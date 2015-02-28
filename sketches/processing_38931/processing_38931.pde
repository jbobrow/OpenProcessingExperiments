
// Robot 3: Response from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

float x = 60;          // X-coordinate
float y = 440;         // Y-coordinate
int radius = 45;       // Head Radius
int bodyHeight = 160;  // Body Height
int neckHeight = 70;   // Neck Height


float easing = 0.1;

void setup() {
  size(700, 480);

  smooth();
  strokeWeight(2);
  ellipseMode(RADIUS);
}

void draw() {
  
  background(134,53,175);
  fill(255,0,30);
  noStroke();
  rect(40,300,300,80);
  fill(95,60,27);
  rect(30,230,40,150);
  fill(255);
  noStroke();
  rect (60,290,50,50);
  fill(0);
  rect(0,380,700,100);
  fill(194,184,198);
  rect(400,0,20,440);
  
  int targetX = mouseX;
  x += (targetX - x) * easing;
    
  if (mousePressed) {
    neckHeight = 16;
    bodyHeight = 90; 
  } else {
    neckHeight = 70;
    bodyHeight = 160; 
  }
  
  float ny = y - bodyHeight - neckHeight - radius;
  
  
  
  // Neck
  stroke(0,74,255);
  strokeWeight(4);
  line(x+12, y-bodyHeight, x+12, ny); 

  // Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);

  // Body
  noStroke();
  fill(83,136,255);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33);
  fill(0);
  ellipse(x+25,ny+150,30,30);
  ellipse(x-25,ny+150,30,30);
  
  

  // Head
  fill(255,230,0);
  ellipse(x+15,ny-20,60,60);
  fill(18,182,255);
  ellipse(x+12, ny, radius, radius); 
  fill(255,0,0);
  ellipse(x+15,ny+22,8,10);
  stroke(0);
  strokeWeight(3);
  line(x+5,ny+21,x+25,ny+21);
  line(x+12,ny-12,x+3,ny-22);
  line(x+28,ny-3,x+12,ny-30);
  line(x+30,ny-3,x+21,ny-34);
  line(x+26,ny,x+36,ny-32);
  line(x+26,ny+4,x+48,ny-22);
  fill(255);
  ellipse(x+24, ny-6, 14, 14);
  fill(0);
  ellipse(x+24, ny-6, 3, 3);
}
