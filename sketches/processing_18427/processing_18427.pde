
void setup (){
  size (300, 300);
  smooth ();
}

float x = 120;

void draw (){
  
  background (255);
  
  stroke(100);
  
  fill (250, 0, 9);
  ellipse (x, height/2, 50, 50);
  
  fill (234, 218, 28);
  ellipse (x+50, height/2, 50, 50);
  
  fill (0, 0, 250);
  ellipse (x*2, height/2, 50, 50);
  
  fill (0, 250, 0);
  ellipse (width-x, height/2, 50, 50);
  
  fill (255, 134, 13);
  ellipse (x/2, height/2, 50, 50);
  
  fill (255, 13, 211);
  ellipse (mouseX, height/2, 50, 50);
  
  
  
}
  



