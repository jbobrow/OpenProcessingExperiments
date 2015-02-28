
/*
components of a city
I wanted to convey the sheer amount of stuff that goes into a city, 
from the landscape it's built on, to the water pipes, to the buildings.
*/



size(400,400);
background(50,225,245);
// (100,200,50) = green
noStroke();

int x =100;
int y = 10;

//nature
ellipseMode(CENTER);
fill (255);
smooth();
strokeWeight(50);
strokeJoin(ROUND);
stroke(255);
bezier(x-50,y+50,x-25,y+30,x,y+75,x+20,y+50);
x += 135;
y -= 30;
bezier(x-50,y+50,x-25,y+30,x,y+75,x+20,y+50);
x += 120;
y += 70;
bezier(x-50,y+50,x-25,y+30,x,y+75,x+20,y+50);

noStroke();
fill(100,200,50);
x = 0;
y=400;
bezier(x-200,y,x+50,y-320,x+300,y-320,x+600,y);

//houses
fill(77,44,33,200);
rectMode(CENTER);
x=50;
y=200;
rect(x, y, 20, 20);
triangle(x-13, y-10, x+13,y-10,x,y-20);
rect(x+50, y-15, 20, 20);
triangle(x+50-13, y-25,x+63,y-25,x+50,y-35);
rect(x+100, y+5, 20, 20);
triangle(x+100-13, y+5-10,x+100+13,y+5-10,x+100,y+5-20);
rect(x+200, y-10, 20, 20);
triangle(x+200-13, y-10-10,x+200+13,y-10-10,x+200,y-10-20);
rect(x+140, y+20, 20, 20);
triangle(x+140-13, y+20-10,x+140+13,y+20-10,x+140,y+20-20);
rect(x+125, y-40, 20, 20);
triangle(x+125-13, y-40-10,x+125+13,y-40-10,x+125,y-40-20);
rect(x+300, y+5, 20, 20);
triangle(x+300-13, y+5-10,x+300+13,y+5-10,x+300,y+5-20);

//roads
noFill();
strokeWeight(8);
stroke(50,150);
strokeJoin(MITER);
beginShape();
vertex(x,y+11);
vertex(x+10,y+100);
vertex(x-15,y+170);
vertex(x-5,y+200);
endShape();

x+=10;
y+=100;
beginShape();
vertex(x,y);
vertex(x+30,y-70);
vertex(x+80,y-70);
vertex(x+150,y-95);
vertex(x+200,y-87);
vertex(x+260,y-92);
endShape();


line(0,370,400,390);
line(0,340,400,330);
line(0,300,400,300);
line(60,300,90,400);
line(20,300,-5,400);
line(100,400,102,300);
line(130,337,137,230);
line(140,400,150,338);
line(190,380,165,300);
line (240,300,220,400);
line(290,300,290,400);
line(320,300,322,400);
line(375,300,375,400);
line(230,360,405,360);
line(200,300,270,213);

//water pipes
noFill();
strokeWeight(5);
stroke(50,225,245,180);
strokeJoin(ROUND);

x=63;
y=195;

beginShape();
vertex(x,y);
vertex(x+5,y);
vertex(x+5,y+15);
vertex(x+35,y+15);
vertex(x+35,y+75);
vertex(x-50,y+75);
vertex(x-50,y+132);
vertex(x+80,y+132);//
vertex(x+80,y+150);
vertex(x+50,y+150);
vertex(x+50,y+210);
endShape();
line(x+50,y+180,x-70,y+180);
beginShape();
vertex(x+80,y+132);
vertex(x+80,y+100);
vertex(x+60,y+100);
vertex(x+60,y+50);
vertex(x+160,y+50);//
vertex(x+160,y);
vertex(x+100,y);
vertex(x+100,y-15);
vertex(x+175,y-15);
endShape();
beginShape();
vertex(x+160,y+50);
vertex(x+170,y+50);
vertex(x+170,y+90);
vertex(x+230,y+90);
vertex(x+230,y+170);
vertex(x+280,y+170);
vertex(x+280,y+210);
endShape();
beginShape();
vertex(x+230,y+90);
vertex(x+295,y+90);
vertex(x+295,y+23);
endShape();

//factories
noStroke();
fill(150,130,96,170);
rectMode(CENTER);
ellipseMode(CENTER);

x=45;
y=240;
rect(x,y,75,50);
rect(x-15,y-35,10,20);
ellipse(x-15,y-49,7,7);
ellipse(x-13,y-55,12,12);
ellipse(x-18,y-65,20,20);
ellipse(x-5,y-70,25,25);
ellipse(x-16,y-85,35,35);
ellipse(x+8,y-95,42,42);
ellipse(x-6,y-120,55,55);
ellipse(x+36,y-125,75,75);
x+=130;
y+=25;
rect(x,y,75,50);
rect(x-15,y-35,10,20);
ellipse(x-15,y-49,7,7);
ellipse(x-13,y-55,12,12);
ellipse(x-18,y-65,20,20);
ellipse(x-5,y-70,25,25);
ellipse(x-16,y-85,35,35);
ellipse(x+8,y-95,42,42);
ellipse(x-6,y-120,55,55);
ellipse(x+36,y-125,75,75);
x=315;
y=240;
rect(x,y,75,50);
rect(x-15,y-35,10,20);
ellipse(x-15,y-49,7,7);
ellipse(x-13,y-55,12,12);
ellipse(x-18,y-65,20,20);
ellipse(x-5,y-70,25,25);
ellipse(x-16,y-85,35,35);
ellipse(x+8,y-95,42,42);
ellipse(x-6,y-120,55,55);
ellipse(x+36,y-125,75,75);

//power lines
noFill();
strokeWeight(3);
stroke(50,200);

x=0;
y=285;
line(x+20,y,x+20,y-70);
line(x+115,y-30,x+115,y-100);
line(x+230,y-50,x+230,y-120);
line(x+290,y+5,x+290,y-65);
line(x+380,y-10,x+380,y-80);

bezier(-40,y-60,-20,y-40,x,y-40,x+20,y-60);
bezier(x+20,y-60,x+50,y-40,x+85,y-65,x+115,y-90);
bezier(x+115,y-90,x+190,y-70,x+200,y-90,x+230,y-110);
bezier(x+230,y-110,x+240,y-55,x+270,y-35,x+290,y-55);
bezier(x+290,y-55,x+320,y-35,x+360,y-40,x+380,y-70);
bezier(x+380,y-70,400,y-50,415,y-50,430,y-70);


//skyscrapers
fill(100,100);
noStroke();

x=40;
y=200;

rect(x,y,35,250);
rect(x+30,y+80,55,175);
rect(x+50,y+120,70,45);
rect(x+100,y+10,30,350);
rect(x+130,y+120,50,100);
rect(x+160,y+60,60,180);
rect(x+220,y+20,40,200);
rect(x+210,y+140,90,70);
rect(x+270,y+55,25,190);
rect(x+305,y-5,35,250);
rect(x+310,y+115,75,60);


