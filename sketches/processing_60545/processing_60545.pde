
void setup () {
  size (400,400);
  
  rectMode (CENTER);

background (200);
}

void draw () {

if(mousePressed){
  ellipse (width/2, height/2, mouseX,mouseY);
}
}
