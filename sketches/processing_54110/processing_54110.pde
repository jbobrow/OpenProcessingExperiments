
// click and drag out for solid circles
// drag back in for ringed circles

int x,y;

void setup(){
  size(800,400);
  smooth();
  background(255);
  noStroke();
}

void draw(){
  
}

void mousePressed(){
  x = mouseX;
  y = mouseY;
}

void mouseDragged(){
  float d = dist(mouseX,mouseY,x,y);
  fill(random(255),random(255),random(255));
  ellipse(x,y,d*2,d*2);
}
                                
