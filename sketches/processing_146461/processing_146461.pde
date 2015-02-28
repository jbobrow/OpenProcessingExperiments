

float [ ] x ={50, 200, 90, 300, 70, 380, 250 };
float [ ] y = { 50, 20, 100, 380, 60, 300, 80 };
float dimension=0;
color [ ] col = {
                color( 255, 0, 0 ),
                color( 0, 255, 0 ),
                color( 0, 0, 200 ),
                color( 200, 200, 0 ),
                color( 200, 0, 200 ),
                color( 0, 200, 200 ),
                color( 100 )
                };
void setup() 
{
background(0);
size(400,400);
rectMode( CENTER);
frameRate(30);

}

void draw()
{

drawFigures();
dimension++;
}

void drawFigures()
{
  for (int i=0; i< col.length; i++)
  {
    noFill();
    stroke(col[i]);
    rect (x[i],y[i],dimension, dimension);
  }

}

void mousePressed()
{
if (mouseButton==LEFT)
{
background(0);
dimension = 0;


}
}



