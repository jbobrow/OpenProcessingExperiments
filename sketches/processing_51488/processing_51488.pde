
//Homework #6 :: 51-257 Sec A :: Michael Loffredo :: mlloffre 
//copyright michael loffredo 2012 

//Press and hold any key to make the background and my initials rapidly change color

float ix, iy, id, ixSpeed, iySpeed; 
float bx, by, bd, bxSpeed, bySpeed;


color c;
color b;

void setup()
{
 size (400, 400);
 smooth ();
 background (b); 
 frameRate (30);
 ix = 0;
 iy = random (height);
 id = 100;
 ixSpeed = 6; 
 iySpeed = 6;
 
 bx = 0;
 by = random (height);
 bd = 100; 
 bxSpeed = 6;
 bySpeed = 6; 
 
 }

void draw()
{
  moveInitials ();
  bounceInitials ();
  
  
  if (!keyPressed) 
 {
    c = color (48, 198, 179);
    b = color (180, 40, 40);
  } 
  else
   {
    c = color (random (50), random (255), random (255), random (50, 255));
    b = color (random (50), random (255), random (255), random (50, 255));
     } 
 fill (b, 100);
 noStroke ();
 rect (0, 0, width, height); 
 if (frameCount > 50)
 {
 initials (sin(ix/50)*150+ix, iy, id);
 initials (bx, by, bd);
 }
}

void initials (float x, float y, float d)
{

  noStroke ();
fill (242, 221, 164);
ellipse (x, y, d*.85, d*.85);

noStroke ();
fill (b);
ellipse (x, y, d*.80, d*.80);

fill (242, 221, 164);
strokeWeight (.025*d);
stroke (242, 221, 164);
ellipse (x, y, d*.75, d*.75);

fill (b);
noStroke ();
ellipse (x + .33*d, y, d*.05, d*.05);

fill (b);
noStroke ();
ellipse (x - .33*d, y, d*.05, d*.05);


//First Initial :: M
fill (242, 221, 164);
strokeWeight (.0375*d);
stroke (c);
beginShape ();
     vertex (x - .23*d, y + .12*d);
     vertex (x - .23*d, y - .215*d);
endShape ();


triangle (x - .13*d, y + .14*d, x - .14*d, y + .19*d, x - .12*d, y + .19*d);
triangle (x - .03*d, y + .14*d, x - .04*d, y + .19*d, x - .02*d, y + .19*d);

beginShape ();
strokeWeight (.0375*d);
curveVertex (x - .23*d, y - .35*d);
curveVertex (x - .23*d, y + .13*d);
curveVertex (x - .26*d, y + .16*d);
curveVertex (x - .29*d, y - .14*d);
endShape ();


beginShape ();
vertex (x - .13*d, y + .16*d);
vertex (x - .13*d, y - .16*d);
endShape ();




//m curves
beginShape ();
curveVertex (x - .23*d, y + .32666666667*d);
curveVertex (x - .23*d, y - .10*d);
curveVertex (x - .17*d, y - .20*d);
curveVertex (x - .13*d, y - .10*d);
curveVertex (x - .16*d, y + .32666666667*d);
endShape ();

line (x - .23*d, y - .215*d, x - .29*d, y - .175*d);


beginShape ();
curveVertex (x - .13*d, y + .32666666667*d);
curveVertex (x - .13*d, y - .10*d);
curveVertex (x - .07*d, y - .20*d);
curveVertex (x - .03*d, y - .10*d);
curveVertex (x - .08*d, y + .32666666667*d);
endShape ();

beginShape ();
vertex (x - .03*d, y + .16*d);
vertex (x - .03*d, y - .08*d);
endShape ();


rect (x - .03*d, y - .0775*d, .0025*d, .08*d);

//Second Initial :: L
strokeWeight (.0375*d);
stroke (c);
beginShape ();
vertex (x + .1*d, y + .13*d);
vertex (x + .1*d, y - .19*d);
endShape ();


triangle (x + .1*d, y + .14*d, x + .09*d, y + .19*d, x + .11*d, y + .19*d);

line (x + .1*d, y - .19*d, x + .04*d, y - .15*d);


//Third Initial :: L
strokeWeight (.0375*d);
stroke (c);
beginShape ();
vertex (x + .25*d, y + .13*d);
vertex (x + .25*d, y - .19*d);
endShape ();

line (x + .25*d, y - .19*d, x + .19*d, y - .15*d);

beginShape ();
strokeWeight (.0375*d);
curveVertex (x + .25*d, y - .35*d);
curveVertex (x + .25*d, y + .13*d);
curveVertex (x + .28*d, y + .16*d);
curveVertex (x + .31*d, y - .14*d);
endShape ();

} 

void moveInitials ()
{
  ix = ix + ixSpeed;
  if (sin(ix/50)*150+ix > width + id*.50)
  { 
    ix = -id*.50; 
  }
  iy = iy + iySpeed;
  if (iy > height + id*.50)
  { 
    iy = -id*.50;
  }
}

void bounceInitials () 
{ 
  bx = bx + bxSpeed;
  if (bx > width) 
  { 
    bxSpeed = -bxSpeed;
  } 
  else if (bx < 0) 
  { 
    bxSpeed = -bxSpeed;
  }
     
  
  by = by + bySpeed; 
  if (by > width)
  {
    bySpeed = -bySpeed; 
  } 
  else if (by < 0)
  { 
    bySpeed = -bySpeed;
  }
  
  
} 




 




