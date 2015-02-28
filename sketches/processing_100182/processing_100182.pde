
//Declare objects, strings, font

Star[] stars = new Star[1300];

PFont font;

PlanetClass Mercury;
PlanetClass Venus;
PlanetClass Earth;
PlanetClass Mars;
PlanetClass Jupiter;
PlanetClass Saturn;
PlanetClass Uranus;
PlanetClass Neptune;

BarChart barDensity;
BarChart barDistanceFromSun;
BarChart barGravity;
BarChart barEscapeVelocity;
BarChart barOrbitalVelocity;

String[] lines;
String[] name;
int[] distanceFromSun;
int[] diameter;
int[] density;
float[] mass;
int[] gravity;
int[] numberOfMoons;
int[] escapeVelocity;
int[] orbitalVelocity;
//Create a class named BarChart to represent the data
class BarChart {

  //Define the fields
  float x2; //Position on the x axis
  float y2; //Position on the y axis - y2 must always be the same
  float barW; //Width - w must always be the same
  float barH; //Height - h depends on the values from the csv file
  int col4; //Color of the Bar R 
  int col5; //Color of the Bar G
  int col6; //Color of the Bar B

  //Define the constructor using appropriate variables
  BarChart(float tempX2, float tempY2, float tempWidth, float tempHeight, int tempCol4, int tempCol5, int tempCol6) {
    x2 = tempX2;
    y2 = tempY2;
    barW = tempWidth;
    barH = tempHeight;
    col4 = tempCol4; 
    col5 = tempCol5; 
    col6 = tempCol6;
  }

  //Define the method
  void display() {
    fill(col4, col5, col6);
    rect(x2, y2, barW, barH);
  }
}

//Create a class named PlanetClass to represent Diameter values from the data
class PlanetClass {

  //Define the fields
  float x1; //Position X
  float y1; //Position Y
  float diameter; //Diameter - uses the value from the csv file
  int col1; //Color of the Planet R 
  int col2; //Color of the Planet G
  int col3; //Color of the Planet B

  //Define the constructor using appropriate variables
  PlanetClass(float tempX, float tempY, float tempDiameter, int tempCol1, int tempCol2, int tempCol3) {
    x1 = tempX;
    y1 = tempY + (sin(frameCount*0.025*(300/x1))*4); //Because I wanted the planets to hover...
    diameter = tempDiameter/700;//Diameter is divided in order to be achieved appropriate proportional size
    col1 = tempCol1; 
    col2 = tempCol2; 
    col3 = tempCol3;
  }

  //Define the method
  void display() {
    fill(col1, col2, col3);
    ellipse(x1, y1, diameter, diameter);
  }
}
//Create a class named Star
class Star {

  //Define the fields
  float x;
  float y;
  float diameter;
  float speed = 0.14; //Because I wanted to make a "sparkling" effect...

  //Define the constructor 
  Star(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }

