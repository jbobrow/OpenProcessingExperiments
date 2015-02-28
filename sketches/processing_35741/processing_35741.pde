
//homework 2
//copyright Kristen McConnell August 2011 Pittsburgh PA 15221

size(450,450);
smooth();
ellipseMode(CORNER);
background(214,255,233);

float x,y,wd,ht;
x = 25;
y = 25;
wd = 400; //width
ht = 400; //height

//background circle;
fill(214,255,233);
noStroke();
ellipse(x,y,wd,ht);

//A
stroke(85,0,98);
strokeWeight(5);
fill(240,214,255);
beginShape();
 curveVertex(x + .36*wd, y + .6*ht);
 curveVertex(x + .2*wd, y + .85*ht);
 curveVertex(x + .3*wd, y + .91*ht);
 curveVertex(x + .3*wd, y + .6*ht);
 vertex(x + .4*wd, y + .45*ht);
 vertex(x + .575*wd, y + .45*ht);
 vertex(x + .65*wd, y + .9*ht);
 curveVertex(x + .8*wd, y + .85*ht);
 curveVertex(x + .675*wd, y + .95*ht);
 curveVertex(x + .75*wd, y + .85*ht);
 curveVertex(x + .575*wd, y + .15*ht);
 curveVertex(x + .5*wd, y);
 curveVertex(x + .425*wd, y + .15*ht);
 curveVertex(x + .2*wd, y + .85*ht);
 curveVertex(x + .2*wd, y + .85*ht);
endShape();

//inside of the A
fill(214,255,233);
beginShape();
 vertex(x + .425*wd, y + .375*ht);
 vertex(x + .57*wd, y + .375*ht);
 vertex(x + .5*wd, y + .1*ht);
 vertex(x + .425*wd, y + .375*ht);
endShape();

//back of the k
noStroke();
fill(0,98,98);
beginShape();
 curveVertex(x + .05*wd, y + .45*ht);
 curveVertex(x + .05*wd, y + .3*ht);
 curveVertex(x + .1*wd, y + .25*ht);
 curveVertex(x + .15*wd, y + .325*ht);
 curveVertex(x + .15*wd, y + .65*ht);
 curveVertex(x + .1*wd, y + .75*ht);
 curveVertex(x + .05*wd, y + .65*ht);
 curveVertex(x + .05*wd, y + .3*ht);
 curveVertex(x + .05*wd, y + .3*ht);
endShape();

//top arm of k
beginShape();
 curveVertex(x + .15*wd, y + .45*ht);
 curveVertex(x + .15*wd, y + .45*ht);
 curveVertex(x + .25*wd, y + .35*ht);
 curveVertex(x + .3*wd, y + .35*ht);
 curveVertex(x + .3*wd, y + .4*ht);
 curveVertex(x + .15*wd, y + .55*ht);
 curveVertex(x + .15*wd, y + .45*ht);
 curveVertex(x + .15*wd, y + .45*ht);
endShape();

//bottom arm of k
beginShape();
 curveVertex(x + .15*wd, y + .5*ht);
 curveVertex(x + .17*wd, y + .5*ht);
 curveVertex(x + .2*wd, y + .5*ht);
 curveVertex(x + .34*wd, y + .7*ht);
 curveVertex(x + .325*wd, y + .75*ht);
 curveVertex(x + .25*wd, y + .7*ht);
 curveVertex(x + .15*wd, y + .55*ht);
 curveVertex(x + .15*wd, y + .55*ht);
endShape();

//M
fill(0,27,98);
beginShape();
 curveVertex(x + .7*wd, y + .45*ht);
 curveVertex(x + .6*wd, y + .35*ht);
 curveVertex(x + .675*wd, y + .3*ht);
 curveVertex(x + .775*wd, y + .375*ht);
 curveVertex(x + .875*wd, y + .3*ht);
 curveVertex(x + .95*wd, y + .35*ht);
 curveVertex(x + .95*wd, y + .675*ht);
 curveVertex(x + .9*wd, y + .75*ht);
 curveVertex(x + .85*wd, y + .675*ht);
 curveVertex(x + .85*wd, y + .45*ht);
 curveVertex(x + .775*wd, y + .5*ht);
 curveVertex(x + .7*wd, y + .45*ht);
 curveVertex(x + .7*wd, y + .675*ht);
 curveVertex(x + .65*wd, y + .75*ht);
 curveVertex(x + .6*wd, y + .675*ht);
 curveVertex(x + .6*wd, y + .35*ht);
 curveVertex(x + .6*wd, y + .35*ht);
endShape();
//saveFrame("hw2.jpg");

