
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
  
fill(backgroundR,backgroundG,backgroundB,50);
 
 
 //also (width/2,height/2,width,height)
 rect(0,0,2*width,2*height);
 //also width/2 and height/2
 fill(255);
  translate(mouseX,mouseY);
 rotate(r);
  rect(0,0, 150, 150);
  
  
  r= r + 0.03;
  
  
  
  
}

