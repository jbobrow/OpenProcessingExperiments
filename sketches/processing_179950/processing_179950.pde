
int col;
Hexagon[] hexagonArray;

void setup()
{
  size(650,600);
  background(0);
  noFill();
  
  hexagonArray = new Hexagon[42];
  
  
  float y = 75;
  float x = 87;
  int offset = 0;
  for (int c = 0; c < 7; c++)
  {
      for (int i = 1; i <= 6; i++)
        {
          if(c%2 > 0)
          {
            offset = 43; 
          } else {
            offset = 0; 
          }
          
          int arrayPos = i + (c*6) - 1;
               
          hexagonArray[arrayPos] = new Hexagon((x*i)+offset, y*(c+1));
      }
          
  }
  
}

void draw() 
{
  background(0);

  for (Hexagon hexagon : hexagonArray)
  {
     hexagon.drawHexagon(); 
  }
  
}
class Hexagon{
PVector pos;
float colour;

Hexagon(float x, float y)
{
  pos = new PVector(x,y);
}

void calcColour()
{
  PVector mouse = new PVector(mouseX, mouseY);
  colour = PVector.dist(pos,mouse);
  colour = colour*1.3;
  colour = constrain(colour,0,200);

}

void drawHexagon()
{   
  calcColour();
  colorMode(HSB, 360,100,255);
  stroke(178,100,255-colour);
  
  
  //Code for drawing a hexagon from Tiago Martins
  //http://www.openprocessing.org/sketch/117535 
  
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(PI/6.0);
  beginShape();
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    float angle = PI*i/3;
    vertex(cos(angle) * 50, sin(angle) * 50);
    popMatrix();
  }
  endShape(CLOSE);
  popMatrix();

}

}

