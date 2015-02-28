
//My initials, homework one
//Copyright Shree Lakshmi Rao, January 2012
size(400,400);
background(#EADACE);
noStroke();
smooth();
fill(255,255,255);
//Drawing the S
//triangle(100,100,100,120,120,110);
//triangle(100,200,100,220,80,210);
stroke(255);
strokeWeight(2);
//line(75,150,125,175);
//noFill();
arc(50,100,100,75,PI, 2*PI);
arc(50,275,100,75,0, PI);
line(0, 100, 100, 275);
//Gestalting it
noStroke();
fill(#957A65);
ellipse(50,100,75,50);
ellipse(50,275,75,50);

stroke(255);
//Drawing the L
line(150,0,150,350);
line(120,0,120,325);
line(180,0,180,375);
line(120,325,400,325);
line(150,350,400,350);
line(180,375,400,375);

//Drawing the R
noStroke();
fill(#957A65);
quad(300,63,330,63,310,325,280,325);
triangle(330,63,315,200,355,150);
ellipse(315, 200,10,10);
ellipse(322,210,10,10);
ellipse(329,220,10,10);
ellipse(336,230,10,10);
ellipse(343,240,10,10);
ellipse(350,250,10,10);
ellipse(357,260,10,10);
ellipse(364,270,10,10);
ellipse(371,280,10,10);
ellipse(378,290,10,10);
ellipse(386,300,10,10);
ellipse(393,310,10,10);
fill(255);
triangle(325,100,320,150,350,150);

saveFrame("hw1.jpg");
                
                
