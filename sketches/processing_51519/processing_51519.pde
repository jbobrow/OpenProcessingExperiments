
//hw6 - bounce hedgehog, BOUNCE!
//Alex Mallard copyrigd 2012
//one hedgehog bounces back and forth accross the screen while
//the other wraps around the screen each time. click the mouse
// to change their color

  
float tx, ty, td, tSpeed;
float px, py, pd, pxSpeed, pySpeed;
color tc, pc;
  
void setup () {
  size (400,400);
  smooth ();
  background (84, 92, 155);
  frameRate (60);
  tc = color (random (150, 255), random (0,150), random (180, 255));
  pc = color (random (255), random (255), random (255));
  
  tx = 0;
  ty = random (height);
  td = 60;
  tSpeed = 2;
  
  px = 100;
  py = random (height - pd);
  pd = 80;
  pxSpeed = 1;
  pySpeed = 1.5;
}
  
void draw () {
  window ();
  moveHedgehog ();
  hedgehogWrap (tx, ty, td);
  bounceHedgehog ();
  hedgehogBounce (px, py, pd, pd);
}

void window () {
  fill (84, 92, 155, 50);
  rect (0,0, width, height);
}

void moveHedgehog () {
  tx = tx + tSpeed;
  if (tx > width + td*.5) {
    tx = -td*.5;
    ty = random (height);
  }
}

void bounceHedgehog () {
  px = px + pxSpeed;
  py = py + pySpeed;
  if (px > width - pd) {
    pxSpeed = -pxSpeed;
  } else if (px < 0) {
    pxSpeed = -pxSpeed;
  }
    if (py > height - pd) {
    pySpeed = -pySpeed;
  } else if (py < 0) {
    pySpeed = -pySpeed;
  }
}

void mousePressed () {
  tc = color (random (150, 255), random (0,150), random (180, 255));
  pc = color (random (255), random (255), random (255));
}
  
