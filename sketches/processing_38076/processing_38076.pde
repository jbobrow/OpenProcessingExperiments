
//homework 6
//copyright Jessica Schafer, Sept. 2011, pittsburgh, pa
//use While loop to draw initials in a circle, increasing in 
//size around circle, able to move formation out & in 

float x, y, x2, y2, rad, dim, ang, alph, j;
//x, y: center of circle
//x2, y2: location of drawn initials
//rad: radius of large circle (x,y) initials are drawn around
//dim: diameter of drawn initals
//ang: angle of circle where initials are drawn
//alph: transparancy of initials
//j: stand in variable for diameter of drawn initials, allow for user input

void setup ()
{
  size (400,400);
  smooth (); 
  //some variables initalized up here so buttons can modify w/o draw loop resetting each time
  rad = 100; 
  j = 20;
}

void draw ()
{
  background (255,250,162);
  x = width/2;
  y = height/2;
  dim = j;
  ang = 0;
  alph = 10;
 
  while (ang <= 315)
  {
    x2 = x + rad*cos(radians(ang));
    y2 = y + rad*sin(radians(ang));
    myInts(x2, y2, dim, alph);
    ang = ang + 45;
    dim = dim + 30;
    alph = alph + 30; 
  }
  
 //saveFrame ("hw6.jpg"); 
}

void keyPressed()
{
  if (keyCode == UP)
    {
     rad = rad + 10;
    }
  if (keyCode == DOWN)
    {
     rad = rad - 10; 
    } 
  if (keyCode == RIGHT)
    {
      j = j + 5;
    }
  if (keyCode == LEFT && j > 0)
    {
      j = j - 5;
    }
}

void myInts (float x, float y, float d, float a)
{
//CIRCLE
  noStroke();
  fill(217,0,94, a);
  ellipse (x, y, d, d);
  noFill();

//HIGHLIGHT
  strokeWeight (.05*d);
  //S highlight
  stroke (255,213,107, a); 
  beginShape();
  //first anchor point
  vertex (x+.35*d, y-.15*d);
  //beziers (control, control, anchor);
    bezierVertex (x+.425*d, y-.4*d,  x, y-.4*d,  x, y-.2*d);
    bezierVertex (x,y, x+.4*d,y, x+.4*d, y+.2*d);
    bezierVertex (x+.4*d, y+.4*d, x-.025*d, y+.4*d, x+.05*d, y+.15*d);
  endShape();
  //J highlight
  beginShape();
    vertex (x-.35*d, y-.15*d);
    bezierVertex (x-.365*d, y-.275*d, x-.15*d, y-.375*d, x-.15*d, y-.32*d);
    vertex (x-.05*d, y+.2*d);
    bezierVertex (x-.05*d, y+.4*d, x-.45*d, y+.4*d, x-.4*d, y+.15*d);
  endShape();
  //H highlight
  beginShape();
    vertex (x-.02*d, y-.05*d);
    bezierVertex (x-.05*d, y-.04*d, x-.05*d, y+.04*d, x-.02*d, y+.05*d);
  endShape();
  beginShape();
    vertex (x+.025*d, y-.05*d);
    bezierVertex (x+.055*d, y-.04*d, x+.055*d, y+.04*d, x+.025*d, y+.05*d);
  endShape();
  line (x-.03*d, y, x+.03*d, y);
//MAIN LETTERS
  strokeWeight (.025*d);
  //S
  stroke (255,105,79, a); 
  beginShape();
  //first anchor point
  vertex (x+.35*d, y-.15*d);
  //beziers (control, control, anchor);
    bezierVertex (x+.425*d, y-.4*d,  x, y-.4*d,  x, y-.2*d);
    bezierVertex (x,y, x+.4*d,y, x+.4*d, y+.2*d);
    bezierVertex (x+.4*d, y+.4*d, x-.025*d, y+.4*d, x+.05*d, y+.15*d);
  endShape();
  //J
  beginShape();
    vertex (x-.35*d, y-.15*d);
    bezierVertex (x-.365*d, y-.275*d, x-.15*d, y-.375*d, x-.15*d, y-.32*d);
    vertex (x-.05*d, y+.2*d);
    bezierVertex (x-.05*d, y+.4*d, x-.45*d, y+.4*d, x-.4*d, y+.15*d);
  endShape();
  //H
  beginShape();
    vertex (x-.02*d, y-.05*d);
    bezierVertex (x-.05*d, y-.04*d, x-.05*d, y+.04*d, x-.02*d, y+.05*d);
  endShape();
  beginShape();
    vertex (x+.025*d, y-.05*d);
    bezierVertex (x+.055*d, y-.04*d, x+.055*d, y+.04*d, x+.025*d, y+.05*d);
  endShape();
  line (x-.03*d, y, x+.03*d, y);
}              
