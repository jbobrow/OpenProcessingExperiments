
//ICE 22
//Copyright Miranda Jacoby 2014 All Rights Reserved

int [] x = {50, 150, 350, 75, 250, 200, 375};
int [] y = {50, 100,  75, 200, 250, 300, 350};

color [] colorList = 
{
color( 255, 0, 0),  
color( 0, 0, 255),  
color( 0, 255, 255 ),  
color( 0, 255, 0),  
color( 255,   0, 255),  
color( 255, 255, 0),  
color( 255, 255, 255),    
};

int diam = 20;

void setup()
{
  size(400, 400);
  noStroke();
  rectMode(CENTER);
}


void draw()
{
  drawSquares();
}

void drawSquares ()
{
  for (int i = 0; i < x.length; i++ )
  {
    diam++;
    designSquares(x[i], y[i], colorList[i]);
   }
   
}

void designSquares (int xpos, int ypos, color fill)
{
  fill(fill);
  rect(xpos, ypos, diam, diam);
}

void mouseClicked ()
{
  diam = 20;
}


