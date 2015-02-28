
//tuesday Sept 3
//Shanna Chan 

size(400,400);
background (255,255,191);

//variables 
float x=200;
float y=150;

float wd=20;
float ht=20;



beginShape();

stroke(0);
//nose and s
noFill();
beginShape();
  curveVertex(x,y-ht*.75);
  curveVertex(x-wd*.5,y-ht);
  curveVertex(x-wd*.6,y-ht*.75);
  curveVertex(x,y);
  curveVertex(x+wd,y+ht);
  curveVertex(x,y+ht*1.5);
  curveVertex(x-wd*2,y+ht*2.5);
endShape();

//mustache 
stroke(153);
strokeWeight(4);
fill(153);
beginShape();
curveVertex(x-wd, y+ht);
  curveVertex(x-wd* 1.5,y+ht*3);
  curveVertex(x-wd*.5,y+ht* 1.5);
  curveVertex(x+wd* .5,y+ht* 1.5);
  curveVertex(x+wd* 1.5,y+ht* 3);
  curveVertex(x+wd,y+ht* 5);
endShape();

//eyes
stroke(0);
strokeWeight(2);
line (x-wd*1.25,y+ht*.125,x-wd*2,y+ht*.25);
line (x+wd,y-ht*.325,x+wd*.5,y-ht*.25);

//Glasses
stroke(153);
noFill();
strokeWeight(2);
ellipse(x-wd*1.75,y+ht*.16,wd*1.5,ht*1.5);
ellipse(x+wd*.75,y-ht*.4,wd*1.5,ht*1.5);

line(x-wd,y,x,y-ht*.2);




