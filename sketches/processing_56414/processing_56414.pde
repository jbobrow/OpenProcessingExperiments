
int bodyWidth = 100;
int place = 150;
PImage landscape;
PFont font;
String name = "Spring 0.1";
int time = 2000;
float ant1=0, ant2=0, ant3=0;

//changeable variables
int numberOfRings = 3;
int bodyHeight = 120;

float x;
float easing = 0.02;

void setup() {
  size(720, 480);
  smooth(); //smooths lines
  landscape = loadImage("alpine.png");
  font = loadFont("Castorgate-Messed-12.vlw");
  textFont(font);
  frameRate(60);
}


void draw() {
  int currentTime = millis();
  place = 150;
  background(landscape);

  if (currentTime > time) {
    ant1=random(-30, 30);
    ant2=random(-20, 30);
    ant3=random(-30, 30);
    time=time+1000;
  }

  if (mousePressed == true) {
    numberOfRings = 1;
    bodyHeight = 70;
  } 
  else {
    numberOfRings = 3;
    bodyHeight = 120;
  }

  float targetX = mouseX;
  x += (targetX - x) * easing;

  //main body
  fill(0); 
  rect(x-bodyWidth/2, place, bodyWidth, bodyHeight); 
  fill(175, 53, 53); 
  text (name, x-25, place+41, 240, 100);

  //head
  stroke(0); 
  strokeWeight(4); 
  noFill(); 
  ellipse(x-30, (place - 35), 60, 60);
  ellipse(x-40, place, 80, 80);

  //Little circles
  noStroke();
  fill(175, 53, 53);
  ellipse(x, place, 80, 80);
  fill(200); 
  ellipse(x, place, 60, 60);
  fill(0);
  ellipse(x, place, 15, 15);

  //antenni
  stroke(0); 
  strokeWeight(2);
  line(x-40, (place - 2), (x-100)+ant1, (place - 40)+ant1);  //bottom
  line(x-40, (place - 2), (x-80)+ant2, (place - 140)+ant2);  //middle
  line(x-40, (place - 2), (x-140)+ant3, (place - 100)+ant3); //top

  //small band on body
  noStroke();
  fill(150); 
  rect(x-bodyWidth/2, (place + (bodyHeight - 10)), bodyWidth, 5); 

  //lower body
  place = place + bodyHeight;
  fill(150); 
  noStroke(); 
  arc(x, place, bodyWidth, 60, 0, PI);
  place = place + 37;

  //creates chain base
  stroke(0); 
  strokeWeight(3); 
  fill(250);

  for (int i = 0; i < numberOfRings; i++) {     //creates circles
    ellipse(x, place, 15, 15);
    place = place + 15;
  }

  // Create base
  fill(0); 
  arc(x, place, 110, 110, 0, PI); //fills arc grey - creates arc
  fill(150); 
  noStroke(); 
  rect(x-65, (place - 6), 130, 10); //fills light grey - no boarder - creates rectangle
}


