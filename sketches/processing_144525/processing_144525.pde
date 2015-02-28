
float tono;

void setup()
{
  size(700, 700);
  colorMode(HSB);
  background(255);
  frameRate(40);
  resetColor();
  
  
}

void draw()
{
  translate(mouseX,mouseY);
  
  rotate(frameCount/10.0);
  if(mousePressed) {
    noFill();
    stroke(tono, random(50,255), random(50,240), random(20,255));
    rect(0,0, random(width),random(height));
  }
}

void keyReleased()
{
  if (key=='d' || key=='D') {
    resetColor();
  }
}

void resetColor()
{ 
  tono = random(255);
  background(255);
}
