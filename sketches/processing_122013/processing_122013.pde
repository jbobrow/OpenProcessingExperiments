

/* 
 
 Group - 9 - Andrew Stewart, Joanna Strońska & Joshua Avern 
 
 Data Gift Project - AC21010.5 - aboutDundee -  
 
 aboutDundee is designed to give quick, concise information regarding pubs and restaurants around central Dundee. 
 
 Our data gift is designed to aid the day to day life of a typical student in Dundee.
 Designed specifically with Andrew’s flatmate in mind, it pinpoints restaurants and pubs/bars on a map of Dundee, all of which display their names on hovering and link to their websites when clicked.
 The app also displays the time and local weather for the day, which is taken from a feed on the internet, which will help determine the correct clothing to be worn!
 Fun facts and random restaurants are generated on the left hand side, so there is always a fresh option on the mind for the user!
 
 */

//Initialising variables ================================>

PImage mapImage;
PImage titleImage;

Table locationTable;
Table nameTable;
Table websitesTable;
int rowCount;
int centX;
int centY;
int radius;

int c1;
int temperature = 0;
String weather = "";

//An array containing the images for the Restaurant chooser.
int imageArray = 5;
int imageIndex = 0; //set the imageIndex to 0 - this will allow the program to start with a specific image showing.
PImage[] images = new PImage [imageArray];

//An array containing the 'facts about Dundee images
int factArray = 17;
int factIndex = 0; //set the imageIndex to 0 - this will allow the program to start with a specific image showing.
PImage[] factImages = new PImage [factArray];


// The location data for the weather - gives the weather for Dundee. This is taken from the Yahoo weather service.
String zip = "18637";

PFont font;

//variables for the digital clock
int centerX;
int centerY;
int radius1;
int c2;

//map - table data
Table dataTable;
float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

//End of Initialising variables ================================>

void setup() {
  size(1278, 755);

  //Weather data
  // The URL for the XML document - Pulls weather information from Yahoo
  String url = "http://xml.weather.yahoo.com/forecastrss?w=" + zip;

  // Loads the XML document
  XML xml = loadXML(url);

  // Takes the information that aboutDundee will use
  XML forecast = xml.getChild("channel/item/yweather:forecast");

  // gets the specific weather information
  temperature = ((forecast.getInt("high") - 32) * 5) / 6; 
  /* We had difficulties working out how to pull the temperature in celcius. After reading through the API provided by Yahoo we could still not get this working. 
   We created the above algorithm that would take the data in fahrenheit and then convert it into celcius. */
  weather = forecast.getString("text");

  //digital clock
  centerX = width / 2;
  centerY = height / 2;
  radius1 = min(width, height) / 2;

  // fact images - This will allow the user to cycle through the array of images at random.
  for (int f = 0; f < factImages.length; f++ ) {
    factImages[f] = loadImage( "fact" + f + ".jpg" ); //picks a random image from the array to display to the user. 

    //Restaurant picker  - This will allow the user to cycle through the array of images at random.
    for (int i = 0; i < images.length; i++ ) {
      images[i] = loadImage( "luck" + i + ".jpg" ); //picks a random image from the array to display to the user. Each image is called 'Dundee' plus a number from 0 - 5.jpg

      //map
      titleImage = loadImage("title.png");
      mapImage = loadImage("map.jpg");
      locationTable = new Table("locations.tsv");
      nameTable = new Table("names.tsv");
      rowCount = locationTable.getRowCount();
      dataTable = new Table("random.tsv");
      websitesTable = new Table("websites.tsv");


      for (int row = 0; row < rowCount; row++) {
        float value = dataTable.getFloat(row, 1);
        if (value > dataMax) {
          dataMax = value;
        }
        if (value < dataMin) {
          dataMin = value;
        }
      }

      PFont font = loadFont("Univers-Bold-12.vlw");
      textFont(font);

      smooth();
      noStroke();
    }
  }
}

//===========================>

