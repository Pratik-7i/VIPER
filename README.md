VIPER architecture for iOS project with sample project. 

![Simulator Screen Shot - iPhone 13 - 2022-06-20 at 19 46 40](https://user-images.githubusercontent.com/96768526/174659156-8c98d16c-ab6e-4805-9657-4979532a25b4.png)
![Simulator Screen Shot - iPhone 13 - 2022-06-20 at 22 01 50](https://user-images.githubusercontent.com/96768526/174659158-223ff14f-61c2-47f0-8901-a77f3dece2f7.png)

---------------------
![Simulator Screen Shot - iPhone 13 - 2022-06-20 at 22 03 14](https://user-images.githubusercontent.com/96768526/174659174-f799d5a2-2271-4d2c-879f-fbbfd1d33fda.png)
![Simulator Screen Shot - iPhone 13 - 2022-06-20 at 22 03 24](https://user-images.githubusercontent.com/96768526/174659176-75ac5118-3366-42ad-8bf0-149196487329.png)

# What is Architecture Pattern

Different design architectural patterns form an essential part of making the core of your app strong. How we shape our buildings is what later dictates how we live and grow, in a similar fashion it is how you architect your app that defines how you will handle the growth of the app.

In MVC, all the logic is put into view controller — in that cas following things gets hardere:

- Testability (Better distribution, better testability)
- Maintainability
- Refactoring speed

### Single Responsibility Principle

Any code should be maintainable, this is where the Single Responsibility Principle enters. This states that every module, class or function should have responsibility for a single part of the functionality.

VIPER fulfils the single responsibility principle with the separation that it creates between various classes thus providing the developer base to write good maintainable code to keep up with constantly evolving the iOS platform.


# VIPER

VIPER is the synonym for:

- View
- Interactor
- Presenter
- Entity 
- Router

## Overview

- Only the presenter talks to the view, and only the inter-actor talks to the model (entity). The presenter and inter-actor coordinate with each other. The presenter is concerned with display and user action, and the inter-actor is concerned with manipulating the data.
- VIPER follows a very clean architecture. It isolates each module from others. So changing or fixing bugs is very easy as you only have to update a specific module. 
- VIPER creates a very good environment for unit testing. 
- As each module is independent of others, it maintains low coupling very well. So, dividing work among co-developers is also pretty simple.
- VIPER should be used when an application’s requirements are very well-formed. Working with constantly changing requirements may create confusion and messed-up codes. So, it should not be used in small projects as MVP or MVC will suffice. 

### View

- Class that has all the code to show the app interface to the user and get their responses. 
- Upon receiving a response, View alerts the Presenter.

### Presenter

- This is the only class that interacts with all others. 
- This is the mediator between the view and the inter-actor.
- It contains the UI related (but UIKit independent) business logic, invokes methods on the Inter-actor.
- It gets user response from the View and works accordingly. The only class to communicate with all the other components. Calls the router for wire-framing, Inter-actor to fetch data (network calls or local data calls), view to update the UI.
- It directs data between the view and inter-actor, taking user actions and calling router to move the user between views.

### Interactor

- This is considered to be the backbone of the app as it contains the business logic. 
- It handles data fetching
- Has the business logic of an app. e.g if business logic depends on making network calls then it is Inter-actor’s responsibility to do so.
- It contains business logic related to the data (Entities) or networking, like creating new instances of entities or fetching them from the server. For those purposes you’ll use some Services and Managers which are not considered as a part of VIPER module but rather an external dependency.

### Router

- This class contains all the navigation logic describing the screens that need to be shown
- It gets input data from the presenter and executes that action.
- Listens from the presenter about which screen to present and executes that.
- It handles navigation between screens. 

### Entity

- These are the basic model objects used by the inter-actor. It is the smallest element inside VIPER.
- It represents application data.
- Contains plain model classes used by the Inter-actor.
- One thing to remember about the Entity is out of all the layers only the Inter-actor should own an entity.

MVVM

￼

VIPER

￼

￼


## Benefits of VIPER

### Testability

- The loosely coupled modules ensure that testing is carried out easily and separately. 
- Apart from the modules themselves even the objects inside are very clearly segregated and ensure great Unit testing.

### Collaboration friendly

- Independent modules make VIPER great for large teams. Fewer merge conflicts, better testability and easier change of modules gives the freedom to create the initial architecture skeleton first and then passing it to other developers to implement logic.
- The codebase is familiar to most developers. Files are smaller, logic is clearer and the overall stability and flexibility are higher.

## Protocols

In VIPER, protocols are used to communicate between layers. One layer calls another through a protocol. The calling layer calls a function from a protocol. The listening layer conforms to that protocol and implements the function.
A naming convention is followed to name a protocol. e.g, ‘viewToPresenterProtocol’. So, it is a ‘protocol’ that will be implemented by ‘the presenter’ to listen to what the ‘view’ has to say.

- `PresenterToViewProtocol` — Presenter calls, View listens. The presenter receives a reference from this protocol to access View. View conforms to the protocol.
- `ViewToPresenterProtocol` — *View* calls, *Presenter* listens.
- `InteractorToPresenterProtocol` — *Interactor* calls, *Presenter* listens.
- `PresentorToInteractorProtocol` — *Presenter* calls, *Interactor* listens.
- `PresenterToRouterProtocol` — *Presenter* calls, *Router* listens.

Also, our protocol names must be different for different modules. One way to achieve this is to add the module name as a prefix. So the format could be `<Module-Name><Protocol-Name>` e.g if the module name is Login then view to presenter protocol name will be `LoginViewToPresenterProtocol`.

> **IMPORTANT**

- View will have reference to presenter and presenter will have reference to view, because both are calling each other.
- Presenter will have reference to inter-actor and inter-actor will have reference to Presenter, because both are calling each other.
- Presenter will have reference to router, but no vice-versa, because router is not calling Presenter.
- There is no role of entity reference. It exists in VIPER as entity same as it exists in MVC / MVVM.

