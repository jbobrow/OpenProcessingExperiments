
int HSBanchor=0;
int timer=0;
int virtualX=400; 
int virtualY=80;
SpinningPolygon poly = new SpinningPolygon(200, 200, 2, 0);

void setup()
{
  size(400, 400);
  background(0);
  smooth();
}

void draw()
{
  virtualX = (int)map((virtualX + random(-1, 1)), 0, 800, 0, 800);
  virtualY = (int)map((virtualY + random(-4, 4)), 0, 800, 0, 800);
  
  
  
  timer++;
  colorMode(RGB, 255);
  noStroke();
  background(55);
  /*
  beginShape();
  fill(255);
  vertex(0, 0);
  vertex(0, height);
  vertex(width, height);
  vertex(width, 0);
  endShape();
  */
  colorMode(HSB, 100);
  HSBanchor = ((int)((float)mouseX/12));
  
  poly.setColor(HSBanchor);
  poly.setFaces(mouseY/40);
  poly.setSpin(mouseY);
  poly.display();
  
}


class SpinningPolygon
{
  int SPcolor;
  int CenterX;
  int CenterY;
  int sides;
  float rotation;
  int SPradius = 15;
////////////////////////////////////////////////////////////////////////////////////  
  SpinningPolygon(int cX, int cY, int faces, float spin) 
  {
    
    CenterX = cX;
    CenterY = cY;
    sides = faces;
    rotation = spin;
    
  }
  
  void setSpin(int s)
  {
    rotation = s;
  }
  
  void setFaces(int f)
  {
    sides = f;
  }  
  
  void setPos (int cX, int cY)
  {
    CenterX = cX;
    CenterY = cY;
  }
////////////////////////////////////////////////////////////////////////////////////  
 void setColor(int clr)
  {
    SPcolor = clr;
  }
////////////////////////////////////////////////////////////////////////////////////
  void display()
  {
    stroke(SPcolor, 360, 360);
    fill(SPcolor, 360, 360);
    if(sides == 1)
    {
      point(CenterX, CenterY);
    }
    stroke(SPcolor, 360, 360);
    fill(SPcolor, 360, 360);
pushMatrix();
 translate(CenterX, CenterY);
  pushMatrix();
    rotate(TWO_PI*((timer%rotation)/rotation));
    beginShape();
    for (int i=0; i < sides; i++)
    {  
     vertex(
      (SPradius * cos(i * 2.0* PI/ sides)),
      (SPradius * sin(i* 2.0* PI/ sides))
     );
    }
    endShape();
  popMatrix();
popMatrix();  
  }
////////////////////////////////////////////////////////////////////////////////////  
}



