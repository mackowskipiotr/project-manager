# System do zarządzania zadaniami i projektami (Aplikacja webowa, zadanie 13)

## Technologia projektowa:
* Windows
* Ruby on Rails
* Mysql
* Bootstrap
* Devise - Biblioteka do autoryzacji użytkowników w ruby on rails.
* sdoc - Biblioteka do generowania dokumentacji w ruby on rails.
* Git

## Funkcjonalności

* Użytkownicy
	- Dodawanie
* Sessja
	* Logowanie
	* Wylogowanie
* Projekty
	* Dodawanie
	* Usuwanie
	* Edycja
	* Przypisywanie osób
* Zadanie
	* Dodawanie
	* Usuwanie
	* Edycja
	* Przypisywanie osób
	* Zmiana statusu
 

## Lista zadań do wykonania:

### ETAP I
* Instalacja Ruby, Rails oraz gita.
* Wygenerowanie nowego projektu RoR.
* Dodanie niezbędnych bibliotek do pliku Gemfile (Devise, bootstrap) 
* Wszystkie biblioteki pobierane są z "https://rubygems.org/"
* Instalacja dodanych bibliotek przez wywołanie komendy "$ bundle" w terminalu


### ETAP II
* Zaimportowanie bootstrapa do plików javascript oraz scss
* Instalacja devise (Wywołanie komend)
$ rails generate devise:install
$ rails generate devise User - Devise automatycznie doda ścieżkę, model użytkownika oraz migrację.
* Ręczne przetestowanie dodawania/logowania/wylogowania użytkownika


### ETAP III
* Wygenerowanie Modelu oraz migracji Project
$ rails generate model Project
* Dodanie nowych kolumn do pliku z migracji: * t.string :name * t.references :user
* Dodanie relacji jeden do wielu (użytkownik jest właścicielem wielu projektów).
* Dodanie kontrolera projects_controller z akcjami (index, show, new, create, edit, update, destroy)
* Dodanie widoków projects dla akcji (new, edit, index, show)
* Ręczne przetestowanie dodawanie projektu przez użytkownika


### ETAP IV
* Dodanie template do aplikacji
* Dodanie paska navbar
* Dodanie wyglądu dla list z projektami oraz zadaniami.


### ETAP V
* Dodanie tabeli wiele do wielu dla użytkownika oraz projektów (Użytkownik może należeć do wielu projektów).
* Dodanie do projects_controller akcji (invite, leave)
* Ręczne przetestowanie zapraszania użytkowników do projektu za pomocą linku


### ETAP VI
* Wygenerowanie Modelu oraz migracji Task
$ rails generate model Task
* Dodanie nowych kolumn do pliku z migracji: * t.string :name * t.string :description * t.references :project * t.references :user * t.references :executor * t.boolean :done
* Dodanie relacji jeden do wielu:
użytkownik jest właścicielem zadania,
użytkownik jest przypisany do zadania,
zadanie jest przypisane do projektu
* Dodanie kontrolera tasks_controller z akcjami (index, new, create, edit, update, destroy)
* Dodanie widoków projects dla akcji (new, edit, index)
* Dodanie do tasks_controller akcji (done)
* Właściciel projektu może usuwać i kończyć zadania, właściciel zadania może kończyć i usuwać swoje zadania
* Dodanie listy użytkowników do dodawania nowego zadania
* Ręczne przetestowanie zapraszania użytkowników do projektu za pomocą linku


### ETAP VII
* Dodanie walidacji dla modeli
* Dodanie do tabeli użytkownicy flagi isAdmin
* Pierwszy użytkownik jako admin
* Dodanie strony z wszystkimi użytkownikami
* Wygenerowanie dokumentacji technicznej

