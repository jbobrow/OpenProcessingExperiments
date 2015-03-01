
/********************************************************************
*
*
*        Greetings from Granada
*         by Peter Bailey
*
*   The sketch will display home city and extend greetings to others
********************************************************************/
float x, y;
String HomeCity="Greetings from Granada";
PImage bg;
import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;

City theCities[];
int numCities = 5;
// Create a session using your Temboo account application details
TembooSession session = new TembooSession("pb21", "myFirstApp", "ae410474bfa546c8ac2b3177fd3db4d3");

// Set up the location
String location = "Granada spain";

// Set up some global values
int temperature;
XML weatherResults;

void setup() {
  size(800, 546);
  bg = loadImage("Alhambra-de-granada.jpg");
  
  runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
  getTemperatureFromXML(); // Get the temperature from the XML results
  displayColor(); // Set the background color
  textSize(32);
  textAlign(CENTER);
  
  
  text(HomeCity, width/2, height/2);
  
    // initialise array and fill it with balls
 theCities = new City[numCities];
  for (int i = 0; i < numCities; ++i) {
    float CitySize = constrain(20 + (randomGaussian() * 4), 1, 100);
    theCities[i] = new City(random(width), random(height), CitySize);
    theCities[i].randomiseDirection();
  }
  
  
  
  
  
}

void runGetWeatherByAddressChoreo() {
  // Create the Choreo object using your Temboo session
  GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);

  // Set inputs
  getWeatherByAddressChoreo.setAddress(location);

  // Run the Choreo and store the results
  GetWeatherByAddressResultSet getWeatherByAddressResults = getWeatherByAddressChoreo.run();

  // Store results in an XML object
  weatherResults = parseXML(getWeatherByAddressResults.getResponse());
}

void getTemperatureFromXML() {
  // Narrow down to weather condition
  XML condition = weatherResults.getChild("channel/item/yweather:condition");

  // Get the current temperature in Fahrenheit from the conditions
  temperature = condition.getInt("temp");

  // Print temperature value
  println("The current temperature in "+location+" is "+temperature+"ºF");
}

void displayColor() {
  // Set up the temperature range in Fahrenheit
  int minTemp = 10;
  int maxTemp = 95;

  // Convert temperature to a 0-255 color value
  float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

  // Set background color using temperature on a blue to red scale     
    textSize(32);
  textAlign(CENTER);
  
  fill(color(temperatureColor, 0, 255-temperatureColor));
  text(HomeCity, width/2, height/2);
  
  background(bg);
  for (int i = 0; i < numCities; ++i) {
    theCities[i].move();
    theCities[i].display();
  }
}
