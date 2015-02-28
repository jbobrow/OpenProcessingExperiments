
/*
Australia Short Term Visitor Arrival by Origin
By Carmel McGinley for part assessment in Data Visualisation and Design, University of Canberra 2010.

Data Source
Forecast
Tourism Forecasting Committee
2010 Issue 2
Tourism Research Australia
Department of Resources, Energy and Tourism
Tourism Forecasting Committee
http://www.ret.gov.au/tourism/tra/traforecasts/Pages/default.aspx

*/



//declare some variables

int selYear = 10;  //ensure first selection is 2009 (the lastest year of actuals)
int numYears = 22;  
int firstYear = 1999;
int firstForecast = 12;

//store the csv files
String[] totalVisitors_in;  //the file containing the metrics
String[] visitors_in;  //the file containing the metrics
String[] nites_in;  //the file containing the metrics
String[] tievs_in;  //the file containing the metrics

String[][] vMatrix;  //a matrix containing the metrics
String[][] nMatrix;  //a matrix containing the metrics
String[][] tMatrix;  //a matrix containing the metrics

//hard code some country information
int numCtries = 26;
String[] ctryNames = {"New Zealand", "Japan", "United Kingdom", "United States",
	"China", "Singapore", "South Korea", "Malaysia", "Hong Kong",
	"Germany", "India", "Indonesia", "Taiwan", "Thailand", "Middle East",
	"Other Asia", "France", "Ireland", "Italy", "Netherlands", "Switzerland", "Nordic Countries",
	"Other Europe", "Canada", "South Africa", "Other World"};

