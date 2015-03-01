
void setup()
{
  size(600,600);
  background(0);
  frameRate(100);
}

void draw()
{
  
  beginShape();
  noFill();
  if(keyPressed)
  {
    float x = random(0, width);
    float y = random(0, height);
    vertex(width/2,height/2);
    curveVertex(width/2, height/2);
    curveVertex(x,y);
    curveVertex(x, random(600));
    curveVertex(random(0,600), random(600));
    curveVertex(random(0,600), random(600));
    stroke(random(255),random(255),random(0,255), random(255 ));
    strokeWeight(1);
    endShape();
  }     
  else
  {
    background(0);
  }
}
