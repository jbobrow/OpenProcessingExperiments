
float x, y;
float angle = 0; 
float r = 300;
float diff = 0.5; 

float colR = random(0,255);
float colG = random(0,255);
float colB = random(0,255);

float colR1 = random(0,255);
float colG1 = random(0,255);
float colB1 = random(0,255);

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  
  x = r * cos(angle); 
  y = r * sin(angle);
  


  strokeWeight(0.1); 
  stroke(colR,colG,colB,50); 
  noFill(); 
  rect(x+300,y+300,5,5);

  strokeWeight(0.1); 
  stroke(colR1,colG1,colB1,50); 
  noFill(); 
  rect(-1*x+300,-1*y+300,10,10);
  

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