color[] bubbleColour = {#000000, #FF0303, #1F04C1, #FF6803,
               #FCFC2E, #259B02, #02283A, #D30547, #A05175,
                #272264, #38197A, #68217A, #2D338E, #B55400, #6D6002,
                #9B4F19, #ED4FAF, #353F5B, #7251BC, #26547C, #BF5B00, #1B003E, 
                #566314, #2012FA, #810719, #ABABAD};  



//declare and instantiate some variables to help with the display
int marginX = 50;

int scaleLine = 100;
float scaleVisitors = 0.5;
float scaleNites = 5;
float scaleTiev = 0.2;

float xPos;
float yPos;
float bubbleD;

int rollBubble = 0;
boolean rollover = false;

float[] totalVisitors = new float[numYears];  //the metric in the file
float[][] aveTievs;
float[][] aveNites = new float[numCtries-1][numYears-1];
float[][] visitors = new float[numCtries-1][numYears-1];


PFont font;

void setup(){
  size(800,600); 
 
  font = createFont("Arial",36); 
  
  //get the data
  totalVisitors_in = loadStrings("totalVisitors.csv");
  //as total visitors is just a single colomn, parse here
  //could be calculated from visitors file but originally not all countries were included
  for (int r=0; r<numYears; r++){ 
    totalVisitors[r] =  float(totalVisitors_in[r]);
  }

  tievs_in = loadStrings("AveTiev.csv");
  parseTievData();
  
  visitors_in = loadStrings("visitors.csv");
  parseVisitorData();
  
  nites_in = loadStrings("AveNites.csv");
  parseNitesData();
  
  smooth();
}
 
void draw(){
  //start with no rollover
  rollover = false;
  
 // colorMode(RGB,255); //not sure this is needed
  
  background(200);
  noStroke();
  
  //call the functions to draw the chart
  drawAxis();
  drawRef();
  drawYears();
  drawBubbles();
  
  //draw the rollover text
  if (rollover){ 
    //write the text
    fill(0);
    textAlign(LEFT);
    //put the country name in a bigger font
    textFont(font,24);     
    text( ctryNames[rollBubble] , 600,50);
    textFont(font,16);   
    text(nfc(visitors[selYear][rollBubble]*1000,0) + " visitors", 600,90);
    text("stay " + round(aveNites[selYear][rollBubble]) + " days and", 600,115);
    text("spend " + "$" + round(aveTievs[selYear][rollBubble]) + " per night" ,  600,140);
    stroke(0);
  } 
}


void drawBubbles(){
  for (int c=0; c<numCtries; c++){ 
    noStroke();
    //get a colour from the matrix of colours defined above
    fill(bubbleColour[c]);
    //put positions into variables to simlify the code
    xPos = 50+visitors[selYear][c]*scaleVisitors;
    yPos = height - 150 - aveNites[selYear][c]*scaleNites;
    bubbleD = aveTievs[selYear][c]*scaleTiev;
    //draw the bubble
    ellipse(xPos,yPos, bubbleD, bubbleD);
    //put a label on the outliers
    if(visitors[selYear][c]>400 || aveNites[selYear][c] > 70)
      text(ctryNames[c], xPos, yPos - bubbleD/2-5);
    //identify hoverover 
    //bit lazy here - checking is mouse position is in square, not circle
    if (mouseX > xPos - bubbleD/2 && mouseX < xPos + bubbleD/2
      && mouseY < yPos + bubbleD/2 && mouseY > yPos - bubbleD/2) {
     rollover = true;
     rollBubble = c;
    } 
  }
}  
 

void drawYears(){
  //draw the marker indicating what is selected with year and value labels
  textFont(font,12);
  fill(0);
  textAlign(CENTER);
  float yearX = marginX+(((width-2*marginX)*selYear)/(numYears-1));
  text(selYear+firstYear,yearX,580);
  text(nf((totalVisitors[selYear])/1000,1,3)+" mil visitors",yearX,500);
  stroke(255,100);
  line(yearX,560,yearX,510);
  //draw the line graph
  stroke(0);
  noFill();
  strokeWeight(2);
  beginShape();
  //draw a line chart showing actual total visitors
  for (int r=0; r<firstForecast-1; r++){ 
    vertex(marginX+(r*((width-2*marginX)/(totalVisitors_in.length-1.01))),
           height-0-((totalVisitors[r]/scaleLine)));
  }
  //forecast line is formatted differently
  endShape();
  stroke(150);
  beginShape();
  for (int r=firstForecast-2; r<totalVisitors_in.length; r++){ 
    vertex(marginX+(r*((width-2*marginX)/(totalVisitors_in.length-1.01))),
           height-0-((totalVisitors[r]/scaleLine)));
  }
  endShape(); 
}

void drawAxis(){
  //draw some lines and text to define the chart area
  textFont(font,10);
  fill(100);
  stroke(255,40);
  textAlign(CENTER);
  text("Length of stay", 50, 30);
  line(50,40,50,450);
  textAlign(RIGHT);
  text("Visitors", 750, 470);
  line(50,450,750,450);
}


void drawRef(){
  //put the reference information at the bottom right
  fill(50);
  textAlign(RIGHT);
  textFont(font,10);
  text("Short term visitors to Australia: Tourism Forecasting Committee, Curreny: Real AUD Q2,2010", 790, 595);
}

// parse the data files
void parseTievData(){
  tMatrix = new String[tievs_in.length][numCtries];
  aveTievs = new float[tievs_in.length][numCtries];
  for (int r=0; r<tievs_in.length; r++){ 
    String[] row = split(tievs_in[r],',');
    tMatrix[r] = row;
    for (int c=0; c<numCtries; c++) {
      aveTievs[r][c] = float(tMatrix[r][c]);
//      println(aveTievs[r][c]);
    }
  }      
}

void parseVisitorData(){
  vMatrix = new String[visitors_in.length][numCtries];
  visitors = new float[visitors_in.length][numCtries];
  for (int r=0; r<visitors_in.length; r++){ 
    String[] row = split(visitors_in[r],',');
    vMatrix[r] = row;
    for (int c=0; c<numCtries; c++) {
      visitors[r][c] = float(vMatrix[r][c]);
//      println(visitors[r][c]);
    }
  }      
}

void parseNitesData(){
  nMatrix = new String[nites_in.length][numCtries];
  aveNites = new float[nites_in.length][numCtries];
  for (int r=0; r<nites_in.length; r++){ 
    String[] row = split(nites_in[r],',');
    nMatrix[r] = row;
    for (int c=0; c<numCtries; c++) {
      aveNites[r][c] = float(nMatrix[r][c]);
//      println(aveNites[r][c]);
    }
  }      
}

//add the interaction for the line chart and allow a screen shot to be saved
void keyPressed(){
  int displayYear = selYear + firstYear;
  if (key =='s') // if the s key is pressed
    //fix the title

    save("TourismArrivalsYear" + displayYear + ".jpg");

  if (keyCode == RIGHT){
    if (selYear == numYears-1) selYear = 0;
    else if (selYear < numYears-1) selYear = selYear+1;  //when moving right don't go further than num years
  }
  else if (keyCode == LEFT){                //when moving left don't go further than first year
    if (selYear == 0) selYear = numYears-1;
    else if (selYear > 0) selYear = selYear -1;
  }
}


