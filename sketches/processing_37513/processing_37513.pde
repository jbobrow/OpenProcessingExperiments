
PImage mapImage;
Table locationTable;
Table populationTable;
Table areaTable;
Table nameTable;
Integrator[] interpolators;
Integrator[] areaInterpolator;

int rowCount;
float dataMin = MAX_FLOAT;
float dataMax = MIN_FLOAT;

float areaMin = MAX_FLOAT;
float areaMax = MIN_FLOAT;

boolean mouseOver = false;
float _mapped = 0;
float infoX = 0;
float infoY = 0;
String infoName;
int infoPopulation;
int infoDensity;

void setup( ) {
  size(639, 756);
  mapImage = loadImage("map.png");
  locationTable = new Table("locations.tsv");
  rowCount = locationTable.getRowCount();

  // Read the data table.
  populationTable = new Table("random.tsv");
  areaTable = new Table("area.tsv");
  nameTable = new Table("names.tsv");

  interpolators = new Integrator[rowCount];
  areaInterpolator = new Integrator[rowCount];
  for (int row = 0; row < rowCount; row++) {
    float initialValue = populationTable.getFloat(row, 1);
    float areaInitialValue = (populationTable.getFloat(row, 1)/areaTable.getFloat(row, 1));
    interpolators[row] = new Integrator(initialValue);
    areaInterpolator[row] = new Integrator(areaInitialValue);
  }
  
  findMinMaxValues(rowCount);
}

void draw() {
  background(255);
  image(mapImage, 0, 0);
  smooth();
  fill(192, 0, 0);
  noStroke();

  for (int row = 0; row < rowCount; row++) {
    interpolators[row].update();
    areaInterpolator[row].update();
  }

  mouseOver = false;
  for (int row = 0; row < rowCount; row++) {
    String abbrev = populationTable.getRowName(row);
    float x = locationTable.getFloat(abbrev, 1);
    float y = locationTable.getFloat(abbrev, 2);
    drawData(x, y, abbrev);
  }
  
  if(mouseOver){
    drawInfoField();
  }
  //updateTable();
}

// Map the size of the ellipse to the data value
void drawData(float x, float y, String abbrev) {
  // Figure out what row this is.
  int row = populationTable.getRowIndex(abbrev);
  // Get the current value.
  float value = interpolators[row].value;
  float areaValue = areaInterpolator[row].value;

  float percent = norm(areaValue, areaMin, areaMax);
  color between = lerpColor(#CBBBA0, #120B01, percent, HSB); // red to blue
  fill(between, 228);

  // Re-map the value to a number between 2 and 40
  float mapped = map(value, dataMin, dataMax, 8, 60);

  // Draw an ellipse for this item
  ellipseMode(RADIUS);
  ellipse(x, y, mapped, mapped);
  
  if (dist(x, y, mouseX, mouseY) < mapped+2) {
    mouseOver = true;
    _mapped = mapped;
    infoX = x;
    infoY = y;
    infoName = nameTable.getString(abbrev, 1);
    infoPopulation = int(value);
    infoDensity = int(areaValue);
  }
}

void drawInfoField(){
    fill(32,32,32,228);
    triangle(infoX-10, infoY-_mapped-10, infoX, infoY-_mapped ,infoX+10, infoY-_mapped-10);
    rectMode(CENTER);
    rect(infoX, infoY-_mapped-42, 160, 66);
    
    fill(228);
    textAlign(LEFT);
    // Show the data value and the state abbreviation in parentheses.
    text(infoName, infoX-70, infoY-_mapped-55);
    text("Population: " + nf(infoPopulation, 0, 0), infoX-70, infoY-_mapped-35);
    text("Density:       " + nf(infoDensity, 0, 0) + " pp/ km²", infoX-70, infoY-_mapped-17.5);
}

void keyPressed( ) {
  if (key == ' ') {
    updateTable();
  }
}

void updateTable( ) {
  for (int row = 0; row < rowCount; row++) {
    float newValue = interpolators[row].value + random(-250000, 250000);
    interpolators[row].target(newValue);
    
    if (newValue > dataMax) {
      dataMax = newValue;
    }

    if (newValue < dataMin) {
      dataMin = newValue;
    }
    
    float areaValue = (interpolators[row].value + newValue)/areaTable.getFloat(row, 1);
    areaInterpolator[row].target(areaValue);
    
    if (areaValue > areaMax) {
      areaMax = areaValue;
    }

    if (areaValue < areaMin) {
      areaMin = areaValue;
    }
  }
}

void findMinMaxValues(int rowCount){
  // Find the minimum and maximum values.
  for (int row = 0; row < rowCount; row++) {
    float value = populationTable.getFloat(row, 1);

    if (value > dataMax) {
      dataMax = value;
    }

    if (value < dataMin) {
      dataMin = value;
    }
    
    float areaValue = areaTable.getFloat(row, 1);

    if (value/areaValue > areaMax) {
      areaMax = value/areaValue;
    }

    if (value/areaValue < areaMin) {
      areaMin = value/areaValue;
    }
  }
}


