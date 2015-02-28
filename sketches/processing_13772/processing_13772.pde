
//Assignment # 4
//Name: Emily Dayton
//E-mail: edayton@brynmawr.edu
//10/5/10

StreetLight[] lights;


void setup() {
  size(800, 600);
  smooth();
  background(255);
  frameRate(30);
  // these variables are used in creating the street lights
  float x, y, m = -0.375, c;
  float h = 500, distance = 300;


  lights = new StreetLight[6];


  x = 100;    // x location of first street light
  c = height-10;  // the intercept for locating the rest of lights
  for (int i = 0; i < 6; i++) {
    y = m*x+c;
    // create a new marker  at <x, y> of height h
    lights[i] = new StreetLight(x, y, h);

    h = h*0.75;
    distance = distance*0.75;
    x += distance;
  }
} // setup





void draw() {

  drawScene();
  fill(255);
  int i;
  // first draw all the lights (in their current state)
  for (i = 0; i < 6; i++)
    lights[i].display();
  // randomly turn some light on/off
  if ((frameCount%150) == 0) {
    i = (int)random(6);
    if (lights[i].isOn()) {
      lights[i].turnOff();
    }
    else {
      lights[i].turnOn();
    }
  }
} // draw
void drawScene() {
  //Curb
  smooth();
  fill(0);
  noStroke();
  quad(25, height, width, 300, width, 315, 150, height);
  // sidewalk
  noStroke();
  fill(85, 82, 77);
  beginShape();
  vertex(0, height-250);
  vertex(width, 220);
  vertex(width, 301);
  vertex(26, height);
  vertex(0, height);
  vertex(0, height-250);
  endShape(CLOSE);
  // dark background
  noStroke();
  fill(15, 13, 70);
  quad(0, height-249, width, 221, width, 0, 0, 0);
  // road
  noStroke();
  fill(75);
  triangle(149, height, width, 314, width, height);
} 


