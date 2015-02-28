
//========================================================
// Introduction
//========================================================
/*MoodMapMe is a program that displays your daily route (based on GPS tracking) in relation to your mood. 
At SIAT, I am interested in using technology to facilitate greater connections to our community and our local physical
environment. As such, I was curious to know if MoodMapMe a) would give me a greater sense of my mood based on my location
and b) if by using MoodMapMe, I would be encouraged to explore new uncharted areas in Vancouver. 

While I can not make any generalizations of my mood in relation to my location, I did feel that MoodMapMe did encourage
me to explore new areas, that I would not otherwise explore without MoodMapMe.

The colors used to represent mood are based on the spectrum of the Rainbow and 

    1 = blue = Sad
    2 = green = Content
    3 = yellow = Happy
    4 = red  = Very Happy

I hope you enjoy using MoodMapMe, and I encourage you to download the GPX Master App, 
(https://itunes.apple.com/us/app/gpx-master/id406096613?mt=8), to use it for yourself.
Use GPX Master to capture a GPX file, and convert it to a .csv file using GPS Visualizer  
(http://www.gpsvisualizer.com/). Load the .csv files into your Data folder of the MoodMapMe Program.

Created by Dan Hawkins
Email: drhawkin@sfu.ca
Date: November 25th, 2012
IAT 800, Project #3, SFU SIAT
*/ 

//========================================================
// Global Variables
//========================================================
PImage mapVan, allWeek, allWeekMap, errorMessage; // Background images
PFont font; // Text font
PFont impact; //impact Font used in Intro
String[] pointData; // Array of Strings that contains the Lat/Long points of my Day
Point[] pointArray; // Array of Points, created from pointData, when parsed

int currentFile = 1; // current file, loaded from data

//colors
int randomValue = int(random(7));
color backGround = color(245,  250, 225);
color blueColor = color (0,127,255);
color greenColor = color (144,238,144);
color yellowColor = color (255,215,0);
color redColor = color (255,99,71);
color circleColor = color (255,99,71);

color c; // intitalizing c (color), used in objects
int currentPalette = '1'; //setting the initial (and current) palette to 1 (blue palette)


//Spacing used for objects
int yStart = 200; // set a value to place the beginning of the objects on the starting screen
int ySpace = 30; // set a value to space the starting position of the objects on beginning screen

// Map coordinate (start and end points)
float w_start = -123.2659;  // Longtitude start (largest longitude value)
float w_end = -122.8450; // Longtitude end (smallest longitude value)
float h_start = 49.312634; // Latitude start (largest latitude value)
float h_end = 49.184546;  // Latitude end (smallest latitude value)

myCharacter[] myC= new myCharacter[8]; // declare new Characters

//text messages 
String nov15 = "November 15th, 2012";
String nov16 = "November 16th, 2012";
String nov17 = "November 17th, 2012";
String nov18 = "November 18th, 2012";
String nov19 = "November 19th, 2012";
String nov20 = "November 20th, 2012";
String allDay = "November 15th to 20th, 2012 ";
String title = "Mood Map Me: X,Y,Mood";
String tagline = "MoodMapMe maps your mood related to your location";

//========================================================
// SET-UP Function
//========================================================
void setup() {
  background(backGround);
  size(1000, 500);
  frameRate(20);
  smooth();
  mapVan = loadImage("vancouverTerrain.png"); // Load Vancouver Map
  allWeek = loadImage("allWeek.png"); // load All Week image
  allWeekMap = loadImage("allWeekMap.png"); //all week with map image
  errorMessage = loadImage("errorMessage.png"); // error message when GPS files are not located
  font = loadFont("HelveticaNeue-30.vlw"); // Load Helvetica font
  impact = loadFont("Impact-48.vlw");// load impact font
 
 //exception catch - try to lage importFiles -- if files are not present or in Data folder, load error Message
 try {
  importTextFile();
 } catch (Exception e) {
   background(errorMessage); // error message
   println ("Error loading files"); // message to user
 }
   
//objects displayed at the beginning of the program, currentfile#1,
// Color, Xpos, Ypos, Speed
myC[0] = new mePerson(color(circleColor),100,(yStart +ySpace),random(6,9));   

myC[1] = new mePerson(color(circleColor),250,(yStart + 3*(ySpace)),random(3,6));

myC[2] = new mePerson(color(circleColor), 500,(yStart + 5*(ySpace)),random(10,12));

myC[3] = new mePerson(color(circleColor), -250,(yStart + 7*(ySpace)),random(8,12));

myC[4] = new otherPerson(color(circleColor),width - 100, (yStart + 2*(ySpace)),random(4,6));

myC[5] = new otherPerson(color(circleColor),width - 400,(yStart + 4*(ySpace)),random(2,5));

myC[6] = new otherPerson(color(circleColor),width,(yStart + 6*(ySpace)),random(5,15));
  
myC[7] = new otherPerson(color(circleColor),width + 300,(yStart + 8*(ySpace)),random(8,13));

  }//end setup
   
