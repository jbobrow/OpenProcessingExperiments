
void setup()
{
  size(800,800);
  background(0);
  smooth();
  //begin hexagon
  drawHex(400, 400, 350);
  drawQuad(400, 400, 350);
  drawTri(400,400,200);
//  drawPattern(x,x,x);
}

void drawHex(float x, float y, float radius)
{
  fill(255,255,255);
  float theta =0.0;
  beginShape();
  for(int i = 0; i<6; i++)
  {
    float ptX = x + cos(theta)*radius;
    float ptY = y+ sin(theta)*radius;
    vertex(ptX,ptY);
    theta += TWO_PI/6;
  }
  endShape();
}

void drawQuad(float x, float y, float radius)
{
  fill(0);
  float theta=0.0;
  for(int i = 0; i<6; i++)
  {
    beginShape();
    int foo = 20;
    
    float ptX = x;
    float ptY = y;
    vertex (ptX,ptY);
    theta -= TWO_PI/foo;
    
    ptX = x + cos(theta)*radius/3;
    ptY = y+ sin(theta)*radius/3;
    vertex(ptX,ptY);
    theta +=TWO_PI/foo;
    
    ptX = x + cos(theta)*radius;
    ptY = y + sin(theta)*radius;    
    vertex (ptX,ptY);
    theta += TWO_PI/foo;
    
    ptX = x + cos(theta)*radius/3;
    ptY = y+ sin(theta)*radius/3;
    vertex(ptX,ptY);
    theta -= TWO_PI/foo;
    
    theta += TWO_PI/6;
    
    endShape();
  }
}

void drawTri(float x, float y, float radius)
{
  fill(0);
  float theta = 0.0;
  theta += TWO_PI/4;
  float triTheta = 0.0 + (TWO_PI/4)*3;
  for(int i = 0; i<6; i++)
  {
    float cX = x + cos(theta)*radius;
    float cY = y + sin(theta)*radius;
    beginShape();

    for(int j = 0; j <3; j++)
    {

      float ptX = cX + cos(triTheta)*25;
      float ptY = cY + sin(triTheta)*25;
      vertex(ptX, ptY);

      triTheta += TWO_PI/3;
    }

    theta += TWO_PI/6;
    triTheta += TWO_PI/6;  

    endShape();
  }
}
/*
*void drawPattern(int geom, float sz, int count)
{
  for (int i=0; i<count; i+=1)
  {
    int geomPicker = int(random(1,geom));
    if(geomPicker == 1) {
      rect(random(50, width-50), random(50, height-50), sz, sz);
    }

    if(geomPicker == 2) 
    {
      ellipse(random(50, width-50), random(50, height-50), sz, sz);
    }

    if(geomPicker == 3) 
    {
      drawTriangle(random(50, width-50), random(50, height-50), sz/2);
      drawTriangle2(random(50, width-50), random(50, height-50), sz/2, random(TWO_PI));
    }
  }
}

void drawTriangle2(float x, float y, float radius, float initRot)
{
  // local variables
  float theta = initRot;
  float ptX = 0.0;
  float ptY = 0.0;
  // used to draw in Processing
  beginShape();
  for (int i=0; i<5; i++)
  {
    ptX = x + cos(theta)*radius;
    ptY = y + sin(theta)*radius;
    vertex(ptX, ptY);
    theta += TWO_PI/3;
  }
  endShape(CLOSE);
}
*/

