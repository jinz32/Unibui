# Unibui

Take Home Assignment for Unibui. 
In my current implementation, CSV parsing is done via a library, and the data is decoded into objects within the JobListViewModel. I’ve structured the app following the MVVM architecture, keeping all business logic in the view models, while the views handle only UI-related tasks. To manage favorites, I instantiate a FavoriteStore at the root of the app, marking it as a @StateObject so that it retains state across UI updates and redraws.

One tradeoff in the sample app is that parsing the entire CSV is required before any data is displayed. This could be inefficient for large files, as the current method processes the entire CSV in one go. However, in this small-scale sample, performance is fast, and to simulate a delay, I added a 2-second artificial pause. See below Full play through Part 1-3 below

Full play through 
https://github.com/user-attachments/assets/99361d8e-77d3-40fb-bfe3-263f7b92eb69

https://github.com/user-attachments/assets/3f371051-eb50-4d4e-89a8-eb52e4f57d20

https://github.com/user-attachments/assets/efeb9069-1db8-40e2-bcd8-0f6a69e62b67

To handle errors, the job list is set to nil when a parsing issue occurs, allowing me to clearly distinguish between a file parsing error and an empty file. 
Empty Csv Below:
![Simulator Screenshot - iPhone 15 Plus - 2024-09-16 at 23 49 54](https://github.com/user-attachments/assets/58b09038-b17c-460a-84a6-adfcf03d7562)

Error reading file Below: (not json etc) 
![Simulator Screenshot - iPhone 15 Plus - 2024-09-16 at 23 52 02](https://github.com/user-attachments/assets/9149021f-0d38-4317-ab3c-0a939dfbeec1)


I've seperated the view components into the following: 
1. UBListItemView: This is used to display the data for both the joblistview and the detailview, effectively eliminating majority of the code in detailjobview from the initial iteration.
3. UBPickerItemView
4. UBSearchBarView
5. UBFavoriteButtonView