//========================================================
// DRAW Function
//========================================================

void draw() {

noStroke();
  // Display the points on the map
  for (int i = 0; i < pointArray.length; i++) {
    pointArray[i].display();
    //  println(pointArray[i]);
    //  println("mood: " + pointArray[i].name + " pos_x: " + pointArray[i].pos_x + " pos_y: " + pointArray[i].pos_y);
  }

   if (currentFile == 1) {
     background(backGround);
     openText();
     tagline ();
     rules();
 for(int i=0; i<myC.length ; i++){
    myC[i].move();
    myC[i].display();

    }//end for loop
   }//end if CurrentFile #1
   
}// end draw 

//========================================================
// COLOR PALlETE 
//========================================================
    /* 
    1 = blue = Sad
    2 = green = Content
    3 = yellow = Happy
    4 = red  = Very Happy
    */
    
    //color palette array
  color[] Bpalette=new color[7]; // color array for Bpalette (blue)
  color[] Gpalette=new color[7]; // color array for Gpalette (green)
  color[] Ypalette=new color[7]; // color array for Ypalette (yellow)
  color[] Rpalette=new color[7]; // color array for Rpalette (red)

//========================================================
//HEADER IN DATA 
//========================================================
///remove header function [adapted from user theprof via Processing Forum ] 
// https://forum.processing.org/topic/mapping-gps-locations-to-a-2d-u-s-map
 
  String[] removeHeaders(String[] stringArray) {
  String[] temp = new String[stringArray.length - 1]; // remove the first element in the array (ie the header)
  for (int i = 0; i < temp.length; i++) {
    temp[i] = stringArray[i + 1];
  }
  return temp;
}


//========================================================
// IMPORT TEXT FILE FUNCTION - and parse csv file
//========================================================
 
 void importTextFile() 
 {
 pointData = loadStrings(currentFile+".csv"); // Load point information
 pointData = removeHeaders(pointData); // Remove the header line

  
  // This section extracts data from the pointData array and uses it to create point object
  int latitude_col = 0; // Latitude is the first column in the excel file,  thus is the first element in the array
  int longitude_col = 1; // longititude is the secondond column in the excel file, thus is the second elemeny in the array
  int mood_col = 2;

  // Initialize the pointArray array to have the same length as point Data
  pointArray = new Point[pointData.length];
  
  // assign pointData values to the pointArray based on the lon/lat value of the pointData Array 
  for (int i = 0; i < pointData.length; i++) {
    String[] values = split(pointData[i], ",");
    pointArray[i] = new Point(values[longitude_col], values[latitude_col], values[mood_col]); //assign pointData to pointArray
  } //end assigning pointData
  
 } //end importTextTile function
 
 
 
