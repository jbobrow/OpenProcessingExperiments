
void setup(){
  
  size(400,400);
  background(255);
  
  smooth();
  
}

void draw(){
  
  if(mousePressed) {
  noStroke();
  fill(0);
  background(255);
  
  rect (125,25,150,300);
  
  
  float r;
  r = random(200);
  
  float s;
  s = random(135);
  
  stroke(255);
  fill(0);
  ellipse(200,100,s,s);
  ellipse(200,225,r,r);
  }
  else {
    
    noStroke();
  fill(0);
  background(255);
  
  rect (125,25,150,300);
   stroke(255);
  ellipse(200,100,75,75);
  ellipse(200,225,100,100);
  
  float f;
  f = random(40);
  
  float x;
  x = random(25);
  
  stroke(255);
  fill(0);
  ellipse(200,100,x,x);
  ellipse(200,225,f,f);
    
    
    
  }
  
}
