
int neckHeight = 20;
int bodyHeight = 40;
 
void setup() {
 size(540, 340);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  frameRate(3);
}
  
void draw() {
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  background(r, g, b);
  drawRobot(30, 300, 100, 100);
  drawRobot(170, 300, 100, 100);
  drawRobot(310, 300, 100, 100);
  drawRobot(450, 300, 100, 100);
}

void drawRobot(int x, int y, int bodyHeight, int neckHeight){
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;
  
//head
fill(237, 109, 70);
if (mousePressed == true){
  fill(145, 109, 70);
}
ellipse(x+40, ny+60, radius, radius);
fill(0);
ellipse(x+20, ny+70, 5, 10);
ellipse(x+60, ny+70, 5, 10);
fill(255);
ellipse(x+20, ny+75, 2, 2);
ellipse(x+60, ny+75, 2, 2);
stroke(0);
strokeWeight(4);
line(x+8, ny+58, x+20, ny+52);
line(x+72, ny+58, x+60, ny+52);
//antennae
stroke(187, 192, 192);
if (mousePressed == true){
  stroke(0);
}
line(x+14, ny+24, x+2, ny+8);
line(x+62, ny+24, x+72, ny+8);
noStroke();
fill(0);
if (mousePressed == true){
  fill(187, 192, 192);
}
ellipse(x+2, ny+8, 4, 4);
ellipse(x+72, ny+8, 4, 4);
//neck
fill(187, 192, 192);
quad(x-3, ny+85, x+83, ny+85, x+90, ny+110, x-10, ny+110);
//body
fill(224, 234, 234);
quad(x+90, ny+110, x+72, ny+165, x+8, ny+165, x-10, ny+110);
//arms
rect(x-20, ny+110, 10, 40);
rect(x+90, ny+110, 10, 40);
//legs
rect(x+8, ny+165, 10, 40);
rect(x+62, ny+165, 10, 40);
arc(x-2, ny+205, 20, 20, PI, TWO_PI);
arc(x+82, ny+205, 20, 20, PI, TWO_PI);
 
}


