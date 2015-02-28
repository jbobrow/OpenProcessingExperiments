
Table data;
float [] date;
float [] interestBOE;
float [] interestFED;
float [] interestECB;
float [] CPIBOE;
float [] CPIFED;
float [] CPIECB;
float [] unemploymentBOE;
float [] unemploymentFED;
float [] unemploymentECB;
int n, x;
color[] palette = {
  #FF8E00, #1921B1, #00B25C
};
float sliderX;
int diamBOE, diamFED, diamECB;
boolean ellipseBOE, ellipseFED, ellipseECB; // true if mouse is at position of the ellipses to show data
boolean cpiPressed, unemploymentPressed;

int width = 500;           // Width of window
int height = 500;            // Height of window
float border = 75;         // Size of border
float lb = border;         // Left border
float rb = width - border;  // Right border
float bb = height - border;  // Bottom border
float tb = border;         // Top borders

float gw = rb - lb;        // Grid width
float gh = bb - tb;        // Grid height


void setup() {
  size (width, height);
  frameRate(5);

  n=93;
  data = new Table ("data.tsv"); 
  date = new float [n];
  interestBOE = new float [n];
  interestFED = new float [n];
  interestECB = new float [n];
  CPIBOE = new float [n];
  CPIFED = new float [n];
  CPIECB = new float [n];
  unemploymentBOE = new float [n];
  unemploymentFED = new float [n];
  unemploymentECB = new float [n];
  x = 1;
  sliderX=lb;
  diamBOE = 20;
  diamFED = 50;
  diamECB = 55;
  ellipseBOE = false;
  ellipseFED = false;
  ellipseECB = false;
  x = (int)map(sliderX, 0, width, 1, n);
  cpiPressed = true;
  unemploymentPressed = false;
}

void draw() {
  background(65);
  loadData();
  if (cpiPressed)
    drawDataCPI();
  else
    drawDataUnemployment();
  frame();
  if (cpiPressed)
    xAxis("CPI", lb, bb, rb);
  else 
    xAxis("Unemployment Rate", lb, bb, rb);

  yAxis("Central "+"\n"+"Bank Rate", lb, bb, tb);
  drawSlider();
  if (cpiPressed)
    showDataCPI();
  else
    showDataUnemployment();
  drawDate();
  drawVariable();
}


void loadData() {
  // load data from data.tsv


  for (int i = 0; i<n; i++) {
    date[i] = data.getFloat(i, 0);
  } 

  for (int i = 0; i<n; i++) {
    interestBOE[i] = map(data.getFloat(i, 1), 0, 6, width-border, border);
  } 

  for (int i = 0; i<n; i++) {
    interestFED[i] = map(data.getFloat(i, 2), 0, 6, width-border, border);
  } 

  for (int i = 0; i<n; i++) {
    interestECB[i] = map(data.getFloat(i, 3), 0, 6, width-border, border);
  } 

  for (int i = 0; i<n; i++) {
    CPIBOE[i] = map(data.getFloat(i, 4), -3, 7, border, width-border);
  } 

  for (int i = 0; i<n; i++) {
    CPIFED[i] = map(data.getFloat(i, 5), -3, 7, border, width-border);
  } 

  for (int i = 0; i<n; i++) {
    CPIECB[i] = map(data.getFloat(i, 6), -3, 7, border, width-border);
  } 

  for (int i = 0; i<n; i++) {
    unemploymentBOE[i] = map(data.getFloat(i, 7), 0, 15, border, width-border);
  } 

  for (int i = 0; i<n; i++) {
    unemploymentFED[i] = map(data.getFloat(i, 8), 0, 15, border, width-border);
  } 

  for (int i = 0; i<n; i++) {
    unemploymentECB[i] = map(data.getFloat(i, 9), 0, 15, border, width-border);
  }
}

