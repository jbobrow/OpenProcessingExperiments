
/*
** Cyclist Count by Year At Selected Commuter Locations
** data from:
** https://data.cityofnewyork.us/d/m6ar-24vj?category=Transportation&view_name=Cyclist-Count-by-Year-At-Selected-Commuter-Locatio
** your task: create a unique data visualization.
** for more information on working with data in Processing, see: https://processing.org/tutorials/data/
*/
String[] headers;
int[][] data;
int rows = 28;
int columns = 9;
int current_row =0;
//color
int[] r= {25,  255,  0,  0,    128,  255,  0,  255};
int[] g= {140, 255,255,  255,  0,    20,    0,  0};
int[] b= {0,    0,  0,    255, 128,  147,  255,  0};
// Declare Header Font
PFont h1;
 
//Declare Label Font
PFont l1;

//******************FOR PIE********************
float minVal, maxVal;
PFont font;

void setup(){
  // load csv file into String array
  String [] lines = loadStrings("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv");
  
  //split the first line into an array and load it into our global headers array
  headers = split(lines[0], ",");
  
  //create a temporary 2D String array.
  //we'll think of it as a 28 row x 9 column matrix
  String[][] tempData = new String[lines.length-1][headers.length];
  
  //Curious to see how many rows and columns we're loading into our tempData?
  //uncomment this line below.
  //println( lines.length-1 + " rows by " + headers.length + " cols.");
  
  //loop through each of the subsequent lines after the header row and
  //assign each to the row index of our tempData matrix 
  for(int i = 1; i < lines.length; i++){
    tempData[i-1] = split(lines[i], ",");//assigns an array to each temData row
  }
  
  //construct our global data matrix.
  //we can also think of this as a 28 row x 9 col matrix
  data = new int[tempData.length][tempData[0].length];
  
  //loop through each of the rows and columns of our tempData matrix.
  //a.k.a. nested for loops.
  for(int i = 0; i < tempData.length; i++){ //for each row
    for(int j = 0; j < tempData[i].length; j++){ //and for each col
      
      /*
      * since our raw data has "" (quotes) around each entry,
      * we need a way to remove them.  Let's use the handy split() method.
      * The delimiter is a " (double quotes) but we need to escape it using a forward slash.
      * for more info on escape characters in Java see:
      * http://stackoverflow.com/questions/1367322/what-are-all-the-escape-characters-in-java
      * example: split(""1024"", "\"") becomes --> {"", "1024", ""}  
      */
      String[] tempCellValue = split(tempData[i][j], "\"");
      // our middle entry contains the data, so we write tempCellValue[1]
      // handle our blank data OR data containing "N/A" by replacing with 0s 
      if(tempCellValue[0].equals("") || tempCellValue[0].equals("N/A")){
        data[i][j] = 0;
      }
      else {
        data[i][j] = Integer.parseInt(tempCellValue[0]);
      }
      println (data[0][8]);
    }
  }
  drawbar();
}
void draw(){
  // draw something awesome with the data matrix and headers array
  // to access individual data cells all you have to do is call data[row][col],
  // where row is an int row number, and col is an int column number
//  drawbar();
  if (mousePressed)
  {
    background (#57385c);
    setupPie ();
    translate (-mouseX, -mouseY);
    println (-mouseY);
    scale (1.5);
    drawChart ();
    drawText ();
  }
}

void drawbar() {
     size(1400, 1400);
   smooth();
   //Use system font 'Arial' as the header font with 12 point type
   h1 = createFont("Arial", 12, false);
   //Use system font 'Arial' as the label font with 9 point type
   l1 = createFont("Arial", 9, false);
  
   //Set Background to white.
   background (#57385c);
   //Call barchart function. Variables are: Y Position of chart, X Position of chart, Chart Height, Chart Width, Column Alpha Amount
   barchart(500, 50, 300, 1300, 255);
}
 
void barchart(float yf1, float xf1, float yscale, float xscale, int a1) {
//  current_row = rowPos;
  textSize(50);
  fill(255, 255, 255);  
  textAlign(CENTER);
  text(data[current_row][0], 700, 100); 
  
  //Declare a float variabe for the max y axis value.
   float ymax;
    
   //Declare a float variable for the minimum y axis value.
   float ymin = 0;
    
   //Set the stroke color to a medium gray for the axis lines.
   stroke(175);
    
   //draw the axis lines.
   line(xf1-3,yf1+2,xf1+xscale,yf1+2);
   line(xf1-3,yf1+2,xf1-3,yf1-yscale);
    
   //turn off strokes for the bar charts.
   noStroke();
    
   //loop the chart drawing once.
   for (int c1 = 0; c1 < 1; c1++){
    
   //Set the start x point value.
   float xfstart = xf1; 
    
   //Load the file.
//   String[] lines = loadStrings(filename);
    
   //Count the number of rows in the file.
   for (int i = 0; i < 1; i++) {
      
     //For each line split values separated by columns into pieces.
     int[] pieces = new int[columns-1];
     for(int j =1 ; j < columns; j++){
     pieces[j-1] = data[current_row][j];
     }
      
     //Set the max Y axis value to be 10 greater than the max value in the pieces array.
     ymax = max(pieces) + 10;
      
     //Count the number of pieces in the array.
     float xcount = pieces.length;
      
     //Draw the minimum and maximum Y Axis labels.
     textFont(h1);
     fill (255, 255, 255);
     textAlign(RIGHT, CENTER);
     text(int(ymax), xf1-8, yf1-yscale);
     text(int(ymin), xf1-8, yf1);
      
     //Draw each column in the data series.
     for (int i2 = 0; i2 < xcount; i2++) {
        
       //Get the column value and set it has the height.
       float yheight = int(pieces[i2]);
        
       //Declare the variables to hold column height as scaled to the y axis.    
       float ypct;
       float ysclhght;
        
       //calculate the scale of given the height of the chart.
       ypct = yheight / ymax;
        
       //Calculate the scale height of the column given the height of the chart.
       ysclhght = yscale * ypct;
        
       //If the column height exceeds the chart height than truncate it to the max value possible.
       if(ysclhght > yscale){
         ysclhght = yscale;
       }
        
       //Determine the width of the column placeholders on the X axis.
       float xcolumns = xscale / xcount;
        
       //Set the width of the columns to 5 pixels less than the column placeholders.
       float xwidth = xcolumns - 5;
        
       //Set the fill color of the columns.
       fill (r[i2],g[i2],b[i2],a1);
       //Draw the columns to scale.
       quad(xf1, yf1, xf1, yf1-ysclhght, xf1 + xwidth, yf1-ysclhght, xf1 + xwidth, yf1);
        
       //Draw the labels.
       textFont(l1);
       textAlign(CENTER, CENTER);
       fill (255, 255, 255);
        
       //Decide where the labels will be placed.
//       if (labelplacement < 1) {
       //Above the columns.
       text(pieces[i2], xf1 + (xwidth / 2), yf1 - (ysclhght + 8));
//       } else {
         //Below the columns.
         text(headers[i2+1], xf1 + (xwidth / 2), yf1 + 8);
//       }
       //increment the x point at which to draw a column.
       xf1 = xf1 + xcolumns;
       }
    }
  //Reset the draw point the original X value to prevent infinite redrawing to the right of the chart. 
  xf1 = xfstart;
  }
}

void keyPressed ()
{
  if (key == '1')
  {
    drawbar();
    if(current_row <27)
    current_row = current_row + 1;
  }

  if (key == '2')
  {
    drawbar();
    if(current_row >0)
    current_row = current_row - 1;
  }
  
    if (key == '3')
  {
    if(current_row <27)
    current_row = current_row + 1;
    background (#57385c);
    setupPie ();
    translate (0, -220);
    scale (1);
    drawChart ();
    drawText ();
  }
    if (key == '4')
  {
    if(current_row >0)
    current_row = current_row - 1;
    background (#57385c);
    setupPie ();
    translate (0, -220);
    scale (1);
    drawChart ();
    drawText ();
  }



}



void drawChart ()
{
  int[] temparray = new int[7];
  for(int i=0; i<7; i++){
  temparray[i] = data[current_row][i+1]; 
  }
    minVal=min(temparray);
  maxVal=max(temparray);

  // wie viele kleine segmente gibt es im pie chart? -----------------------
  int numberOfElements = 7;

  // winkel-abstände -------------------
  float angleSteps = TWO_PI / data[current_row][8];

  int i = 0;

  stroke (#A75265);
  strokeWeight (2);

  float currentAngle = 0;
  float startAngle = 0;

  while (i < numberOfElements)
  {
    currentAngle = angleSteps * data[current_row][i+1];

    stroke (#A75265);
    float mapValue = map ( data[current_row][i+1], minVal, maxVal, 0, 1);
    mapValue = constrain (mapValue, 0, 1);

    color c = lerpColor (#ffedbc, #A75265, mapValue);

    // pie chart zeichnen
    fill (c);
    arc (width/2, height/2, 700, 700, startAngle, startAngle+currentAngle);
    line (width/2, height/2, width/2 + cos (startAngle+currentAngle)*130, height/2 + sin (startAngle+currentAngle)*130);

    float ca = 0;
    float as = currentAngle / data[current_row][i+1];
    int j = 0;
//    while (j < data[0][i+1])
//    {
//      ca = startAngle + as *  j;
//
//      float x1 = width/2 + cos (ca)*138;
//      float y1 = height/2 + sin (ca)*138;
//
//      float lineLength = map (rVals [i] [j], minViews, maxViews, 10, 150);
//
//      float x2 = x1 + cos (ca)*lineLength;
//      float y2 = y1 + sin (ca)*lineLength;
//      stroke (lerpColor (c, color (254, 190, 126), map (rVals [i] [j], minViews, maxViews, 0, mapValue)));
//      line (x1, y1, x2, y2);
//
//      j = j +1;
//    }

    // Berechnung -----------------------
    startAngle = startAngle + currentAngle;

    // zÃ¤hlvariable erhÃ¶hen----------------------------------

    i = i + 1;
  }
}
void drawText ()
{
  int[] temparray = new int[7];
  for(int i=0; i<7; i++){
  temparray[i] = data[current_row][i+1]; 
  }
    minVal=min(temparray);
  maxVal=max(temparray);

  fill (255);

  // wie viele kleine segmente gibt es im pie chart? -----------------------
  int numberOfElements = 7;

  // winkel-abstände -------------------
  float angleSteps = TWO_PI / data[current_row][8];

  int i = 0;

  stroke (#A75265);
  strokeWeight (2);

  float currentAngle = 0;

  translate (width/2, height/2);
  while (i < numberOfElements)
  {
    currentAngle = angleSteps * data[current_row][i+1];

    float fontSize = map ( data[current_row][i+1], minVal, maxVal, 0, 30);

    color c = #57385c;
    if (fontSize > 15) c = #ffffff;

    textSize (fontSize);
    fill (c);
    rotate (currentAngle / 2);
    text (headers [i+1], 40, 0);
    rotate (currentAngle / 2);


    // zÃ¤hlvariable erhÃ¶hen----------------------------------

    i = i + 1;
  }
}
void setupPie ()
{
  size (1400, 1400);
  smooth();
    textSize(50);
  fill(255, 255, 255);  
  textAlign(CENTER);
  text(data[current_row][0], 700, 100); 

  font = createFont ("Arial", 14);
  textFont (font, 14);
  textAlign (LEFT, BASELINE);
}


