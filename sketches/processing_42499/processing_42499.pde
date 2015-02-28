
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
int volumeInterval = 100000;
int volumeIntervalMinor = 10;

PFont plotFont;

float barWidth = 5;


void setup( ) {
  size(720, 405);
  data = new FloatTable("Bevolking.tsv");
  rowCount = data.getRowCount( );
  columnCount = data.getColumnCount( );
  years = int(data.getRowNames( ));
  yearMin = years[0];
  yearMax = years[years.length - 1];
  dataMin = 16500000;
  dataMax = ceil(data.getTableMax( ) / volumeInterval) * volumeInterval;

  // Corners of the plotted time series
  plotX1 = 180;
  plotX2 = width - 80;
  labelX = 50;
  plotY1 = 60;
  plotY2 = height - 70;
  labelY = height - 25;
  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);
  smooth( );
}

void draw( ) {
  background(255);
  
  // Show the plot area as a white box
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1, plotY1, plotX2, plotY2);
  drawTitle( );
  drawAxisLabels( );
  drawYearLabels();
  drawVolumeLabels( );
  fill(#5679C1);
  noStroke();
  strokeWeight(2);
  drawDataBars(currentColumn);
  drawDataHighlight(currentColumn);
}


void drawTitle( ) {
  fill(0);
  textSize(20);
  textAlign(LEFT);
  String title = data.getColumnName(currentColumn);
  text(title, plotX1, plotY1 - 10);
}

void drawAxisLabels( ) {
  fill(0);
  textSize(13);
  textLeading(15);
  textAlign(CENTER, CENTER);

  // Use \n (aka enter or linefeed) to break the text into separate lines.
  text("Prognose\nInwoners\nNederland", labelX, (plotY1+plotY2)/2);
  textAlign(CENTER);
  text("Jaar", (plotX1+plotX2)/2, labelY);
}

void drawYearLabels( ) {
  fill(0);
  textSize(10);
  textAlign(CENTER, TOP);
  
  // Use thin, gray lines to draw the grid.
  stroke(224);
  strokeWeight(1);
  for (int row = 0; row < rowCount; row++) {
  if (years[row] % yearInterval == 0) {
  float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
  text(years[row], x, plotY2 + 10);
  line(x, plotY1, x, plotY2);
  }
  }
}

void drawVolumeLabels( ) {
  fill(0);
  textSize(10);
  stroke(128);
  strokeWeight(1);
  for (float v = dataMin; v <= dataMax; v += volumeIntervalMinor) {
  if (v % volumeIntervalMinor == 0) { // If a tick mark
  float y = map(v, dataMin, dataMax, plotY2, plotY1);
  if (v % volumeInterval == 0) { // If a major tick mark
  if (v == dataMin) {
  textAlign(RIGHT); // Align by the bottom
  } else if (v == dataMax) {
  textAlign(RIGHT, TOP); // Align by the top
  } else {
  textAlign(RIGHT, CENTER); // Center vertically
  }
  text(floor(v), plotX1 - 10, y);
  line(plotX1 - 4, y, plotX1, y); // Draw major tick
  } else {
  // Commented out; too distracting visually
  //line(plotX1 - 2, y, plotX1, y); // Draw minor tick
}
}
}
}

void drawDataPoints(int col) {
  for (int row = 0; row < rowCount; row++) {
  if (data.isValid(row, col)) {
  float value = data.getFloat(row, col);
  float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
  float y = map(value, dataMin, dataMax, plotY2, plotY1);
  point(x, y);
  }
  }
}

void drawDataLine(int col) {
beginShape( );
int rowCount = data.getRowCount( );
for (int row = 0; row < rowCount; row++) {
if (data.isValid(row, col)) {
float value = data.getFloat(row, col);
float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
float y = map(value, dataMin, dataMax, plotY2, plotY1);
vertex(x, y);
}
}
endShape( );
}

void drawDataHighlight(int col) {
for (int row = 0; row < rowCount; row++) {
if (data.isValid(row, col)) {
float value = data.getFloat(row, col);
float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
float y = map(value, dataMin, dataMax, plotY2, plotY1);
if (dist(mouseX, mouseY, x, y) < 3) {
strokeWeight(10);
point(x, y);
fill(0);
textSize(10);
textAlign(CENTER);
text(nf(value, 0, 2) + " (" + years[row] + ")", x, y-8);
}
}
}
}

void drawDataCurve(int col) {
beginShape( );
for (int row = 0; row < rowCount; row++) {
if (data.isValid(row, col)) {
float value = data.getFloat(row, col);

float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
float y = map(value, dataMin, dataMax, plotY2, plotY1);
curveVertex(x, y);
// Double the curve points for the start and stop
if ((row == 0) || (row == rowCount-1)) {
curveVertex(x, y);
}
}
}
endShape( );
}

void drawDataArea(int col) {
beginShape( );
for (int row = 0; row < rowCount; row++) {
if (data.isValid(row, col)) {
float value = data.getFloat(row, col);
float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
float y = map(value, dataMin, dataMax, plotY2, plotY1);
vertex(x, y);
}
}
// Draw the lower-right and lower-left corners.
vertex(plotX2, plotY2);
vertex(plotX1, plotY2);
endShape(CLOSE);
}

void drawDataBars(int col) {
noStroke( );
rectMode(CORNERS);
for (int row = 0; row < rowCount; row++) {
if (data.isValid(row, col)) {
float value = data.getFloat(row, col);
float x = map(years[row], yearMin, yearMax, plotX1, plotX2);
float y = map(value, dataMin, dataMax, plotY2, plotY1);
rect(x-barWidth/2, y, x+barWidth/2, plotY2);
}
}
}

void keyPressed( ) {
  if (key == '[') {
  currentColumn--;
  if (currentColumn < 0) {
  currentColumn = columnCount - 1;
  }
  } else if (key == ']') {
  currentColumn++;
  if (currentColumn == columnCount) {
  currentColumn = 0;
  }
  }
}

