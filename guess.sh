#!/bin/bash
first_number=$1
second_number=$2

total_count_1=0
total_count_2=0
total_count_3=0
total_count_4=0
total_count_5=0
count_all_files=0

total_catalogs=0

times=1

cont="1"
while [ $cont != 0 ]
do
read -p "Enter catalog: " catalog_name

temp_count_1=$(find ./$catalog_name -mindepth 1 -perm $a)
echo "Total files: $temp_count_1 "
find ./$catalog_name -type f -mindepth 1 -perm $a
echo ""

temp_count_2=$(find ./$catalog_name -mindepth 1 -mtime $b)
echo "Total files: $temp_count_2 "
find ./$catalog_name -type f -mindepth 1 -mtime $b
echo ""

temp_count_3=$(find ./$catalog_name -type d -mindepth 1 -atime $b)
echo "Total files: $temp_count_3 "
find ./$catalog_name -type d -mindepth 1 -atime $b
echo ""

temp_count_4=$(find ./$catalog_name -mindepth 1 -type s)
pipe=$(find ./$catalog_name -mindepth 1 -type p)
temp_total=$(( $temp_count_4 + $pipe ))
echo "Total files: $temp_total "
find ./$catalog_name -mindepth 1 -type s
find ./$catalog_name -mindepth 1 -type p
echo ""

temp_count_5=$(find ./$catalog_name -type f maxdepth 1)
echo "Total files: $temp_count_5 "
find ./$catalog_name -type f maxdepth 1

times=$(($times+1))
count_all_files=$(( $count_all_files + $temp_count_1 + $temp_count_2 + $temp_count_4 + $temp_count_5))
total_count_1=$(( $temp_count_1 + $total_count_1 ))
total_count_2=$(( $temp_count_2 + $total_count_2 ))
total_count_3=$(( $temp_count_3 + $total_count_3 ))
total_count_4=$(( $temp_count_4 + $total_count_4 ))
total_count_5=$(( $temp_count_5 + $total_count_5 ))
total_catalogs=$(( $total_catalogs + $temp_count_3 ))

read -p "Enter 0 for exit: " cont
done
echo ""
echo "Total files: $count_all_files"
echo "Total catalogs: total_catalogs"
echo "Total searches: $times"
echo "Total files at 1st case: $total_count_1"
echo "Total files at 2nd case: $total_count_2"
echo "Total catalogs at 3rd case: $total_count_3"
echo "Total files at 4th case: $total_count_4"
echo "Total files at 5th case: $total_count_5"