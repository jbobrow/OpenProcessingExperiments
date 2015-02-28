
float i = 0;

void draw (){
 
  noStroke();
  smooth();
  fill(255);
  ellipse (330,250,50,30);
  
  i = i + 0.1;
   
  pushMatrix();
  translate(330,250);
  smooth();
  fill(255,114,26);
  rotate(i);
  ellipse(0,0,25,25);
  popMatrix();
   
   
  noStroke();
  smooth();
  fill(0, 183, 247, 255);
  rect (445,240,50,25);
   
  fill (0);
  noStroke();
  smooth();
  ellipse(470,250,30,15);
   
  fill (89,0,149);
  noStroke();
  smooth();
  rect (700,50,250,250);
 
  
}
 
 
 
 
 
void setup (){
 
background(200,80,50);
size(800,800);
 
fill(201,183,112);
noStroke();
beginShape();
vertex(330,470);
vertex(480,470);
vertex(480,590);
vertex(330,590);
endShape();
 
fill(211,170,119);
beginShape();
vertex(0,800);
vertex(150,620);
vertex(330,590);
vertex(480,590);
vertex(680,620);
vertex(800,800);
endShape();
 
fill(206,200,139);
noStroke();
smooth();
ellipse(410,300,350,400);
 
fill(252, 139, 0);
noStroke();
rect(250,160,20,70);
 
fill(229, 127, 2);
noStroke();
rect(270,140,20,50);
 
fill(200, 115, 4);
noStroke();
rect(290,130,20,50);
 
fill(188,100,5);
noStroke();
rect(310,115,20,50);
 
fill(167,85,7);
noStroke();
rect(330,100,20,50);
 
fill(152,70,8);
noStroke();
rect(350,90,20,50);
 
fill(128,55,10);
noStroke();
rect (370,80,20,50);
 
fill(113,40,11);
noStroke();
rect(390,75,20,50);
 
fill(60);
noStroke();
rect(410,75,20,50);
 
fill(50);
noStroke();
rect(430,80,20,50);
 
fill(40);
noStroke();
rect(450,90,20,50);
 
fill(30);
noStroke();
rect(470,100,20,50);
 
fill(20);
noStroke();
rect(490,110,20,50);
 
fill(10);
noStroke();
rect(500,120,20,50);
 
fill(5);
noStroke();
rect(520,130,20,50);
 
fill(0);
noStroke();
rect(540,150,20,70);
 
fill(206,200,139);
noStroke();
smooth();
ellipse(405,200,270,150);
 
 
 
 
fill(196,191,91);
beginShape();
curveVertex(400,250);
curveVertex(400,250);
curveVertex(405,260);
curveVertex(400,300);
curveVertex(395,305);
curveVertex(425,310);
curveVertex(418,290);
curveVertex(410,260);
curveVertex(405,255);
curveVertex(400,250);
curveVertex(400,250);
endShape();
 
fill(196,191,91);
beginShape();
curveVertex(250,250);
curveVertex(250,250);
curveVertex(255,260);
curveVertex(260,290);
curveVertex(260,295);
curveVertex(270,320);
curveVertex(245,295);
curveVertex(250,250);
curveVertex(250,250);
endShape();
 
beginShape();
curveVertex(550,250);
curveVertex(550,250);
curveVertex(565,260);
curveVertex(570,290);
curveVertex(570,295);
curveVertex(550,320);
curveVertex(555,295);
curveVertex(550,250);
curveVertex(550,250);
endShape();
 
fill(131,50,50);
beginShape();
curveVertex(370,370);
curveVertex(370,370);
curveVertex(380,390);
curveVertex(385,390);
curveVertex(440,390);
curveVertex(450,390);
curveVertex(460,370);
curveVertex(460,370);
endShape();
 
 
fill(200,0,0);
translate(width/2, height/2);
rotate(PI/3.0);
ellipse(-350, 150, 289, 289);
 
fill(79,201,206);
translate(width/2, height/2);
rotate(TWO_PI);
rect(-110,-280, 52, 52);
 

 

 
}


