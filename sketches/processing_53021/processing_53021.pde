
int HSBanchor=0;
int timer= 0;

SpinningPolygon triangle_ = new SpinningPolygon(100, 150, 3, 60);  
SpinningPolygon square_ = new SpinningPolygon(100, 450, 4, 80);
SpinningPolygon pentagon_ = new SpinningPolygon(100, 750, 5, 100);
SpinningPolygon hexagon_ = new SpinningPolygon(100, 1050, 6, 120);


//  SpinningPolygon(int cX, int cY, int faces, int spin) 
void setup(){
 size(1200, 800); 
 background(255);
}


void draw(){
  timer++;
  colorMode(RGB, 255);
 noStroke();
 beginShape();
 fill(255, 50);
 vertex(0, 0);
 vertex(0, height);
 vertex(width, height);
 vertex(width, 0);
 endShape();

 
 colorMode(HSB, 100);
 HSBanchor = ((int)((float)mouseX/12));

 
 //triangle
 triangle_.setColor(HSBanchor);
 triangle_.display();
 
 //square
 square_.setColor((HSBanchor*4/3)%100);
 square_.display();
 
 //pentagon
 pentagon_.setColor((HSBanchor*5/3)%100);
 pentagon_.display();
 //hexagon
 hexagon_.setColor((HSBanchor*2)%100);
 hexagon_.display(); 
 
 
}

/*

totem of spinning shapes

have them rotate harmonically?

have them increase in faces

*/

class SpinningPolygon
{
  int SPcolor;
  int CenterX;
  int CenterY;
  int sides;
  float rotation;
  int SPradius = 10;
////////////////////////////////////////////////////////////////////////////////////  
  SpinningPolygon(int cX, int cY, int faces, float spin) 
  {
    
    CenterX = cX;
    CenterY = cY;
    sides = faces;
    rotation = spin;
    
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
    fill(SPcolor, 360, 360);
  pushMatrix();
    rotate(TWO_PI*((timer%rotation)/rotation));
    beginShape();
    for (int i=0; i < sides; i++)
    {  
     vertex(
      CenterX + (SPradius * cos(i * 2.0* PI/ sides)),
      CenterY + (SPradius * sin(i* 2.0* PI/ sides))
     );
    }
    endShape();
  popMatrix();
  }
////////////////////////////////////////////////////////////////////////////////////  
}



