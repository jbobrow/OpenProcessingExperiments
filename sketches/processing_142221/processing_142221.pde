
// David Mrugala
 
float angle;
 
void setup()
{
  size(600,600);
}
 
void draw()
{
  background(16,63,69);
  
  // rotation angle
  angle += 0.001;
 
  strokeWeight(23);
  stroke(16,63,69);
  fill(226,220,206);
  
  // move coordinate origin to center of sketch window
  translate(width/2,height/2);
  
  // number of scaled rectangles
  for (int i=0; i<80; i++){
    rotate(angle);
    scale(0.95);
    rectMode(CENTER);
    rect(0,0,400,400);
  }
}
