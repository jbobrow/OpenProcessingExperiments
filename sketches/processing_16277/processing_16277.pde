
/*
Australia Short Term Visitor Arrival by Origin
By Carmel McGinley for part assessment in Data Visualisation and Design, University of Canberra 2010.

World Map source
http://commons.wikimedia.org/wiki/File:Blank_Map_Pacific_World.svg
By Dmthoth (Own work) [CC-BY-SA-3.0 (www.creativecommons.org/licenses/by-sa/3.0) or GFDL (www.gnu.org/copyleft/fdl.html)],
via Wikimedia Commons

Possible Improvements
 - Hover over to display at least country name
 - Better placement of country centroids
 - Colour bubble according to percentage change on previous years
 - "Ghost" previous bubbles


*/

	
//Create some hashmaps so relationships between map and metric can be established
HashMap hm_mapX = new HashMap(); //stores the 2-letter country code and x location of the centre of shape
HashMap hm_mapY = new HashMap(); //stores the 2-letter country code and y location of the centre of shape
HashMap hm_metric = new HashMap(); //stores the 2-letter country code and the scaled metric for bubble size

//declare some variables
//first up the metric information (in this case short term visitor arrivals)
String[] data_in;  //the file containing the metrics
String[][] dataMatrix;  //a matrix containing the metrics

String[] ctryName; //the country name stored in the metric file (for labels)
String[] rowLabel; //the 2-letter country code
float[][] metric;  //the metric in the file
float[] metricScale;  //a scaled metric for the bubble size
float[] metricTotal;

int selYear = 1;
int numCols = 21;

//variables for the map
PShape map_in;  //the map svg file
int numctries;  //number of countries in the map file
PShape[] ctryShape;  //each country outline
String[] ctryCode;  //2-letter country code
float[] centroidX;
float[] centroidY;

//some display variables
int marginX = 50;
int firstYear = 1991;

PFont font;

void setup(){
  size(855,700); 
 
  font = createFont("Arial",36); 
  //load the data
  data_in = loadStrings("originData.csv");
  parseData();
  //load the map 
  map_in = loadShape("WorldMapWithLayerNames.svg");  
  parseMap();
  //instantiate some variables once the size of the arrays is known  
  metricScale = new float[data_in.length]; 
  metricTotal = new float[numCols];


  smooth();
}
 
void draw(){
  background(255);
  drawRef();
  //put the metrics for the selected year into the hashmap
  for (int r=0; r<data_in.length; r++){   
    metricScale[r] = (metric[r][selYear]/10000);
    hm_metric.put(rowLabel[r], metricScale[r]);
  }
  for (int c=1; c < numCols-1; c++) {
    metricTotal[c] = float(dataMatrix[data_in.length-1][c])/100000;
  }
  drawMap();
  drawYears();
}

void drawMap() {
  for (int c=0; c<numctries; c++){ 
    //disable the svg style to allow one to be creating in processing
    ctryShape[c].disableStyle();
    //create a new 'style'
    fill(100,99);
    stroke(255);
    //draw each country
    shape(ctryShape[c]);
  }
  //use a separate for loop for the bubbles to ensure they are drawn in front of map
  for (int c=0; c<numctries; c++){ 
    //set the style for the bubbles
    stroke(255,0,0,99);
    fill(255,0,0,99);
    //get the data for the position and size of bubbles from the hashmaps
    float x = (Float)hm_mapX.get(ctryCode[c]);
    float y = (Float)hm_mapY.get(ctryCode[c]);
    //set bubble size to 0
    float m = (Float) 0.0;
    if (hm_metric.containsKey(ctryCode[c]) == true) {  //if the country exists, set bubble size to metric
      m = (Float)hm_metric.get(ctryCode[c]);
    }
    //draw each bubble
    ellipse(x, y, m, m);
  }
}

