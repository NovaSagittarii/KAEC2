while read line
do
  # echo $(<"$line")
  echo "$line"
done < "${1:-/dev/stdin}"
