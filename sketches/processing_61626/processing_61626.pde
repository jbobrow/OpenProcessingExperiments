
//project 1 - Rorsach Creator
//Copyright Alex Mallard 2012
//Click the mouse to draw an hedgehog ink blot, drag the mouse to draw more in a
//line that follows the mouse. Click 'r' to reset the image.

import processing.pdf.*;

float r, rx, ry;
color rc;

void setup () {
  size (600, 600);
  smooth ();
  background (255);
  
  rc = color (random (255), random (255), random (255));
}

void draw () {

  r = random (0, 40);
  rx = mouseX;
  ry = mouseY;
  drawInkBlots (rx, ry, r);
  
}

void mousePressed () {
  rc = color (random (255), random (0, 100), random (255));
}

void keyPressed () {
  if (key == 'r') {
    background (255);
  }
}

void drawInkBlots (float x, float y, float dia) {
  fill (0);
  if (mousePressed) {
    dia += 1;
    hedgehog (x, y, r);
    hedgehog (width - x, y, r);
  }
}

void hedgehog (float x, float y, float d) {
  noStroke ();
  fill (rc);
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