void drawDataCPI() {

  x = (int)map(sliderX, lb, rb+1, 1, n);

  noStroke();

  // Draw ECB ellipse
  fill(palette[2]);
  ellipse(CPIECB[x], interestECB[x], diamECB, diamECB);

  // Draw FED ellipse
  fill(palette[1]);
  ellipse(CPIFED[x], interestFED[x], diamFED, diamFED);

  // Draw BoE ellipse
  fill(palette[0]);
  ellipse(CPIBOE[x], interestBOE[x], diamBOE, diamBOE);
}

void drawDataUnemployment() {

  x = (int)map(sliderX, lb, rb+1, 1, n);

  noStroke();

  // Draw ECB ellipse
  fill(palette[2]);
  ellipse(unemploymentECB[x], interestECB[x], diamECB, diamECB);

  // Draw FED ellipse
  fill(palette[1]);
  ellipse(unemploymentFED[x], interestFED[x], diamFED, diamFED);

  // Draw BoE ellipse
  fill(palette[0]);
  ellipse(unemploymentBOE[x], interestBOE[x], diamBOE, diamBOE);
}

void drawDate () {
  // draw date
  fill(150);
  textSize(22);
  textAlign(RIGHT, TOP);
  text(data.getString(x, 0), rb-12, tb+5);
}

void frame () {
  noStroke();
  fill(90);
  rect(0, 0, width, border);    // Top mask
  rect(0, bb, width, border);   // Bottom mask
  rect(0, 0, border, height);   // Left mask
  rect(rb, 0, border, height);  // Right mask
}
void xAxis (String axisTitle, float xl, float y, float xr) {
  stroke(250);
  strokeWeight(1);
  line(xl, y, xr, y);

  fill(250);
  textSize(10);
  textAlign(CENTER, CENTER);
  text(axisTitle, width/2, bb + 10);
}

void yAxis (String axisTitle, float x, float yb, float yt) {
  stroke(250);
  strokeWeight(2);
  line(x, yb, x, yt);

  fill(250);
  textAlign(RIGHT, CENTER);
  text(axisTitle, lb -5, height/2);
}

void drawSlider() {
  // Slider line
  stroke(140, 0, 0, 100);
  strokeCap(SQUARE);
  strokeWeight(5);
  line(lb, bb+40, rb, bb+40);

  // Slider button
  noStroke();
  fill(250);
  if ((dist(mouseX, mouseY, sliderX, bb+40)<75)&&mousePressed)
    sliderX = mouseX;
  sliderX = constrain(sliderX, lb, rb);
  ellipse(sliderX, bb+40, 18, 18);
  fill(50);
  ellipse(sliderX, bb+40, 10, 10);

  // Slider title
  fill(250);
  textSize(10);
  textAlign(CENTER, TOP);
  text("2006", lb, bb+55);
  text("2013", rb, bb+55);
}

void showDataCPI() {

  // ellipse booleans become true ones mouse crosses location of ellipses

  if ((dist(mouseX, mouseY, CPIBOE[x], interestBOE[x]))<diamBOE)
    ellipseBOE = true;
  else
    ellipseBOE = false;
  if ((dist(mouseX, mouseY, CPIFED[x], interestFED[x]))<diamFED && ellipseBOE==false)
    ellipseFED = true;
  else
    ellipseFED = false;
  if ((dist(mouseX, mouseY, CPIECB[x], interestECB[x]))<diamECB && ellipseBOE==false && ellipseFED==false)
    ellipseECB = true;
  else
    ellipseECB = false;


  // show data: interest and CPI

  if (ellipseBOE) {
    fill(250);
    textSize(10);
    textAlign(LEFT, LEFT);
    text("Bank of England"+"\n"+"Central Bank Rate: "+data.getFloat(x, 1)+"%"+"\n"+"Inflation: "+data.getFloat(x, 4)+"%", border, border/2-15);
  }
  if (ellipseFED) {
    fill(250);
    textSize(10);
    textAlign(LEFT, LEFT);
    text("Federal Reserve"+"\n"+"Central Bank Rate: "+data.getFloat(x, 2)+"%"+"\n"+"Inflation: "+data.getFloat(x, 5)+"%", border, border/2-15);
  }
  if (ellipseECB) {
    fill(250);
    textSize(10);
    textAlign(LEFT, LEFT);
    text("European Central Bank"+"\n"+"Central Bank Rate: "+data.getFloat(x, 3)+"%"+"\n"+"Inflation: "+data.getFloat(x, 6)+"%", border, border/2-15);
  }
}

