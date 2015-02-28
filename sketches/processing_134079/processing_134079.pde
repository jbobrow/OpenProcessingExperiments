
float a = 1;
void setup () {
  size (500,500);
  background (149, 255, 252) ;
}

void draw () {
  ellipse (mouseX, mouseY,width/4, height/4);
  fill (random(0,100)); 
  noStroke ();
  ellipse (mouseX, mouseY,width/8, height/8);
  fill (random(0,100)); 
  noStroke ();
  
}
