
PImage galaxy;
PImage spin;
PImage sun;
PImage mars;
PImage mer;
PImage venus;
PImage saturn;


float angle = 0;
float angle2 = 0;
float angle3 = 0;

void setup() {
  size(600, 300);
  galaxy = loadImage("bg.png");
  spin = loadImage("spin.png");
  sun = loadImage("sun.png");
  mars = loadImage("mars.png");
  mer = loadImage("mer.png");
  venus = loadImage("venus.png");
  saturn = loadImage("sat.png");
  smooth();
  frameRate(60);
  imageMode(CENTER);
}

void draw() {

  pushMatrix();
  background(0);
  float d = random(100, 300);
  float blueX = random(100, 300);
  float g = random(-10, 10);


  //bg
  pushMatrix();
  image(galaxy, width/2, height/2);
  popMatrix();

  //sun
  pushMatrix();
  translate(mouseX, mouseY);
  angle+=.015;
  angle2+=.0125;
    angle3+=.005;


  float sinVal2 = 150 + sin(angle+0.005) *150;
  rotate(angle);
  image(sun, 0, 0, 110, 110);
  popMatrix();


  //mercury
  pushMatrix();
  float orbit3 = cos(angle+PI)*80;
  translate(0, orbit3);
  translate(mouseX, mouseY);
  float merspin = 10 + sin(angle) * 10;
  rotate(-angle);
  image(mer, 0, 0, merspin, merspin);
  popMatrix();

  //earth
  pushMatrix();
  float orbit1 = cos(angle)*90;
  translate(orbit1, orbit1/2);
  translate(mouseX, mouseY);
  float earth = 20+ sin(radians(45)+angle+TWO_PI) * 20;
  rotate(angle);
  image(spin, 0, 0, earth, earth);
  popMatrix();

  //mars
  pushMatrix();
  float orbit2 = cos(angle)*150;
  translate(orbit2, orbit2/2);
  translate(mouseX, mouseY);
  float marspin = 25+ sin(angle+PI) * 25;
  rotate(angle+PI);
  image(mars, 0, 0, marspin, marspin);
  popMatrix();

  //venus
  pushMatrix();
  float orbit4 = cos(angle+TWO_PI)*200;
  translate(orbit4, 0);
  translate(mouseX, mouseY);
  float vspin = 30 + sin(angle) * 30;
  rotate(angle);
  image(venus, 0, 0, vspin, vspin);
  popMatrix();

  //saturn
  pushMatrix();
  float orbit5 = cos(angle2+PI)*220;
  translate(orbit5, -orbit5/2);
  translate(mouseX, mouseY);
  float sspin = 70 + sin(-angle2+TWO_PI) * 70;
  rotate(angle2);
  image(saturn, 0, 0, sspin, sspin);
  popMatrix();
  
  //ship
  


  popMatrix();
}


