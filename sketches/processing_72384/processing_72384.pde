
// Credit from Example Book/Visualizing Data/ Chapter 04 / Step 17
// from Processing program.

FloatTable data;
float dataMin, dataMax;

float plotX1, plotY1;
float plotX2, plotY2;
float labelX, labelY;

int rowCount;
int columnCount;
int currentColumn = 0;

int yearMin, yearMax;
int[] years;

int yearInterval = 1;
int volumeInterval = 10;
int volumeIntervalMinor = 100; // this is where i modify it

float[] tabLeft, tabRight;
float tabTop, tabBottom;
float tabPad = 10;

Integrator[] interpolators;

PFont plotFont; 


void setup() {
 
  size(720, 405);
  
  
  data = new FloatTable("death.tsv");
  rowCount = data.getRowCount();
  columnCount = data.getColumnCount();
  
  years = int(data.getRowNames());
  yearMin = years[0];
  yearMax = years[years.length - 1];
  
  dataMin = 0;
  dataMax = ceil(data.getTableMax() / volumeInterval) * volumeInterval;

  interpolators = new Integrator[rowCount];
  for (int row = 0; row < rowCount; row++) {
    float initialValue = data.getFloat(row, 0);
    interpolators[row] = new Integrator(initialValue);
    interpolators[row].attraction = 0.1;  // Set lower than the default
  }

  plotX1 = 150; // i modify the size
  plotX2 = width - 80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height - 70;
  labelY = height - 20;
  
  plotFont = createFont("SansSerif", 20); // changing font size
  textFont(plotFont);

  smooth();
}


void draw() {
  background (245,235,198);
  
  // Show the plot area as a white box  
  fill(0);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1, plotY1, plotX2, plotY2);

  drawTitleTabs();
  drawAxisLabels();

   for (int row = 0; row < rowCount; row++) {
    interpolators[row].update();
  }

  drawYearLabels();
  drawVolumeLabels();

  noStroke();
  fill(255,0,0);
  drawDataArea(currentColumn);
}


void drawTitleTabs() {
  rectMode(CORNERS);
  noStroke();
  textSize(12);
  textAlign(LEFT);

  // On first use of this method, allocate space for an array
  // to store the values for the left and right edges of the tabs
  if (tabLeft == null) {
    tabLeft = new float[columnCount];
    tabRight = new float[columnCount];
  }
  
  float runningX = plotX1; 
  tabTop = plotY1 - textAscent() - 15;
  tabBottom = plotY1;
  
  for (int col = 0; col < columnCount; col++) {
    String title = data.getColumnName(col);
    tabLeft[col] = runningX; 
    float titleWidth = textWidth(title);
    tabRight[col] = tabLeft[col] + tabPad + titleWidth + tabPad;
    
    // If the current tab, set its background white, otherwise use pale gray
    fill(col == currentColumn ? 255 : 224);
    rect(tabLeft[col], tabTop, tabRight[col], tabBottom);
    
    // If the current tab, use black for the text, otherwise use dark gray
    fill(col == currentColumn ? 0 : 64);
    text(title, runningX + tabPad, plotY1 - 10);
    
    runningX = tabRight[col];
  }
}


void mousePressed() {
  if (mouseY > tabTop && mouseY < tabBottom) {
    for (int col = 0; col < columnCount; col++) {
      if (mouseX > tabLeft[col] && mouseX < tabRight[col]) {
        setCurrent(col);
      }
    }
  }
}


void setCurrent(int col) {
  currentColumn = col;
  
  for (int row = 0; row < rowCount; row++) {
    interpolators[row].target(data.getFloat(row, col));
  }
}


void drawAxisLabels() {
  fill(255,0,0);
  textSize(13);
  textLeading(15);
  
  textAlign(CENTER, CENTER);
  text("Number of\n deaths rate\nper\n100,000\npopulation", labelX, (plotY1+plotY2)/2);
  textAlign(CENTER);
  text("Years", (plotX1+plotX2)/2, labelY);
}


void drawYearLabels() {
  fill(0);
  textSize(10);
  textAlign(CENTER);
  
  // Use thin, gray lines to draw the grid
  stroke(224);
  strokeWeight(0.5); // modify stroke weight
  
  for (int row = 0; row < rowCount; row++) {
    if (years[row] % yearInterval == 0) {
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
      text(years[row], x, plotY2 + textAscent() + 10);
      line(x, plotY1, x, plotY2);
    }
  }
}


void drawVolumeLabels() {
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  
  stroke(0); // change color
  strokeWeight(1); // change weight

  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
    if (v % volumeIntervalMinor == 0) {     // If a tick mark
      float y = map(v, dataMin, dataMax, plotY2, plotY1);  
      if (v % volumeInterval == 0) {        // If a major tick mark
        float textOffset = textAscent()/2;  // Center vertically
        if (v == dataMin) {
          textOffset = 0;                   // Align by the bottom
        } else if (v == dataMax) {
          textOffset = textAscent();        // Align by the top
        }
        text(floor(v), plotX1 - 10, y + textOffset);
        line(plotX1 - 4, y, plotX1, y);     // Draw major tick
      } else {
        //line(plotX1 - 2, y, plotX1, y);   // Draw minor tick
      }
    }
  }
}


void drawDataArea(int col) {
  beginShape();
  for (int row = 0; row < rowCount; row++) {
    if (data.isValid(row, col)) {
      float value = interpolators[row].value;
      float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      vertex(x, y);
    }
  }
  vertex(plotX2, plotY2);
  vertex(plotX1, plotY2);
  endShape(CLOSE);
}

