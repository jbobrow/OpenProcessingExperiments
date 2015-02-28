
// Assignment #
// Name: Wenyu Pan
// E-mail: wpan@brynmawr.edu
// Date: September 6, 2010

void setup(){
size(500,500);
smooth();
background(126,204,255);}

void draw(){
  //draw the lower body of the mermaid
  noStroke();
  fill(100,100,255);
  triangle(200,250,300,250,250,400);
  fill(255,0,0);
  arc(250,450,100,100,PI,TWO_PI);
  fill(126,204,255);
  arc(275,450,50,20,PI,TWO_PI);
  arc(225,450,50,20,PI,TWO_PI);
  //draw the upper body of the mermaid
  fill(245,219,171);
  beginShape();
  curveVertex(200,250);
  curveVertex(230,200);
  curveVertex(200,140);
  curveVertex(190,180);
  curveVertex(170,180);
  curveVertex(140,150);
  curveVertex(130,140);
  curveVertex(150,140);
  curveVertex(175,175);
  curveVertex(190,125);
  curveVertex(305,125);
  curveVertex(330,170);
  curveVertex(340,220);
  curveVertex(340,230);
  curveVertex(320,180);
  curveVertex(300,140);
  curveVertex(270,200);
  curveVertex(300,250);
  curveVertex(200,250);
  curveVertex(230,200);
  endShape();
  strokeWeight(2);
  stroke(250,195,93);
  line(250,210,250,220);
  ellipse(250,215,3,3);
  stroke(250,195,93);
  fill(245,219,171);
  arc(230,150,50,50,PI/2,TWO_PI-PI/2);
  stroke(250,195,93);
  fill(245,219,171);
  arc(270,150,50,50,-PI/4,PI/2);
  //draw the head and hair of the mermaid
  noStroke();
  fill(245,219,171);
  ellipse(250,90,50,90);
  fill(103,68,10);
  beginShape();
  curveVertex(250,40);
  curveVertex(270,50);
  curveVertex(290,90);
  curveVertex(280,130);
  curveVertex(270,100);
  curveVertex(250,40);
  curveVertex(270,50);
  endShape(CLOSE);
  beginShape();
  curveVertex(250,40);
  curveVertex(230,50);
  curveVertex(210,90);
  curveVertex(220,130);
  curveVertex(230,100);
  curveVertex(250,40);
  curveVertex(230,50);
  endShape(CLOSE);
  ellipse(250,60,30,40);
  fill(0);
  ellipse(240,90,10,5);
  ellipse(260,90,10,5);
  fill(227,10,24);
  strokeWeight(2);
  stroke(255,10,10);
  arc(250,110,15,8,PI/4,PI-PI/4);}
  
  

