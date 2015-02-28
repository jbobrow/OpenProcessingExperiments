
int c = 0;

void setup (){
  size(400,400);
  background(255, 20);
}

void draw(){
  fill(250,50,50);
if (mousePressed){
  ellipse(mouseX, mouseY, c, c);
  c = c + 2;
}
if (c > width){
  c = 0;
}
}

void mouseReleased(){
  c = 0;
}
