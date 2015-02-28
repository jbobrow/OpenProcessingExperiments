
//'Robot' Exercise 4 z3331791 - Sarah Bracken
//Feed the cat the mouse and watch him expand with fattness :D
//With bg image, text and svg file
PImage catscratch;
PFont font;
PShape collar;

int x = 179;
int y = 300; 
int radius = 100;

void setup() {
size(500, 500);
catscratch = loadImage("catscratch.jpg");
font = loadFont("Dialog-20.vlw"); 
textFont(font);
collar = loadShape("collar.svg");
smooth();

ellipseMode(RADIUS);
noStroke();
}


void draw() {
  background(220, 237, 250);
  image(catscratch, 120, 0);
  textSize(10);
  text("*Squeek*", mouseX - 80, mouseY + 10);
  
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    radius++;
    fill(255);
  }
  stroke(240);
  ellipse(x, y, radius, radius);
  stroke(240);
  ellipse(x, y - 100, radius / 2, radius / 2);
  
  noStroke();
  triangle(138, 150, 175, 160, 135, 180);
  triangle(222, 150, 225, 180, 180, 160);
  
  noStroke();
  fill(252, 204, 204);
  ellipse(x - 1, y - 98, radius / 6, radius / 8);
  fill(255);
  ellipse(x - 1, y - 110, radius / 5, radius / 8);
  
  stroke(0);
  fill(255);
  ellipse(x + 19, y - 120, radius / 14.2, radius / 14.2);
  fill(0);
  ellipse(x + 19, y - 120, radius / 66, radius / 66);
  fill(255, 255, 255, 0);
  ellipse(x - 21, y - 120, radius / 14.2, radius / 14.2);
  fill(0);
  ellipse(x - 21, y - 120, radius / 66, radius / 66);
  fill(255);
  stroke(0);
  fill(255);
  ellipse(250, 280, radius / 14, radius / 4);
  ellipse(105, 280, radius / 14, radius / 4);
  noStroke();
  fill(255);
  ellipse(250, 260, radius / 14, radius / 4);
  ellipse(105, 260, radius / 14, radius / 4);
  noFill();
 
  stroke(255, 255, 255);
  bezier(335, 270, 260, 260, 340, 340, 265, 335);
  noStroke();
  fill(255);
  fill(200);
  ellipse(mouseX - 10, mouseY + 10, 20, 10);
  noFill();
  stroke(200);
  bezier(mouseX + 40, mouseY + 10, mouseX + 5, mouseY + 5, mouseX + 45, mouseY + 45, mouseX, mouseY + 5);
  noStroke();
  fill(0);
  ellipse(mouseX - 20, mouseY + 10, 2, 2);
  fill(255);

shape(collar, 125, 211);
}



