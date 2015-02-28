
//NASDAQ Project
//Feb. 19, 2012
//Tracy Carlin
//For Computational Expression

int stockNum; // total # of stocks we are tracking
float barSize;  //width of the bar
int margeN; // margin
int nasdaqDates; //# of closing days recorded
PImage nasdaqLogo, eaLogo, wfLogo, blizzardLogo, sBuxLogo, fullLogo; // pictures to go with each company

float[] closeCostNasdaq, closeCostEA, closeCostWF, closeCostBlizzard, closeCostSBux; // the cost of the share at the end of close, one for each company

float DAQHi, wholeMax; // max close stock size for NASDAQ

float startX, startY; //the start for ach bar graph

void setup() {
  size (800, 600); //size of the window
  smooth(); //smooth rectangles
  strokeWeight(1); // thin lines

  //NASDAQ Setup here
  nasdaqLogo = loadImage("nasdaqLogo.png"); //loading in the logo
  nasdaqLogo.resize(75, 75); //resizing that sucker
  String dataLines[]=loadStrings("NASDAQClose.csv"); //finding the NASDAQ data
  nasdaqDates=dataLines.length; // defining the # of dates we are looking at

  closeCostNasdaq = new float [nasdaqDates]; //naming the relevant data inside NASDAQDates - the closing date

  for (int counter=0;counter<nasdaqDates;counter++) { //parsing NASDAQ data to find closing dates
    String[] temp = split(dataLines[counter], ',');
    closeCostNasdaq[counter]=float(temp[4]); // parsing out just line five, which is related to the close of day
    //close of day is all we need.
  }
  //EA Setup here

  eaLogo = loadImage("eaLogo.png"); //loading in the logo
  eaLogo.resize(75, 75); //resizing that sucker

  String dataLinesEA[]=loadStrings("EAClose.csv"); //finding the NASDAQ data

  closeCostEA = new float [nasdaqDates]; //naming the relevant data inside NASDAQDates - the closing date

  for (int counter=0;counter<nasdaqDates;counter++) { //parsing NASDAQ data to find closing dates
    String[] temp = split(dataLinesEA[counter], ',');
    closeCostEA[counter]=float(temp[4]); // parsing out just line five, which is related to the close of day
    //close of day is all we need.
  }

  //Whole Foods Setup here

  wfLogo = loadImage("wfLogo.png"); //loading in the logo
  wfLogo.resize(75, 75); //resizing that sucker

  String dataLinesWF[]=loadStrings("WholeFoodsClose.csv"); //finding the NASDAQ data

  closeCostWF = new float [nasdaqDates]; //naming the relevant data inside NASDAQDates - the closing date

  for (int counter=0;counter<nasdaqDates;counter++) { //parsing NASDAQ data to find closing dates
    String[] temp = split(dataLinesWF[counter], ',');
    closeCostWF[counter]=float(temp[4]); // parsing out just line five, which is related to the close of day
    //close of day is all we need.
  }

  //blizzard setup here

  blizzardLogo = loadImage("BlizzardLogo.png"); //loading in the logo
  blizzardLogo.resize(75, 75); //resizing that sucker

  String dataLinesBlizzard[]=loadStrings("BlizzardClose.csv"); //finding the NASDAQ data

  closeCostBlizzard = new float [nasdaqDates]; //naming the relevant data inside NASDAQDates - the closing date

  for (int counter=0;counter<nasdaqDates;counter++) { //parsing NASDAQ data to find closing dates
    String[] temp = split(dataLinesBlizzard[counter], ',');
    closeCostBlizzard[counter]=float(temp[4]); // parsing out just line five, which is related to the close of day
    //close of day is all we need.
  }

  //Starbucks setup here


  sBuxLogo = loadImage("SBuxLogo.png"); //loading in the logo
  sBuxLogo.resize(75, 75); //resizing that sucker

  String dataLinesSBux[]=loadStrings("SBuxClose.csv"); //finding the NASDAQ data

  closeCostSBux = new float [nasdaqDates]; //naming the relevant data inside NASDAQDates - the closing date

  for (int counter=0;counter<nasdaqDates;counter++) { //parsing NASDAQ data to find closing dates
    String[] temp = split(dataLinesSBux[counter], ',');
    closeCostSBux[counter]=float(temp[4]); // parsing out just line five, which is related to the close of day
    //close of day is all we need.
  }
  //final general setup here
  DAQHi = max (closeCostNasdaq); //defining the max the bar will climb to for NASDAQ
  wholeMax = max (closeCostWF); // defining the max value of our maximum stock
  barSize = width/50; //size of each bar in  the bar graph
  margeN= 25; //margins between anything showing and the end of the window
  startX = width/3; //where the bar graph begins
  startY = height-margeN; //the lowest point
  
  fullLogo = loadImage("FullLogo.png"); //loading in the logo
  //fullLogo.resize(150,150);
}

