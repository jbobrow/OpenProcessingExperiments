
//HW2 - Computing for the Arts with Processing 11:30
//Copyright © 2012 Tony Zhang

smooth();
size(400,400);
background(181,215,216);

float x,y,wd,ht;

x=width*.5;
y=height*.5;
wd=250;
ht=250;

//bright blue circle
ellipseMode(CENTER);
fill(82,170,227);
noStroke();
strokeWeight(5);
ellipse(x,y,wd*1.5,ht*1.5);

//yellow with red stroke
ellipseMode(CENTER);
fill(255,255,188);
stroke(200,0,0);
strokeWeight(5);
ellipse(x,y,wd,ht);

//thin red
ellipseMode(CENTER);
noFill();
stroke(200,0,0);
strokeWeight(1);
ellipse(x,y,wd*1.05,ht*1.05);

//thin white
ellipseMode(CENTER);
noFill();
stroke(255,255,255);
strokeWeight(1);
ellipse(x,y,wd*1.55,ht*1.55);
ellipse(x,y,wd*1.58,ht*1.58);
ellipse(x,y,wd*1.61,ht*1.61);
ellipse(x,y,wd*1.65,ht*1.65);
ellipse(x,y,wd*1.70,ht*1.70);
ellipse(x,y,wd*1.78,ht*1.78);
ellipse(x,y,wd*1.88,ht*1.88);
ellipse(x,y,wd*2,ht*2);

//thin dark blue
ellipseMode(CENTER);
noFill();
stroke(29,50,167);
strokeWeight(1);
ellipse(x,y,wd*1.48,ht*1.48);
ellipse(x,y,wd*1.44,ht*1.44);

//begin initials
beginShape();
  //t cap
    stroke(250,132,35);
    strokeWeight(5);
    strokeCap(SQUARE);
    curveVertex(x,y+ht/10);
    curveVertex(x-wd/10,y);
    curveVertex(x-wd/4,y-ht/20);
    curveVertex(x-wd/2.4,y);
    curveVertex(x-wd/2.2,y+ht/10);
endShape();

beginShape();
  //t stem
    stroke(26,69,160);
    strokeWeight(5);
    strokeCap(SQUARE);
    curveVertex(x-wd/4,y-ht/10);
    curveVertex(x-wd/4,y);
    curveVertex(x-wd/4,y+ht/3.1);
    curveVertex(x-wd/4,y+ht/3);
endShape();

beginShape();
  //t stem pt.2
    stroke(200,0,0);
    strokeWeight(3);
    strokeCap(SQUARE);
    curveVertex(x-wd/5,y-ht/10);
    curveVertex(x-wd/5,y+ht/10);
    curveVertex(x-wd/5,y+ht/3.6);
    curveVertex(x-wd/5,y+ht/2);
endShape();

beginShape();
  //y top
    stroke(200,0,0);
    strokeWeight(6);
    strokeCap(SQUARE);
    curveVertex(x-wd/10,y-ht/2);
    curveVertex(x-wd/10,y-ht/3);
    curveVertex(x-wd/12,y-ht/7);
    curveVertex(x,y-ht/10);
    curveVertex(x+wd/12,y-ht/7);
    curveVertex(x+wd/10,y-ht/3);
    curveVertex(x+wd/10,y-ht/2);
endShape();

beginShape();
  //y stem
    stroke(26,69,160);
    strokeWeight(3);
    strokeCap(SQUARE);
    curveVertex(x,y-ht/1.5);
    curveVertex(x,y-ht/5);
    curveVertex(x,y+ht/2.5);
    curveVertex(x,y+ht/1.5);
endShape();

beginShape();
  //z middle
    stroke(200,0,0);
    strokeWeight(3);
    strokeCap(SQUARE);
    curveVertex(x+wd/2,y-ht/5);
    curveVertex(x+wd/2.7,y);
    curveVertex(x+wd/6.5,y+ht/6);
    curveVertex(x+wd/8,y+ht/3);
    curveVertex(x+wd/9,y+ht/2);
endShape();

beginShape();
  //z top
    stroke(250,132,35);
    strokeWeight(5);
    strokeCap(PROJECT);
    curveVertex(x,y+ht/10);
    curveVertex(x+wd/8,y);
    curveVertex(x+wd/2.7,y);
    curveVertex(x+wd/2,y+ht/10);
endShape();

beginShape();
  //z bottom
    stroke(26,69,160);
    strokeWeight(5);
    strokeCap(SQUARE);
    curveVertex(x,y+ht/3.3);
    curveVertex(x+wd/6,y+ht/3.3);
    curveVertex(x+wd/3.2,y+ht/3.3);
    curveVertex(x+wd/2,y+ht/3.3);
endShape();

//saveFrame("hw2.jpg");

