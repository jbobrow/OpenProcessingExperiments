
//Alex LeBlanc
//AME294
//ASSIGNMENT 10: MILK+TEA+COFFEE CONSUMPTION PER CAPITA

//Array & variables set
DataPoint[] data;      
float maxVal;    
float minVal;
float graphX;
float graphY;
float graphWidth;
float graphHeight;
float w;
PFont fontSmall;
PFont fontMedium;
PFont fontBig;
int highlight;


void setup() {
  size( 1350, 600 );

  fontSmall = createFont( "Courier New", 8 );
  fontMedium = createFont( "Courier New", 14 );
  fontBig = createFont( "Courier New", 32 );
  highlight = -1;

  graphX = 100.0;
  graphY = 100.0;
  graphWidth = 1245.0;
  graphHeight = 400.0;


  data = new DataPoint[0];
  maxVal = 0;
  minVal = 0;

  String[] lines = loadStrings( "milk-tea-coffee.tsv" );
  for (int i = 1; i < lines.length; i++) {
    String[] strings = split( lines[i], "\t" );

    float value = float( strings[1] );
    float value1 = float( strings[2] );
    float value2 = float( strings[3] );
    DataPoint dp = new DataPoint( strings[0], strings[1], strings[2], strings[3] );

    if (value > maxVal) {
      maxVal = value;
    }
    if (value < minVal) {
      minVal = value;
    }
    if (value1 > maxVal) {
      maxVal = value1;
    }
    if (value1 < minVal) {
      minVal = value1;
    }
    if (value2 > maxVal) {
      maxVal = value2;
    }
    if (value2 < minVal) {
      minVal = value2;
    }

    data = (DataPoint[])append( data, dp );
  }

  w = graphWidth / (float)data.length;


  for (int i = 0; i < data.length; i++) {
    float hMilk = map( data[i].milk, minVal, maxVal, 0.0, graphHeight );
    float xMilk = graphX + (i * w) + w / 2.0;
    float yMilk = graphY + (graphHeight - hMilk);
    data[i].xM = xMilk;
    data[i].yM = yMilk;
    //Tea
    float hTea = map( data[i].tea, minVal, maxVal, 0.0, graphHeight );
    float xTea = graphX + (i * w) + w / 2.0;
    float yTea = graphY + (graphHeight - hTea);
    data[i].xT = xTea;
    data[i].yT = yTea;
    //Coffee
    float hCoffee = map( data[i].coffee, minVal, maxVal, 0.0, graphHeight );
    float xCoffee = graphX + (i * w) + w / 2.0;
    float yCoffee = graphY + (graphHeight - hCoffee);
    data[i].xC = xCoffee;
    data[i].yC = yCoffee;
  }
}

void draw() {
  background( 155 );

  // Heading Text
  noStroke();
  fill( 0 );
  textFont( fontBig );
  textAlign( CENTER );
  text( "POPULAR LIQUIDS TO CONSUME (PER MOUTH)", 675, 65 );

  //X Axis
  noStroke();
  fill( 0 );
  textFont( fontMedium );
  textAlign( CENTER );
  text( "Gallons", 28, 300 );

  //Y Axis
  noStroke();
  fill( 0 );
  textFont( fontMedium );
  textAlign( CENTER );
  text( "Years", 675, 550 );

  // Chart outline
  stroke( 0 );
  noFill();
  rectMode( CORNER );
  rect( graphX, graphY, graphWidth, graphHeight );

  drawDataPoints();
  labelXAxis();
  labelYAxis();
  highlightNearestDataPoint();
}


void drawDataPoints() {
  for (int i = 1; i < data.length; i++) {
    //Milk Lines
    stroke(0, 255, 255);
    line( data[i-1].xM, data[i-1].yM, data[i].xM, data[i].yM );
    //Tea Lines
    stroke(255, 165, 0);
    line( data[i-1].xT, data[i-1].yT, data[i].xT, data[i].yT );
    //Coffee Lines
    stroke(123, 17, 19);
    line( data[i-1].xC, data[i-1].yC, data[i].xC, data[i].yC );
  }

  rectMode( CENTER );
  for (int i = 0; i < data.length; i++) {
    //Milk Points
    stroke(0, 255, 255);
    ellipse( data[i].xM, data[i].yM, 10, 10 );
    //Tea Points
    stroke(255, 165, 0);
    ellipse( data[i].xT, data[i].yT, 10, 10 );
    //Coffee Points
    stroke(123, 17, 19);
    ellipse( data[i].xC, data[i].yC, 10, 10 );
  }
}


