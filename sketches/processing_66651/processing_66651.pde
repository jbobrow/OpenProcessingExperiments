
PFont f;

void setup(){
  smooth();
  noFill();
  size(500,500);
  background(0);
  f=loadFont("sansserif.vlw");

} 


void mouseDragged(){
  fill(0);
  ellipse(mouseX, mouseY, 25, 25);
}

void keyPressed()
{
  if( key >= 'A' && key <= 'z') {
   background(0);
  }
}
  

void draw(){  
  for(int i=10; i<= width; i+=10)
  {
   noFill();
   stroke(random(0, 100), random(0, 100), random(150, 255));
   ellipse(width/2,height/2, i,i);
  }
  



}


