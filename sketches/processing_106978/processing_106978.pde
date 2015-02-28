
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size (800, 800);
  background(0);
  smooth();
}

void draw() {
  //fil all variables with random values

  r= random(255);
  g =random (255);
  b= random(255);
  a = random(255);
  diam = random(20);
  x=random(width);
  y =random(height);
  
  r=r+random(10);
  diam=diam+(random(100));
  
 
 
  noStroke();
  fill(r, g, b, a);
  ellipse(x, y, diam, diam);
}

void mousePressed() {
  background(random(255), random(255), random(255));
  ellipse(x,y,x,y);
  rect(x-100,y-250,x,y);
  
}

void keyPressed(){
  rect(r,g,x,y);
  rect(x,y,x,y);
 
}