//========================================================
// IF KEYS PRESSED -- allow different display options (ie Each Day)
//========================================================
void keyPressed () {
  
   if (key == '1') { // load starting screen
     background(backGround);
  
     currentFile = 1; //load file #1
     importTextFile(); 
    }
   // load Nov 15th Day, file #2
  if (key == '2') {
    background(backGround);
    fill(10);
    textFont(impact);
    textSize(20);
    text(nov15, 10, 20);
    currentFile = 2;
    importTextFile();
  }
  // load Nov 16th Day, file #3
    if (key == '3') { 
    background(backGround);
    fill(10);
    textFont(impact);
    textSize(20);
    text(nov16, 10, 20);
    currentFile = 3;
    importTextFile();
  }
   // load Nov 17th Day, file #4
   if (key == '4') {
    background(backGround);
    fill(10);
    textFont(impact);
    textSize(20);
    text(nov17, 10, 20);
    currentFile = 4;
    importTextFile();
  }
   // load Nov 18th Day, file #5
  if (key == '5') {
    background(backGround);
    fill(10);
    textFont(impact);
    textSize(20);
    text(nov18, 10, 20);
    currentFile = 5;
    importTextFile();
  }
   // load Nov 19th Day, file #6
  if (key == '6') {
    background(backGround);
    fill(10);
    textFont(impact);
    textSize(20);
    text(nov19, 10, 20);
    currentFile = 6;
    importTextFile();
  } 
  //load Nov 20th Day, file #7
  if (key == '7') {
    background(backGround);
    fill(10);
    textFont(impact);
    textSize(20);
    text(nov20, 10, 20);
    currentFile = 7;
    importTextFile();
  }
   // load All Days
   if (key == 'a'|| key == 'A') {
      currentFile = 8;
      background(allWeek);
  }
  //load All Days with Map
  if (key == 'z'|| key == 'Z') {
    currentFile = 8;
    background(allWeekMap);
  }
   //save frame
   if (key == 's' || key == 'S') {
    saveFrame();
  }
  //bring current file back to 1
  if (key == '0') {
   currentFile = 1;
  }
  // draw background Vancouver Map
 if (key == ENTER) {
  image(mapVan,0,0); // draw background image
  }
  // remove Map
 if (key == TAB) // remove background Map image
 {
    background(backGround); // exit map mode
  }//end Tab, exit from map 
}//end keyPressed
  
//========================================================
// Opening Screen Text
//========================================================

//title text
void openText () {
  
    textFont(impact);
    textSize(40);
    text(title, 10, 50);
}
// tagline underneath title
void tagline () {
    
    textFont(impact);
    textSize(20);
    text(tagline, 10, 70);
}
//instructions for user
void rules () {
    textFont(impact);
    fill(150);
    textSize(15);
  
    text("Press key #1 to load Start Screen", 10, height - 20);
    text("Press keys #2 to #7 load a day", 10, height - 5);
    
    text("Press A for all days", 250, height - 5);
    text("Press Z for all days w/ Map", 250, height-20);
    
    text("Press ENTER to load Vancouver Map", 500, height-20);
    text("Press S to save frame", 500, height-5);
    
    text("Created by drhawkins@sfu.ca", 800, height-20);
    text("Nov 25th, 2012", 800, height-5);
}

//New Class myCharacter
//new abstract class used to create beginning objects (squares and circles)
abstract class myCharacter {
color c; //color of object
float xpos; // x position of object
float ypos; // y position of object
float xspeed; // x speed of object

//myCharacter constructor 
myCharacter(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
  
c = tempC; //color
xpos = tempXpos; // xposition
ypos = tempYpos; //y position
xspeed = tempXspeed; // speed
}
void setSpeed(float s){
this.xspeed=s;
}
float getSpeed(){
return this.xspeed;
}
void move() {
xpos = xpos + xspeed;
if (xpos > width) {
xpos = 0;
}
} //end move fuction

void display(){
}

}//end Character Object

//new class Point - used to represent the lat/long coordinate point of the traveler, and mood
class Point {

 float longitude; // Longitude
 float latitude; // Latitude
 float mood_c; // mood (and color)
 float pos_x; // x-position on the screen
 float pos_y; // y-position on the screen

 
 // Constructor; take the values from the main program to create the Object
 Point( String longitude_, String latitude_, String mood_) {
  
   longitude = Float.valueOf(longitude_);
   latitude = Float.valueOf(latitude_);
   mood_c = Float.valueOf(mood_);
   // Map the longitude and latitude to coordinates on the screen
   pos_x = map(longitude, w_start, w_end, 0, width);
   pos_y = map(latitude, h_start, h_end, 0, height);
   // Set the radius of the circle
 
 } //end constructor 
 
