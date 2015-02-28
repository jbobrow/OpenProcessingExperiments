
// Maria Gomez
// January 2009
// NMD 102 UMaine

// Colors
float r;
float g;
float b;
float a;
// Middle Circle
float x = 250;
float y = 10;
float z = 20; // Diameter of circles, squares
// Left Circle
float l = 100;
float t = 10;
// Right Circle
float d = 400;
float s = 10;
// Top left square
float n = 175;
float m = 5;
// Top right square
float o = 325;
float k = 5;
// Far top left square
float u = 25;
float c = 5;
// Far top right square
float p = 475;
float q = 5;
// Far bottom left square
float e = 25;
float f = 495;
// Bottom left square
float h = 175;
float i = 495;
// Bottom right square
float j = 325;
float v = 495;
// Far right square
float w = 475;
float ab = 495;
// Cursor line
float leng = 500;
float heig = 3;

float speed = 0;
float gravity = 0.1;

void setup() {
  size (500,500);
  background (255);
  smooth();
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  
  //Large square/background
  frameRate(80);
  rectMode(CORNER);
  noStroke();
  fill(r,b,g,a);
  rect(0,0,500,500);
  
  //Middle square
  rectMode(CENTER);
  noStroke();
  fill(r,g,b,a);
  rect(250,250,300,300);
  
  //Top left square
  rectMode(CENTER);
  noStroke();
  fill(g,r,a,b);
  rect(150,150,100,100);
  
  //Bottom right square
  rectMode(CENTER);
  noStroke();
  fill(a,b,g,r);
  rect(350,350,100,100);
  
  // First circle
  fill(r,b,a,g);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(x,y,z,z);
  
  //Second circle
  fill(r,b,g,a);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(l,t,z,z);
  
  //Third circle
  fill(r,g,a,b);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(d,s,z,z);
  
  // Top left square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(n,m,z,z);
  
  // Top right square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(o,k,z,z);
  
  // Far left square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(u,c,z,z);
  
  // Far right square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(p,q,z,z);
  
  // Far bottom left square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(e,f,z,z);
  
  // Bottom left square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(h,i,z,z);
  
  // Bottom right square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(j,v,z,z);
  
  // Far bottom right square
  fill(g,b,r,a);
  stroke(0);
  rectMode(CENTER);
  rect(w,ab,z,z);
  
  // Line following cursor
  fill(0);
  strokeWeight(1);
  line(0,mouseX,500,mouseY);
  
  //Mouse follow circle
  fill(a,r,g,b);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,50,50);
  
  if (mousePressed) {
    frameRate(20);
    println ("Click and hold down the mouse to lower the frame rate significantly");
  }

  // Add speed to location
  y = y + speed;
  t = t + speed;
  s = s + speed;
  
  // Add gravity to speed
  speed = speed + gravity;
  
  // When circles reaches the bottom reverse the speed
  if (y > height)
  if (t > height) 
  if (s > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
    speed = speed * -0.95;  
  }
  // The weight of the stroke is effected by the movement of the mouse
  stroke(0);
  strokeWeight(abs(pmouseX - mouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}


// When the cursor moves, it disappears from the screen
void mouseMoved() {
  noCursor();
}


// Some code credit and reference goes to processing.org and learningprocessing.org

