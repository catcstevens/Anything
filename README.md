# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
7. Identification of the *problem* you are trying to solve by building this particular marketplace *app*.

Users have become aware that the 'throw away' culture we live in has to change and want an easy solution.  

8. Why is it a *problem* that needs solving?

Landfills are overflowing, workers in developing nations are working in awful conditions to create stuff for consumers to use once and discard and people have so much 'stuff' that they have to rent storage space to keep it all. "Thank You Neighbour" is a modern solution to return us to a simpler time, when if you needed to use something once, or only occasionally, you would borrow it from a friend or neighbour rather than buying it. My solution is a two-way marketplace where 'neighbours' can list things they own but aren't using for 'borrowers' to rent for a period of time. The result is less waste, less materialism, more neighbourliness and an extra income stream for neighbours.

9. A link (URL) to your deployed *app* (i.e. website)

thankyouneighbour.herokuapp.com

10.

https://github.com/catcstevens/Anything

11. Description of your marketplace *app* (website), including:
\- Purpose: The purpose of "Thank You Neighbour" is to provide a two-way marketplace for people to rent out items they are not currently using to people who would otherwise have to buy the item. The person renting the item might only need to use said item once, or would like to try before they buy. The app would also be useful for people travelling. The might need something on their travels that they have at home, and buying another one would be wasteful and costly. The app will save uneccesary buying, cutting down on waste, and building a community of neighbourly people.
\- Functionality / features
The main features of the app are finding items that are available locally to borrow and listing items that you would like to rent out in order to make extra money. 
\- Sitemap
\- Screenshots
\- Target audience
\- Tech stack (e.g. html, css, deployment platform, etc)

12. User stories for your *app*
As a user of ThankYouNeighbour I have found the app while searching for a drill. I am not very handy, but I have some shelves to put up and I thought it would be cheaper to do it myself, however when I went to buy a drill online it cost more money than paying someone to do the job for me. I also don't want to buy a new drill because I don't know if I will ever use it again and I hate storing things that I have no use for because it makes me feel guilty.

The important things I wanted from the app were to save money, be environmentally friendly, convenience and because I would probably be picking up the drill, security of knowing the 'neighbour' as the app refers to them is not dangerous. 

I found it easy to navigate the app. I could view what was available to rent by browsing the listings without signing up and search by what I wanted or area. I could also view the listing in more detail and click through to get more information about the 'neighbour'. It made me feel more secure to see his rating and know that othe users had rented from him before. From the listing I could click to a calendar to see if the drill was available on the day I needed it and there was a link to book and securely pay for it. The drill was much cheaper to rent than to buy, and I found a 'neighbour' ten minutes away who was renting what I needed.

When I went to pick up the drill I got chatting to my 'neighbour' and he told me how much money he is making renting out stuff he already owns. So when I got home I added some stuff to my profile and listed some items that are hanging around my house. By the next day I had rented out a blender and a loom, met a couple of new people and and made some cash from stuff I already own!

13. Wireframes for your app
[download this](ThankYouNeighbour.pdf)
FIX ME

14. An ERD for your *app*

https://www.lucidchart.com/documents/edit/1a35fd1a-ba46-4651-bdfa-0bc4678544c8/0_0?beaconFlowId=7B4E477B4B4353E2

15. Explain the different high-level components (abstractions) in your *app*

This app uses the Ruby, HTML, SCSS, and a small amount of Javascript languages on a Ruby on Rails framework. It utilizes Ruby gems like Bootstrap, Ranscack, Stripe and Devise to add utilities as well as the gems that are imported with the Rails framework. The expected user is looking for an app where they can either list products to rent out or find products to rent. Therefore one of the most important components is the abiblity to easily list and view listings, which is easily acheived on Ruby on Rails by making tables stored in a database using Postgresql. Where extra storage is needed, Amazon Web Services is used via another gem. Due to security issues, all payments are done through Stripe, and a sign-in feature comes from the devise gem. 

This Rails uses MVC to work, which is that each element in the app has a seperation of concerns. The Controllers handle the logic and informs how the models behave. Each model exists as a table in the database. The Controllers contain Classes, and each method in the class refers to a page in the views, which is the part of the app visible to the user. The communication between the MVC is controlled by Routes.

16. Detail any third party services that your *app* will use

The main third party services used by this app are Stripe, Amazon Web Services (AWS), Heroku and Ruby Gems. Stripe and AWS are used in Rails through using a gem, but function as third parties without a gem too. 

Stripe is used to securely process payments on the app. They take responsibilty for verifying payment and customer details, and transfer a customers funds into the attached account after taking a percent of the transaction as a fee. They assume all of the risk of the transaction.

AWS gives external storage to the app. When an app needs to store large amounts of data it doesn't make sense to be storing it locally. It is expensive and can be corrupted. Therefore the app uses AWS as a storage facility for any images that are uploaded to the app. AWS provide a 'bucket' to store the image files in. In a real world scenario further back-up would be needed to keep the data secure and AWS can offer multiple storage scenarios. All of the tables in this app other than images are being stored locally which would not work if multiple users were to sign up to it.

Heroku offers a free option of a third party service to deploy the app to the Internet. 

The app is using multiple Ruby gems as they are often an easy way of integrating elements into an app. Devise is a gem that brings the ability for users to sign into the app with a password. The gem creates a User model that can be used with other models to enhance the app's capabilities. In this app a Conversation method uses the User from Devise to have an email conversation.

Ransack is another gem that allows the app to have a search function searching through multiple criteria. 

17. Describe your projects *models* in terms of the relationships (active record associations) they have with each other



18. Discuss the database relations to be implemented in your application

19. Provide your database schema design

20. Describe the way tasks are allocated and tracked in your project

21. Delete this later
