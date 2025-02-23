# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: ruby-3.4.2

* System dependencies: libvips, rails-8.0.1

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Webpage Sijeme Praha 8 (technological demo)
This is a "playing around to figure things out" kind of project. Might use something else in full version (like Shopify or Jekyll).

## Concept
* ApplicationController is used to handle few static pages.
 * root/introduction
 * about
 * workshop dates
 * contact with map (mapy.cz with little bit of scripting as a backup) and web form to send messages
 * contract terms
* ClankyController that manages "clanky" resource
 * index page
 * adding, updating and deleting individual articles
* Contact model for logging/sending a message from web form on contact page (default rails mailer)

All pages have navigation bar on top (not all pages are linked directly) and a footer with some basic info.
Some paths are only allowed for logged-in users (default Rails authentication with User model and SessionController).
Some pages have extra content if the user is authenticated.
Some very basic styling using bootstrap.



# todo
* optional "Address" field for web form (probably will be handled in different way in full version - that will require sing-up for applying to workshops which will contain the billing address and info web form will be left without it), corresponding field in Contact model (and database: rails generate migration AddAddressToContact address :string)
* expose more of the user logging and/or registering; at the moment, users have to be added manually

