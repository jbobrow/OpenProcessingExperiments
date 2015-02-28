
//Homework 2
//copyright benjamin corwin 2012

size ( 400, 400);
smooth();
float x,y,wd,ht;

x = 200;
y = 200;
wd = 200;
ht = 200;

//x is the horizontal center of the design
//y is vertical center of the design
//wd is width of the shape from the center of the design
//ht is the hight of the shape from the center of the design

background(#00AA72);
fill(#FF5600);
stroke(#FF5600);
strokeWeight(7.5 * (wd + ht)/200);
ellipse(x, y, 1.925 * wd, 1.925 * ht);
noFill();
//g
stroke(#FF9900);
beginShape();
  curveVertex(x + .5 * wd, y - .2 * ht);
  curveVertex(x + .5 * wd, y - .1 * ht);
  curveVertex(x + .5 * wd, y + .1 * ht);
  curveVertex(x + .5 * wd, y + .5 * ht);
  curveVertex(x + .3 * wd, y + .75 *ht);
  curveVertex(x + .0 * wd, y + .85 *ht);
  curveVertex(x - .3 * wd, y + .75* ht);
  curveVertex(x - .5 * wd, y + .5 * ht);
  curveVertex(x - .5 * wd, y + .0 * ht);
  endShape();
ellipse(x, y, wd, ht);

//outline
//c
stroke(#5fa2b9);
strokeWeight(12.5 * (wd + ht)/200);
arc(x + .525 * wd, y, .9 * wd, .9 * ht, PI/4, TWO_PI-PI/4);
//b
ellipse(x - .475 * wd, y, .9 * wd, .9 * ht);
arc(x, y, 1.85 * wd, 1.85 * ht, PI, TWO_PI-2*PI/3);
//inside
//c
stroke(#0d5872);
strokeWeight(6.5 * (wd + ht) / 200);
arc(x + .525 * wd, y, .9 * wd, .9 * ht, PI/4, TWO_PI-PI/4);
//b
ellipse(x - .475 * wd, y, .9 * wd, .9 * ht);
arc(x, y, 1.85 * wd, 1.85 * ht, PI, TWO_PI-2*PI/3);
                
