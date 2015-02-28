
//Sydney C, Penguin, CP1, Mods: 4/5
smooth();
background(41,35,150);
size(300,300);
fill(152,91,45);
noStroke();
//body
ellipse(150,180,105,155);
//head
ellipse(150,110,125,125);
fill(240,235,75);
//beak
triangle(155,130,145,130,150,150);
stroke(0);
strokeWeight(3);
//left eye
ellipse(125,100,35,35);
//right eye
ellipse(175,100,35,35);
//left foot
arc(110,257,25,25,PI/2,PI+PI);
arc(120,257,25,25,PI/2,PI+PI);
arc(130,257,25,25,PI/2,PI+PI);
//right foot
arc(180,257,25,25,PI,PI+PI+PI/2);
arc(170,257,25,25,PI,PI+PI+PI/2);
arc(160,257,25,25,PI,PI+PI+PI/2);
//moon
noStroke();
ellipse(300-50,40,50,50);
fill(41,35,150);
ellipse(300-40,45,30,30);
//feet fixing-up
ellipse(135,262,15,15);
ellipse(155,262,15,15);
//pupil/iris
fill(0,0,0);
ellipse(125,100,17,17);
ellipse(175,100,17,17);
//head thingy/eyebrow(s)
fill(152,91,45);
noStroke();
triangle(65,65,235,65,150,110);
//left wing
stroke(0);
bezier(100,150,30,110+220,150,110,100,150);
bezier(100,150,50,110+235,150,110,100,150);
bezier(100,150,70,110+250,150,110,100,150);
//right wing
bezier(200,150,300-30,110+220,150,110,200,150);
bezier(200,150,300-50,110+235,150,110,200,150);
bezier(200,150,300-70,110+250,150,110,200,150);
