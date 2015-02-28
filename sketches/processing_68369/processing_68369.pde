
/*--------------------------------------------------------------------------------------------------------------------------------
Noise Based Warping Explorer
Ale González · 2012 · Dominio Público | Public Domain
----------------------------------------------------------------------------------------------------------------------------------
A explorer of noise based warping, as explained here: http://www.iquilezles.org/www/articles/warp/warp.htm
And as pointed out here: http://amnonp5.wordpress.com/2012/06/17/playing-with-glsl-in-processing/
----------------------------------------------------------------------------------------------------------------------------------
  
The process as described basically by Iñigo:
"Say you have some geometry or image defined as a function of space. For geometry, that would be a function of the form f(x,y,z) 
and for an image it would be f(x,y). We can just write both cases more compactly as f(p), where p is the position in space for 
which we can evaluate the volumetric density that will define our (iso)surface or image color. Warping simply means we distort
the domain with another function g(p) before we evaluate f. Basically, we replace f(p) with f(g(p)). g can be anything, but often 
we want to distort the image of f just a little bit with respect its regular behabiour. Then, it makes sense to have g(p) being 
just the identiy plus a small arbitary distortion h(p), or in other words,

g(p) = p + h(p),

meaning we will be computing

f( p + h(p) )

This technique is really powerful and allows you to shape apples, buildings, animals or any other thing you might imagine. For the 
purpose of this article, we are going to work only with fbm based patterns, both for f ang h. This will produce some abstract but
beautiful images with a pretty organic quality to them."

----------------------------------------------------------------------------------------------------------------------------------
Thanks to both, Íñigo and Amnon, for dedicating so much time to share. ;-)
----------------------------------------------------------------------------------------------------------------------------------
Font: 'sw!ft' by orgdot, as shared on dafont, http://www.dafont.com/orgdot.d518. Thanks again!
--------------------------------------------------------------------------------------------------------------------------------*/


/*
 Global variables and objects
*/

//Canvas size
final int W= 500, H= 500;

//A font to output frameRate
PFont theFont;

//Default level of recursion and text properties
int level = 1,
txt_x = 25,
txt_y = 25,
txt_c = 0xddffff00,
txt_s = 10;

//default values to instantiate the noise domain and warper objects
float 
  perlin_x= .01,
  perlin_y= .01,
  simplex_x= .0045,
  simplex_y= .0045,  
  min_V = -1f,
  max_V =  1f,
  vK=4f;

boolean
  moving = false,
  hud     = true;
  

DomainStrategy domain;
DomainWarper   warper;


/*
 Main methods
*/

void setup(){
  size (W,H,P2D);  
  cursor (CROSS);
  domain  = new Perlin  (255, perlin_x, perlin_y);
  warper  = new DomainWarper (level, min_V, max_V, vK);
  textFont (loadFont("SWFTv01-16.vlw"), txt_s);
  fill (txt_c);
}

void draw(){
  loadPixels();
  if (moving) {warper.x2--; warper.y1++;}
  //Iterate over screen pixels
  for (int y=0, yW=0; y<H; y++, yW+=W) {
    for(int x=0; x<W; x++) {
       //And use domain values (v) to set grayscale values to them, using the domain function provided
      int v = (int) warper.getValue (x,y, domain);
      pixels[x+yW] = v<<16|v<<8|v; 
    }
  }
  updatePixels();
  if (hud) text ("Level: " + level + " - K: " + vK + " - Framerate: " + nfc(frameRate,2), txt_x, txt_y);
}


/*
 Some interaction here:
 · Move mouse to shift the warping, acting onto one of the vectors that define the parent of the tree structure
 · Keys:
   '1'    : use Perlin noise based domain
   '2'    : use Simplex noise based domain
   'Up'   : increase level of recursion (up to 5)
   'Down' : decrease level of recursion (down to 0).
*/

void mousePressed(){
  switch (mouseButton) {
    case (LEFT):
      moving= !moving;
      break;
    case (RIGHT):
      hud = !hud;
      break;
  } 
}

void keyPressed(){
  if (key!=CODED) {
    switch (key) {
      case (KeyEvent.VK_1) : //key '1' constant value as implemented in KeyEvent Java class
        domain = new  Perlin (255, perlin_x, perlin_y);
        break;
      case (KeyEvent.VK_2) : //...
        domain = new Simplex (255, simplex_x, simplex_y);
        break;
    }
  } else {
    if      (keyCode==UP    && level<10) warper= new DomainWarper (++level, min_V, max_V, vK);
    else if (keyCode==DOWN  && level>1)  warper= new DomainWarper (--level, min_V, max_V, vK);
    else if (keyCode==RIGHT && vK<=10)   warper= new DomainWarper (level, min_V, max_V, ++vK);
    else if (keyCode==LEFT  && vK>=0)    warper= new DomainWarper (level, min_V, max_V, --vK);
  }
}

