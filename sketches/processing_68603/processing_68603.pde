
//emily wobb, ewobb
//copyright wobb, Pittsburgh

size(400, 400);
smooth();
background(223,220,227);

float x, y, wd, ht;

x = 200;
y = 200;
wd = 250;
ht = wd * 1.0625;

//circle

fill(94,245,213);
stroke(73,36,224);
ellipse(x, y, ht + 100, wd + 100);


//outside curve

stroke(1);
noFill();
beginShape();
curveVertex(x + (1.0625 * wd), y + (.4118 * ht));
curveVertex(x + (.3125 * wd), y - (.2941 * ht));
curveVertex(x - (.1875 * wd), y - (.4706 * ht));
curveVertex(x - (.4375 * wd), y - (.3529 * ht));
curveVertex(x - (.5 * wd), y - (.1176 * ht));
curveVertex(x - (.3125 * wd), y + (.2941 * ht));
curveVertex(x + (.0625 * wd), y + (.5294 * ht));
curveVertex(x + (.4375  * wd), y + (.4118 * ht));
curveVertex(x + (.5625 * wd), y + (.1765 * ht));
curveVertex(x + (.4375 * wd), y - (.1765 * ht));
curveVertex(x - (.1875 * wd), y - (.7647 * ht));
endShape();

//inside upper curve

beginShape();
curveVertex(x+(.1875 * wd), y+(.4118 * ht));
curveVertex(x-(.1875 * wd), y+(.0588 * ht));
curveVertex(x-(.3125 * wd), y-(.1176 * ht));
curveVertex(x-(.3125 * wd), y-(.2941 * ht));
curveVertex(x-(.125 * wd), y-(.2941 * ht));
curveVertex(x+(.0625 * wd), y-(.1765 * ht));
curveVertex(x+(.4118 * wd), y+(.1765 * ht));
endShape();

//inside line (short)

line(x-(.1875 * wd), y+(.0588 * ht), x+(.0625 * wd), y-(.1765 * ht));

//inside lower curve

beginShape();
curveVertex(x-(.5625 * wd), y-(.2941 * ht));
curveVertex(x-(.125 * wd),y+(.1176 * ht));
curveVertex(x+(.0625 * wd), y+(.2353 * ht));
curveVertex(x+(.3125 * wd), y+(.2353 * ht));
curveVertex(x+(.4375 * wd), y+(.0588 * ht));
curveVertex(x+(.4375 * wd), y-(.1765 * ht));
curveVertex(x +(.1875 * wd),y-(.7647 * ht));
endShape();

//inside line (long)

line(x-(.125 * wd),y+(.1176 * ht),x+(.3125 * wd), y-(.2941 * ht));



//outside curve

noFill();
stroke(131,85,69);
beginShape();
curveVertex(x - (1.0625 * wd), y - (.4118 * ht));
curveVertex(x - (.3125 * wd), y + (.2941 * ht));
curveVertex(x + (.1875 * wd), y + (.4706 * ht));
curveVertex(x + (.4375 * wd), y + (.3529 * ht));
curveVertex(x + (.5 * wd), y + (.1176 * ht));
curveVertex(x + (.3125 * wd), y - (.2941 * ht));
curveVertex(x - (.0625 * wd), y - (.5294 * ht));
curveVertex(x - (.4375  * wd), y - (.4118 * ht));
curveVertex(x - (.5625 * wd), y - (.1765 * ht));
curveVertex(x - (.4375 * wd), y + (.1765 * ht));
curveVertex(x + (.1875 * wd), y + (.7647 * ht));
endShape();

//inside upper curve

beginShape();
curveVertex(x-(.1875 * wd), y-(.4118 * ht));
curveVertex(x+(.1875 * wd), y-(.0588 * ht));
curveVertex(x+(.3125 * wd), y+(.1176 * ht));
curveVertex(x+(.3125 * wd), y+(.2941 * ht));
curveVertex(x+(.125 * wd), y+(.2941 * ht));
curveVertex(x-(.0625 * wd), y+(.1765 * ht));
curveVertex(x-(.4118 * wd), y-(.1765 * ht));
endShape();

//inside line (short)

line(x+(.1875 * wd), y-(.0588 * ht), x-(.0625 * wd), y+(.1765 * ht));

//inside lower curve

beginShape();
curveVertex(x+(.5625 * wd), y+(.2941 * ht));
curveVertex(x+(.125 * wd),y-(.1176 * ht));
curveVertex(x-(.0625 * wd), y-(.2353 * ht));
curveVertex(x-(.3125 * wd), y-(.2353 * ht));
curveVertex(x-(.4375 * wd), y-(.0588 * ht));
curveVertex(x-(.4375 * wd), y+(.1765 * ht));
curveVertex(x -(.1875 * wd),y+(.7647 * ht));
endShape();

//inside line (long)

line(x+(.125 * wd),y-(.1176 * ht),x-(.3125 * wd), y+(.2941 * ht));







