
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float x; float y;

void setup()
{
  size(800,600);
  background(0);
  smooth();
  colorMode(RGB,3,3,3);
  noCursor(); 
}

void draw()
{
  noStroke();
  fill(0,0.2);
  rect(0,0,width,height);
  
  // line to draw
  stroke(random(3),random(3),random(3));
  strokeWeight(30);
  line(mouseX,mouseY,x,y);
  
  // radnom coordinates within the sketch window
  x=random(width);
  y=random(height); 
}