void draw() {
  background(255);
  fill(0);
  rect(230, 14, 10, displayHeight);
  rect(0, 14, displayWidth, 10);
  rect(0, 75, displayWidth, 10);
  rect(0, 170, displayWidth, 10);
  fill(#17670C);
  noStroke();
  rect(0, 0, displayWidth, 12);
  image(images[imageIndex], 5, 190); //Displays the image of the restaurant that the user can cycle through when picking where to eat.
  image(factImages[factIndex], 5, 500);


  // Display all the stuff we want to display
  fill(0);
  text("THE WEATHER IN DUNDEE:", 10, 120);

  // The following text changes  colour depending on the temperature. - Blue, purple, pink & red

  if ( temperature <= 0)  //Blue - if the temperature is less than 0 the text will be blue.
  {
    fill(#2647FA);
    text("Today’s High: " + temperature + "C", 30, 140);   
    text("Forecast: " + weather, 30, 160);
  }

  if ( temperature > 0 && temperature <= 10) //Purple - if the temperature is greater than 0 but less than 10 the text will be purple.
  {
    fill(#8826FA);
    text("Today’s High: " + temperature + "C", 30, 140);
    text("Forecast: " + weather, 30, 160);
  }

  if ( temperature > 10 && temperature <= 20) // If the temerature is greater than 10 but less than 20 then the text will be pink.
  {
    fill(#FA26E2);
    text("Today’s High: " + temperature + "C", 30, 140);
    text("Forecast: " + weather, 30, 160);
  }

  if ( temperature > 20) //If the temperature is greater than 20 then the text will be red.
  {
    fill(#FA2626);
    text("Today’s High: " + temperature + "C", 30, 140);
    text("Forecast: " + weather, 30, 160);
  }

  //digital clock
  textSize(15);
  fill(#FA8626);
  text(nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2), 10, 104);
  textSize(12);

  //map
  image(titleImage, 0, 27, 228, 45);
  image(mapImage, 243, 27, mapImage.width, mapImage.height);

  for (int row = 0; row < rowCount; row++) {
    String abbrev = dataTable.getRowName(row);
    float x = locationTable.getFloat(abbrev, 1);
    float y = locationTable.getFloat(abbrev, 2);
    drawData(x, y, abbrev);
  }
}

//===========================>

void drawData(float x, float y, String abbrev) {
  float value = dataTable.getFloat(abbrev, 1);  
  float radius = 0;
  if (value >= 0) {
    radius = map(value, 0, dataMax, 1.5, 15);
    stroke(0);
    strokeWeight(1.5);
    fill(#2782FF);
  } 
  else {
    radius = map(value, 0, dataMin, 1.5, 15);
    fill(#FF365B);
  }
  ellipseMode(RADIUS);
  ellipse(x, y, radius, radius);

  if (dist(x, y, mouseX, mouseY) < radius+9) {


    textAlign(LEFT);
    String name = nameTable.getString(abbrev, 1);
    int l1 = name.length();
    fill(#FDFFFC);
    rect(x, y, l1*15, 20);
    ellipse(x, y, radius + 2, radius + 2);
    fill(0);
    text(name + " ", x + 12, y + 14); // when the user hovers over one of the markers the name of the location will be displayed.

    if (mousePressed) {
      String web = websitesTable.getString(abbrev, 1); //when the user clicks on one of the locations, it will take them to the website. The URLs are stored in the data folder.
      link(web);
    }
  }
}

//===========================>

void mousePressed() { //when the mouse is clicked the program will cycle through the two image arrays at random. This allows the user to select a restaurant at random and view some facts about dundee.
  imageIndex = int(random(images.length));
  factIndex = int(random(factImages.length));
}

class Table {
  int rowCount;
  String[][] data;
  
  
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      
      // split the row on the tabs
      String[] pieces = split(rows[i], TAB);
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
      
      
    }
    // 
    data = (String[][]) subset(data, 0, rowCount);
  }
  
  
  int getRowCount() {
    return rowCount;
  }
  
  
 // this will find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  String getRowName(int row) {
    return getString(row, 0);
  }


  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

  
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }  
}


