
float r = 0;
float backgroundR;
float backgroundG;
float backgroundB;
void setup() {
  size(500,500);
 
 backgroundR = random(0,100);
 backgroundG = random(0,100);
 backgroundB = random(0,100);
 
  rectMode(CENTER);
  
  noStroke();
  smooth();
}


void draw() {
  
fill(backgroundR,backgroundG,backgroundB,10);
 //also width/2 and height/2
 
  translate(250,250);
 rotate(r);
  rect(0,0, 150, 150);
  
  
  r= r + 0.02;
  
  
  
  
}

