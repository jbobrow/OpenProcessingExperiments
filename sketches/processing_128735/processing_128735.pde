
//Abstract
size(400,400);
background(224,224,224);

//yellow ellipse
noStroke();
fill(255,255,0,240);
ellipse(200,340,340,50);

//red rectangle
noFill();
stroke(205,0,0);
strokeWeight(1.5);
line(350,305,330,390);
line(100,280,80,345);
line(330,335,120,300);
line(310,360,100,325);

//yellow rectangle
fill(255,215,0,200);
stroke(205,0,0,250);
strokeWeight(3);
rect(50,170,300,70);

//offset rectangles
noStroke();
fill(205,133,0,190);
rectMode(CORNERS);
rect(310,30,370,130);
fill(0,0,0,250);
rectMode(CORNER);
rect(300,120,60,90);

//triangles
fill(176,23,31);
triangle(220,45,270,45,245,120);
fill(0,100,0);
triangle(245,110,210,200,276,200);

//ellipse
fill(106,90,205);
ellipse(165,115,50,160);

//offset X
stroke(104,34,139);
strokeWeight(5);
line(125,40,85,220);
stroke(0,0,128);
line(80,43,122,217);
