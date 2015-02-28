
float d1, d2, d3, d4;
int radius = 90;

float posX, posY;

int x1, y1;
int x2, y2;
int x3, y3;
int x4, y4;

void setup () {
  size(500,500);
  
  x1 = 75;
  y1 = height/2;
  
  x2 = 175;
  y2 = height/2;
  
  x3 = 275;
  y3 = height/2;
  
  x4 = 375;
  y4 = height/2;
  
  smooth();

}

void draw() {
  
  background(255);
  
  d1 = dist(mouseX, mouseY, x1, y1);
  println("my value for d1 is:" + d1);

  d2 = dist(mouseX, mouseY, x2, y2);
  println("my value for d2 is:" + d2);

  d3 = dist(mouseX, mouseY, x3, y3);
  println("my value for d3 is:" + d3);

  d4 = dist(mouseX, mouseY, x4, y4);
  println("my value for d4 is:" + d4);

//  fill(random(255), random(255), random(255), 200);
//  frameRate(40);
  fill(0);
  noStroke();
  
  if(mousePressed) {
   background(0);
   fill(random(255), random(255), random(255), 255);
   frameRate(40);
//  fill(0);
  }

  ellipse (x1, y1, d1, d1);
  ellipse (x2, y2, d2 , d2);
  ellipse (x3, y3, d3, d3);
  ellipse (x4, y4, d4, d4);
  
  posX = x1;
  posY = y1 - d1;
  
  ellipse(posX, posY, 30, 30);
  
  posX = x1;
  posY = y1 + d1;
  
  ellipse(posX, posY, 30, 30);
  
  posX = x2;
  posY = y2 - d2;
  
  ellipse(posX, posY, 30, 30);
  
  posX = x2;
  posY = y2 + d2;
  
  ellipse(posX, posY, 30, 30);
    
  posX = x3;
  posY = y3 - d3;
  
  ellipse(posX, posY, 30, 30);
  
  posX = x3;
  posY = y3 + d3;
  
  ellipse(posX, posY, 30, 30);
  
  posX = x4;
  posY = y4 - d4;
  
  ellipse(posX, posY, 30, 30);
  
  posX = x4;
  posY = y4 + d4;

  ellipse(posX, posY, 30, 30);
}