void hedgehogWrap (float x, float y, float d) {
  noStroke ();
  fill (tc);
  beginShape ();
  vertex (x + .1*d, y + .5*d);
  vertex (x, y + .4*d);
  vertex (x + .1*d, y + .4*d);
  vertex (x + .05*d, y + .3*d);
  vertex (x + .15*d, y + .35*d);
  vertex (x + .1*d, y + .2*d);
  vertex (x + .2*d, y + .25*d);
  vertex (x + .2*d, y + .1*d);
  vertex (x + .3*d, y + .2*d);
  vertex (x + .3*d, y + .05*d);
  vertex (x + .4*d, y + .15*d);
  vertex (x + .4*d, y);
  vertex (x + .5*d, y + .1*d);
  vertex (x + .55*d, y);
  vertex (x + .6*d, y + .1*d);
  vertex (x + .7*d, y + .05*d);
  vertex (x + .7*d, y + .15*d);
  vertex (x + .8*d, y + .1*d);
  vertex (x + .8*d, y + .2*d);
  vertex (x + .9*d, y + .15*d);
  vertex (x + .85*d, y + .25*d);
  vertex (x + .95*d, y + .25*d);
  vertex (x + .9*d, y + .35*d);
  vertex (x + d, y + .4*d);
  vertex (x + .9*d, y + .45*d);
  vertex (x + d, y + .5*d);
  vertex (x + .9*d, y + .55*d);
  vertex (x + d, y + .6*d);
  vertex (x + .9*d, y + .65*d);
  vertex (x + .95*d, y + .75*d);
  vertex (x + .85*d, y + .75*d);
  vertex (x + .85*d, y + .85*d);
  vertex (x + .75*d, y + .8*d);
  vertex (x + .75*d, y + .9*d);
  vertex (x + .65*d, y + .85*d);
  vertex (x + .65*d, y + .95*d);
  vertex (x + .55*d, y + .9*d);
  vertex (x + .5*d, y + d);
  vertex (x + .45*d, y + .9*d);
  vertex (x + .4*d, y + d);
  vertex (x + .35*d, y + .9*d);
  vertex (x + .3*d, y + .95*d);
  vertex (x + .3*d, y + .9*d);
  endShape ();
  beginShape ();
  vertex (x + .18*d, y + .61*d);
  vertex (x + .125*d, y + .7*d);
  vertex (x + .2*d, y + .7*d);
  vertex (x + .15*d, y + .75*d);
  vertex (x + .2*d, y + .75*d);
  vertex (x + .175*d, y + .8*d);
  vertex (x + .25*d, y + .8*d);
  endShape ();
  fill (222, 179, 98);
  beginShape ();
  curveVertex (x + .1*d, y + .5*d);
  curveVertex (x + .1*d, y + .5*d);
  curveVertex (x + .2*d, y + .45*d);
  curveVertex (x + .4*d, y + .5*d);
  curveVertex (x + .45*d, y + .65*d);
  curveVertex (x + .4*d, y + .8*d);
  curveVertex (x + .35*d, y + .85*d);
  curveVertex (x + .3*d, y + .9*d);
  curveVertex (x + .25*d, y + .92*d);
  curveVertex (x + .2*d, y + .9*d);
  curveVertex (x + .175*d, y + .85*d);
  curveVertex (x + .2*d, y + .8*d);
  curveVertex (x + .25*d, y + .75*d);
  curveVertex (x + .3*d, y + .65*d);
  curveVertex (x + .25*d, y + .6*d);
  curveVertex (x + .2*d, y + .6*d);
  curveVertex (x + .2*d, y + .6*d);
  endShape ();
  beginShape ();
  curveVertex (x + .26*d, y + .85*d);
  curveVertex (x + .25*d, y + .92*d);
  curveVertex (x + .19*d, y + .95*d);
  curveVertex (x + .2*d, y + .9*d);
  curveVertex (x + .175*d, y + .85*d);
  endShape ();
  beginShape ();
  curveVertex (x + .25*d, y + .5*d);
  curveVertex (x + .2*d, y + .6*d);
  curveVertex (x + .15*d, y + .64*d);
  curveVertex (x + .05*d, y + .65*d);
  curveVertex (x + .075*d, y + .575*d);
  curveVertex (x + .105*d, y + .5*d);
  curveVertex (x + .1*d, y + .5*d);
  endShape ();
  stroke (170, 85, 15);
  beginShape ();
  vertex (x + .35*d, y + .55*d);
  vertex (x + .3*d, y + .6*d);
  vertex (x + .28*d, y + .6*d);
  vertex (x + .3*d, y + .615*d);
  vertex (x + .28*d, y + .63*d);
  vertex (x + .31*d, y + .625*d);
  vertex (x + .325*d, y + .64*d);
  vertex (x + .332*d, y + .62*d);
  vertex (x + .35*d, y + .625*d);
  vertex (x + .34*d, y + .6*d);
  vertex (x + .375*d, y + .575*d);
  endShape ();
  beginShape ();
  vertex (x + .25*d, y + .6*d);
  vertex (x + .2*d, y + .65*d);
  vertex (x + .175*d, y + .65*d);
  vertex (x + .2*d, y + .665*d);
  vertex (x + .185*d, y + .675*d);
  vertex (x + .215*d, y + .67*d);
  vertex (x + .225*d, y + .685*d);
  vertex (x + .24*d, y + .665*d);
  vertex (x + .255*d, y + .67*d);
  vertex (x + .25*d, y + .65*d);
  vertex (x + .29*d, y + .615*d);
  endShape ();
  beginShape ();
  vertex (x + .3*d, y + .85*d);
  vertex (x + .28*d, y + .81*d);
  vertex (x + .265*d, y + .8*d);
  vertex (x + .275*d, y + .793*d);
  vertex (x + .27*d, y + .775*d);
  vertex (x + .28*d, y + .78*d);
  vertex (x + .29*d, y + .76*d);
  vertex (x + .3*d, y + .775*d);
  vertex (x + .315*d, y + .765*d);
  vertex (x + .31*d, y + .78*d);
  vertex (x + .325*d, y + .825*d);
  endShape ();
  beginShape ();
  vertex (x + .25*d, y + .8*d);
  vertex (x + .21*d, y + .75*d);
  vertex (x + .19*d, y + .75*d);
  vertex (x + .204*d, y + .735*d);
  vertex (x + .193*d, y + .715*d);
  vertex (x + .217*d, y + .725*d);
  vertex (x + .23*d, y + .707*d);
  vertex (x + .235*d, y + .72*d);
  vertex (x + .25*d, y + .725*d);
  vertex (x + .24*d, y + .735*d);
  vertex (x + .27*d, y + .77*d);
  endShape ();
  beginShape ();
  curveVertex (x + .1*d, y + .5*d);
  curveVertex (x + .1*d, y + .5*d);
  curveVertex (x + .095*d, y + .47*d);
  curveVertex (x + .11*d, y + .42*d);
  curveVertex (x + .15*d, y + .475*d);
  curveVertex (x + .15*d, y + .475*d);
  endShape ();
  beginShape ();
  curveVertex (x + .15*d, y + .5*d);
  curveVertex (x + .155*d, y + .5*d);
  curveVertex (x + .18*d, y + .4*d);
  curveVertex (x + .215*d, y + .465*d);
  curveVertex (x + .21*d, y + .51*d);
  curveVertex (x + .21*d, y + .51*d);
  endShape ();
  fill (232, 129, 189);
  beginShape ();
  curveVertex (x + .175*d, y + .49*d);
  curveVertex (x + .175*d, y + .49*d);
  curveVertex (x + .182*d, y + .45*d);
  curveVertex (x + .2*d, y + .465*d);
  curveVertex (x + .2*d, y + .5*d);
  curveVertex (x + .2*d, y + .5*d);
  endShape ();
  beginShape ();
  curveVertex (x + .118*d, y + .49*d);
  curveVertex (x + .118*d, y + .49*d);
  curveVertex (x + .113*d, y + .475*d);
  curveVertex (x + .118*d, y + .45*d);
  curveVertex (x + .138*d, y + .48*d);
  curveVertex (x + .138*d, y + .48*d);
  endShape ();
  noStroke ();
  fill (44, 37, 67);
  ellipse (x + .037*d, y + .65*d, .025*d, .015*d);
  ellipse (x + .15*d, y + .552*d, .03*d, .03*d);
  stroke (44, 37, 67);
  noFill ();
  beginShape ();
  curveVertex (x + .125*d, y + .55*d);
  curveVertex (x + .125*d, y + .54*d);
  curveVertex (x + .15*d, y + .525*d);
  curveVertex (x + .175*d, y + .54*d);
  curveVertex (x + .175*d, y + .545*d);
  endShape ();
}

