
boolean wait = false;

void setup()
{
  size(800, 800);
  smooth();
  background(220);
}

void draw()
{
  if(wait)
    return;
  
  int maxGreyscaleJitter =  constrain( mouseX, 0, 255);
  
  translate(width/2, height/2);
  rotate(radians(45));
  
 int resolution = 16;
 int rectHeight = floor(width * 0.6);
 int rectWidth = rectHeight;
 
 int span = rectWidth/resolution;
 int x = 0 - rectWidth/2;
 int y = span * floor (random(0, resolution)) - rectHeight/2;
 
 frameRate = 0.5;
 
 int jitter = floor( random(0, maxGreyscaleJitter));
 fill(0 + jitter, 0 + jitter, 0 + jitter);
  
 stroke(255);
 strokeWeight(4);
 
 rect(x, y, rectWidth, span );
 
 x = span * floor (random(0, resolution)) - rectWidth/2;
 y = 0 - rectHeight/2;
 
 rect(x, y, span, rectWidth );
}

void keyPressed()
{
  wait = !wait;
}
