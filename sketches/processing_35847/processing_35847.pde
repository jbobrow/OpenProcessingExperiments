
// copyright Emily So
// homework 2
background(159, 159, 170);
size (500, 500);
float x, y, wd, ht;
x = 250;
y = 230;
wd = 430;
ht = 120;

noFill();
stroke(0, 155, 120);
strokeWeight(20);
ellipse(x, y, wd, wd);
strokeWeight(.035*x);
stroke(0, 40, 60);
ellipse(x, y, .9*wd, .9*wd);
//"E"
stroke(100, 20, 80);
strokeWeight(.02*wd);
beginShape();
curveVertex(x - .2*ht, y - ht);
curveVertex(x - .2*ht, y - ht);
curveVertex(x - ht, y - ht);
curveVertex(x - (ht+30), y - .1*wd);
curveVertex(x - (ht-20), y - .1*wd);
curveVertex(x - (ht-20), y - .1*wd);
curveVertex(x - (ht+30), y+.05*wd);
curveVertex(x - (ht+30), y+.1*wd);
curveVertex(x - ht, y + .12*wd);
curveVertex(x - .2*ht, y+.1*wd);
curveVertex(x - .2*ht, y+.1*wd);
endShape();
//"S"
stroke(100, 40, 140);
beginShape();
curveVertex(x + .3*wd, y - .8*ht);
curveVertex(x + .3*wd, y - .8*ht);
curveVertex(x + .25*wd, y - ht);
curveVertex(x + .1*wd, y - .8*ht);
curveVertex(x + .08*wd, y - .7*ht);
curveVertex(x + .12*wd, y - .6*ht);
curveVertex(x + .4*wd, y);
curveVertex(x + .4*wd, y + .2*ht);
curveVertex(x + .2*wd, y + .4*ht);
curveVertex(x + .07*wd, y + .1*ht);
curveVertex(x + .07*wd, y + .1*ht);
endShape();
                
