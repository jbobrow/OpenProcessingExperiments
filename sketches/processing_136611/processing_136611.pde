
void setup(){
  size(600,400);
  background(108,196,227,random(100,255));
  frameRate(30);
}

void draw(){
  strokeWeight(0.9);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  fill(160,19,11);
  rect(0,0,width/6,height);
  fill(160,19,11);
  rect(500,0,width/6,height);
  noStroke();
  fill(255,random(0,100));
  ellipse(random(width),random(height),10,10);
 
}

void mousePressed(){
  background(108,196,227,random(100,255));
  stroke(0);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  fill(160,19,11);
  rect(0,0,width/6,height);
  fill(160,19,11);
  rect(500,0,width/6,height);
  
}
