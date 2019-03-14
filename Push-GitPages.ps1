<#
.SYNOPSIS   
Скрипт, предназначенный для деплоя сайта на github.io

.DESCRIPTION 
Этот скрипт используется в связке с hugo и git для деплоя сайта, собранного hugo на github pages.

.PARAMETER Message
Параметр позволяет задать кастомное сообщение к коммиту.

.NOTES   
Name: Push-GitPages.ps1
Author: Alex Speedfire
DateCreated: 2019-03-14
DateUpdated: 2019-03-14
Site: https://alexspeedfire.github.io/
Version: 0.0.1

.LINK
https://alexspeedfire.github.io/

.EXAMPLE
	.\Push-GitPages.ps1

Description
-----------
Эта команда соберёт с помощью hugo сайт и запушит его на github с коммит месседжем "rebuilding site %date%"

.EXAMPLE
	.\Push-GitPages.ps1 -Message "Commit Message"

Description
-----------
Эта команда соберёт с помощью hugo сайт и запушит его на github с коммит месседжем "Commit Message"
#>

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

# Коммитим в основной репозитарий.
git add .

# Коммитим изменения.
git commit -m "$Message"

# Пушим их на гитхаб
git push origin master
