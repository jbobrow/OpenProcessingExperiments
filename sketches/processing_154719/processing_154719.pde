
void setup(){
  size(400,400);
  background(0);
  rectMode(CENTER);
  smooth();
  frameRate(60);
}

float count = 0;
float rotation = 0;

void draw(){
  
  translate(width/2, height/2);
  fill(0,80);
  noStroke();
  rect(0,0,width, height);
  
  pushMatrix();
  rotate(rotation);
  float x = cos(count) * width/4;
  float y = sin(count) * height/4;
  noFill();
  stroke(255,255,255);
  strokeWeight(abs(x/4)); 
  ellipse(x,y,abs(x),abs(x));
  popMatrix();

  rotation+=0.03*abs(x);
  count+=0.01;
}

