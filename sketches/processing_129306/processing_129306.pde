
//Lauren Ruoff lruoff
//Homework 2
//copyright 2014

size(400, 400);
background(179, 180, 118);

float x =200;
float y =200;
float wd =200;
float ht =200;

//head
noStroke();
fill(245, 221, 190);
ellipse(x, y, wd, ht);

//chin
beginShape();
  curveVertex(x+wd*-.4, y+ht*.3);
  curveVertex(x+wd*-.41, y+ht*.3); //(x-70)
  curveVertex(x, y+ht*.53);
  curveVertex(x+wd*.41, y+ht*.3);
  curveVertex(x+wd*.4, y+ht*.3);
endShape();

//beard
stroke(57, 39, 18);
strokeWeight(10);
beginShape();
  curveVertex(x+wd*-.4, y+ht*-.3);
  curveVertex(x+wd*-.5, y+ht*.1); 
  curveVertex(x+wd*-.4, y+ht*.32);
  curveVertex(x, y+ht*.53);
   curveVertex(x+wd*.4, y+ht*.32);
  curveVertex(x+wd*.5, y+ht*.1);
  curveVertex(x+wd*.4, y+ht*-.3);
endShape();

//eyes
point(x+wd*.2, y);
point(x+wd*-.2, y);

//nose
strokeWeight(2);
beginShape();
  curveVertex(x+wd*+.03, y+ht*-.0003);
  curveVertex(x+wd*-.003, y+ht*-.0003);
  curveVertex(x+wd*-.05, y+ht*.2);
curveVertex(x+wd*.5, y+ht*.25);
endShape();


//ears
noStroke();
ellipse(x+wd*-.51, y+ht*.05, wd*.1, ht*.2);
ellipse(x+wd*.51, y+ht*.05, wd*.1, ht*.2);



/////////////////////NEW

/////////////////////In stating the height and width of the arcs, do not need to use x or y just width and height
//top of hair
fill(57, 39, 18);
arc(x, y+ht*-.15, wd*.95, ht*.75, PI, TWO_PI);

//hair sides
arc(x+wd*.4, y+ht*-.065, wd*.175, ht*.4, PI, TWO_PI);
arc(x+wd*-.4, y+ht*-.065, wd*.175, ht*.4, PI, TWO_PI);



//nude ellipses for curls //left to right
fill(245, 221, 190);
arc(x+wd*-.075, y+ht*-.1, wd*.4, ht*.25, PI, TWO_PI);
arc(x+wd*.1, y+ht*-.1, wd*.25, ht*.275, PI, TWO_PI);
arc(x+wd*.375, y+ht*-.05, wd*.2, ht*.3, PI, TWO_PI);
arc(x+wd*-.375, y+ht*-.065,wd*.20, ht*.25, PI, TWO_PI);


//mouth
fill(234, 73, 73);
beginShape();
  curveVertex(x+wd*-.05, y+ht*.35);
  curveVertex(x+wd*-.05, y+ht*.3);
  curveVertex(x+wd*.05, y+ht*.425);
  curveVertex(x+wd*.175, y+ht*.25);
  curveVertex(x+wd*.1, y+ht*.20);
endShape();

//R in mouth
strokeWeight(2);
noFill();
stroke(188, 44, 44);
beginShape();
  curveVertex(x+wd*-.05, y+ht*.35);
  curveVertex(x+wd*-.05, y+ht*.3);
  curveVertex(x+wd*.05, y+ht*.425);
  curveVertex(x+wd*.1, y+ht*.29);
  curveVertex(x+wd*.15, y+ht*.305);
  curveVertex(x+wd*.15, y+ht*.305);
endShape();

//line in R
line(x+wd*-.05, y+ht*.3, x+wd*.175, y+ht*.25);


