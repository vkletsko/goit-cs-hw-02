#!/bin/bash

# Список вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
log_file="website_status.log"

# Перевірка доступності вебсайтів та запис результатів у файл логів
for website in "${websites[@]}"; do
    if curl -s -L --head --request GET -w '%{http_code}\n' "$website" | grep "200" > /dev/null; then
        status="UP"
    else
        status="DOWN"
    fi
    echo "$website is $status" >> "$log_file"
    echo "$website is $status"
done

echo "Результати записані у файл логів: $log_file"