 // parsing function adapted from theprof via Processing Forum
 // https://forum.processing.org/topic/mapping-gps-locations-to-a-2d-u-s-map
 int parseNumber(String input) 
  {
   // Remove commas and place the fragments into a temp Stringarray
   String[] fragments = split(input, ',');
   // Create an empty output String
   String output = "";
   // Join the fragments together
   for (int i = 0; i < fragments.length; i++) {
     output = output + fragments[i];
   } 
   
   // Return an integer value of the output
   return int(output);
  }// end parseNumber
 
 
 void display() {

   //mood color assigned to initial gray, but depending on the mood number from the .csv file, read and display mood color
  color moodColor = color (100);
  int randomValue = int(random(7)); //random number used to select color from array/palette
  
   // select a random color from the Blue Palette  when mood = 1
     if (mood_c == 1)  
     {
      color randomColor = Bpalette[ randomValue ];
      Bpalette[0]=color(0,127,255);
      Bpalette[1]=color(3,180,200);
      Bpalette[2]=color(99,184,255);
      Bpalette[3]=color(30,144,255);
      Bpalette[4]=color(24,116,205);
      Bpalette[5]=color(0,191,255);
      Bpalette[6]=color(0,191,255);
       
       moodColor =  randomColor;
     }
       
       // select a random color from the Green Palette when mood = 2
     if (mood_c == 2)  
     {
      color randomColor = Gpalette[ randomValue ];
      Gpalette[0]=color( 2,157,116);
      Gpalette[1]=color(0,255,127);
      Gpalette[2]=color(0,205,102);
      Gpalette[3]=color(144,238,144);
      Gpalette[4]=color(0,238,118);
      Gpalette[5]=color(154,255,154);
      Gpalette[6]=color(0,205,0);
         
       moodColor =  randomColor;
     }
       // select a random color from the Yellow Palette when mood = 3
      if (mood_c == 3)  
     {
       color randomColor = Ypalette[ randomValue ];
      Ypalette[0]=color(238,238,0);
      Ypalette[1]=color(238,201,0);
      Ypalette[2]=color(255,215,0);
      Ypalette[3]=color(219,219,112);
      Ypalette[4]=color(255,255,51);
      Ypalette[5]=color(255,255,204);
      Ypalette[6]=color(255,255,153);
    
      moodColor =  randomColor;
     }
     
       // select a random color from the Red Palette  when mood = 4
       if (mood_c == 4)  
     {
         
        color randomColor = Rpalette[ randomValue ];
        Rpalette[0]=color(238,92,66);
        Rpalette[1]=color(238,92,66);
        Rpalette[2]=color(255,99,71);
        Rpalette[3]=color(255,69,0);
        Rpalette[4]=color(238,59,59);
        Rpalette[5]=color(166,42,42);
        Rpalette[6]=color(139,35,35);
         
        moodColor =  randomColor;
     }
     
     
      fill(moodColor); //fill the points with corresponding mood number/color
      ellipse(pos_x, pos_y, 10,10); //display points as a ellipse
      //println(mood_c);
 } //end display
 
} //end Point Class
 
  

//New Class mePerson
//mePerson object, extended from myCharacter Abstract - used at beginning of program
// mePerson represented by Circles

class mePerson extends myCharacter{
mePerson(color tempC, float tempXpos, float tempYpos, float tempXspeed){
  //inherited form myCharacter
super(tempC,tempXpos,tempYpos,tempXspeed);
}
void display() {
noStroke();
fill(c);
rectMode(CENTER);
ellipse(xpos,ypos,20,20); //size and position of circles
frameRate(10); // frame rate slowed down for objects

//if position is greater than 0, then make blue
if (xpos > 0) {
   c = blueColor;
  }
//if position is greater than 250, then make green  
if (xpos > 250) {
   c = greenColor;  
  }
//if position is greater than 500, then make yellow 
if (xpos > 500) {
  c = yellowColor; 
  }
//if position is greater than 750, then make red   
if (xpos > 750) {
  c = redColor;
  }
  
} // end display


}//end class
// New Class otherPerson
//other person object, extended from mePerson - used at beginning of program
// otherPerson represented by Squares
class otherPerson extends mePerson {
  
otherPerson(color tempC, float tempXpos, float tempYpos, float tempXspeed)
{
super(tempC,tempXpos,tempYpos,tempXspeed);
}
//display function of otherPerson
void display() {
noStroke();
fill(c);
rectMode(CENTER);
rect(xpos,ypos,20,20); //other person represented by Square, 20 by 20

  //if position is less than 350, then make red
if (xpos < width-250) {
  c = redColor;
  }
  //if position is less than 500, then make blue
if (xpos < width-500) {
  c = blueColor;
  }
    //if position is less than 750, then make green
if (xpos < width-750) {
  c = greenColor;
  }
  
} //end display

void move() {
xpos = xpos - xspeed; // decrease speed by speed, ie move left across screen
if (xpos < 0) { // if the object moves past 0, then reload at width
xpos = width;
} 
}//end move



} // end otherPerson


