
// Homework 2
// copyright John Mailley September 2011 Pittsburgh, PA 15289
size(500, 500);
smooth();
background(43, 5, 77);
ellipseMode(CORNER);

float x, y, wd, ht;
x = 50;
y = 50;
wd = 400;
ht = 400;

strokeWeight(3);
stroke(74, 161, 252);
quad(250, 0, 500, 250, 250, 500, 0, 250);

stroke(255, 150, 13);
strokeWeight(2);
fill(74, 161, 252);
ellipse(x, y, wd, ht);

strokeWeight(1);
stroke(43, 5, 77);
fill(255, 150, 13);
//'J'
beginShape();
  curveVertex(x + .0625*wd, y + .25*ht);
  curveVertex(x + .25*wd, y + .0625*ht);
  curveVertex(x + .4375*wd, y + .01*ht);
  curveVertex(x + .4375*wd, y + .05*ht);
  curveVertex(x + .3125*wd, y + .125*ht);
  curveVertex(x + .3125*wd, y + .625*ht);
  curveVertex(x + .1875*wd, y + .8125*ht);
  curveVertex(x + .0625*wd, y + .6875*ht);
  curveVertex(x, y + .5625*ht);
  curveVertex(x + .0625*wd, y + .4375*ht);
  curveVertex(x + .1875*wd, y + .4375*ht);
  curveVertex(x + .1875*wd, y + .5*ht);
  curveVertex(x + .0625*wd, y + .5625*ht);
  curveVertex(x + .1875*wd, y + .6875*ht);
  curveVertex(x + .25*wd, y + .1875*ht);
  curveVertex(x + .125*wd, y + .3125*ht);
  curveVertex(x + .0625*wd, y + .25*ht);
  curveVertex(x + .25*wd, y + .0625*ht);
  curveVertex(x + .4375*wd, y + .01*ht);
  curveVertex(x + .4375*wd, y + .05*ht);
endShape();

//'J' (2)
beginShape();
  curveVertex(x + .25*wd, y + .8125*ht);
  curveVertex(x + .3125*wd, y + .75*ht);
  curveVertex(x + .375*wd, y + .875*ht);
  curveVertex(x + .41*wd, y + .25*ht);
  curveVertex(x + .32*wd, y + .25*ht);
  curveVertex(x + .36*wd, y + .08*ht);
  curveVertex(x + .6*wd, y + .0625*ht);
  curveVertex(x + .58*wd, y + .2*ht);
  curveVertex(x + .47*wd, y + .25*ht);
  curveVertex(x + .4375*wd, y + .9375*ht);
  curveVertex(x + .3125*wd, y + .9375*ht);
  curveVertex(x + .25*wd, y + .8125*ht);
  curveVertex(x + .3125*wd, y + .75*ht);
  curveVertex(x + .375*wd, y + .875*ht);
endShape();

//'M'
beginShape();
  curveVertex(x + .9375*wd, y + .625*ht);
  curveVertex(x + .875*wd, y + .4375*ht);
  curveVertex(x + .8125*wd, y + .625*ht);
  curveVertex(x + .6875*wd, y + .3125*ht);
  curveVertex(x + .625*wd, y + .9375*ht);
  curveVertex(x + .5*wd, y + .95*ht);
  curveVertex(x + .5*wd, y + .75*ht);
  curveVertex(x + .5625*wd, y + .875*ht);
  curveVertex(x + .625*wd, y + .125*ht);
  curveVertex(x + .6875*wd, y + .125*ht);
  curveVertex(x + .8125*wd, y + .375*ht);
  curveVertex(x + .875*wd, y + .1875*ht);
  curveVertex(x + .99*wd, y + .4375*ht);
  curveVertex(x + .9375*wd, y + .625*ht);
  curveVertex(x + .875*wd, y + .4375*ht);
  curveVertex(x + .8125*wd, y + .625*ht);
endShape();



