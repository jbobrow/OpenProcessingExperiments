
float x = 200;          // X-coordinate
float y = 350;         // Y-coordinate
int radius = 45;       // Head Radius
int bodyHeight = 160;  // Body Height
int neckHeight = 70;   // Neck Height
 
float easing = 0.050;


 
void setup() {
  size(700, 400);
  background(97, 218, 247);
  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}
 
void draw() {
   
  int targetX = mouseX;
  x += (targetX - x) * easing;
     
  if (mousePressed) {
    neckHeight = 100;
    bodyHeight = 90;
  } else {
    neckHeight = 70;
    bodyHeight = 20;
  }
   
  float ny = y - bodyHeight - neckHeight - radius;
   fill (97, 218, 247);
   rect(0,0,700,180);
    fill(40,245,22);
  noStroke();
  rect(0,180,700,400);
  fill(245,218,7); 
  ellipse(25,25,40,40);
fill(255,0,0);
rect(70,120,90,60);
triangle(50,120,115,80,180,120);
fill(121,67,13);
stroke(0);
rect(100,129,30,50);
noStroke();
rect(20,129,15,50);
fill(57,242,34);
ellipse(25,125,25,25);
ellipse(12,115,25,25);
ellipse(39,115,25,25);
ellipse(25,100,25,25);
fill(255);
ellipse(152,25,30,30);
ellipse(140,32,40,30);
ellipse(168,32,40,30);
ellipse(152,39,30,30);
   
  // Neck
  stroke(102);
  line(x+12, y-bodyHeight, x+12, ny);
 
  // Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
 
  // Body
  noStroke();
  fill(245, 233, 7);
  ellipse(x, y-33, 33, 33);
  fill(245, 233, 7);
  rect(x-60, y-bodyHeight, 90, bodyHeight-33);
 
  // Head
  fill(245, 233, 7);
  ellipse(x+10, ny, radius, radius);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
  fill(245, 233, 7);
}
          
                
