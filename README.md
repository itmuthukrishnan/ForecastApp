# ForecastApp

Forecast project: (iOS App)

	1.	Coded in swift language.
	2.	Designed using MVVM pattern.
	3.	Used Codable protocol to convey data from API Response.
	4.	Used simple UITableView with custom UITableViewCell  to populate the forecast details 

With the given openweathermap.org we can’t able to get response for all location, I have used sample JSON from this below link.
 https://samples.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22

JSON Structure is complicated to fetch details. It contains all the days 3hrs details in single array. (Refer attached API).

Enhance Forecast App: (If more time avail)

	1.	To proceed further we can enumerate array and filter out day with appropriate hours forecast details for those respective day. 
	2.	With Live API - we can get location information from the user to fetch the respective forecast details.
	3.	We can also implement mapView and show the user enter location.
	4.	While tapping on the table list we can show detailed information of the particular forecast in another viewController.
	5.	We can write unit testCase for respective modules.
