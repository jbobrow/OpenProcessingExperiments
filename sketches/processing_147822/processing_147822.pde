
void setup()
{
  size(200,100);
  rectMode(CORNERS);
}

void draw()
{
  background(204);
  stroke(0);
  fill(255);
  rect(50,10,150,90);
  
  stroke(color(255,0,0));
  line(mouseX, 10,mouseX,90);
  
  float fraction = norm(mouseX,50,150);
  fill(0);
  text(nfc(fraction,3), width/2,height/2);
}