void showDataUnemployment() {

  // ellipse booleans become true ones mouse crosses location of ellipses

  if ((dist(mouseX, mouseY, unemploymentBOE[x], interestBOE[x]))<diamBOE)
    ellipseBOE = true;
  else
    ellipseBOE = false;
  if ((dist(mouseX, mouseY, unemploymentFED[x], interestFED[x]))<diamFED && ellipseBOE==false)
    ellipseFED = true;
  else
    ellipseFED = false;
  if ((dist(mouseX, mouseY, unemploymentECB[x], interestECB[x]))<diamECB && ellipseBOE==false && ellipseFED==false)
    ellipseECB = true;
  else
    ellipseECB = false;


  // show data: interest and CPI

  if (ellipseBOE) {
    fill(250);
    textSize(10);
    textAlign(LEFT, LEFT);
    text("Bank of England"+"\n"+"Central Bank Rate: "+data.getFloat(x, 1)+"%"+"\n"+"Unemployment Rate: "+data.getFloat(x, 7)+"%", border, border/2-15);
  }
  if (ellipseFED) {
    fill(250);
    textSize(10);
    textAlign(LEFT, LEFT);
    text("Federal Reserve"+"\n"+"Central Bank Rate: "+data.getFloat(x, 2)+"%"+"\n"+"Unemployment Rate: "+data.getFloat(x, 8)+"%", border, border/2-15);
  }
  if (ellipseECB) {
    fill(250);
    textSize(10);
    textAlign(LEFT, LEFT);
    text("European Central Bank"+"\n"+"Central Bank Rate: "+data.getFloat(x, 3)+"%"+"\n"+"Unemployment Rate: "+data.getFloat(x, 9)+"%", border, border/2-15);
  }
}

void drawVariable() {

  // draw text: inflation / unemployment rate
  fill(250);
  textSize(10);
  textAlign(RIGHT, CENTER);
  text("Inflation"+"\n"+"Unemployment Rate", rb-10, border/2);

  // draw circles for option clicking
  stroke(5);
  strokeWeight(1);
  fill(250);
  ellipseMode(CENTER);

  // highlight if mouse crosses circles
  if ((dist(mouseX, mouseY, rb, 30))<12)
    fill(200);
  else
    fill(250);
  ellipse(rb, 30, 12, 12);

  if ((dist(mouseX, mouseY, rb, 48))<12)
    fill(200);
  else
    fill(250);
  ellipse(rb, 48, 12, 12);

  // change colour if mouse is pressed in circle area
  if ((dist(mouseX, mouseY, rb, 30))<15 && mousePressed) {
    cpiPressed = true;
    unemploymentPressed = false;
  }

  if ((dist(mouseX, mouseY, rb, 48))<15 && mousePressed) {
    unemploymentPressed = true;
    cpiPressed = false;
  }


  if (cpiPressed) {
    fill(0);
    ellipse(rb, 30, 4, 4);
  }

  if (unemploymentPressed) {
    fill(0);
    ellipse(rb, 48, 4, 4);
  }
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
      String[] pieces = split(rows[i], "\t");
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
      
      // this could be done in one fell swoop via:
      //data[rowCount++] = split(rows[i], TAB);
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }
  
  
  int getRowCount() {
    return rowCount;
  }
  
  
  // find a row by its name, returns -1 if no row found
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
  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }
  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
}

