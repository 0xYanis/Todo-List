# To do List - pet-проект IOS приложения для личных заметок

## - Язык программировния - Swift

## - Фреймворк создания интерфейса - SwiftUI

## - Архитектурный паттерн - MVVM

### Компоненты паттерна:

1. Models - описывает используемые в приложении данные.

- ItemModel - хранит структуру задач

id - id задачи

title - название задачи

isCompleted - выполнена или нет

2. Views - описывает визуальное представление приложения

- ListView - Отображает view списка задач, или NoItemsView в случае их отсутствия

- ListRowView - Отобраает оформление задачи

- AddView - view добавления новой задачи

- NoItemsView - Отображает view при отсутствии задач

- Launch Screen - Storyboard view запуска приложения

3. ViewModels - модель предствления, связывает модель и представление

- ViewModels - класс функций обработки задач

Содержит CRUD-функции (создание, чтение, обновление и удаление)

## - Запись и чтение данных (задач) - UserDefaults

## - вид данных - JSON

Хоть и правильнее использовать Core Data, но в данном случае проект не является эталонным приложением, подлежащим выгрузке в App Store;

В UserDefaults рекомендуется хранить не более 512 Кбайт, а так как данные кодируются в JSON, они имеют формат UTF-8, соответственно чтобы заполнить 512 Кбайт UserDefaults, нужно составить условно 10.000 задач, что маловероятно и контрпродуктивно.

## Скриншоты работы приложения

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-20 at 13 54 16](https://user-images.githubusercontent.com/111576120/208651657-30f2996a-cd76-40a1-8eec-bfcf20ecf3f7.png)

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-20 at 13 55 24](https://user-images.githubusercontent.com/111576120/208651708-8cf2dc20-102c-4503-be92-0162ab8e4df9.png)

Кнопка "Добавить задачу" имеет анимацию пульсации

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-20 at 13 55 19](https://user-images.githubusercontent.com/111576120/208651810-4691fdca-0c67-4d8b-88d6-c4a1e7563e6e.png)

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-20 at 13 57 57](https://user-images.githubusercontent.com/111576120/208651858-f5c54a80-a37e-4ec2-9157-977b82753bf3.png)

![Simulator Screen Shot - iPhone 14 Pro - 2022-12-20 at 13 59 02](https://user-images.githubusercontent.com/111576120/208651890-314983ee-1198-4ac0-833e-01e836c43f1e.png)


