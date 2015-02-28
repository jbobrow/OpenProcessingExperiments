
float counter = 0; 
void setup()
{
  size(400,400);
  background(255);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  
  translate(width/2, height/2);
  
  pushMatrix();
  background(0);
  noStroke();
   float h = map(sin(counter), -1, 10, 60, 360);
   fill(2, 70, h);
  popMatrix();
  
  pushMatrix();
  translate(cos(counter)*50, sin(counter)*50); //*100 --> Schrittweite/Länge der ellipse
  ellipse(0,0,300,300);
  popMatrix();
  
  counter -= 0.3; 

}
