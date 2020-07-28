CURL_URL='' # url target from curl
X_KA_FKEY='' # fkey from cookie or curl
COOKIE=$'' # cookie from curl

i=0
while read line
do
  ((i=i+1))
  echo "$i Size: ${#line}"
  curl "$CURL_URL" \
  -H 'authority: www.khanacademy.org' \
  -H 'x-ka-fkey: '"$X_KA_FKEY" \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' \
  -H 'content-type: application/json' \
  -H 'accept: */*' \
  -H 'origin: https://www.khanacademy.org' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://www.khanacademy.org/cs/-/5733417664643072' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H $'cookie: '"$COOKIE" \
  --data-binary @"$line" \
  --compressed | node parseResponse.js
done < "${1:-/dev/stdin}"
