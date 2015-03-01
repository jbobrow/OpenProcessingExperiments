
void setup(){
  size(600,600);
  background(0);
  fill(255);
  stroke(172);
fill(122);
smooth();
}

void draw(){
  colorMode(HSB);
  frameRate(20);
ellipse(mouseX,300,300,mouseY);
noFill();
stroke(255/2);
ellipse(mouseY/2,300,300,mouseX/2);
stroke(155);
}
