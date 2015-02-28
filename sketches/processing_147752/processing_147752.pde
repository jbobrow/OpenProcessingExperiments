
//siv Sophie Vennix
//May 13, 2014, Final Project I: Visualizing a Set of Data
//Data at http://www.emporis.com and http://www.manyeyes.com

//INSTRUCTIONS:
//This program shows the 20 tallest sky scrapers in 
//NYC, Dubai, Hong Kong, Tokyo, and Chicago, resulting in 
//100 displayed buildings total. 

//Each building pops up at the time it was built (time is shown
//at the top), and all the buildings are sized respectively to 
//eachother. 

//To restart, just press the spacebar. 

String [] buildings;

String [] cities;
int [] heights;
int [] years;
float [] offsets; 

int rectWidth = 20; 
int rectY;
int year;

int nyOffset;
int hkOffset;
int chiOffset;
int tkoOffset;
int dubOffset;

color nyCol = color(255, 24, 0, 180);
color hkCol = color(255, 124, 0, 180);
color chiCol = color(4, 133, 157, 180);
color tkoCol = color(0, 193, 43, 180);
color dubCol = color(172, 43, 80, 180); 

void setup()
{
  size(800, 400);

  rectY = height;
  int margin = 0;
  year = 1900;

  buildings = loadStrings("skyData.txt");

  cities = new String[buildings.length];
  heights = new int[buildings.length];
  years = new int[buildings.length];
  offsets = new float[buildings.length];

  for (int i = 0; i < buildings.length; i++)
  {
    String [] buildingAttributes = split(buildings[i], ' ');

    cities[i] = buildingAttributes[0];
    heights[i] = int(buildingAttributes[1]);
    years[i] = int(buildingAttributes[2]);
    offsets[i] = random(50, 750);
  }
}

void draw()
{
  background(255);
  rectMode(CORNER);
  noStroke();


  //DRAW NAMES OF CITIES
  cityNameIndex();

  //DRAW THE YEAR
  countYears(); 
  year++;
  if (year > 2014) 
  {
    year = 2014;
  }

  for (int i = 0; i < buildings.length; i++)
  {
    fill(getCityCol(cities[i]));
    float x = offsets[i];
    float h = convertHeight(heights[i]);
    float y = rectY - h;
    int w = rectWidth;

    ///ANIMATE BUILDINGS
    if (year >= years[i])
    {
      rect(x, y, w, h);
    }
  }
}

color getCityCol(String cityName)
{
  if (cityName.equals("chicago")) {
    return chiCol;
  } 
  else if (cityName.equals("newyorkcity")) {
    return nyCol;
  } 
  else if (cityName.equals("tokyo")) {
    return tkoCol;
  } 
  else if (cityName.equals("dubai")) {
    return dubCol;
  } 
  else if (cityName.equals("hongkong")) {
    return hkCol;
  }
  return color(0, 0, 0);
}

int getCityOffset(String cityName) 
{
  if (cityName.equals("chicago")) {
    return chiOffset;
  } 
  else if (cityName.equals("newyorkcity")) {
    return nyOffset;
  } 
  else if (cityName.equals("tokyo")) {
    return tkoOffset;
  } 
  else if (cityName.equals("dubai")) {
    return dubOffset;
  } 
  else if (cityName.equals("hongkong")) {
    return hkOffset;
  }
  return 0;
}

float convertHeight(int feet)
{
  return feet/2717.0 * 220;
}

void countYears()
{
  frameRate(5);
  
  ///COURIER BOLD
  PFont courierBold;
  courierBold = loadFont("Courier-Bold-48.vlw");
  textFont(courierBold);
  textSize(30);
  fill(100); 
  textAlign(CENTER);

  //YEAR DISPLAY COUNTING UP
  text(" "+year+" ", width/2, 50);
}

//CITYNAMEINDEX
void cityNameIndex()
{
  //COURIER
  PFont courier;
  courier = loadFont("Courier-48.vlw");
  textFont(courier); 
  textSize(14);
  textAlign(LEFT);

  //NEW YORK CITY
  fill(nyCol);
  text("new york city", 45, 60);

  //HONG KONG
  fill(hkCol);
  text("hong kong", 45, 80);

  //CHICAGO
  fill(chiCol);
  text("chicago", 45, 100);

  //TOKYO
  fill(tkoCol);
  text("tokyo", 45, 120);

  //DUBAI
  fill(dubCol);
  text("dubai", 45, 140);
}

//RESTART PROGRAM
void keyPressed()
{
  if (key == ' ')
  {
    year = 1900;
  }
}



