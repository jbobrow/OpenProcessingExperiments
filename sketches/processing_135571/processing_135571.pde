

void setup() {
  size (300, 300);
   frameRate(10);
  noCursor();
  
 }
 
void draw() {
  background (2,67,31); 
  fill(2,random(67,76),31);
  stroke (255,205,0);
  strokeWeight (random(2,3.5));
  ellipse (width/2,height/2,width/2.2,height/2.2);

  }