void hedgehogBounce (float x, float y, float wd, float ht) {
  noStroke ();
  fill (pc);
  beginShape ();
  vertex (x + .1*wd, y + .5*ht);
  vertex (x, y + .4*ht);
  vertex (x + .1*wd, y + .4*ht);
  vertex (x + .05*wd, y + .3*ht);
  vertex (x + .15*wd, y + .35*ht);
  vertex (x + .1*wd, y + .2*ht);
  vertex (x + .2*wd, y + .25*ht);
  vertex (x + .2*wd, y + .1*ht);
  vertex (x + .3*wd, y + .2*ht);
  vertex (x + .3*wd, y + .05*ht);
  vertex (x + .4*wd, y + .15*ht);
  vertex (x + .4*wd, y);
  vertex (x + .5*wd, y + .1*ht);
  vertex (x + .55*wd, y);
  vertex (x + .6*wd, y + .1*ht);
  vertex (x + .7*wd, y + .05*ht);
  vertex (x + .7*wd, y + .15*ht);
  vertex (x + .8*wd, y + .1*ht);
  vertex (x + .8*wd, y + .2*ht);
  vertex (x + .9*wd, y + .15*ht);
  vertex (x + .85*wd, y + .25*ht);
  vertex (x + .95*wd, y + .25*ht);
  vertex (x + .9*wd, y + .35*ht);
  vertex (x + wd, y + .4*ht);
  vertex (x + .9*wd, y + .45*ht);
  vertex (x + wd, y + .5*ht);
  vertex (x + .9*wd, y + .55*ht);
  vertex (x + wd, y + .6*ht);
  vertex (x + .9*wd, y + .65*ht);
  vertex (x + .95*wd, y + .75*ht);
  vertex (x + .85*wd, y + .75*ht);
  vertex (x + .85*wd, y + .85*ht);
  vertex (x + .75*wd, y + .8*ht);
  vertex (x + .75*wd, y + .9*ht);
  vertex (x + .65*wd, y + .85*ht);
  vertex (x + .65*wd, y + .95*ht);
  vertex (x + .55*wd, y + .9*ht);
  vertex (x + .5*wd, y + ht);
  vertex (x + .45*wd, y + .9*ht);
  vertex (x + .4*wd, y + ht);
  vertex (x + .35*wd, y + .9*ht);
  vertex (x + .3*wd, y + .95*ht);
  vertex (x + .3*wd, y + .9*ht);
  endShape ();
  beginShape ();
  vertex (x + .18*wd, y + .61*ht);
  vertex (x + .125*wd, y + .7*ht);
  vertex (x + .2*wd, y + .7*ht);
  vertex (x + .15*wd, y + .75*ht);
  vertex (x + .2*wd, y + .75*ht);
  vertex (x + .175*wd, y + .8*ht);
  vertex (x + .25*wd, y + .8*ht);
  endShape ();
  fill (222, 179, 98);
  beginShape ();
  curveVertex (x + .1*wd, y + .5*ht);
  curveVertex (x + .1*wd, y + .5*ht);
  curveVertex (x + .2*wd, y + .45*ht);
  curveVertex (x + .4*wd, y + .5*ht);
  curveVertex (x + .45*wd, y + .65*ht);
  curveVertex (x + .4*wd, y + .8*ht);
  curveVertex (x + .35*wd, y + .85*ht);
  curveVertex (x + .3*wd, y + .9*ht);
  curveVertex (x + .25*wd, y + .92*ht);
  curveVertex (x + .2*wd, y + .9*ht);
  curveVertex (x + .175*wd, y + .85*ht);
  curveVertex (x + .2*wd, y + .8*ht);
  curveVertex (x + .25*wd, y + .75*ht);
  curveVertex (x + .3*wd, y + .65*ht);
  curveVertex (x + .25*wd, y + .6*ht);
  curveVertex (x + .2*wd, y + .6*ht);
  curveVertex (x + .2*wd, y + .6*ht);
  endShape ();
  beginShape ();
  curveVertex (x + .26*wd, y + .85*ht);
  curveVertex (x + .25*wd, y + .92*ht);
  curveVertex (x + .19*wd, y + .95*ht);
  curveVertex (x + .2*wd, y + .9*ht);
  curveVertex (x + .175*wd, y + .85*ht);
  endShape ();
  beginShape ();
  curveVertex (x + .25*wd, y + .5*ht);
  curveVertex (x + .2*wd, y + .6*ht);
  curveVertex (x + .15*wd, y + .64*ht);
  curveVertex (x + .05*wd, y + .65*ht);
  curveVertex (x + .075*wd, y + .575*ht);
  curveVertex (x + .105*wd, y + .5*ht);
  curveVertex (x + .1*wd, y + .5*ht);
  endShape ();
  stroke (170, 85, 15);
  beginShape ();
  vertex (x + .35*wd, y + .55*ht);
  vertex (x + .3*wd, y + .6*ht);
  vertex (x + .28*wd, y + .6*ht);
  vertex (x + .3*wd, y + .615*ht);
  vertex (x + .28*wd, y + .63*ht);
  vertex (x + .31*wd, y + .625*ht);
  vertex (x + .325*wd, y + .64*ht);
  vertex (x + .332*wd, y + .62*ht);
  vertex (x + .35*wd, y + .625*ht);
  vertex (x + .34*wd, y + .6*ht);
  vertex (x + .375*wd, y + .575*ht);
  endShape ();
  beginShape ();
  vertex (x + .25*wd, y + .6*ht);
  vertex (x + .2*wd, y + .65*ht);
  vertex (x + .175*wd, y + .65*ht);
  vertex (x + .2*wd, y + .665*ht);
  vertex (x + .185*wd, y + .675*ht);
  vertex (x + .215*wd, y + .67*ht);
  vertex (x + .225*wd, y + .685*ht);
  vertex (x + .24*wd, y + .665*ht);
  vertex (x + .255*wd, y + .67*ht);
  vertex (x + .25*wd, y + .65*ht);
  vertex (x + .29*wd, y + .615*ht);
  endShape ();
  beginShape ();
  vertex (x + .3*wd, y + .85*ht);
  vertex (x + .28*wd, y + .81*ht);
  vertex (x + .265*wd, y + .8*ht);
  vertex (x + .275*wd, y + .793*ht);
  vertex (x + .27*wd, y + .775*ht);
  vertex (x + .28*wd, y + .78*ht);
  vertex (x + .29*wd, y + .76*ht);
  vertex (x + .3*wd, y + .775*ht);
  vertex (x + .315*wd, y + .765*ht);
  vertex (x + .31*wd, y + .78*ht);
  vertex (x + .325*wd, y + .825*ht);
  endShape ();
  beginShape ();
  vertex (x + .25*wd, y + .8*ht);
  vertex (x + .21*wd, y + .75*ht);
  vertex (x + .19*wd, y + .75*ht);
  vertex (x + .204*wd, y + .735*ht);
  vertex (x + .193*wd, y + .715*ht);
  vertex (x + .217*wd, y + .725*ht);
  vertex (x + .23*wd, y + .707*ht);
  vertex (x + .235*wd, y + .72*ht);
  vertex (x + .25*wd, y + .725*ht);
  vertex (x + .24*wd, y + .735*ht);
  vertex (x + .27*wd, y + .77*ht);
  endShape ();
  beginShape ();
  curveVertex (x + .1*wd, y + .5*ht);
  curveVertex (x + .1*wd, y + .5*ht);
  curveVertex (x + .095*wd, y + .47*ht);
  curveVertex (x + .11*wd, y + .42*ht);
  curveVertex (x + .15*wd, y + .475*ht);
  curveVertex (x + .15*wd, y + .475*ht);
  endShape ();
  beginShape ();
  curveVertex (x + .15*wd, y + .5*ht);
  curveVertex (x + .155*wd, y + .5*ht);
  curveVertex (x + .18*wd, y + .4*ht);
  curveVertex (x + .215*wd, y + .465*ht);
  curveVertex (x + .21*wd, y + .51*ht);
  curveVertex (x + .21*wd, y + .51*ht);
  endShape ();
  fill (232, 129, 189);
  beginShape ();
  curveVertex (x + .175*wd, y + .49*ht);
  curveVertex (x + .175*wd, y + .49*ht);
  curveVertex (x + .182*wd, y + .45*ht);
  curveVertex (x + .2*wd, y + .465*ht);
  curveVertex (x + .2*wd, y + .5*ht);
  curveVertex (x + .2*wd, y + .5*ht);
  endShape ();
  beginShape ();
  curveVertex (x + .118*wd, y + .49*ht);
  curveVertex (x + .118*wd, y + .49*ht);
  curveVertex (x + .113*wd, y + .475*ht);
  curveVertex (x + .118*wd, y + .45*ht);
  curveVertex (x + .138*wd, y + .48*ht);
  curveVertex (x + .138*wd, y + .48*ht);
  endShape ();
  noStroke ();
  fill (44, 37, 67);
  ellipse (x + .037*wd, y + .65*ht, .025*wd, .015*ht);
  ellipse (x + .15*wd, y + .552*ht, .03*wd, .03*ht);
  stroke (44, 37, 67);
  noFill ();
  beginShape ();
  curveVertex (x + .125*wd, y + .55*ht);
  curveVertex (x + .125*wd, y + .54*ht);
  curveVertex (x + .15*wd, y + .525*ht);
  curveVertex (x + .175*wd, y + .54*ht);
  curveVertex (x + .175*wd, y + .545*ht);
  endShape ();
}

               
