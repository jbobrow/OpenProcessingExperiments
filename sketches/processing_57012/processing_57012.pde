
void setup(){
  size(1920,1080);
  background(0);
  
  frameRate(20);
}

void draw(){
  fill(random(255), random(255), random(255),random(255));
  smooth();
  strokeWeight(5);
  stroke(random(255),random(255),random(255));
  ellipse(random(1500),random(600),random(500-1000),random(500-1000));
  
  fill(random(255));
  strokeWeight(5);
  stroke(random(255),random(255));
  line(0,0,random(1920),random(1080));
  
  line(random(1920),random(1080),1920,1080);
  
}

