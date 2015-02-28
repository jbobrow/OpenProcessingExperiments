
// Photo album with images of my town
// Loading files
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PFont vladimir;

//Global variables
float i = 0;
float i2 = 0;
float j;
float k;
float j2;
float k2;
float j3;
float k3;
float j4;
float k4;
float j5;
float k5;
float j6;
float k6;
float j7;
float k7;
float j8;
float k8;
float y = -500;
float y2 = 600;
float y3 = 600;
float y4 = 1000;

//Setup
void setup() {
 size(800, 600);
colorMode(HSB, 360, 100, 100, 100);
background(50, 40, 90);
a = loadImage("a.jpg");
b = loadImage("b.jpg");
c = loadImage("c.jpg");
d = loadImage("d.jpg");
e = loadImage("e.jpg");
f = loadImage("f.jpg");
g = loadImage("g.jpg");
h = loadImage("h.jpg");
vladimir = loadFont("vladimir.vlw");
imageMode(CENTER);
rectMode(CENTER);
}

// The smoke at the left
void draw() {
  y +=1;
  y2 -=.4;
  y3 -= .4;
  y4 -= 1.3;
  i += .05;
  float x = (float)map(mouseX, 0, width, 317.5, -282.5);
  float x2 = (float)map(mouseX + mouseY, 0, width, 60, 42.5);
  float x3 = (float)map(mouseX + mouseY, 0, width, 25, 42.5);
  float x4 = (float)map(mouseX, 0, width, 317.5, -282);
  noFill();  
  strokeWeight(1);
  stroke(i, 0, i, 25);
  curve(x, y, x2, y2, x3, y3, x4, y4);

// The looping background
  noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  fill(0, 70, 50);
  textFont(vladimir, 48);
  text("San Cristobal", 300, 100);

// The photo frames local variables
j = map (mouseX, 0, width, 199, 209);
j2 = map (mouseX, 0, width, 343, 353);
j3 = map (mouseX, 0, width, 487, 497);
j4 = map (mouseX, 0, width, 631, 641);
k = map(mouseY, 0, height, 209, 219);
k2 = map(mouseY, 0, height, 229, 239);
k3 = map(mouseY, 0, height, 393, 403);
k4 = map(mouseY, 0, height, 373, 383);


 // The photos
  image(a, 204, 214, 80, 120);
  image(b, 348, 234, 120, 80);
  image(c, 492, 234, 120, 80);
  image(d, 636, 214, 80, 120);
  image(e, 204, 398, 80, 120);
  image(f, 348, 378, 120, 80);
  image(g, 492, 378, 120, 80);
  image(h, 636, 398, 80, 120);
  
  // The photo frames
  noFill();
strokeWeight(1);
stroke(0, 70, 50);
rect(j, k, 90, 130);
rect(j2, k2, 130, 90);
rect(j3, k2, 130, 90);
rect(j4, k, 90, 130);
rect(j, k3, 90, 130);
rect(j2, k4, 130, 90);
rect(j3, k4, 130, 90);
rect(j4, k3, 90, 130);

strokeWeight(2);
rect(j, k, 97, 137);
rect(j2, k2, 137, 97);
rect(j3, k2, 137, 97);
rect(j4, k, 97, 137);
rect(j, k3, 97, 137);
rect(j2, k4, 137, 97);
rect(j3, k4, 137, 97);
rect(j4, k3, 97, 137);
  
  // The photo interaction
  if (mouseX > 164 && mouseX < 244 && mouseY > 154 &&
  mouseY < 274) {
   pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(a, 420, height/2, 400, 600);
 popMatrix(); 
  }
  if (mouseX > 288 && mouseX < 408 && mouseY > 194 &&
  mouseY < 274) {
  pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(b, 420, height/2, 600, 400);
 popMatrix();
  }
 if (mouseX > 432 && mouseX < 552 && mouseY > 194 &&
  mouseY < 274) {
 pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(c, 420, height/2, 600, 400);
 popMatrix();
  }
 if (mouseX > 596 && mouseX < 676 && mouseY > 154 &&
  mouseY < 274) {
    pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(d, 420, height/2, 400, 600);
 popMatrix();
  }
 if (mouseX > 164 && mouseX < 244 && mouseY > 338 &&
  mouseY < 458) {
     pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(e, 420, height/2, 400, 600);
 popMatrix();
  }
 if (mouseX > 288 && mouseX < 408 && mouseY > 338 &&
  mouseY < 418) {
     pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(f, 420, height/2, 600, 400);
 popMatrix();
  }
 if (mouseX > 432 && mouseX < 552 && mouseY > 338 &&
  mouseY < 418) {
     pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(g, 420, height/2, 600, 400);
 popMatrix();
  }
 if (mouseX > 596 && mouseX < 676 && mouseY > 338 &&
  mouseY < 458) {
     pushMatrix();
   noStroke();
  fill(50, 40, 90);
  rect(420, 300, 600, height);
  image(h, 420, height/2, 400, 600);
 popMatrix();
  }
}

