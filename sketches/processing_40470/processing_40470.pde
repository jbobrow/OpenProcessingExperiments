
//Homework 8
//Copyright John Swanson October 2011

PImage v;
PImage f1;
PImage f2;
PImage f3;
float angle, deltX, deltY, x, y, dia, r;
void setup()
{
  size(500, 500);
  background(255);
  v = loadImage( "Dino1.png");
  f1 = loadImage( "1.png");
  f2 = loadImage("2.png");
  f3 = loadImage("3.png");
  imageMode(CENTER);
  smooth();
  x=0;
  y=0;
  deltX=0;
  deltY=0;
  dia=50;
 
}
void draw()
{
  background( 255 );
  movedino();
  r = random(4);
  float a = atan2(deltX, deltY);
  pushMatrix();
    translate(x,y);
    rotate(-a);
    image( v, 0, 0, dia, dia );
    if (keyPressed)
    {
      if (key=='f')
      { 
        if (r<=1)
        {
          image(f1, 0, dia, dia/2, dia );
        } 
        else if(r<=2 && r>1) 
        {
          image(f2,0,dia,dia/2,dia);
        }
        else
        {
          image(f3,0,dia,dia/2,dia);
        }
      }  
    }
  popMatrix();
}

void movedino()
{
  x=x+deltX;
 if (keyPressed==true && keyCode==RIGHT)
  {deltX= deltX+.1;} 
 if (keyPressed==true && keyCode==LEFT)
  {deltX= deltX-.1;} 
  y=y+deltY;
 if (keyPressed==true && keyCode==DOWN)
  {deltY= deltY+.1;} 
 if (keyPressed==true && keyCode==UP)
  {deltY= deltY-.1;} 
 
 if(x > width + dia/2)
  {x = -dia/2;}
 if(x < -dia/2)
  {x =width + dia/2;}
 if(y < -dia/2)
  {y = height + dia/2;}
 if(y > height + dia/2)
  {y = -dia/2;}
 if (keyPressed==true && key==' ')
  {deltX=0; deltY=0;} 
}

