
size(186,175);
background(250,246,221);
strokeWeight(1);
smooth();

int r;
int g;
int b;
r=236;
g=65;
b=0;

//star
line(120,135,118,160);
line(105,145,130,145);
line(130,135,105,160);
line(110,135,130,160);

//beziers
noFill();
bezier(0,5,12,25,15,25,0,40);
bezier(186,145,90,110,60,60,165,0);
bezier(20,110,0,100,20,100,0,80);

//triangle(kind of)
fill(0);
ellipse(0,80,10,10);
triangle(10,92,-30,120,10,115);
fill(r, g, b);
triangle(10,92,30,120,10,115); 


//big circle
fill(0);
ellipse(70,155,45,35);
ellipse(70,125,13,9);
fill(r,g,b);
arc(70, 155, 45, 35, PI / 2, 3 * PI / 2); 
line(70,125,70,150);


//balls at the beziers
fill(0);
ellipse(5,17,13,13);
fill(r,g,b);
arc(5,17,13,13, PI / 2, 3 * PI/2 );

fill(0);
ellipse(145,15,10,10);
fill(r,g,b);
arc(145,15,10,10,3 * PI / 4, 7 * PI / 4);

fill(0);
ellipse (125,30,9,9);
fill(r,g,b);
arc(125,30,9,9, -PI / 4, 3 * PI / 4);

fill(0);
ellipse(132,120,10,10);
fill(r,g,b);
arc(132,120,10,10, -PI / 4, 3 * PI / 4);

fill(0);
ellipse(160,135,13,13);
fill(r,g,b);
arc(160,135,15,15, 7 * PI/6, 5 *PI/ 3);

//purple star
fill(83,70,152,220);
triangle(60,155,40,140,40,160);
fill(83,70,152);
triangle(40,140,30,110,20,145);
triangle(20,145,-10,150,20,160);
triangle(20,160,-5,175,30,167);
triangle(30,167,40,200,40,160);
noStroke();
fill(83,70,152);
rect(20,143,22,22);

//at the middle 
fill(236,65,0);
beginShape();
curveVertex(120,110);
curveVertex(120,110);
curveVertex(120,80);
curveVertex(100,80);
curveVertex(100,90);
curveVertex(120,110);
curveVertex(120,110);
endShape();
  
fill(0);
noStroke();
  beginShape();
  curveVertex(30, 0); // the first control point
  curveVertex(30, 0); // is also the start point of curve
  curveVertex(27,50);
  curveVertex(40,90);
  curveVertex(70,110);
  curveVertex(100,110);
  curveVertex(120,110);//meets with red bezier
  curveVertex(100,80);
  curveVertex(80,75);
  curveVertex(80,48);
  curveVertex(90, 0); // the last point of curve
  curveVertex(90,0); // is also the last control point
  endShape();

fill(236,65,0);
beginShape();
curveVertex(110,105);
curveVertex(110,105);
curveVertex(118,82);
endShape();

fill(236,65,0);
beginShape();
curveVertex(5,10);
curveVertex(5,10);
curveVertex(10,20);
curveVertex(10,20);
endShape();

  

  

 

