
/**
 * Draw line charts comparing data generated from random()                                                              
 * to data generated using noise() (Perlin Noise).
 *
 * Move the pointer over the chart to get an interactive cursor
 * for browsing the data values.
 *
 * Press any key to redraw the charts with new random values.
 */
//  Bruce Wilson, 6/20/2013

static final int kMargin=50;
static final int kRandChartY=80;
static final int kNoiseChartY=280;

static final int kLabelPadding = 5;

static final float kChartHeight=100.0;

static final int kXInterval = 5;

static final boolean kShowPoints = false;
static final boolean kDebugging = false;

float[] randomData;
float[] noiseData;
int chartWidth = 0;

void setup() {
  size(750, 450);
  chartWidth = width - 2 * kMargin;
  createData();
  frameRate(12);
}

void createData() {
  int numData = (width - 2 * kMargin) / kXInterval;
  
  // Random values
  randomData = new float[numData];
  if (kDebugging) println("Random Data:");
  for(int i = 0; i < numData; i++) {
    randomData[i] = random(0.0, 1.0);
    if (kDebugging) println("" + nf(i, 3) + " " + nf(randomData[i], 1, 4));
  }
  
  // Perlin noise values
  noiseData = new float[numData];
  
  // Reset the noiseSeed each time the data is generated, otherwise the same
  // values are computed each time (as opposed to random(), which always
  // returns different value
  // noiseSeed(millis());  // noiseSeed(millis()) doesn't seem to work in Processing.js
  noiseSeed(int(random(0.0, 10000.0)));

  // Use a random multiplier to vary the data generated each time it's created.
  // Documentation for noise() says values between 0.005 and 0.030 work best.
  float  noiseMultiplier = random(0.005, 0.030);
  
  if (kDebugging) println("Noise Data:");
  for(int i = 0; i < numData; i++) {
    noiseData[i] = noise(noiseMultiplier * float(i) * kXInterval);
    if (kDebugging) println("" + nf(i, 3) + " " + nf(noiseData[i], 1, 4));
  }
}

void draw() {
  background(80);
  drawChart(kMargin, kRandChartY, randomData, "random()");
  drawChart(kMargin, kNoiseChartY, noiseData, "noise()");
}

void drawChart(int left, int top, float[] data, String chartLabel) {
  color axisColor = color(40);
  color lineColor = color(0, 255, 255);    // cyan
  color cursorColor = color(255, 255, 0);  // yellow
  
  noFill();
  
  // Important: default strokeJoin style of MITER may cause sharp corners
  // to extend below the horizontal axis
  strokeJoin(ROUND);
  // strokeCap(ROUND);  // didn't fix the problem
  
  if (kDebugging) { stroke(255, 0, 0); ellipse(left, top, 5, 5); }
  
  // Important: keep in mind here that y coordinates increase value downwards,
  // not upwards!  Also, translate() only applies to coordinates used in drawing
  // things - it does not affect current mouse position values.
  pushMatrix();
  translate(left, top);
  if (kDebugging) println("Draw chart '" + chartLabel + "': left=" + left + ",top=" + top);
  
  // Draw the axis
  stroke(axisColor);
  strokeWeight(1);
  line(0, kChartHeight, width - 2 * kMargin, kChartHeight);

  // Chart label
  textAlign(LEFT, BOTTOM);
  text(chartLabel, 0, -kMargin / 2);
  
  // Vertical axis values
  textAlign(RIGHT, CENTER);
  text("1.0", -kLabelPadding, 0);
  line(0, 0, 10, 0);
  text("0.0", -kLabelPadding, kChartHeight);
  
  // Data line
  stroke(lineColor);
  strokeWeight(2);
  beginShape();
  for(int i=0; i < data.length; i++) {
    float x = map(i, 0, data.length - 1, 0, chartWidth);
    float y = kChartHeight - map(data[i], 0.0, 1.0, 0.0, kChartHeight);
    if (kShowPoints) ellipse(x, y, 3, 3);  // Mark the data points
    vertex(x, y);
  }
  endShape();
  
  // Vertical cursor
  if ( mouseInChart(left, top) ) {
    stroke(cursorColor);
    strokeWeight(1.0);
    
    final int cursorPadding=2;
    
    int x = mouseX - left;
    // Draw the cursor line
    line(x, 0, x, kChartHeight - cursorPadding);
    
    // Label the data value at the cursor.
    // Offset so that cursor reads the correct value just to either side
    // of a data point.
    int horizDataOffset = kXInterval / 2;
    int iData = (int)map(x + horizDataOffset, 0, chartWidth, 0, data.length - 1);
    String dataLabel = nf(data[iData], 1, 4);
    textAlign(CENTER, TOP);
    text(dataLabel, x, kChartHeight);
    // println("x=" + x + ", top=" + top + ",i=" + iData + ", data=" + data[iData]);
  }
  
  popMatrix();  
}

boolean mouseInChart(int left, int top) {
  if ( mouseY < top) return false;
  if ( mouseY > top + kChartHeight) return false;
  if ( mouseX < left ) return false;
  if ( mouseX > (width - left) ) return false;
  // println("Mouse in chart: left=" + left + ", top=" + top);
  return true;
}

void keyPressed() {
  // Create a new set of data when any key is pressed
  createData();
}



