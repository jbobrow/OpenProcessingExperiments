
/*Adinamis Z. Corchado
  GAM 240 Assignment 3
  spiral design code taken from "Processing" by Reas and Fry pg. 123
*/

//for color BG
float timer = 0.0;
float direction = 20; 

float y = 0.0;
float z = 20.0;
float a = 40.0;
float b = 60.0;
float c = 80.0;
 
void setup()
{
  //background(0);
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
 
 

}
 
void draw() {
   if (timer>360) {
    direction = -direction;
    timer = 360;
  }
 
  if (timer<0) {
    direction = -direction;
    timer = 0;
  }  
  pushStyle();
  //first bar
y = y + 0.5;
strokeWeight(5);
line(0, y, 600, y);
line(10, y, 600, y);
if (y > 600){
y = 0;}

//second bar
z = z + 0.5;
line (0, z, 600, z);
if (z > 600) {
z = 0;}

// third bar
a = a + 0.5;
line (0, a, 600, a);
if (a > 600) {
a = 0;}

// fourth bar
b = b + 0.5;
line (0, b, 600, b);
if (b > 600) {
b = 0;}

//fifth bar
c = c + 0.5;
line (0, c, 600, c);
if (c > 600) {
c = 0;}  
noStroke();   
popStyle();
  background(timer, 100, 100);
 

 
  timer +=direction;
  
 smooth();
fill(255, 20);
float scaleVal = 18.0;
float angleInc = PI/28.0;
float angle = 0.0;
for (int offset = -10; offset < width+10; offset += 5) {
  for (int y = 0; y <= height; y += 2) {
    float x = offset + (sin(angle) * scaleVal);
    noStroke();
    ellipse(x, y, 10, 10);
    stroke(317, 90, 93);
    point(x, y);
    angle += angleInc;
  }
  angle += PI;

}
   
 
 
 //creates flashing spheres
 
   fill(random(206), random(360), random(200));
   noStroke();
   ellipse(random(mouseX - 600, mouseX + 600), mouseY, random(70), 1400);
   ellipse(random(mouseX - 600, mouseX + 600), mouseY, random(70), 1400);
   ellipse(random(mouseX - 600, mouseX + 600), mouseY, random(70), 1400);
   ellipse(random(mouseX - 600, mouseX + 600), mouseY, random(70), 1400);
}
 
void mousePressed() {
colorMode(RGB);
  noStroke();
  fill(random(360), random(100), random(100));
  rect(random(600), random(600), random(200), random(200));
  rect(random(600), random(600), random(200), random(200));
  ellipse(random(600), random(600), 400, 50);
  ellipse(random(600), random(600), 50, 50);
  ellipse(random(600), random(600), 50, 50);
  ellipse(random(600), random(600), 50, 50);
  //triangle(random(600), random(600), random(600), random(600), random(600), random(600));
   
  quad(random(400), random(400), random(400), random(400), random(400), random(400),random(400), random(400));
  quad(random(200), random(200), random(200), random(200), random(200), random(200),random(200), random(200));
  quad(random(300), random(300), random(300), random(300), random(300), random(300),random(300), random(300));
 
}
