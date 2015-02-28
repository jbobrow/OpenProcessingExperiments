
PImage bsspLayout;
Table nameTable;
Table locationTable;
Table dataTable;
int rowCount;
String labelText = "";
float labelX;
float labelY;

void setup() {
  size(1600, 900);
  bsspLayout = loadImage("BSSPLayoutblack.png");
  
  
  nameTable = new Table("names.tsv");
  locationTable = new Table("locations.tsv");
  dataTable = new Table("data.tsv");
  rowCount = locationTable.getRowCount();
  PFont font;
  font = loadFont("Arial.vlw");
  textFont(font);
  textSize(24);
  
 // textFont(font);
}

void draw() {
  background(0);
  image(bsspLayout, 0, 10);
  smooth();
  
  //attempted loop through locations
  labelText = "";
  
  for (int row = 0; row < rowCount; row++) {
    String abbrev = locationTable.getRowName(row);
    float value = dataTable.getFloat(abbrev, 1);
    float x = locationTable.getFloat(row, 1);
    float y = locationTable.getFloat(row, 2);
    
  
  
  if (dist(x, y, mouseX, mouseY) < 75) {
    labelText = abbrev + " " + value;
    labelX = x;
    labelY = y;
  }
  }
  if (labelText.length() > 0) {
    fill(255, 0, 0);
    textAlign(CENTER);
    text(labelText, labelX, labelY);
  }
}




