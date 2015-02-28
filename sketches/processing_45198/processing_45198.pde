
//Pollution zone by Stefan Hesselman. Made available thanks to Ben Fry's code and samples.

//Declarations
PImage img;
int circleX, circleY;
Table locationTable;
int rowCount;
PFont f;

Table dataTable;
float dataMin = MAX_FLOAT;    //Lowest extreme in data.
float dataMax = MIN_FLOAT;    //Highest extreme in data.

//Setup map.
void setup() {
  size(440, 470); 
  img = loadImage("nederland.jpg");
  locationTable = new Table("locaties hoofdsteden.tsv"); // Loading pollution data from /data/ in sketchmap.
  rowCount = locationTable.getRowCount();
  
  f = createFont("Myriad Pro",12, true); // Loading font to display major cities where pollution is visualized.
  
  dataTable = new Table("Greenhouse.tsv");
  //acquiring the rows which contain the data. All from the first row.
  //Comparing the highest number. Stores it. And continues to measure.
  for (int row = 0; row < rowCount; row++) {
    float value = dataTable. getFloat( row, 1);
    if (value > dataMax) {
      dataMax = value;
    }
    if (value < dataMin) {
      dataMin = value;
    }
  }
  
  smooth();
  fill(255);

}

void draw() { 
  background(255);
  textFont(f); //Applying the Myriad Pro font.
  image(img, 0, 0); //Displaying the image in the sketch at it's base.
  image(img, 10, 0, img.width/2, img.height/2);
// Drawing attributes for the ellipses. smooth( );
  fill(192, 0, 0);
  noStroke();
  
  //Displaying text for each major city where pollution has been measured.
  text("Amsterdam", 100, 190);
  text("Lelystad", 190, 160);
  text("Rotterdam", 80, 260);
  text("Utrecht", 160, 235);
  text("Nijmegen", 230, 280);
  text("Eindhoven", 220, 330);
  text("Maastricht", 220, 440);
  text("Zwolle", 320, 170);
  text("Assen", 340, 110);
  text("Groningen", 340, 50);
  text("Leeuwarden", 240, 50);
  
  //Acquires the pollution for each area along with it's coordinates x and y.
  for (int row = 0; row < rowCount; row++) {
    float x = locationTable.getFloat(row, 1);
    float y = locationTable.getFloat(row, 2);
 ellipse(x, y, 10, 10);
}

  //Creates a new string called abbreviation. Acquires the rows and visualizes the data based on the minimum and maximum values.
for (int row = 0; row < rowCount; row++) {
  String abbrev = dataTable. getRowName(row);
  float x = locationTable.getFloat(abbrev, 1);
  float y = locationTable.getFloat(abbrev, 2);
  drawData(x, y, abbrev);
  }
}
  //When the minimum and maximum values have been interpreted, they act as extremes. The ellipses become bigger or smaller based on acquired pollution data.
void drawData(float x, float y, String abbrev) {
  float value = dataTable.getFloat(abbrev, 1);
  float mapped = map(value, dataMin, dataMax, 2, 40);
  ellipse(x, y, mapped, mapped);
}

