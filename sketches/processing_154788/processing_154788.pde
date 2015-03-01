
void setup() {
  size(600, 200);
  smooth();
 
  frameRate (30);
}
 
 
void draw()
{
  background(#57385c);
  
  stroke (255);
  strokeWeight (3);
  
  noFill();
  ellipse (90,100, 100,100);
  
  fill (255);
  ellipse (160,100, 100,100);
  
  fill (40, 80);
  ellipse (230,100, 100,100);
  
  fill (255,237,188);
  ellipse (300,100, 100,100);
  
  fill (167,82,101);
  ellipse (370,100, 100,100);
  
  fill (#FEBE7E);
  ellipse (440,100, 100,100);
  
  fill (#FEBE7E, 120);
  ellipse (510,100, 100,100);
  
 }
