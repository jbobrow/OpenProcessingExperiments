
// homework 4
// copyright John Swanson September 2011, Pittsburgh, PA 15221
int x;
int y;
int wd;
int ht;
int wt;
color col1, col2, col3;
void setup()
{
  size( 400, 400);
  noFill();
  smooth();
  ellipseMode(CORNER);
  x = 50;
  y = 150;
  wd = 100;
  ht = 100;
  wt = 10;
  col1 = color( 0, 0, 0);
  col2 = color( 0, 0, 0);
  col3 = color( 0, 0, 0);
}
void draw()
{
  fill( 0, 0, 0, 20);
  noStroke();
  rect( 0, 0, WIDTH, HEIGHT);
  
  //J
 stroke(col1);
 strokeWeight(wt);
arc( x, y+.5*ht, 
    wd, ht, 
    0, PI);
beginShape();
  vertex( x+wd, y+ht);
  vertex( x+wd, y);
  vertex( x+0.5*wd, y+0.25*ht);
endShape();
//T
stroke(col2);
beginShape();
  vertex( x+1.25*wd, y-0.125*ht);
  vertex( x+2.25*wd, y-0.625*ht);
endShape();
beginShape();
  vertex( x+1.75*wd, y-0.375*ht);
  vertex( x+1.75*wd, y+0.875*ht);
endShape();
//S
stroke(col3);
arc( x+2.5*wd, y-0.75*ht, 
     0.5*wd, 0.625*ht,
     PI/2, TWO_PI);
arc( x+2.5*wd, y-0.125*ht, 
     0.5*wd, 0.625*ht,
     TWO_PI-PI/2, TWO_PI);
arc( x+2.5*wd, y-0.125*ht, 
     0.5*wd, 0.625*ht,
     0, PI);
rect(0,0, width, height);
}

void keyPressed()
{
  if (key == 'j')
  {
    col1 = color(random(256), random(256), random(256));
  }
  else 
  {
    col1 = color(255, 0, 0);
  }
  if (key == 't')
  {
    col2 = color(random(256), random(256), random(256));
  }
  else
  {
   col2 = color(255, 255, 255); 
  }
  if (key == 's')
  {
    col3 = color(random(256), random(256), random(256));;
  }
  else
  {
   col3 = color(0, 0, 255); 
  }
  if (keyCode == UP)
  {
   ht = ht + 10; 
  }
  if (keyCode == DOWN)
  {
   ht = ht - 10;
  }
  if (key == 'w')
  {
    wd = wd + 10;
  }
  if (key == 'c')
  {
    wt = wt + 1;
  }
  if (key == ' ')
  {
   wt = 10;
   wd = 100;
   x = 50;
   y = 150;
   ht = 100;
   }
}
void mouseDragged ()
{
  x = mouseX -150;
  y = mouseY -50;
}
                
                
