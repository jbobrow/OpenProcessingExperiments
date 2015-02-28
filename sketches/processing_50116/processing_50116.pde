
//Sara Humel hmwk3 (1)
//copyright 2012


void setup( ) {
  size(400,400);
  background(0,0,0);
  
}

void draw( ) {
  fill(0,0,0);
  stroke(255,255,255);
  line(width-width,width-width,mouseX,mouseY);
  line(width-width,width,mouseX,mouseY);
  stroke(0,0,0);
  line(width,width-width,mouseX,mouseY);
  line(width,width,mouseX,mouseY);
}               
                                                                
