
/*Daniel Feusse
Bar Graph/**
 * Draws a bar chart with data from a tsv file
 */

// Size of screen
int width = 500;
int height = 500;

// Size of graph on screen
int margin = 60;
int chartWidth = width-2*margin;
int chartHeight = height-2*margin;

PFont f;
// variables for size of bars on the screen
int maxVal;
float unitHeight;
float barWidth;

String[] xValues; // bar labels
int[] yValues;    // bar heights

void setup() {
  size(width, height);
  f = createFont("Arial", 10, true);
  readData();
  calcBarSize();
}

/**
 * Reads data for bar chart from tsv file
 */
void readData() {
  Table data = new Table("scrapedBookdata.tsv"); 
  
  int numRows = data.getRowCount();
  xValues = new String[numRows];
  yValues = new int[numRows];
  
  for (int i = 0; i < numRows; i++) {
    xValues[i] = data.getString(i,0);
    yValues[i] = data.getInt(i,1);
  }
}

/**
 * Initializes graph variables
 */
void calcBarSize() {
  // find the largest y value and use it to scale the y axis
  maxVal = 0;
  for (int i = 0; i < yValues.length; i++)
    if (yValues[i] > maxVal)
      maxVal = yValues[i];
  unitHeight = chartHeight / (float)maxVal;

  barWidth = chartWidth/yValues.length;
}

void draw() {
  background(245);
  smooth();
  
  // Draw axes
  stroke(0,0,0);
  strokeWeight(1);
  line(margin, margin, margin, height-margin);
  line(margin, height-margin, width-margin, height-margin);
  
  // Draw the bars
  noStroke();
  rectMode(CORNERS);
  fill(180);
  for (int i = 0; i < yValues.length; i++) {
    float x = (float)(margin + barWidth*i + barWidth/6f);
    rect(x, height-margin, x + barWidth*2/3, (float)(height - margin - unitHeight*yValues[i]));
  }

  // Label the x-axis
  fill(0);
  textSize(12);
  textAlign(CENTER);
  for (int i = 0; i < yValues.length; i++) {
    float x = (float)(margin + barWidth*i + barWidth/2f);
    text(xValues[i], x, height - margin + textAscent() + 3);
  }
  
  // Label the y-axis
  stroke(0,0,0);
  strokeWeight(1);
  int numTicks = 4; // number of labels along the y axis
  textAlign(RIGHT,CENTER);
  for (int i = 0; i <= numTicks; i++) {
    float yVal = maxVal * i / numTicks;
    float y = height - margin - unitHeight*yVal;
    // draw tick mark
    line(margin-3, y, margin+3, y);
    text((int)yVal, margin-5, y);
    
    
  }
  
          //add labels
  textFont(f, 10);
  //x-axis
  text("Book 1: A Tale of Two Cities  Book 2: The Little Prince  Book 3: The Lord of the Rings", margin+387.5, height-margin+30);
  text("Book 4: The Hobbit  Book 3: Dream of the Red Chamber  Book 6: And Then There Were None", margin+424, height-margin+45);
  //translate(0,0);
  //rotate(radians(270));
  //text("Ponage", margin-10, height/2);
  
  stroke(255);
  line(margin+10, 345, width-margin-14, 345);
  line(margin+10, 250, width-margin-200, 250);
  line(margin+10, 155, width-margin-200, 155);
  
  //y-axis
  textFont(f, 12);
  translate(margin/4, height/2.5);
  rotate(radians(270)); 
  text("Book Sales (000,000)", 0, 0);
  
  
  
  
}



