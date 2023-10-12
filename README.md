# Package-Building

  Для выполнения задания был выбран модуль litecrypt-0.0.8.
  Были проведены работы по преобразованию модуля в пакеты deb и rpm. Также был написан Dockerfile для построения контейнера, внутри которого посредством скрипта .sh происходила сборка пакетов.
  Файлы модуля, Dockerfile и .sh-скрипта приведены в репозитории. Построить нормальный CI/CD процесс к сожалению не удалось.

  Метаданные генерируются в данном решении утилитами по имеющимся исходникам. При необходимости там что-то изменить можно менять [options] в 
  python3 setup.py --command-packages=stdeb.command sdist_dsc --build-depends="python3 (>= 3.6)" и python3 setup.py bdist_rpm --requires="python3 >= 3.6". Они переписывают control и spec файлы соответственно. 
  Убраны в путях версии, что позволяет собирать пакеты с другими версиями litecrypt (учитывая, что структура будет подобной)
  Добавлены зависимости для собираемых пакетов на python >= 3.6
  
