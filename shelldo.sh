#!/bin/bash

#script to allow one to manage a simple to-do list adding and removing tasks.

function add {
	echo "*** ADDING NEW ENTRY ***"
	read -p "Enter the new task: " new_task
	echo $new_task >> todolist
}

function remove {
	echo  "*** REMOVING AN ENTRY ***"
	read -p "Enter the task to remove: " rm_task
	sed -i "/$rm_task/d" todolist
}

function list {
	echo ""
	echo "tasks:"
	cat todolist
}

function main {
	if [[ -e todolist && -f todolist ]]
	then
		echo "*** SIMPLE TODO LIST MANAGER ***"
		echo ""
		echo "Enter 1 to add and item to todo list"
		echo "Enter 2 to remove and item to todo list"
		echo "Enter 3 to list the todo list"
		echo "Enter * to exit"
		read -p "Enter and option: " opt
	        case $opt in
	           "1")add ;;
		   "2")remove ;;
	           "3")list ;;
		   "*")exit 0 ;;
	        esac
	else
		echo "creating needed files ...."
		touch todolist
		echo "completed ..."
	fi
}

count=1
while [ $count -lt 10 ]
do
	main
done

