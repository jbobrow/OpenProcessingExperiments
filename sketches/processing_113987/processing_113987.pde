
int keyworkDistance = 80;

void setup()
{
  size(600, 600);
  background(255);
  stroke(0);
}


void draw()
{
  if(mouseX<.5* width)
  {
    background(255);
    stroke(0);
  }
  else
  {
    float edgedist = map(mouseX,.5*width,.75*width,0,255);
    stroke(random(0,edgedist),random(0,edgedist),random(0,edgedist)); 
  }
  
  float size = map(mouseX/10, 0, width, 1, 4.5);
  //float xPos;
  //float yPos;
  for (int x = -width/2; x<= width/size+100; x = x+keyworkDistance)
  {
    for (int y = -height/2; y<=height/size+100; y = y+keyworkDistance)
    {
      float xPos = x + random(mouseX/50);
      float yPos = y + random(mouseX/50);
      //float z = if(mouseX 
      keywork(xPos, yPos, size);

    }
  }
  
}


void keywork(float x, float y, float zoom)
{
  pushMatrix();
  translate(-width/2,-height/2);
  scale(zoom);
  translate(width/2,height/2);

  noFill();
  //strokeWeight(2);
  //stroke(r, g, b);
  ellipse(x, y, 10, 10);
  triangle(x, y-20, x-20, y+13, x+20, y+13);
  ellipse(x, y+25, 10, 10);
  ellipse(x-20, y-13, 10, 10);
  ellipse(x+20, y-13, 10, 10);
  ellipse(x, y-30, 35, 35);
  ellipse(x-22, y+13, 35, 35);
  ellipse(x+22, y+13, 35, 35);
  popMatrix();
}
