---
title: "Сборка чужих книжек с гитбука."
date: 2019-04-08T13:02:00+03:00
tags: ["gitbook","nodejs", "win64", "git"]
categories: ["howto","offwork"]
draft: false
---

Я сейчас нахожусь в состоянии "что бы интересного почитать, чтобы немного поразмять мозг". И вот сегодня на хабре всплыла короткая новость про ["Сети для самых маленьких"](https://habr.com/ru/post/447080/), которая [выложена](https://linkmeup.gitbook.io/sdsm) на gitbook.io.

Так вышло, что тема сетей в моей голове сейчас находится в состоянии бардака и подобная книжка очень неплохо зайдёт после того, как я закончу текущую книжку по ансиблу. Осталась малость - в онлайне читать мне не очень удобно, хочется это получить в более удобном виде. Желательно epub, дабы натравить на него читалку и залипнуть. Но ссылки на гитбуке нет даже на пдф.

Будем исправлять. Как обычно, используя хост на windows.

## Что потребуется.

Вкратце, потребуется **git**, **gitbook-cli** и **[calibre](http://calibre-ebook.com/about)**.

Как установить git я писать не буду, будем считать, что он есть на машине.

## Установка

Для начала нам потребуется установить **node.js**. Для этого воспользуемся **[Chocolatey](https://chocolatey.org/)**. Инструкция по установке самого choco есть на сайте.

Установка **nodejs** (в консоли powershell с правами администратора).

    choco install nodejs

Установка пакета **gitbook-cli**

    npm install -g gitbook-cli

Установка необходимых пакетов

    gitbook install

Нам потребутся **[calibre](http://calibre-ebook.com/about)**., чтобы собрать pdf/epub/mobi.

    choco install calibre

## Получаем репозиторий

Открываем ссылку, что упомянута выше и нажимаем кнопку **Edit on GitHub** и используем эту ссылку для git.

    git clone https://github.com/eucariot/SDSM.git

## Собираем книжку

Если мы попробуем сейчас собрать книжку, мы получим ошибку  ``Template render error: (\SDSM\README.md) [Line 3, Column 2] unknown block tag: hint``. Это всё потому, что не хватает модуля в нашем gitbook. Так что в паке SDSM создадим файл **book.json** со следующим содержимым:

    { "plugins": ["hints", "page-ref"] }

и ещё раз запустим установку модулей, чтобы gitbook поставил себе модуль **hints**:

    gitbook install

Увы и ах, нормального способа эмбеддить видео в epub я не нашёл (но не так, чтобы очень усиленно искал, ибо plugins.gitbook.com возвращает ERR_TOO_MANY_REDIRECTS), так что придётся вычистить немного:
из следующих файлов удалить блоки ``{% embed url="https://youtube...``

1. 1.-podklyuchenie-k-oborudovaniyu-cisco/README.md
2. 2.-switching/README.md
3. 3.-static_routing/README.md
4. 4.-stp/README.md
5. 5.-acl-i-nat\README.md
6. 6.-dinamic-routing\README.md
7. 7.-vpn\README.md
8. 8.-bgp-i-ip-sla\README.md
9. 8.1-ibgp\README.md
10. 9.-multicast\README.md
11. 10.-base-mpls\README.md
12. 11.-mpls-l3vpn\README.md
13. 13.-mpls-traffic-engineering\sposoby-napravleniya-trafika-v-te-tunnel.md

Так же нужно ещё кое-что поправить в тексте статей (смотри [PR44](https://github.com/eucariot/SDSM/pull/44), если оно мерджнуто - значит не надо)

1. SDSM\1.-podklyuchenie-k-oborudovaniyu-cisco\4.-nastroika-dostupa.md, строка 69 - там кривая вставка, попытка вместо ссылки - картинку. Изменить ``![](http://ru.wikipedia.org/wiki/Протокол_AAA)ААА`` на ``[ААА](http://ru.wikipedia.org/wiki/Протокол_AAA)``

А теперь пробуем собрать книжку.

    gitbook epub ./ ./sdsm.epub

С дцатого раза (спасибо тебе, мегафон, за качественный интернет) книжечка таки собралась и улетела в таком виде в библиотеку google play. Но насколько качественной получилась книжка, я скажу через пару недель =)