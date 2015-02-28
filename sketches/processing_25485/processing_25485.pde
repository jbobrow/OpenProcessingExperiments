
void setup(){
  size(300,300);
  background(255);
  frameRate(30);
  smooth();
}

int t;

void draw(){
  strokeWeight(3);
  
  stroke(255);  
  fill(40,200,255);  
  ellipse(150 + 100*cos(t),150 + 100*sin(t),20,20);
  
  stroke(random(255),random(255),random(255));
  line(150 + 100*cos(t),150 + 100*sin(t),150,150);
  
  t = t + 6;
}

