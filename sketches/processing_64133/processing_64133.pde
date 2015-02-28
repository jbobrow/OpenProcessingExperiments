
void setup(){
  size(600,600);
  smooth();
  noStroke();
  background(0);
}

void draw(){
  fill(0, 3);
  rect(0,0, width,height);
  
  
  float ra = random(TWO_PI);
  float rr = random(75, 130);
  
  noStroke();
  fill(255);
  
  float x = width/2 +  cos(ra) * rr;
  float y = height/2+  sin(ra) * rr;
  ellipse(x, y, 5,5);
}