void labelXAxis() {
  // draw the horizontal marks and numbers
  textFont( fontSmall );
  textAlign( CENTER );
  float baseline = graphY + graphHeight;
  for (int i = 0; i < data.length; i++) {
    stroke( 0 );
    noFill();
    line( data[i].xM, baseline, data[i].xM, baseline + 10 );

    
  }
}


void labelYAxis() {
  // draw the vertical marks and numbers
  textFont( fontMedium );
  float yValueRange = maxVal - minVal;
  float yValueStep = yValueRange / 10.0;
  float yPixelStep = graphHeight / 10.0;
  for (int i = 0; i <= 10; i++) {
    float yPixelValue = i * yPixelStep;
    float yValue = i * yValueStep;

    float y = graphY + graphHeight - yPixelValue;
    float x = graphX;
    stroke( 0 );
    noFill();
    line( x, y, x - 15, y );

    noStroke();
    fill( 0 );
    textAlign( RIGHT, CENTER );
    text( nfc( yValue, 1 ), x - 20, y );
  }
}


void highlightNearestDataPoint() {
  //Year Text
  fill(0);
  textFont( fontMedium );
  textAlign( CENTER );
  text("Year:", 1100, 150);
  //Milk Text
  fill(0, 255, 255);
  textFont( fontMedium );
  textAlign( CENTER );
  text("Milk:", 1100, 175);
  //Tea Text
  fill(255, 165, 0);
  textFont( fontMedium );
  textAlign( CENTER );
  text("Tea:", 1100, 200);
  //Coffee Text
  fill(123, 17, 19);
  textFont( fontMedium );
  textAlign( CENTER );
  text("Coffee:", 1100, 225);
  if (highlight != -1) {
    //Milk Highlight
    stroke( 0, 255, 255 );
    strokeWeight( 3 );
    noFill();
    ellipse( data[highlight].xM, data[highlight].yM, 10, 10 );
    //Tea Highlight
    stroke( 255, 165, 0 );
    strokeWeight( 3 );
    noFill();
    ellipse( data[highlight].xT, data[highlight].yT, 10, 10 );
    //Coffee Highlight
    stroke( 123, 17, 19 );
    strokeWeight( 3 );
    noFill();
    ellipse( data[highlight].xC, data[highlight].yC, 10, 10 );

    //Year Text
    fill(0);
    textFont( fontMedium );
    textAlign( CENTER );
    text(data[highlight].time, 1200, 150 );
    //Milk Text
    fill(0, 255, 255);
    textFont( fontMedium );
    textAlign( CENTER );
    text( data[highlight].milk + " gallons", 1200, 175 );
    //Tea Text
    fill(255, 165, 0);
    textFont( fontMedium );
    textAlign( CENTER );
    text( data[highlight].tea + " gallons", 1200, 200 );
    //Coffee Text
    fill(123, 17, 19);
    textFont( fontMedium );
    textAlign( CENTER );
    text( data[highlight].coffee + " gallons", 1200, 225 );

    noStroke();


    strokeWeight( 1 );
  }
}


void mouseMoved() {
  float closest = 2000;
  int closest_i = -1;
  for (int i = 0; i < data.length; i++) {
    float distanceM = dist( data[i].xM, data[i].yM, mouseX, mouseY );
    if (distanceM < closest) {
      closest = distanceM;
      closest_i = i;
    }
    float distanceT = dist( data[i].xT, data[i].yT, mouseX, mouseY );
    if (distanceT < closest) {
      closest = distanceT;
      closest_i = i;
    }
    float distanceC = dist( data[i].xC, data[i].yC, mouseX, mouseY );
    if (distanceC < closest) {
      closest = distanceC;
      closest_i = i;
    }
  }
  if (closest < 20 && closest_i >= 0) {
    highlight = closest_i;
  }
  else {
    highlight = -1;
  }
}

class DataPoint {
  String time;
  float milk;
  float tea;
  float coffee;
  float xM;
  float yM;
  float xT;
  float yT;
  float xC;
  float yC;
  
  DataPoint( String _time, float _milk, float _tea, float _coffee ) {
    time = _time;
    milk= _milk;
    tea= _tea;
    coffee= _coffee;
    xM = 0.0;
    yM = 0.0;
    xT = 0.0;
    yT = 0.0;
    xC = 0.0;
    yC = 0.0;
  }
}