//parse the matrix of arrivals by year by country
void parseData(){
  dataMatrix = new String[data_in.length][numCols];
  rowLabel = new String[data_in.length];  
  metric = new float[data_in.length][numCols];

  for (int r=0; r<data_in.length; r++){ 
    String[] row = split(data_in[r],',');
    dataMatrix[r] = row;
    rowLabel[r] = dataMatrix[r][0];
    for (int c = 1; c < numCols-1; c++) {
      metric[r][c] = float(dataMatrix[r][c]);
    }
  }      
}

//parse the svg map. labels have been assigned to countries in illustrator.
//some modifications were made to the XML before import
void parseMap(){
  //Declare some variables for this function
  numctries = map_in.getChildCount();
  ctryShape = new PShape[numctries];
  ctryCode = new String[numctries];
  centroidX = new float[numctries];
  centroidY = new float[numctries];
  float[] shapePointX;
  float[] shapePointY;
  float[] tempX;
  float[] tempY;
  int numPoints = 0;
  
  for (int c=0; c<numctries; c++){  //step through all layers (countries/shapes) in the SVG file
    ctryShape[c] = map_in.getChild(c);  //get each shape layer (country)
    ctryCode[c] = ctryShape[c].getName();  //get the 2-letter country code (the layer name)
    
    numPoints = ctryShape[c].getVertexCount();  //determine the number of points in each country
    shapePointX = new float[numPoints];  //instantiate a matrix equal to number of points
    shapePointY = new float[numPoints];  
    tempX = new float [numctries];  //a temp iterator - not sure this is needed
    tempY = new float [numctries];
    for (int i=0; i<ctryShape[c].getVertexCount(); i++){ //step through all the points in the country
      shapePointX[i] = ctryShape[c].getVertexX(i);  //get the X point
      shapePointY[i] = ctryShape[c].getVertexY(i);  //get the Y point
      tempX[c] = tempX[c] + shapePointX[i];  //add the current point to all preceeding points
      tempY[c] = tempY[c] + shapePointY[i];
    }
    centroidX[c] =  tempX[c]/(numPoints+1);  // get the average X point
    centroidY[c] =  tempY[c]/(numPoints+1);  // get the average Y point
    
    hm_mapX.put(ctryCode[c], centroidX[c]);  //put x in a hashmap with 2-letter code 
    hm_mapY.put(ctryCode[c], centroidY[c]);  //put y in a hashmap with 2-letter code
  }
}

void drawYears(){
  //draw a marker line and name and value labels 
  textFont(font,14);
  fill(0);
  textAlign(CENTER);
  float yearX = marginX+(((width-2*marginX)*selYear)/(numCols-1));
  text(selYear+firstYear-1,yearX,630);
  text(nfc((metricTotal[selYear])/10,3)+" million visitors",yearX,560);
  strokeWeight(0.7);
  stroke(0);
  line(yearX,610,yearX,570);
  //draw the line chart of total visitors
  stroke(0);
  noFill();
  strokeWeight(2);
  beginShape();
  for (int c=1; c<numCols-1; c++){
    vertex(marginX+(c*((width-2*marginX)/(numCols-1.01))),
           height-70-((metricTotal[c])));
  }
  endShape();
}

void drawRef(){
    //write the references information
  noStroke();
  textFont(font,12);
  fill(100);
  textAlign(LEFT);
  text("Short Term Vistor Arrivals to Australia", 20, height-35);
  textFont(font,10);
  text("Data source: ABS Publication 3401.0", 20, height-20);
}

void keyPressed(){
  int displayYear = selYear + firstYear;
  if (key =='s') // if the s key is pressed
    save("TourismArrivalsYear" + displayYear + ".jpg");

  if (keyCode == RIGHT){
    if (selYear == numCols-2) selYear = 1;
    else if (selYear < numCols-2) selYear = selYear+1;  //when moving right don't go further than num years
  }
  else if (keyCode == LEFT){                //when moving left don't go further than first year
    if (selYear == 1) selYear = numCols-2;
    else if (selYear > 1) selYear = selYear -1;
  }
}


