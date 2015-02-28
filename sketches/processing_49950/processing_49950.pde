
//Using curveVertex and such, processing class
//copyright Shree Lakshmi Rao Jan 2012

size(400,400);
smooth();
noStroke();
float x=50,y=50,wd=250,ht=250;
//drawing the background
background(#CBBDAD);
fill(#ECEBDD);
rect(0,0,20,height);
rect(80,0,20,height);
rect(160,0,20,height);
rect(240,0,20,height);
rect(320,0,20,height);
rect(400,0,20,height);

fill(#ECEBDD);
//rect(x,y,wd,ht);
stroke(#D25B4F);
strokeWeight(5);
ellipse(x+.5*wd, y+.5*ht,wd,ht);

//drawing points for the S
stroke(#7BB6A7);
strokeWeight(15);

point(x+(wd/8),y+.25*ht);
point(x+(wd/4),y+ht/8);
point(x+(3*wd/8),y+.25*ht);
point(x+(wd/4),y+3*ht/8);//center of S
point(x+(3*wd/8),y+ht/2);
point(x+(wd/4),y+(.75*ht-ht/8));
point(x+(wd/8),y+ht/2);

beginShape();
stroke(#7BB6A7);
strokeCap(PROJECT);
  curveVertex(x+.25*wd,y+.5*ht);
  curveVertex(x+(3*wd/8),y+.25*ht);
  curveVertex(x+(wd/4),y+ht/8);
  curveVertex(x+(wd/8),y+.25*ht);
  
  curveVertex(x+(wd/4),y+3*ht/8);//center of S
  curveVertex(x+(3*wd/8),y+ht/2);
  curveVertex(x+(wd/4),y+(.75*ht-ht/8));
  curveVertex(x+(wd/8),y+ht/2);
  curveVertex(x+.25*wd,y+.25*ht);
endShape();

/*points for l
stroke(255,0,0);
point(x+wd/2,y+ht/2);
point(x+wd/2,y+3*ht/4);
point(x+5*wd/8,y+7*ht/8);
point(x+6*wd/8,y+3*ht/4);*/
//shape
stroke(#9B8776);
strokeWeight(10);
strokeCap(ROUND);
beginShape();
  curveVertex(x+.025*wd,y+1.25*ht);
  curveVertex(x+wd/2,y+ht/2);
  curveVertex(x+wd/2,y+3*ht/4);
  curveVertex(x+5*wd/8,y+7*ht/8);
  curveVertex(x+6*wd/8,y+3*ht/4);
  curveVertex(x+.75*wd,y+.75*ht);
endShape();

//points for r
stroke(#D25B4F);
line(x+(5*wd/8),y+(3*ht/8), x+(5*wd/8), y+3*ht/4);
beginShape();
  curveVertex(x+.5*wd,y+ht);
  curveVertex(x+(5*wd/8),y+ht/2);
  curveVertex(x+(6*wd/8),y+3*ht/8);
  curveVertex(x+(7*wd/8),y+ht/2);
  curveVertex(x+.75*wd,y+.5*ht);
endShape();
//saveFrame("hw-2.jpg");



                
