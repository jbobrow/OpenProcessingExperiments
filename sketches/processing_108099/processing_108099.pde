
// hw 2
// copyright Melissa Mak, September 2013, Pittsburgh, PA

size(400, 400);
rectMode(CENTER);
background(255, 93, 93);
smooth();

// variables
float x = 200;
float y = 200;
float wd = 300;
float ht = 300;

// head
fill(252, 246, 235);
ellipse (x, y, wd, ht);

// hair
stroke(255);
strokeWeight(5);
line(x, y - (ht * .49), x, y - (ht * .4));
line(x - (wd * .15), y - (ht * .47), x - (wd * .15), y - (ht * .4));
line(x + (wd * .15), y - (ht * .47), x + (wd * .15), y - (ht * .4));

// head outline
noFill();
strokeWeight(3);
ellipse (x, y, wd, ht);

// mustache
fill(200);
noStroke();
  triangle(x - (wd * .32), y + (ht * .28), x - (wd * .125), y + (ht * .12), x + (wd * .32), y + (ht * .28));
  triangle(x - (wd * .28), y + (ht * .28), x + (wd * .125), y + (ht * .12), x + (wd * .32), y + (ht * .28));
  stroke(252, 246, 235);
  strokeWeight(2.5);
  line(x - (wd * .25), y + (ht * .28), x - (wd * .25), y + (ht * .22));
  line(x - (wd * .15), y + (ht * .28), x - (wd * .15), y + (ht * .1));
  line(x - (wd * .05), y + (ht * .28), x - (wd * .05), y + (ht * .1));
  line(x + (wd * .05), y + (ht * .28), x + (wd * .05), y + (ht * .1));
  line(x + (wd * .15), y + (ht * .28), x + (wd * .15), y + (ht * .1));
  line(x + (wd * .25), y + (ht * .28), x + (wd * .25), y + (ht * .22));
  
// eyes
stroke(147, 119, 108);
strokeWeight(10);
point(x - (wd * .2), y - (ht * .08));
point(x + (wd * .2), y - (ht * .08));

// eyebrows
stroke(200);
strokeWeight(20);
line(x - (wd * .3), y - (ht * .15), x - (wd * .12), y - (ht * .15));
line(x + (wd * .3), y - (ht * .15), x + (wd * .12), y - (ht * .15));

// left lens
stroke(0);
strokeWeight(4);
fill(240, 255, 254, 125);
beginShape();
  curveVertex(x, y - (ht * .5)); // reference point
  curveVertex(x - (wd * .05), y - (ht * .15));
  curveVertex(x - (wd * .12), y + (ht * .01));
  curveVertex(x - (wd * .3), y + (ht * .01));
  curveVertex(x - (wd * .37), y - (ht * .15));
  curveVertex(x - (wd * .42), y - (ht * .5)); // reference point
endShape();

// right lens
beginShape();
  curveVertex(x, y - (ht * .5)); // reference point
  curveVertex(x + (wd * .05), y - (ht * .15));
  curveVertex(x + (wd * .12), y + (ht * .01));
  curveVertex(x + (wd * .3), y + (ht * .01));
  curveVertex(x + (wd * .37), y - (ht * .15));
  curveVertex(x + (wd * .42), y - (ht * .5)); // reference point
endShape();

// glasses
line(x - (wd * .5), y - (ht * .15), x + (wd * .5), y - (ht * .15));

//saveFrame("hw2.jpg");



