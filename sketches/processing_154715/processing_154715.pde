
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
 int minTemp = 10;
  int maxTemp = 95;
float[] CityTemps;
// Set up some global values
int temperature;
XML weatherResults;

import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;


City theCities[];

int numCities = 5;
// Create a session using your Temboo account application details
TembooSession session = new TembooSession("pb21", "myFirstApp", "ae410474bfa546c8ac2b3177fd3db4d3");

// Set up the location
String location = "Granada spain";


void setup() {
  size(800, 546);
  bg = loadImage("Alhambra-de-granada.jpg");
  background(bg);
    
  runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
  getTemperatureFromXML(); // Get the temperature from the XML results
  //displayColor(); // Set the background color
  textSize(40);
  textAlign(CENTER);
  
  
  text(HomeCity, width/2, height/2);
  
  


  
  
  
  
    // initialise array and fill it with cities
 theCities = new City[numCities];
  for (int i = 0; i < numCities; ++i) {
    //float CitySize = constrain(20 + (randomGaussian() * 4), 1, 100);
    
    switch (i){
      case 0:
      location="London UK";
        runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
        getTemperatureFromXML(); // Get the temperature from the XML results
        
        float temperatureColorLondon = map(temperature, minTemp, maxTemp, 0, 255);
     
        theCities[i] = new City(random(width), random(height), 40, "London", "Anya",color(temperatureColorLondon, 0, 255-temperatureColorLondon));
    println(location);
        println(color(temperatureColorLondon, 0, 255-temperatureColorLondon));
        
        break;
      case 1:
      location="Paris France";
        runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
        getTemperatureFromXML(); // Get the temperature from the XML results
      
      float temperatureColorParis = map(temperature, minTemp, maxTemp, 0, 255);
        theCities[i] = new City(random(width), random(height), 40, "Paris", "Pierre",color(temperatureColorParis, 0, 255-temperatureColorParis));
     println(location);
       println(color(temperatureColorParis, 0, 255-temperatureColorParis)); 
        
        break;
     case 2:
     
      location="Luxemburg";
      runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
        getTemperatureFromXML(); // Get the temperature from the XML results
    
     
     
     float temperatureColorLuxemberg = map(temperature, minTemp, maxTemp, 0, 255);
       theCities[i] = new City(random(width), random(height), 40, "Luxemberg", "Jerome",color(temperatureColorLuxemberg, 0, 255-temperatureColorLuxemberg));
     println(location);
       println(color(temperatureColorLuxemberg, 0, 255-temperatureColorLuxemberg));
       break;
     case 3:
     
     location ="Milton Keynes uk";
      
     runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
        getTemperatureFromXML(); // Get the temperature from the XML results
     float temperatureColorMilton = map(temperature, minTemp, maxTemp, 0, 255);
      theCities[i] = new City(random(width), random(height), 40, "Milton Keynes", "Jackie",color(temperatureColorMilton, 0, 255-temperatureColorMilton));
      println(location);
      println(color(temperatureColorMilton, 0, 255-temperatureColorMilton));
      
      
      
      break;
     case 4:
     location ="Belgium";
      runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
        getTemperatureFromXML(); // Get the temperature from the XML results
     
     
     
     float temperatureColorBelgium = map(temperature, minTemp, maxTemp, 0, 255);
      theCities[i] = new City(random(width), random(height), 40, "Belgium", "Nathalie",color(temperatureColorBelgium, 0, 255-temperatureColorBelgium));
      println("belgium");
      println(color(temperatureColorBelgium, 0, 255-temperatureColorBelgium));
   break;   
    } 
    theCities[i].randomiseDirection(); 
   
  }
  
 
  
  
  
}
  void draw() {
   
     

 background(bg);
  
  for (int i = 0; i < numCities; ++i) {
    
      // Set background color using temperature on a blue to red scale     
    textSize(32);
    textAlign(CENTER);
    // Convert temperature to a 0-255 color value
    float temperatureColorHome = map(temperature, minTemp, maxTemp, 0, 255);
    fill(color(temperatureColorHome, 0, 255-temperatureColorHome));
    text(HomeCity, width/2, height/2);
    
    
    theCities[i].move();
    theCities[i].display();
   
    save("Greeting.jpg");
    
    
    
  }
  
}
void runGetWeatherByAddressChoreo() {
  // Create the Choreo object using your Temboo session
  GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);
//*********************************************************************************
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

/*
 * Class "city"

 *
 */
class City {

  // instance variables
  float x;        // x position
  float y;        // y position
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  String Person;
  String HomeCity;
  float TempColorCity;
  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
 City(float x_, float y_, float size_, String HomeCity_, String Person_, float TempColorCity_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;
    HomeCity=HomeCity_;
    Person=Person_;
   TempColorCity=TempColorCity_;
   println(Person);
   println(HomeCity);
   println(TempColorCity);
    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
  }
  
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = randomGaussian() * 0.3;
  }
  
  // move method
  // moves the city in the current direction
  void move() {
    float dx, dy; 
    /*
     * direction is an angle that represents the current
     * direction of travel.
     * speed is the current speed in units/frame
     */
    dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;
    x += dx;
    y += dy;
    direction += omega;
    checkBounds();
  }
  
  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      direction += 180;
      direction = direction % 360;
    }
  }
      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    noStroke();
    //fill(250,100);
    //ellipse(x, y, size, size);
    stroke(255,0,0);
    fill(color(TempColorCity, 0, 255-TempColorCity));
    println(color(TempColorCity, 0, 255-TempColorCity));
    text(HomeCity,x,y);
    stroke(255,255,0);
    fill(color(TempColorCity, 0, 255-TempColorCity));
    text(Person,x,y+30);
    
    //point(x,y);
    
  }
}
