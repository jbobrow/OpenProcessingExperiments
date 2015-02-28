
///////////////////////////////////////////////////////////////////////
////Rachel Hill Final Project: Data Visualization
////April 2014, hill.1523@osu.edu
////Reference/Inspiration:Micol Hebron (Gallery Tally)
////The code referenced (tweaked) in this file is from Hannah Organick 
////(www.openprocessing.org/sketch/60308)reference (courtesy Jenny)
///////////////////////////////////////////////////////////////////////

PImage mapImage;  //  background image

String[] data;  //  Declares Array of Strings
Gallery[] gallery;  //  Declares Array of Galleries

//  Reference Hannah Organick
void setup() {
  size(706, 550);  //  size of background
  mapImage = loadImage("MapofCbus3.jpg");  //  loading of background image

    //  String consisiting of: gallery name & percentage of males and females in that gallery
  data = loadStrings("GalTalDataFinal.csv"); 
  //  Creating and array of items the same length as the data
  gallery = new Gallery[data.length];

  //  Fill array with new items, info from data array
  for (int i = 0; i < data.length; i++) {
    gallery[i] = new Gallery(data[i]);
  }
}

//  Reference Hannah Organick
void draw() {
  background(#061006);  // Dark Green
  image(mapImage, 0, 0);  //  Background image loaded

  smooth();
  noFill();  //  No fill inside shapes
  strokeWeight(3);  //  Stroke weight of shape lines

  for (int i=0;i<data.length;i++) { //For each object in the array, a line is created
    gallery[i].display(); //Displays the objects
  }

  for (int i=0;i<data.length;i++) { //Text will be displayed for each object in the array in the bottom right corner
    //If the distance of the mouse is less than 10 from center of objects then text appears
    if (dist(gallery[i].getXPos(), gallery[i].getYPos(), mouseX, mouseY) < 10) { 
      //  Gallery Names
      textAlign(CENTER); // Text is centered
      fill(#96B577); //  Green text
      textSize(18);  //  Font size
      text(gallery[i].getName(), width-130, height-85); //  Displays the gallery name

      //  MALE
      textAlign(LEFT);  //  Aligns text to the left
      fill(#4867D6); //  Blue text
      textSize(16);  //  Font size 
      text(gallery[i].getPercent(), width-80, height-65); //  Displays %
      text("Male  " + gallery[i].getM(), width-155, height-65); //  Displays Male

      textAlign(LEFT);  //  Aligns text to the left
      fill(#EA3A8D);  //  Pink text
      textSize(16); //  Font size
      text(gallery[i].getPercent(), width-80, height-45); //Displays %
      text("Female  " + gallery[i].getF(), width-170, height-45); //Displays Female
    }
  }

  //  Title 
  textAlign(LEFT);  //  Aligns text to left
  textSize(20);  //  Size of text  
  fill(#96B577);  //  Light Green text Color
  text("2014 Gallery Statistics", 30, 25);  //  States title and position in top left corner

  //  Comparison Statistics 
  textAlign(LEFT);  //  Aligns text to left
  textSize(18);  //  Size of text
  fill(#96B577);  //  Light green text color
  text("Comparison between cities", 10, height-85);  //  Position of text

  //  Columbus
  textSize(16);  //  size of text
  fill(#96B577);  //  Light green text color
  text("Columbus", 10, height-65);  //  Postion of text
  //  Male statistic
  fill(#4867D6);  //  Male (BLUE)
  text("60%", 100, height-65);  //  Position of text
  //  Female statistics
  fill(#EA3ABD);  //  Female (PINK)
  text("40%", 140, height-65);  //  Position of text

  //  Key instructions
  textSize(18);  //  Size of text
  fill(#96B577);  //  Light green text color
  text("For NY press N, for Chicago press C, for LA press L", 10, height-45);  //  Position of text

  //  Reference Micol Hebron Data collection for NY, Chicago, and LA
  //  New York City
  if (key == 'n' || key == 'N') {  // If n or N pressed show New York City Statistics
    textSize(16);  //  Size of text
    fill(#96B577);  // Light green text color
    text("New York City, 2013.", 10, height-25);  // Position of text
    //  Male statistics
    fill(#4867D6);  //  Male (BLUE)
    text("81%", 185, height-25);  //  Position of text
    //  Female statistics
    fill(#EA3ABD);  //  Female (PINK)
    text("14%", 225, height-25);  //  Position of text
  }  //  Chicago 
  else if (key == 'c' || key == 'C') {  //  If c or C pressed show Chicao Statistics
    textSize(16);  //  Size of text
    fill(#96B577);  // Light green text color
    text("Chicago, 2013.", 10, height-25);  // Position of text
    //  Male statistics
    fill(#4867D6);  //  Male (BLUE)
    text("83%", 138, height-25);  //  Position of text
    //  Female statistics
    fill(#EA3ABD);  //  Female (PINK)
    text("17%", 178, height-25);  //  Position of text
  }  //  Los Angeles
  else if (key == 'l' || key == 'L'){
    textSize(16);  //  Size of text
    fill(#96B577);  // Light green text color
    text("Los Angeles, 2013.", 10, height-25);  // Position of text
    //  Male statistics
    fill(#4867D6);  //  Male (BLUE)
    text("83%", 165, height-25);  //  Position of text
    //  Female statistics
    fill(#EA3ABD);  //  Female (PINK)
    text("11%", 205, height-25);  //  Position of text
  }
}

class Gallery { 
  String name;  //  Gallery names
  String percent;  // Percent sign
  int m;  //  Male percentages
  int f;  //  Female percentages
  int xPos;  //  Postion on the x
  int yPos;  // Position on the y
  int gender;  //  Controls dominate gender
  

  Gallery(String line) { //  Constructor
    String[] data = line.split(",");  //  Splits each String  
    //  The variable is = to the data from the respective columns in the GalTalData.cvs table
    name = data[0];  
    percent = data[1];
    m = int(data[2]);
    f = int(data[3]);
    xPos = int(data[4]);  
    yPos = int(data[5]); 
    gender = int(data[6]);
  }

  //  Class Display
  void display() { 
    if (gender == 1) {  //  Calls to column to determine male = 1
      stroke(#133AAC);  //  Male(BLUE)
      ellipse(xPos, yPos, 20, 20);  // Origin circle
      line(xPos+7, yPos-17, xPos+15, yPos-15);  //  Left part of arrow
      line(xPos+17, yPos-7, xPos+15, yPos-15);  //  Right part of arrow
      line(xPos+7, yPos-7, xPos+15, yPos-15);  //  Starting line of arrow
    } 
    if (gender == 2) {  //  Calls to column to determine female = 2
      stroke(#D2006B);  //  Female(PINK)
      ellipse(xPos, yPos, 20, 20);  //  Origin circle
      line(xPos, yPos+10, xPos, yPos+25);  //  Verticle line
      line(xPos+7, yPos+19, xPos-7, yPos+19);  //  Horizonatl line
    }
  }

  //  Returns gallery name
  String getName() {
    return name;
  }
  //  Returns % 
  String getPercent(){
    return percent;
  }
  //  Returns male
  int getM() {
    return m;
  } 
  //  Returns female
  int getF() {
    return f;
  } 
  //  Returns the position on the x
  int getXPos() {
    return xPos;
  } 
  //  Returns the position on the y
  int getYPos() {
    return yPos;
  } 
  //  Returns the gender 1 = male, 2 = female
  int getGender() {
    return gender;
  }
}



