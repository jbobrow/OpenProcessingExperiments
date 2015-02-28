
/*
Niels de Beukelaer
539978
*/

PImage mapImage;
Table locationTable;
int rowCount;
Table dataTable;
Table nameTable;
int dataMin = MAX_INT;
int dataMax = MIN_INT;
int mouseValue = 0;

int dots;

int currentData;


void setup() {
  size(700, 750); //imagesize is 531x750
 
  mapImage = loadImage("map.png"); 
  locationTable = new Table("locations.tsv");
  rowCount = locationTable.getRowCount();
  dataTable = new Table("random.tsv");
  nameTable = new Table("names.tsv");
  
  for (int row = 0; row < rowCount; row++) {
    int value = dataTable.getInt(row, 1);
    if (value > dataMax) {
      dataMax = value;
    }
    if (value < dataMin) {
      dataMin = value;
    }
  }
}


void draw(){
  background(240);
  image(mapImage, 0, 0);
    
  dots = 1;
  
  stroke(225);
  line(532, 0, 532, 750);
  
  smooth();
  fill(192, 0, 0);
  noStroke();
  
  fill(255);
  rect(535, 138, 160, 50);
  rect(535, 198, 160, 50);
  
  fill(0);
  text1();
    
  data1(); // mocht er gebruik worden gemaakt van meerdere data
  
  if (dots == 1){
    PFont font = loadFont("Verdana.vlw");
    textAlign(CENTER);
    textFont(font, 20);
    fill(120,0,0);
    text("...", 610, 185);
    text("...", 610, 245);
  } else {
  }
    
  
}


void text1() {
  PFont font = loadFont("Verdana.vlw");
  textFont(font, 26);
  textAlign(CENTER);
  text("Province", 610, 160);
  text("Inhabitants", 615, 220);
  
  textAlign(LEFT);
  text("Inhabitants per province", 30, 30);
  stroke(0);
  line(30, 40, 350, 40);
  
  textFont(font, 12);
  textAlign(LEFT);
  text("N. de Beukelaer", 540, 700);
  }


void data1(){
    for (int row = 0; row < rowCount; row++) {
    String abbrev = dataTable.getRowName(row);
    float x = locationTable.getFloat(abbrev, 1);
    float y = locationTable.getFloat(abbrev, 2);
    drawData(x, y, abbrev);
  }
}

// Om coördinaten te vinden
void mouseClicked() {
    if (mouseValue == 0){
    println(mouseX+","+mouseY);
    } else {
      mouseValue = 0;
    }
  }


void drawData(float x, float y, String abbrev){
  int value = dataTable.getInt(abbrev, 1);
  float radius = 0;
  radius = map(value, dataMin, dataMax, 10, 40);
  fill(#4422CC);
  ellipseMode(RADIUS);
  ellipse(x, y, radius, radius);
  
  if (dist(x, y, mouseX, mouseY) < radius+2) {
    fill(0);
    textAlign(CENTER);
    String name = nameTable.getString(abbrev, 1);
    PFont font = loadFont("Verdana.vlw");
    textFont(font, 20);
    fill(120,0,0);
    dots = 0;
    text(name, 610, 185);
    text(value, 610, 245);
  }
}

