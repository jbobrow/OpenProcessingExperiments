
void setup () {
  size (400,400);
  
  rectMode (CENTER);

background (200);
}

void draw () {

if(mousePressed){
  fill (0);
  rect (mouseX, mouseY, 40,20);
  fill (255);
    rect (mouseX-40,mouseY+40,40,20);
  
}
}
