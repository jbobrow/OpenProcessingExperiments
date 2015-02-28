
//Homework #5 :: 51-257 Sec A :: Michael Loffredo :: mlloffre
//copyright michael loffredo 2012

//Press and hold any key to make the background and my initials change color.
//Move the mouse around the screen to watch the icon grow bigger and smaller as it follows the mouse.

color c;
color b;

void setup()
{
 size (400, 400);
 smooth ();
 background (b); 
 frameRate (30);
 }

void draw()
{
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
 background (b);
 if (frameCount > 50)
 {
 initials (mouseX, mouseY, (mouseX + mouseY)*.50);
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


 




