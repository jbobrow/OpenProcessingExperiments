
void setup(){
  size(250,250);
  background(255);
  fill(0,102);
  smooth();
  noStroke();
}

void draw(){
  fill(mouseX,mouseY,random(30,200),80);//colour will chnage depending on mouse position
ellipse(mouseX,mouseY,12,12);//when mouse moves circles appear
}

