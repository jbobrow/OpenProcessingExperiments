
float r; 
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(500,500);
  background(25);
  smooth();    
  noCursor();
}

void draw() {
 
  r = random(232);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(205);
  x = random(width);
  y = random(height);


  noStroke(); 
  
  stroke(0);
  line(mouseX,mouseY,34,265);
  fill(255);
  quad(46,65,35,23,23,43,98,43);
  fill(r,g,b,a);
   stroke(34);
  line(mouseX,mouseY,width/6,height/5);
  fill(255);
  quad(46,65,35,23,23,43,mouseX,43);
  fill(r,g,b,a);
  bezier(mouseX,mouseY,10,10,100,mouseX,34,54);
   ellipse(mouseX,mouseY,45,23);
   arc(mouseX,56,56,98,89,56);
}



