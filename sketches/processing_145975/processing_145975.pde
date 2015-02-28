
import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("ACCOUNT NAME", "APP_NAME", "APP_KEY");

//Delare location array 
String[] location;
int currentLocation = 0;

// Declare fonts
PFont fontTemperature, fontLocation, fontInstructions;

// Give on-screen user instructions
String instructions1 = "Weather for your City";
String instructions2 = "Another City?";
String instructions3 = "City Not Found, Try Again?";

// Set up some global values
int temperature;
XML weatherResults;

//Variable to stroke text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

void setup() {
  size(500, 500);
  background(200);
  //Font Setup
  fontTemperature = createFont("Arial", 150, true);
  fontLocation = createFont("Arial", 50, true);
  fontInstructions = createFont("Arial", 36, true);
  //Font Color
  fill(255);
  
  //Set up Locations
  location = new String[2];
  location[0] = "Berkeley"; //Default
  location[1] = "User Input";
  
  //Display Inital Location
  runGetWeatherByAddressChoreo(); //Run Choreo Function
  getTemperatureFromXML();
  displayColor();
  displayText();
}

boolean TextFieldTest = false; //Test whether user is inside textfield
int InstructionsTest = 0;

void draw() {
  
  noStroke();
  if (TextFieldTest==false) {
    fill(255,255);
  } else {
    fill(235,255);
  }
  rectMode(CENTER);
  rect(width/2, 7*height/8, width-20, height/8,10);
  rectMode(CORNER);
  
  //Set fontLocation & Fill
  textFont(fontInstructions);
  fill(0,255);
  //Display fontLocation
  textAlign(CENTER,CENTER);
  text(typing, width/2, 7*height/8);
  
  fill(50,100);
  textAlign(CENTER,CENTER);
  if ((InstructionsTest == 0) && (TextFieldTest == false)) {
    text(instructions1,width/2, 7*height/8);
  } else if ((InstructionsTest == 1) && (TextFieldTest == false)) {
    text(instructions2,width/2, 7*height/8);
  } else if ((InstructionsTest == 2) && (TextFieldTest == false)) {
    text(instructions2,width/2, 7*height/8);
  }
}

void mousePressed() {
  if ((mouseX>10) && (mouseX<width-10) && (mouseY>7*height/8-height/16) && (mouseY<7*height/8+height/16)) {
    TextFieldTest = true;
  } else {
    TextFieldTest = false;
  }
}

void keyPressed() {
  if (TextFieldTest == true) {
    if ((key == BACKSPACE) && (typing.length() > 0)) {
        typing = typing.substring(0, typing.length() - 1);
      } 
      else if (key == '\n' ) {
        // If the return key is pressed, save the String and clear it
        saved = typing;
        // A String can be cleared by setting it equal to ""
        typing = "";
        TextFieldTest = false;
        InstructionsTest = 1;
        location[1] = saved;
        currentLocation = 1;
        runGetWeatherByAddressChoreo();
        getTemperatureFromXML();
        displayColor();
        displayText();
      } 
      else {
        // Otherwise, concatenate the String
        // Each character typed by the user is added to the end of the String variable.
        typing = typing + key;
      }
  }
}

void runGetWeatherByAddressChoreo() {
  // Create the Choreo object using your Temboo session
  GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);

  // Set inputs
  getWeatherByAddressChoreo.setAddress(location[currentLocation]);

  // Run the Choreo and store the results
  GetWeatherByAddressResultSet getWeatherByAddressResults = getWeatherByAddressChoreo.run();

  // Store results in an XML object
  weatherResults = parseXML(getWeatherByAddressResults.getResponse());
}

void getTemperatureFromXML() {
  // Narrow down to weather condition
  XML condition = weatherResults.getChild("channel/item/yweather:condition");

  // Get the current temperature in Fahrenheit from the weather conditions
  temperature = condition.getInt("temp");

  // Print temperature value
  //println("The current temperature in "+location[currentLocation]+" is "+temperature+"ºF");
}

void displayColor() {
  // Set up the temperature range in Fahrenheit
  int minTemp = 10;
  int maxTemp = 95;

  // Convert temperature to a 0-255 color value
  float temperatureColor = map(temperature, minTemp, maxTemp, 0, 255);    

  // Set background color using temperature on a blue to red scale     
  background(color(temperatureColor, 0, 255-temperatureColor));
}

void displayText() {
  // Set up text margins
  fill(50,100);
  textAlign(CENTER,CENTER);

  // Display temperature
  textFont(fontTemperature);
  text(temperature + "º", width/2, height/2);

  // Display location
  textFont(fontLocation);
  text(location[currentLocation], width/2, 5*height/8);
}
