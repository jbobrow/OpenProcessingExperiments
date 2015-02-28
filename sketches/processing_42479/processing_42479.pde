
PImage mapImage;
Table locationTable;
Table nameTable;
int rowCount;
Table dataTable;
float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

float closestDist;
String closestText;
float closestTextX;
float closestTextY;

void setup( ) {
  size(700, 318);
  
  PFont font = loadFont("Univers-Bold-12.vlw");
  textFont(font);
  
  mapImage = loadImage("kaart.png");
  // Make a data table from a file that contains
  // the coordinates of each state.
  locationTable = new Table("locations.tsv");
  // The row count will be used a lot, so store it globally.
  rowCount = locationTable.getRowCount( );  

  nameTable = new Table("names.tsv");

  // Read the data table.
  dataTable = new Table("random.tsv");
  // Find the minimum and maximum values.
  for (int row = 0; row < rowCount; row++) {
    float value = dataTable.getFloat(row, 1);
    if (value > dataMax) {
      dataMax = value;
    }
    if (value < dataMin) {
      dataMin = value;
    }
  }
}

void draw( ) {
  background(255);
  image(mapImage, 0, 0);
  closestDist = MAX_FLOAT;
  for (int row = 0; row < rowCount; row++) {
    String abbrev = dataTable.getRowName(row);
    float x = locationTable.getFloat(abbrev, 1);
    float y = locationTable.getFloat(abbrev, 2);
    drawData(x, y, abbrev);
  }
  
  // Use global variables set in drawData( )
  // to draw text related to closest circle.
  if (closestDist != MAX_FLOAT) {
    fill(0);
    textAlign(CENTER);
    text(closestText, closestTextX, closestTextY);
  }
}

void drawData(float x, float y, String abbrev) {
  float value = dataTable.getFloat(abbrev, 1);
  float radius = 0;
  if (value >= 0) {
    radius = map(value, 0, dataMax, 1.5, 15);
    fill(#FF4422); // blue
  } else {
      radius = map(value, 0, dataMin, 1.5, 15);
      fill(#4422CC); // red
    }
    
  ellipseMode(RADIUS);
  ellipse(x, y, radius, radius);
  float d = dist(x, y, mouseX, mouseY);
  
  // Because the following check is done each time a new
  // circle is drawn, we end up with the values of the
  // circle closest to the mouse.
  if ((d < radius + 2) && (d < closestDist)) {
    closestDist = d;
    String name = nameTable.getString(abbrev, 1);
    closestText = name + " : " + int(value);
    closestTextX = x;
    closestTextY = y-radius-4;
  }
}

