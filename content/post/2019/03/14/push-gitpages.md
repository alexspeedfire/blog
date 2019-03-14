---
title: "Push Gitpages"
date: 2019-03-14T14:21:04+03:00
Tags: ["powershell","bash"]
Categories: ["scripts", "offwork"]
draft: false
---

В ходе ковыряния с [hugo](https://gohugo.io) и сохранения результата в виде этого сайта мне надоело руками фигачить команды, а пример скрипта на офсайте был только для mac/linux.

Стало быть пишем свой! Представляет он из себя банальный батник, но с вызовами некоторых хвостов поша, чтобы каждый раз не вводить текст коммита.

<!--more-->
```posh
param(
	[string]$Message = "Rebuilding site "+(Get-Date).ToString("yyyyMMdd")
)

Write-Host "Deploying updates to GitHub..."

# Собираем сайт.
hugo

# Уходим в папку с собранным сайтом.
cd public
# Добавляем изменения в гит
git add .

# Коммитим изменения.
git commit -m "$Message"

# Пушим их на гитхаб
git push origin master

# Возвращаемся обратно
cd ..
```
Ничего экстрасложного, никаких отловов ошибок и анализа вывода бинарников.

Полная же лежит в репозитарии с блогом вот [тут](https://github.com/alexspeedfire/blog/blob/master/Push-GitPages.ps1)
