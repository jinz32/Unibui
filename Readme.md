# Unibui

Take Home Assignment for Unibui. 
In my current implementation, CSV parsing is done via a library, and the data is decoded into objects within the JobListViewModel. I’ve structured the app following the MVVM architecture, keeping all business logic in the view models, while the views handle only UI-related tasks. To manage favorites, I instantiate a FavoriteStore at the root of the app, marking it as a @StateObject so that it retains state across UI updates and redraws.

One tradeoff in the sample app is that parsing the entire CSV is required before any data is displayed. This could be inefficient for large files, as the current method processes the entire CSV in one go. However, in this small-scale sample, performance is fast, and to simulate a delay, I added a 2-second artificial pause. See below in Part 1



Full play through 


https://github.com/user-attachments/assets/3c3ef2ca-99a1-489a-b7ac-c5099d503bee

https://github.com/user-attachments/assets/065366e8-96d4-4639-bb77-c8284ede6711

https://github.com/user-attachments/assets/1d58b9a1-b1c3-485a-ad22-83fba29c5286

To handle errors, the job list is set to nil when a parsing issue occurs, allowing me to clearly distinguish between a file parsing error and an empty file. 
Empty Csv Below:
![Simulator Screenshot - iPhone 15 Plus - 2024-09-14 at 00 49 09](https://github.com/user-attachments/assets/bfcfc2b8-143b-46a2-88ee-d17b6b6ed718)
Error reading file Below: 
![Simulator Screenshot - iPhone 15 Plus - 2024-09-14 at 01 22 57](https://github.com/user-attachments/assets/d9e71d62-9682-444a-b5d2-64a2219c210d)


Additionally, I separated the view components into well-structured variables, making the UI more readable and maintainable. Some aspects, like localization and more robust string handling, weren’t implemented but could be considered for future improvements.
 
