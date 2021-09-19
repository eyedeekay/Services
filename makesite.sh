#! /usr/bin/env bash

pages="DEPS HOST PORTAINER PASTEBIN NEWSXML DOKUWIKI FREECIV RADIO"

funcs="help pages clean install uninstall"

usage="

help: show this message
pages: generate the pages
clean: clean up the pages
install: setup the cron jobs and shell scripts
uninstall: remove the cron jobs and shell scripts
"

function file_ends_with_newline() {
    [[ $(tail -c1 "$1" | wc -l) -gt 0 ]]
}

function help() {
	echo "functions: $funcs$usage"
}

function pages() {
	echo -n "" > README.md
	echo -n "" > index.html
	for page in $pages; do
		lower=$(echo "$page" | tr '[:upper:]' '[:lower:]')
		if ! file_ends_with_newline $page.md; then
			echo "" >> $page.md
		fi
		if ! file_ends_with_newline $lower.sh; then
			echo "" >> $lower.sh
		fi
		cp $page.md $lower.md
		echo '' >> $lower.md
		echo '```bash' >> $lower.md
		cat $lower.sh >> $lower.md
		echo '```' >> $lower.md
		echo '' >> $lower.md
		pandoc "$lower.md" -o $lower.html
		cat $lower.md >> README.md
		pandoc README.md > index.html
	done
}

function clean() {
	for page in $pages; do
		lower=$(echo "$page" | tr '[:upper:]' '[:lower:]')
		rm -fr $lower.md $lower.html
	done
}

function install() {
	crontab -l > cronjobs
	for page in $pages; do
		lower=$(echo "$page" | tr '[:upper:]' '[:lower:]')
		if [ -f "$lower.sh" ]; then
			cp "$lower.sh" "$HOME/$lower.sh"
			chmod +x "$HOME/$lower.sh"
			if ! grep "$HOME/$lower.sh" cronjobs ; then
				echo "0 0 * * *	$HOME/$lower.sh" | tee -a cronjobs
			fi
			cat cronjobs | crontab -
		fi
	done
}

function uninstall() {
	for page in $pages; do
		lower=$(echo "$page" | tr '[:upper:]' '[:lower:]')
		crontab -l | grep -v "$HOME/$lower.sh" | crontab -
		if [ -f "$HOME/$lower.sh" ]; then
			rm "$HOME/$lower.sh"
		fi
	done
}

if [ -z $1 ]; then
	help
else
	for func in $funcs; do
		if [ $func = $1 ]; then
			$1
			exit 0
		fi
	done
	echo $1 not found.
	help
	exit 1
fi
