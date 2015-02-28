
boolean button = false;

float d;
float e;
float r;
float g;
float b;

void setup() {
  size(800,600); 
  frameRate(8);
  smooth();
}

void draw() {
  d= random(600);
  e= random(600);
  r= random(255);
  g= random(255);
  b= random(255);
  
  if (button) {
    background(0);
    noStroke();
    fill(r,g,b);  
    triangle(0,e,mouseX,mouseY,0,d);
    stroke(255);
  line(800,mouseY,mouseX,mouseY);
  fill(255,99);
   noStroke();
  quad(mouseX+35,mouseY-60,mouseX-35,mouseY+65,mouseX+100,mouseY+65,mouseX+105,mouseY+65);
  
} else {
    background(0);
    noStroke();
    fill(255); 
    triangle(0,100,mouseX,mouseY,0,500);
    stroke(255);
  line(800,mouseY,mouseX,mouseY);
    fill(255,99);
     noStroke();
    quad(mouseX+35,mouseY-60,mouseX-35,mouseY+65,mouseX+100,mouseY+65,mouseX+105,mouseY+65);
  }
  
}


void mousePressed() {
  if (mouseX < 800 && mouseY <600) {
    button = !button;
  }  
}                
                
