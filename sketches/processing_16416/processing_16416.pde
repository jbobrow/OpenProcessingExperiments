
/*
 TOPOGRAPHY OF KEYWORDS FROM RHIZOME.ORG
 
 THE SKETCH SCANS A DATASET OF BLOGPOST TAGS OVER THE LAST 6 MONTHS ON THE
 ART/TECH BLOG HTTP://RHIZOME.ORG, AND COUNTS HOW MANY TIMES THE INDIVIDUAL
 TAGS APPEAR.
 
 THE RESULT IS A GRID WITH THE Y-VALUE OF THE GRIDPOINTS RELATIVE TO THE 
 FREQUENCY THE TAG AT THAT GRIDPOINT APPEARS IN THE DATASET.
 
 THANKS TO RICK COMPANJE FOR THE HASHMAP CODE FROM http://wiki.processing.org/w/HashMap
 
 KEYS 1-6 SELECT THE MONTH
 MOUSEKEY/MOUSEX MOUSEY CONTROLS CAMERA
 CMD +  MOUSE MOVES CAMERA UP/DOWN/LEFT/RIGHT
 RIGHTMOUSE ZOOMS
 */

import peasy.*;
//import processing.opengl.*;

String[] data;        //string array to hold raw text 
String[] tag;         //string array to hold individual tags
String[] months = { 
  "NOVEMBER", "OCTOBER", "SEPTEMBER", "AUGUST" , "JULY", "JUNE"};

int[] xpos;           //x positions of grid
int[] zpos;           //z positions of grid
int[][] ypositions;   //2d array to hold keyword frequency as y values
int[][] pypositions;

PFont keywordFont;
PFont titleFont;
PFont monthFont;

PeasyCam peasy;
HashMap keywords = new HashMap();  //keyword HashMap

int gridsz = 400;     //Increment size of each row in the grid
int row;              //Amount of rows in the grid
int sensitivity = 80; //yposition multiplier
int hashSize;         //How many elements in the HashMap
float springDelay = 1.5; //how springy the mesh will be when loading between different datasets

int keywordFontSize = 48;
int titleFontSize = 24;
int monthFontSize = 16;
int w, pw = 0;

// S E T U P * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

void setup() {
  size(800, 600, P3D);
  peasy = new PeasyCam(this, 200);
  
  keywordFont = loadFont("HelveticaNeue-Light-48.vlw");
  titleFont = loadFont("HelveticaNeue-Light-24.vlw");
  monthFont = loadFont("HelveticaNeue-Light-16.vlw");

  textFont(titleFont, titleFontSize);
  init("november.txt");
}

// I N I T * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

//Initialise data/arrays/variables for setup()
void init(String source){
  keywords.clear();
  data = loadStrings(source); //fill data array with the source text

  for(int i=0; i<data.length; i++){
    addWord(data[i]);  //add the tags from the data array to our HashMap
  }

  hashSize = keywords.size();  //set the hashSize to the amount of tags in the HashMap
  row = int(sqrt(hashSize))-1;
  //set array sizes
  ypositions = new int[hashSize][hashSize];
  pypositions = new int[hashSize][hashSize];

  for(int i=0; i<hashSize; i++){
    for(int j=0; j<hashSize; j++){
      ypositions[i][j] = 0;
      pypositions[i][j] = 0;
    }
  }

  tag = new String[hashSize];
  xpos = new int[hashSize/row];
  zpos = new int[hashSize/row];

  println("hashSize: "+hashSize);

  //set the values for the gridpoints
  for(int i=0; i<hashSize/row; i++){
    for(int j=0; j<hashSize/row; j++){
      xpos[i] = i*gridsz;
      zpos[j] = j*gridsz;
    }
  }
}

// D R A W * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

void draw(){
  background(0);
  //set camera centrepoint
  translate(-(gridsz*5), 0, -(gridsz*5));

  //draw floor
  pushMatrix();
  stroke(0, 0, 255);
  noFill();
  rotateX(radians(90));
  rect(0, 0, gridsz*10, gridsz*10);
  popMatrix();
  textMode(MODEL);
  //draw the data to the screen
  getData();

  //sketch information
  peasy.beginHUD();
  ui(20, height-230, 30);
  peasy.endHUD();
}

// U S E R I N T E R F A C E * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

