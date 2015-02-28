
void setup(){
  size(250,250);
  smooth();
  noStroke();
  background(#171B54);
}

void draw(){
  fill(#171B54,12);
  rect(0,0,width,height);
  fill(255);
  ellipse(mouseX,mouseY,50,50-random(49));
}

