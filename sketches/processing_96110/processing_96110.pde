
void setup() {
  
  size (400,400);
  stroke(0);
  strokeWeight(10);
  ellipseMode(CENTER);
  }

void draw(){
  
  fill(0,0,0,5);
  rect(0,0,width,height);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(random(5,width),random(5,height),80,80);
  ellipse(random(5,width),random(5,height),40,40);
  rect(random(5,width),random(5,height),20,30);
  }