//ACTUAL ACTION I S HERE
void draw() {
  background(205);
  image(fullLogo, width/2, margeN); 
  ruler();
  nasdaqruler();
  nasdaq();
  wholefoods();
  starbucks();
  ea();
  blizzard();
}
//The functions for each set of bars goes down here
void nasdaq() {
  fill(#17A8FF); //NASDAQ Blue
  image(nasdaqLogo, margeN, margeN+30); //get that logo in there!
  rect(margeN + 100, margeN+50, 30, 30); //color code box
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY*.65, barSize, -closeCostNasdaq[n]*.1); //making each bar in the bar graph
  }
}

void ea() {
  fill(#434343); //EA's colors are grey
  image(eaLogo, margeN, margeN+130); //get that logo in there!
  rect(margeN+100, margeN+150, 30, 30); //color code box
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY, barSize, -closeCostEA[n]*2); //making each bar in the bar graph
  }
  //this is a tiny version for the big NASDAQ graph
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY*.65, barSize, -closeCostEA[n]*.1); //making each bar in the bar graph
  }
}

void wholefoods() {
  fill(#064D00); //whole foods forest green
  image(wfLogo, margeN, margeN+230); //get that logo in there!
  rect(margeN+100, margeN+250, 30, 30); /// color code box
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY, barSize, -closeCostWF[n]*2); //making each bar in the bar graph
  } 
  //this is a tiny version for the big NASDAQ graph
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY*.65, barSize, -closeCostWF[n]*.1); //making each bar in the bar graph
  }
}

void blizzard() {
  fill(#004276); //blizzard is light blue - darken to differentiate from NASDAQ
  image(blizzardLogo, margeN, margeN+330); //get that logo in there!
  rect(margeN+100, margeN+350, 30, 30); //color code box
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY, barSize, -closeCostBlizzard[n]*2); //making each bar in the bar graph
  }
  //this is a tiny version for the big NASDAQ graph
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY*.65, barSize, -closeCostBlizzard[n]*.1); //making each bar in the bar graph
  }
}


void starbucks() {
  fill(255); //Starbucks is also forest green - I'll use white to differentiate from Whole Foods
  image(sBuxLogo, margeN, margeN+430); //get that logo in there!
  rect(margeN+100, margeN+450, 30, 30); //color code box
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY, barSize, -closeCostSBux[n]*2); //making each bar in the bar graph
  }
  //this is a tiny version for the big NASDAQ graph
  for (int n=0;n<nasdaqDates;n++) {  //iterations for each day in the graph
    rect (startX+n*barSize, startY*.65, barSize, -closeCostSBux[n]*.1); //making each bar in the bar graph
  }
}
// this will provide a vague sense of measurement for the image. Once I can add text this will be 20 bucks per line
void ruler() {
  line(startX-10, startY, startX-10, startY-wholeMax*2); //this line starts at zero and goes to the biggest that Whole Foods, the biggest stock, gets.
  for (int n=0;n<wholeMax*2; n = n+40) { // each rule indicates 20 dollars up to the maximum whole foods stock (remember, everything is times 2 for a prettier graph) 
    line(startX-15, startY-n, startX - 5, startY-n);
  }
  line(startX-15, startY-wholeMax*2, startX-5, startY-wholeMax*2);
}
// this will provide a vague comparative mesaurement so that it will be obvious the two graphs aren't equal. When I can add text I'll make it so each line means 20 dollars. 
void nasdaqruler() {
  line(startX-10, startY*.65, startX-10, startY*.65-DAQHi*.1); //this line starts at zero and goes to the biggest that Whole Foods, the biggest stock, gets.
  for (int n=0;n<DAQHi*.1; n = n+2) { //each rule indicates 10 dollars again, but because NASDAQ is so much more compressed they should appear much closer together
    line(startX-15, startY*.65-n, startX - 5, startY*.65-n); //If 5 bucks is 20 pixels up there, multiply 20 by .1 and divide by 2 for 1 line for every 5 dollars
  }
  line(startX-15, startY*.65-DAQHi*.1, startX-5, startY*.65-DAQHi*.1);
}


