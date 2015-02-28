

float radius ;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(800,600);
  PImage b;
b = loadImage("map1.jpg");
background(b);
  smooth(); 
  noCursor();
}

void draw() {
  r = random(205);
  g = random(255);
  b = random(225);
  a = random(185);
  radius = random(800);
  x = random(width);
  y = random(height);
  

  noStroke(); 
  fill(172,222,230);
    quad(mouseX,mouseY,100,100,100,100,100,100);
      fill(r,g,b,a);

  ellipse(mouseX,mouseY,50,50);
 
}

void mouseDragged() {
  radius = random(0,200);
  
  stroke(0,175,216);
  strokeWeight(2);
  ellipseMode(CENTER) ;
  ellipse(mouseX,mouseY,radius,radius);

}
void mouseClicked() {
  
PImage b;
b = loadImage("map1.jpg");
}




