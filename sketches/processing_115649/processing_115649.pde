
float d1, d2, d3, d4;
int radius = 90;

float posX1, posY1;
float posX2, posY2;
float posX3, posY3;
float posX4, posY4;

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
  ellipse(mouseX, mouseY, 9, 9);
  strokeWeight(20); //stroke weight of lines
  fill(0);
  
d1 = dist(mouseX, mouseY, x1, y1);
println("my value for d1 is:" + d1);

d2 = dist(mouseX, mouseY, x2, y2);
println("my value for d2 is:" + d2);

d3 = dist(mouseX, mouseY, x3, y3);
println("my value for d3 is:" + d3);

d4 = dist(mouseX, mouseY, x4, y4);
println("my value for d4 is:" + d4);
  
// lines going down  
  
posX1 = x1;
posY1 = y1 - d1;
  
posX2 = x2;
posY2 = y2 - d2;
  
posX3 = x3;
posY3 = y3 - d3;

posX4 = x4;
posY4 = y4 - d4;

line(posX1, posY1, posX2, posY2);
line(posX2, posY2, posX3, posY3);
line(posX3, posY3, posX4, posY4);

// lines going up

posX1 = x1;
posY1 = y1 + d1;
  
posX2 = x2;
posY2 = y2 + d2;
  
posX3 = x3;
posY3 = y3 + d3;

posX4 = x4;
posY4 = y4 + d4;

line(posX1, posY1, posX2, posY2);
line(posX2, posY2, posX3, posY3);
line(posX3, posY3, posX4, posY4);

strokeWeight(10); //stroke weight of circle

  
}



