
//Homework 2, 60-757
//Copyright: Angela Kolosky, Pittsburgh, PA, September 2013

size(400,400);
rectMode(CENTER);
background(1,82,1);

//variables
float x=200;
float y=200;

float wd=300;
float ht=300;

//background pattern
stroke(82,1,10);
line(x,y-ht,x,y+ht);
strokeWeight(3);
line(x-wd*.5,y-ht,x-wd*.5,y+ht);
line(x+wd*.5,y-ht,x+wd*.5,y+ht);
stroke(1,15,82);
strokeWeight(1);
line(x-wd,y,x+wd,y);
strokeWeight(3);
line(x-wd,y-ht*.5,x+wd,y-ht*.5);
line(x-wd,y+ht*.5,x+wd,y+ht*.5);
stroke(211,187,0);
strokeWeight(.5);
line(x-wd*.25,y-ht,x-wd*.25,y+ht);
line(x+wd*.25,y-ht,x+wd*.25,y+ht);
line(x-wd,y-ht*.25,x+wd,y-ht*.25);
line(x-wd,y+ht*.25,x+wd,y+ht*.25);

//design code
  //circle
  fill(250,210,189);
  noStroke();
  ellipse(x,y,wd*.5,ht*.5);
  
  //eyes
  noStroke();
  fill(255);
  ellipse(x-wd*.125,y-ht*.05,wd*.1,ht*.1); //left white
  ellipse(x+wd*.125,y-ht*.05,wd*.1,ht*.1); //right white
  fill(0);
  ellipse(x-wd*.125,y-ht*.05,wd*.05,ht*.05); //left black
  ellipse(x+wd*.125,y-ht*.05,wd*.05,ht*.05);  //right black
  
  //glasses
  stroke(0);
  strokeWeight(2);
  line(x-wd*.25,y-ht*.1,x+wd*.25,y-ht*.1); //top bar of glasses
  line(x-wd*.25,y+ht*.1,x,y-ht*.1); //left frame
  line(x,y-ht*.1,x+wd*.25,y+ht*.1); //right frame
  noStroke();
  fill(189,216,250,50);
  triangle(x-wd*.25,y-ht*.1,x,y-ht*.1,x-wd*.25,y+ht*.1); //glass left
  triangle(x,y-ht*.1,x+wd*.25,y-ht*.1,x+wd*.25,y+ht*.1); //glass right
  
  //mustache
  fill(175,150,117);
  beginShape();
    curveVertex(x+wd*.25,y-ht*.1);
    curveVertex(x,y);
    curveVertex(x-wd*.125,y+ht*.01);
    curveVertex(x-wd*.25,y+ht*.25);
    curveVertex(x-wd*.125,y+ht*.125);
    curveVertex(x,y);
    curveVertex(x+wd*.25,y-ht*.1);
  endShape(CLOSE); //left side
  beginShape();
    curveVertex(x-wd*.25,y-ht*.1);
    curveVertex(x,y);
    curveVertex(x+wd*.125,y+ht*.01);
    curveVertex(x+wd*.25,y+ht*.25);
    curveVertex(x+wd*.125,y+ht*.125);
    curveVertex(x,y);
    curveVertex(x-wd*.25,y-ht*.1);
  endShape(CLOSE); //right side
  
  //mouth
  noFill();
  stroke(0);
  strokeWeight(1);
  beginShape();
    curveVertex(x-wd*.25,y+ht*.25);
    curveVertex(x-wd*.125,y+ht*.125);
    curveVertex(x,y+ht*.06);
    curveVertex(x+wd*.125,y+ht*.125);
    curveVertex(x+wd*.25,y+ht*.25);
  endShape();
  
  //hair
  stroke(175,150,117);
  strokeWeight(3);
  beginShape();
    curveVertex(x-wd*.25,y-ht*.1);
    curveVertex(x-wd*.125,y-ht*.2);
    curveVertex(x,y-ht*.185);
    curveVertex(x+wd*.125,y-ht*.2);
    curveVertex(x+wd*.25,y-ht*.1);
  endShape();
  


