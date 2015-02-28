
float[] xpos;
float[] ypos;
float[] rotations;

void setup()
{
  size(500,500);
  smooth();
  xpos = new float[50];
  ypos = new float[50];
  rotations = new float[50];

  for(int i=0; i<xpos.length; i++)
  {
    xpos[i] = random(width);
    ypos[i] = random(height);
    //rotations[i] = random(400, 600) * random(-1,1);
    rotations[i] = random(PI);
  }
}
void draw()
{
  println(xpos);
  
  for(int i=0; i<xpos.length; i++)
  {
    
    smileyFace(xpos[i],ypos[i], rotations[i]);
  }
}

void smileyFace(float x, float y, float r)
{
  pushMatrix();
  translate(x,y);
  rotate(sin(millis()/(r*150.0))*r);
  ellipse(0,0, 50,50);
  ellipse(-10,-10, 7,7);
  ellipse(10,-10, 5,5);
  arc(0,0,30,30, radians(25), radians(135));
  popMatrix();
}


