
boolean button = false;

float mouseX = 100;
float mouseY = 100;
float w = 60;
float h = 60;
float eyeSize = 16;
float xspeed = 3;
float yspeed = 1;

void setup() {
size(600,400);
smooth();
}

void draw() {
// Change the location of Zoog by speed
mouseX = mouseX + xspeed;
mouseY = mouseY + yspeed;

background(0);
ellipseMode(CENTER);
rectMode(CENTER);
noStroke();

if ((mouseX > width -50) || (mouseX < 50)) {
xspeed = xspeed * -1;
}
if ((mouseY > height -50) || (mouseY < 50)) {
yspeed = yspeed * -1;
}
if (mousePressed) {
button = true;
} else {
button = false;
}
if (button) {
background(255,0,0);
} else {
background(255);
}


 // VV
  stroke (0);
  fill (255);
  rect (mouseX,mouseY,90, 100);
  
  strokeWeight(3);
  line(mouseX-20, mouseY+20,mouseX-15,mouseY+30);
  line(mouseX-15,mouseY+30,mouseX-10,mouseY+20);
  line (mouseX+20,mouseY+20,mouseX+15,mouseY+30);
  line (mouseX+15,mouseY+30,mouseX+10,mouseY+20);
  
 fill (map (mouseX,0,width,0,255), 0,0);
  noStroke ();
  ellipse(mouseX-20,mouseY-20, 12, 11);
  ellipse(mouseX+20,mouseY-20,13, 13); 
 
}