void ui(int x, int y, int monthInc){
  //draw the heads-up display
  //select months with number keys 1-6, selected month highlighted red
  textMode(SCREEN);
  textFont(titleFont, titleFontSize);
  text("CATEGORY TOPOGRAPHY", 20, 30);
  textFont(monthFont, monthFontSize);
  if(key=='1'){
    for(int i=0; i<months.length; i++){
      if(i==0){
        fill(255, 0, 0);
      }
      else{
        fill(255);
      }
      text(months[i], x, y+i*monthInc);
    }
  }
  else if(key=='2'){
    for(int i=0; i<months.length; i++){
      if(i==1){
        fill(255, 0, 0);
      }
      else{
        fill(255);
      }
      text(months[i], x, y+i*monthInc);
    }
  } 
  else if(key=='3'){
    for(int i=0; i<months.length; i++){
      if(i==2){
        fill(255, 0, 0);
      }
      else{
        fill(255);
      }
      text(months[i], x, y+i*monthInc);
    }
  }
  else if(key=='4'){
    for(int i=0; i<months.length; i++){
      if(i==3){
        fill(255, 0, 0);
      }
      else{
        fill(255);
      }
      text(months[i], x, y+i*monthInc);
    }
  }
  else if(key=='5'){
    for(int i=0; i<months.length; i++){
      if(i==4){
        fill(255, 0, 0);
      }
      else{
        fill(255);
      }
      text(months[i], x, y+i*monthInc);
    }
  }
  else if(key=='6'){
    for(int i=0; i<months.length; i++){
      if(i==5){
        fill(255, 0, 0);
      }
      else{
        fill(255);
      }
      text(months[i], x, y+i*monthInc);
    }
  }
  else{
    for(int i=0; i<months.length; i++){
      text(months[i], x, y+i*monthInc);
    }
  }
  fill(255);
  text("Keywords: "+hashSize, x, y+7*monthInc-20);
  fill(255, 0, 0);
  w = hashSize;
  w += (w-pw)/springDelay;
  rect(x, y+5*monthInc+10, w, 10);
  pw = w;
}

// S A V E F I L E * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

void keyPressed(){
  if(key=='1'){
    init("november.txt");
  }
  if(key=='2'){
    init("october.txt");
  }
  if(key=='3'){
    init("september.txt");
  }
  if(key=='4'){
    init("august.txt");
  }
  if(key=='5'){
    init("july.txt");
  }
  if(key=='6'){
    init("june.txt");
  }
}

// F I L L H A S H M A P * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

void addWord(String value) {
  Integer n = (Integer)keywords.get(value);
  int count = (n!=null ? n.intValue()+1 : 1);
  keywords.put(value, new Integer(count));
}

// D R A W D A T A * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

void getData(){

  textFont(keywordFont, keywordFontSize);

  int index1 = 0;        //variable to count first dimension of ypositions array
  int index2 = 0;        //variable to count second dimension of ypositions array
  int x = 0;             //x position for text
  int z = 0;             //z position for text

  //set up an Iterator to process our tags
  Set keys=keywords.keySet(); 
  Iterator iter = keys.iterator(); 

  //if there is another tag to iterate over...
  while(iter.hasNext()){ 
    String name = iter.next().toString();  //store the current tag as the name variable
    float f = Float.parseFloat(keywords.get(name).toString());  //get the frequency of the tag
    int intf = int(f);  //convert to an integer
    int currHeight = -intf*sensitivity;  //algorithm to control the ypositions

    //if the second index is greater than the amount of rows...
    if(index2>row){
      index2=0;  //reset to 0
      x=0;       //back to beginning of x row
      z+=gridsz; //move to a new z row
      index1++;  //increment first dimension of the ypositions array
    }
    else{
      index2++;  //else increment 2nd dimension variable
      x+=gridsz; //increment x by the grid size
    }

    ypositions[index1][index2] = currHeight;

    ypositions[index1][index2] += (ypositions[index1][index2]-pypositions[index1][index2])/springDelay; //fill array at specified array indices with the current y value

    //put text at the grid points
    pushMatrix();
    fill(255);
    translate(x+2.5, ypositions[index1][index2]-40, z);
    rotate(radians(-90));
    text(name, 0, 0);
    popMatrix();
    pypositions[index1][index2] = ypositions[index1][index2];
  }

  //draw the grid with vertices
  //points controlled with xpos[], ypositions[][] and zpos[] arrays
  stroke(255, 0, 0);
  noFill();

  //across
  for(int i=0; i<hashSize/row; i++){
    beginShape();
    for(int j=0; j<hashSize/row; j++){
      vertex(xpos[j], ypositions[i][j], zpos[i]);
    }
    endShape(OPEN);
  }

  //back
  for(int i=0; i<hashSize/row; i++){
    beginShape();
    for(int j=0; j<hashSize/row; j++){
      vertex(xpos[i], ypositions[j][i], zpos[j]);
    }
    endShape(OPEN);
  }
}

