
void setup (){
  size (600,600);
  background (128);
  smooth ();
  fill (255,255,0);
}

void draw (){
  background (1);
  
  arc(mouseX,mouseY,300,300,mouseX+6.3,mouseX+5.65);
  background (128);
  arc(mouseX+5,mouseY,300,300,mouseX+.47,mouseX+5.81);
  arc(mouseX+5,mouseY,300,300,mouseX+.63,mouseX+5.65);
}
  