  //Define the methods
  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }

  void display() {
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}
//Main draw loop
void draw() {

  //Make local variables
  float barWidth = 11; //The width of a single bar
  float h1 = 269; //Y position of the Bars
  float h = height/5; //Y position of the Planets

  //For loop to move and display the stars:
  background(0);
  smooth();
  for (int i=0; i<stars.length; i++) {
    frameRate(100);
    fill(255);
    stars[i].move();
    stars[i].display();
  }

  fill(255, 255, 40, 230); //Color of Sol
  ellipse(-630, height/2, 1391, 1391); //Sol

  //Create Legend Box
  fill(255, 255, 255, 20);
  rect(505, 525, 300, 125);

  //Create the different bar legends
  pushMatrix();
  translate(520, 542);
  fill(148, 0, 211); //Distance from Sun color
  rect(0, 0, 30, 10);
  textSize(15);
  fill(255);
  text(" Distance from Sun         (10^6 km)", 35, 10);


  translate(0, 21);
  fill(0, 255, 255); //Escape Velocity color
  rect(0, 0, 30, 10);
  fill(255);
  text(" Escape Velocity               (km/s)", 35, 10);

  translate(0, 21);
  fill(124, 252, 0); //Gravity color
  rect(0, 0, 30, 10);
  fill(255);
  text(" Gravity                               (m/s2)", 35, 10);

  translate(0, 21);
  fill(199, 21, 133); //Orbital Velocity color
  rect(0, 0, 30, 10);
  fill(255);
  text(" Orbital Velocity                (km/s)", 35, 10);

  translate(0, 21);
  fill(218, 112, 214); //Density color
  rect(0, 0, 30, 10);
  fill(255);
  text(" Density                              (kg/m3)", 35, 10);

  popMatrix();

  //Display the objects (instances of the PlanetClass):
  translate(0, 25);
  Mercury = new PlanetClass(140, h+10, diameter[0], 250, 30, 0); //h+10 for the terrestrial planets is done purely for aesthetical reasons.
  Mercury.display();
  Venus = new PlanetClass(220, h+10, diameter[1], 240, 220, 80);//The color of planets is just personal preference. 
  Venus.display();
  Earth = new PlanetClass(300, h+10, diameter[2], 100, 200, 255);
  Earth.display();
  Mars = new PlanetClass(380, h+10, diameter[3], 255, 0, 0);
  Mars.display();
  Jupiter = new PlanetClass(690, h, diameter[4], 230, 130, 50);
  Jupiter.display();
  Saturn = new PlanetClass(930, h, diameter[5], 200, 120, 200);
  Saturn.display();
  Uranus = new PlanetClass(1105, h, diameter[6], 120, 100, 180);
  Uranus.display();
  Neptune = new PlanetClass(1245, h, diameter[7], 90, 90, 230);
  Neptune.display();



  //Display the bar charts:

  //Mercury bar charts
  pushMatrix();
  translate(120, h1); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Mercury", 4, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[0]/30, 218, 112, 214);
  barDensity.display();
  text(density[0], 38, 190);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[0]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[0], 0, 12);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[0]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[0], 24, 42);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[0]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[0], 13, 22);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[0]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[0], 32, 129);

  //Venus bar charts
  translate(80, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Venus", 10, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[1]/30, 218, 112, 214);
  barDensity.display();
  text(density[1], 38, 184);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[1]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[1], -7, 15);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[1]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[1], 24, 82);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[1]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[1], 8, 41);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[1]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  barEscapeVelocity.display();
  fill(199, 21, 133);
  text(orbitalVelocity[1], 33, 97);

  //Earth bar charts
  translate(80, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Earth", 12, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[2]/30, 218, 112, 214);
  barDensity.display();
  text(density[2], 38, 193);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[2]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[2], -7, 15);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[2]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[2], 20, 90);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[2]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[2], 9, 44);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[2]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[2], 34, 84);

  //Mars bar charts
  translate(80, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Mars", 15, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[3]/30, 218, 112, 214);
  barDensity.display();
  text(density[3], 38, 141);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[3]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[3], -7, 20);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[3]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[3], 24, 42);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[3]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[3], 13, 24);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[3]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[3], 33, 69);

  //Jupiter bar charts
  translate(300, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Jupiter", 4, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[4]/30, 218, 112, 214);
  barDensity.display();
  text(density[4], 40, 53);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[4]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[4], -7, 48);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[4]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[4], 23, 194);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[4]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[4], 10, 190);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[4]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[4], 33, 43);

  //Saturn bar charts
  translate(245, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Saturn", 6, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[5]/30, 218, 112, 214);
  barDensity.display();
  text(density[5], 44, 32);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[5]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[5], -13, 81);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[5]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[5], 26, 81);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[5]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[5], 11, 116);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[5]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[5], 34, 36);

  //Uranus bar charts
  translate(185, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Uranus", 6, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[6]/30, 218, 112, 214);
  barDensity.display();
  text(density[6], 40, 52);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[6]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[6], -6, 153);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[6]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[6], 26, 81);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[6]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[6], 12, 72);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[6]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[6], 35, 27);

  //Neptune bar charts
  translate(140, 0); 
  fill(255, 255, 255, 100);
  textSize(13);
  text("Neptune", -3, -11);
  textSize(9.45);
  barDensity = new BarChart(barWidth*4, 0, barWidth, density[7]/30, 218, 112, 214);
  barDensity.display();
  text(density[7], 40, 63);
  barDistanceFromSun = new BarChart(0, 0, barWidth, distanceFromSun[7]/20, 148, 0, 211);
  barDistanceFromSun.display();
  text(distanceFromSun[7], -6, 233);
  barGravity = new BarChart(barWidth*2, 0, barWidth, gravity[7]*8, 124, 252, 0);
  barGravity.display();
  text(gravity[7], 23, 97);
  barEscapeVelocity = new BarChart(barWidth, 0, barWidth, escapeVelocity[7]*3, 0, 255, 255);
  barEscapeVelocity.display();
  text(escapeVelocity[7], 11, 82);
  barOrbitalVelocity = new BarChart(barWidth*3, 0, barWidth, orbitalVelocity[7]*2.5, 199, 21, 133);
  barOrbitalVelocity.display();
  text(orbitalVelocity[7], 36, 22);
  popMatrix();

  //Display Asteroid Belt, Saturn and Uranus rings (I don't have time to make rings for Jupiter and Neptune but they aren't that spectacular so could be neglected for now.
  noFill();
  stroke(216, 191, 216, 200);
  strokeWeight(5);
  strokeJoin(MITER);
  beginShape(); //Saturn ring
  vertex(1015, h +16 + (sin(frameCount*0.05)*2)); //Because I wanted a "wave" effect...
  vertex(1037, h + 25 + (sin(frameCount*0.05)*2));
  vertex(823, 119 + (cos(frameCount*0.05)*2));
  vertex(843, 118 + (cos(frameCount*0.05)*2));
  endShape();
  stroke(250, 250, 255, 100);
  strokeWeight(1.5);
  ellipse(1105, h + (sin(frameCount*0.007)*3), 90, 90); //Uranus ring
  strokeWeight(0.5);
  ellipse(-800, height/2, 2650, 1400); //Asteroid Belt... kind of. Will make some asteroids in the future.
}

//Setup the Processing Canvas
void setup() {
  size(1340, 650);

  //Load the text font
  font = loadFont("CenturyGothic-20.vlw");
  textFont(font);

  //Load the csv file
  String[] lines = loadStrings("PlanetaryFactSheet.csv");

  //Read in the data from the csv file
  //Diameter values are used to represent the planets' diameters in scale. The rest of the values are used in the bar charts.
  name = split(lines[0], ',');
  distanceFromSun = int(split(lines[1], ','));
  diameter = int(split(lines[2], ',')); 
  density = int(split(lines[3], ',')); 
  mass = float(split(lines[4], ',')); //Not used in the visualisation due to the enormous difference between the smallest and the biggest value.
  gravity = int(split(lines[5], ','));
  numberOfMoons = int(split(lines[6], ',')); //Not used due to the same reasons as above.
  escapeVelocity = int(split(lines[7], ','));
  orbitalVelocity = int(split(lines[8], ','));

  //For loop for the stars
  for (int i=0; i<stars.length; i++) {
    float x = random(width);
    float y = random(height);
    float r = i/450;
    stars[i] = new Star(x, y, r);
  }
}


