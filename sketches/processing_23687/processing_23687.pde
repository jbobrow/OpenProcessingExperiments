
size(400,400);
background(255,255,255);

smooth();

line(155,0,100,400); //web
line(125,0,70,400);
line(0,225,300,400);
line(0,260,250,400);
line(0,355,400,200);
line(0,325,400,170);
line(0,160,145,400);
line(0,115,180,400);
line(350,0,40,400);
line(315,0,5,400);
line(0,300,400,240);
line(0,330,400,270);
line(20,400,270,0);
line(55,400,305,0);
line(20,0,150,400);
line(0,45,120,400);

line(230,390,350,278);
line(200,342,250,263);
line(380,400,400,300);

line(400,170,330,25);
line(250,130,340,192);

line(142,90,257,20);
line(40,60,117,60);

//spider

smooth();
noStroke();
color ddbrown = color(77,32,11,230);
color dbrown = color(116,57,29,230);
color brown = color(160,83,47,230);
color lbrown = color(193,129,100,230);
color white = color(255,255,255,230);
color black = color(1,2,3,255);
color Red = color(252,48,55,230);
color pink = color (250,73,218,230);

fill(dbrown); //colour for legs closest to body
ellipse(245,170,50,40);
ellipse(155,170,50,40);

ellipse(245,200,50,30);
ellipse(155,200,50,30);

ellipse(240,220,40,30);
ellipse(160,220,40,30);

fill(brown);
ellipse(265,150,40,30);
ellipse(135,150,40,30);

ellipse(270,190,40,30);
ellipse(130,190,40,30);

ellipse(265,225,30,25);
ellipse(135,225,30,25);

fill(lbrown);
ellipse(290,130,40,30);
ellipse(110,130,40,30);

ellipse(295,180,25,25);
ellipse(105,180,25,25);

ellipse(282,228,20,20);
ellipse(118,228,20,20);

fill(dbrown);
ellipse(315,140,25,25);
ellipse(85,140,25,25);

ellipse(310,190,20,20);
ellipse(90,190,20,20);

ellipse(293,238,15,15);
ellipse(107,238,15,15);

fill(ddbrown); //color for legs furthest from body
ellipse(330,150,20,20);
ellipse(70,150,20,20);

ellipse(322,200,15,15);
ellipse(78,200,15,15);

ellipse(300,245,10,10);
ellipse(100,245,10,10);

ellipse(200,200,110,80); // color for body

fill(Red);
curve(130,300,170,210,230,210,270,300); //mouth

fill(white);
triangle(165,180,195,180,180,190); //whites of eyes
triangle(235,180,205,180,220,190);

triangle(190,200,195,200,192.5,210); //teeth
triangle(205,200,210,200,207.5,210);

fill(black);
ellipse(180,185,8,8); //pupils of eyes
ellipse(220,185,8,8);

//butterfly
fill(pink);
quad(55,340,60,290,80,330,110,340);
quad(65,340,60,390,40,350,10,340);

