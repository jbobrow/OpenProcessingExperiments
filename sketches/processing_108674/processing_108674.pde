
//Amy Friedman
//amyfried
//copyright Amy Friedman Sept 2013
size(400,400);
rectMode (CENTER);

//background//
background(#A5F7D3);
noStroke();
fill(#FF553B,200);
rect(0, 150, 400, 400);
fill(#D9A9E8, 200);
rect(250, 400, 400, 400);

float x = 200;
float y = 200;
float wd = 150;
float ht = 150;

//face shape//
noStroke();
fill(#F7D3AC);
ellipse(x, y, wd, ht);

//bowtie//
fill(#F70707);
noStroke();
ellipse( x, y+ht*.5,    wd*.2,    ht*.2);
triangle(x, y+ht*.5,    x*.75, y+ht*.75,    x*.75, y+ht*.33);
triangle(x, y+ht*.5, x+wd*.33, y+ht*.75, x+wd*.33, y+ht*.33);

//dimples//
noStroke();
fill(#9B652C);//brown//
ellipse(x-wd*.27, y+ht*.17, wd*.13, ht*.13);
ellipse(x+wd*.27, y+ht*.17, wd*.13, ht*.13);
ellipse( x-wd*.2, y-ht*.12, wd*.17, ht*.13);
ellipse( x+wd*.2, y-ht*.12, wd*.17, ht*.13);
fill(#F7D3AC);//skin//
ellipse(x-wd*.28, y+ht*.16, wd*.13, ht*.13);
ellipse(x+wd*.28, y+ht*.16, wd*.13, ht*.13); 
ellipse( x-wd*.2, y-ht*.13, wd*.2, ht*.13);
ellipse( x+wd*.2, y-ht*.13, wd*.2, ht*.13);

//eyes//
stroke(200);
fill(#FFFFFF); //white eye part//
ellipse( x*.85, y*.9, wd*.2, ht*.1);
ellipse(x*1.15, y*.9, wd*.2, ht*.1);
noStroke();
fill(#836646); //iris//
ellipse(  x*.85, y*.9, wd*.09, ht*.11);
ellipse(x+wd*.2, y*.9, wd*.09, ht*.11);
fill(#030303); //pupil//
ellipse(  x*.85, y*.9, wd*.05, ht*.07);
ellipse(x+wd*.2, y*.9, wd*.05, ht*.07);
strokeWeight(8);
stroke(200);//eyebrows//
line(x*.72, y*.83, x*.9, y*.75);
line(x+wd*.28, y*.83, x+wd*.07, y*.75);

//smile//
strokeWeight(7);
stroke(#FF939F);
fill(#FFFFFF);
beginShape();
 curveVertex( x-wd*.2, y+ht*.25);
 curveVertex( x-wd*.2, y+ht*.25);
 curveVertex( x-wd*.2, y+ht*.27);
 curveVertex(x-wd*.13, y+ht*.30);
 curveVertex(       x, y+ht*.33);
 curveVertex(x+wd*.13, y+ht*.30);
 curveVertex( x+wd*.2, y+ht*.27);
 curveVertex( x+wd*.2, y+ht*.25);
 curveVertex( x+wd*.2, y+ht*.25);
endShape();

//mustache//
stroke(200);
fill(200);
beginShape();
 curveVertex( x-wd*.1, y+ht*.1);
 curveVertex( x-wd*.1, y+ht*.1);
 curveVertex(x-wd*.23, y+ht*.3);
 curveVertex(x-wd*.17, y+ht*.27);
 curveVertex( x-wd*.1, y+ht*.23);
 curveVertex(x-wd*.03, y+ht*.27);
 curveVertex(      x,  y+ht*.27);
 curveVertex(x+wd*.03, y+ht*.27);
 curveVertex( x+wd*.1, y+ht*.23);
 curveVertex(x+wd*.17, y+ht*.27);
 curveVertex(x+wd*.23, y+ht*.3);
 curveVertex( x+wd*.1, y+ht*.1);
 curveVertex( x+wd*.1, y+ht*.1);
endShape();

//nose//
strokeWeight(1);
stroke(#9B652C);
fill(#F7D3AC);
beginShape();
  curveVertex(x-wd*.15, y-ht*.2);//reference point
  curveVertex(x-wd*.07, y-ht*.2);
  curveVertex(x-wd*.05, y+ht*.02);
  curveVertex(x-wd*.1, y+ht*.1);
  curveVertex(x-wd*.11, y+ht*.17);
  curveVertex(x-wd*.06, y+ht*.15);
  curveVertex(x-wd*.03, y+ht*.18);
  curveVertex(   x*.98, y+ht*.19);
  curveVertex(       x, y+ht*.2);
  curveVertex(  x*1.02, y+ht*.19);
  curveVertex(x+wd*.03, y+ht*.18);
  curveVertex(x+wd*.06, y+ht*.15);
  curveVertex(x+wd*.11, y+ht*.17);
  curveVertex(x+wd*.13, y+ht*.16);
  curveVertex( x+wd*.1, y+ht*.1); 
  curveVertex(x+wd*.05, y+ht*.02);
  curveVertex(x+wd*.07, y-ht*.2);
  curveVertex(x+wd*.15, y-ht*.2);//reference point
endShape();
arc( x-wd*.09, y+ht*.13, x-wd*1.24, y-ht*1.25,    HALF_PI,    PI+HALF_PI, OPEN);
arc(x+wd*.095, y+ht*.13, x-wd*1.24, y-ht*1.25, PI+HALF_PI,TWO_PI+HALF_PI, OPEN);

//ears
fill(#F7D3AC);
noStroke();
ellipse(x-wd*.5, y-ht*.07, wd*.2, ht*.2);
ellipse(x+wd*.5, y-ht*.07, wd*.2, ht*.2);



//glasses//
noFill();
stroke(15);
strokeWeight(7);
fill(#E0FBFF, 125);
beginShape(); //left side//
 curveVertex(x-wd*.37, y-ht*.23);//reference point
 curveVertex(x-wd*.37, y-ht*.23);
 curveVertex(x-wd*.33, y-ht*.1);
 curveVertex(x-wd*.27, y-ht*.03);
 curveVertex(x-wd*.13, y-ht*.03);
 curveVertex(x-wd*.07, y-ht*.1);
 curveVertex(x-wd*.03, y-ht*.23);
 curveVertex(x-wd*.03, y-ht*.23);//reference point
endShape();

beginShape();//right side//
 curveVertex(x+wd*.03, y-ht*.23);//reference point
 curveVertex(x+wd*.03, y-ht*.23);
 curveVertex(x+wd*.07, y-ht*.1);
 curveVertex(x+wd*.13, y-ht*.03);
 curveVertex(x+wd*.27, y-ht*.03);
 curveVertex(x+wd*.33, y-ht*.1);
 curveVertex(x+wd*.37, y-ht*.23);
 curveVertex(x+wd*.37, y-ht*.23);//reference point
endShape();
line(x-wd*.5, y-ht*.23, x+wd*.5, y-ht*.23);
line(x-wd*.5, y-ht*.04, x-wd*.3, y-ht*.04);
line(x-wd*.5, y-ht*.23, x-wd*.5, y+ht*.5);



