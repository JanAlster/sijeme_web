# Webpages Sijeme Praha 8 (full version)
## Concept
ApplicationController is used to handle few static pages.

Next we have three kinds of editable articles (Trix):
* workshop / courses descriptions
* news (mainly about new course dates)
* knowhow articles


## Static pages
### Decorations (application.html.erb)
Header with navbar.
Footer with copyright and link to business terms.
(maybe admin login)

### root / introduction (public)
* Hero section with motivating background image.
* Short advertising section why to join.
* News section, show all news + terms that have publication date not too far in the past, limit to max 10?
 * featured image and message of News 

### about (public)
* introduction of lecturers, background story, ...

### workshops (public) - WorkshopController
List of available (public) workshops with descriptions (using featured image and introduction).
Links (slug) to individual workshop articles.

### Individual workshops (public)
Title, rich body text
(public) List of available terms + link to application.
(customer) Subscribed term
(customer) List of knowhow articles (possibly only after term start)
(admin) link to update
(admin) link to show

### Knowhows (customer) - KnowhowController
List of knowhow articles available to subscribed customer

### Invididual knowhow article (customer)

### News (admin) - NewsController
List of news (link to delete, link to update, no need to link to show)
Add news

### New (admin)
update
delete (actually does not need to show anything, has to redirect back to News page)
(not so sure I want to handle it this way; perhaps we can work with selecting new from
a list and edit/delete/add on a single page? will not be handled via simple requests

### Terms and prices (public)
* list available terms, link to apply (actually link to apply can be on Term individual page)
* list of 

### individual Term
* (public, customer) application form (for custorem pre-filled)
* (admin) link to delete (this is extreme action since it might have dire consequences)

### Contact
* map, address, send message form

### (maybe) Settings (admin)
* setting for things like email where to send the emails from web form
* adding users

## Models
### Workshop
* title
* slug (short title for links)
* featured image
* rich body text
* (optional) introduction, give first paragraph of body text if not available
* (maybe) public/private
* list of knowhow articles accessible through this workshop (watch out for SQL foreign keys, see https://guides.rubyonrails.org/active_record_migrations.html)

### New
* featured image
* date of publication
* message

### Term (is News or quacks as News)
* workshop/course (which will be run)
* date (when it starts)
* (optional) featured image - use workshop's featured image if not set
* (default news message composed of date and link to workshop)
* date of publication

### Knowhow
(articles with knowhow for workshop attendees, not public)
* title
* rich body text

### User
(authentication)
* email/login
* password
* access level (admin, customer)
* (customer) billing info
* (customer) workshop access (which workshops are 

### Contact
(message from web form contact)
* from email
* name
* message
* subject

## Routes (URI -> action description, prefix, controller#action)
* get / -> Application#index
* get /about -> Application#about
* get /workshops -> Workshop list all, workshops_index, workshop#index
* get /workshops/slug -> Workshop show single slug (adjust to login level), workshops, workshops#show
* get /workshops/new -> show form to create a new Workshop, new_workshop, workshop#new
* get /workshops/slug/edit -> show form to edit single slug, edit_workshop, workshop#edit
* post /workshops -> create a new workshop (response to form from /workshops/new (should redirect to get /workshops)), none, workshops#create
* patch /workshops/slug -> update single slug (response to form from /workshop/slug/edit (should redirect to get /workshops/slug or to get /workshops), none, workshops#update
* put /workshops/slug - dtto
* delete /workshops/slug -> delete single workshop slug (confirm)(should redirect to get /workshops), none, workshops#destroy
(Note this is perhaps not entirely correct, since it was adapted from the "clanky" routes for the demo version and those are slightly messed up. 
I guess that is the result of using "Clanek" model and "Clanky" controller. See https://guides.rubyonrails.org/active_record_basics.html#convention-over-configuration-in-active-record
and https://stackoverflow.com/questions/2998551/ruby-on-rails-pluralize-for-other-languages. For now, let's stick with english for paths and models)

