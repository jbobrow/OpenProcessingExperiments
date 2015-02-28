
//PAUL RIVERA - RELATIVE FACE SKETCH
size(500, 500);
background(255);
smooth();
//noStroke();

int xCent= width/2;
int yCent = height/2;

float xpos = width*0.2;
float ypos = height*0.2;

//println(xpos);


strokeWeight(xpos*0.015);
rectMode(CENTER);
rect(xCent, ypos*1.27, xpos*1.32, ypos*1.68);

strokeCap(ROUND);
strokeWeight(ypos*.03);
line(xpos*1.59, ypos*.66, xpos*2.10, ypos*.66);
line(xpos*2.91, ypos*.66, xpos*3.42, ypos*.66);

//noStroke();
fill(0);
ellipseMode(CENTER);
ellipse(xpos*1.845, ypos*1.09, xpos*0.07145, ypos*0.07145);
ellipse(xpos*3.1653, ypos*1.09, xpos*.17, ypos*.17);

rectMode(CORNER);
rect(xpos*2.48, ypos*.425, xpos*.05, ypos*2.60);

triangle(xpos*1.74,ypos*2.56, xpos*2.22,ypos*2.38, xpos*2.22, ypos*2.73);
triangle(xpos*2.80,ypos*2.38, xpos*3.28,ypos*2.56, xpos*2.80, ypos*2.74);

rect(xpos*.45,ypos*3.64, xpos*4.13, ypos*.92);

fill(255);
quad(xpos*1.62,ypos*3.03, xpos*3.39,ypos*3.02, xpos*3.83,ypos*3.74, xpos*1.16,ypos*3.74);

line(xpos*1.51,ypos*3.195, xpos*3.493,ypos*3.195);
line(xpos*1.24,ypos*3.625, xpos*3.75, ypos*3.62);

quad(xpos*2.27,ypos*3.515, xpos*2.7363,ypos*3.515, xpos*2.68,ypos*3.73, xpos*2.32,ypos*3.74);
quad(xpos*2.2538, ypos*3.025, xpos*2.7445,ypos*3.025, xpos*2.82,ypos*3.325, xpos*2.18,ypos*3.325);

line(xpos*2.49,ypos*3.02, xpos*2.49,ypos*3.32);
line(xpos*2.49,ypos*3.51,xpos*2.49,ypos*3.73);





