
//Homework 8
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)

int y, yspacing, phase;


void setup ( )
{
size (400, 400);
background (0);
  
y = 5;
yspacing = 20;

smooth ( );
}

void draw ( )
{
  if (phase == 0)
  {
   fill (random(255), random(255), random(255));
   whileloop ( );
   y = (y + yspacing) % height;
  } 
  
  else if (phase == 1)
  {
   forloop ( ); 
  }
}



void whileloop ( )
{
  int x = 5;
  int diam = 10;
  int spacing = 20;
  
  while (x<=width)
  {
   ellipse (x++, y, diam, diam);
   x = x + spacing;
  }
}

void forloop ( )
{
  background (220, 90, 90);
  for (int x = width/4; x <= width *.75; x += 20)
  {
   rect (x, 0, x, height, width*.75, 0, width *.75, height); 
  }
    for (int x = width/4; x <= width *.75; x += 15)
  {
   line (x, 0, x, height); 
}
}


void keyPressed ( )
{
 if (key == '1')
{
 phase = 0;
 redraw ( );
} else if (key == '2')
{
 phase = 1; 
 redraw ( );
}
}

