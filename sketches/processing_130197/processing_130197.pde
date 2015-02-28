
size(400,400);
int jelly = 5;
int bean = 5;
smooth();
ellipse(jelly*30,275,bean*6,30);
//left leg
line(jelly*30,355,bean*27,400);
//right leg
line(150,355,165,400);
//left arm
line(150,315,130,335);
line(130,335,150,345);
//right arm
stroke(0,0,0);
strokeWeight(1);
line(150,315,180,305);
//wooden stick
strokeWeight(2);
stroke(255,127,36);
line(185,310,110,290);
//bent part of right arm
strokeWeight(1);
stroke(0,0,0);
line(180,305,180,310);
//body
line(jelly*30,290,bean*30,355);
//red sack
noStroke();
fill(238,0,0);
ellipse(jelly*24,305,bean*4,25);
triangle(120,295,110,290,117,285);
triangle(120,295,129,292,123,285);
fill(255,255,255);
ellipse(115,307,3,3);
ellipse(125,302,3,3);
ellipse(123,315,3,3);
ellipse(112,300,3,3);
ellipse(120,305,3,3);
ellipse(118,312,3,3);
ellipse(126,306,3,3);
ellipse(120,298,3,3);
ellipse(117,293,3,3);
