
//størrelsen

size(500,500);

background(255,255,255);

//græsset

stroke(29,206,21);

fill(29,206,21);

rect(0,300,500,200);

//Himmel

fill(0,189,255);

stroke(0,189,255);

rect(0,0,500,300);

//huset

stroke(0,0,0);

fill(121,0,0);

rect(150,320,100,100);

fill(0,0,0);

triangle(150,320,250,320,200,270);

fill(0,0,0);

quad(200,270,275,205,320,250,250,320);

fill(121,0,0);

quad(250,420,320,340,320,250,250,320);

stroke(54,54,54);

line(200,270,250,320);

stroke(0,0,0);

//skorsten

fill(0,0,0);

quad(175,295,190,280,190,270,175,270);

//sol

stroke(0,0,0);

fill(250,255,0);

ellipse(0,0,100,100);

//Man

line(350,290,350,325);

line(350,325,335,350);

line(350,325,365,350);

line(350,310,365,300);

line(350,310,335,300);

fill(255,255,255);

ellipse(350,290,20,20);

//skyer

arc(400, 100, 50, 50, 1,PI);

arc(385,90,50,50,1.5,PI+QUARTER_PI);

arc(375,80,50,50,1.5,PI+QUARTER_PI+QUARTER_PI);

arc(375,70,50,50,2,PI+HALF_PI+QUARTER_PI);

arc(390,60,50,50,2,PI+HALF_PI+HALF_PI);

arc(410,60,50,50,4,PI+HALF_PI+HALF_PI+QUARTER_PI);

arc(425,80,50,50,4,TWO_PI+HALF_PI);

arc(415,100,50,50,5,TWO_PI+HALF_PI+QUARTER_PI);

stroke(255,255,255);

ellipse(400,80,60,60);




