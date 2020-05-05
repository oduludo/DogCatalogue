#  Doggify
iOS client for the Doggify API. This is a practice project and not a real world application.

## Project structure
This project uses an MVC architecture. Models go in the "Models" folder, Views in the "Views" folder and ViewControllers in the "Controllers" folder. The folder "HelperClasses" is the place for utility like classes that do not fit directly in any of the MVC folders.

Storyboards are being used, but views will be built programmatically as much as possible.

## The product
This application will show the data from the Doggify API. The start screen will show a ListView with BreedGroups. Clicking on a BreedGroup should bring the user to a view with a ListView populated with Breeds belonging to that BreedGroup. Alamofire and SwiftyJSON will be used for the API calls. As soon as the API starts serving images as well, Kingfisher will be used to show and cache those images. At some point Realm will be used to cache Doggify API data. This way the user can use the app offline, but an internet connection is still required for the most up-to-date data.
