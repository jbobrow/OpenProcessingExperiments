
//HW2 - initials in a circle
//Alex Mallard copyright 2012
//move the mouse around the window and watch the hedgehog roll in response

float x, y, wd, ht;
float angle1, angle2;

void setup () {
  size (400,400);
  smooth ();
  frameRate (60);
}

void draw () {
  background (84, 92, 155);
  angle1 = (mouseX/float (width) - 0.5) * PI;
  angle2 = (mouseY/float (height) - 0.5) * -PI;
  pushMatrix ();
  translate (x + .5*wd, y + .5*ht);
  rotate (angle1);
  rotate (angle2);
  hedgehog ();
  popMatrix ();
}

void hedgehog () {
  pushMatrix ();
  translate (-(x + .5*wd), -(y + .5*ht));
  x = 50;
  y = 50;
  wd = 300;
  ht = 300;
  noStroke ();
  fill (211, 150, 252);
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
  popMatrix ();
}            
