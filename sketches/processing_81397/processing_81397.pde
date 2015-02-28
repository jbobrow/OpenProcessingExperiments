
PImage bg;

void setup(){
  size(600,540);
  smooth();
  noStroke();
  bg = loadImage("bg.JPG");
  image(bg,0,0,width,height);
}

void draw() {
}

void mouseClicked () {
  ellipse (mouseX,mouseY,13,13);
}
  
void keyPressed() {
  if (key =='z') {
    fill(#C61A1A);
  }
  if (key =='x') {
    fill(#32AD23);
  }
  if (key =='c') {
    fill(#E35B07);
  }
  if (key =='v') {
    fill(#E3CD07);
  }
   if (key =='b') {
    fill(#39261B);
  }
}
  
  
   


