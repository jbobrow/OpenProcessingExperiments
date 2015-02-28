
//Hw#1 Initials
//Joshua Chang jmc1
//Copyright 2012
size(400, 400);
smooth();
noStroke();
background(0, 0, 0);
fill(0,0,0);
rect(0, 100, 400, 200);

//Lines
stroke(255,255,255);
strokeWeight(5);
line(0,150,400,150);
strokeWeight(5);
line(0,250,400,250);
strokeWeight(1);
line(0,145,400,145);
strokeWeight(1);
line(0,155,400,155);
strokeWeight(1);
line(0,245,400,245);
strokeWeight(1);
line(0,255,400,255);


//J-Bottom
stroke(255,255,255);
strokeWeight(20);
arc(100,165, 100, 50, PI, TWO_PI);
//line(50, 150, 150, 150);
arc(100, 235, 100, 50, 0, PI);
//line(50, 250, 150, 250);
//C-Bottom

arc(300, 165, 100, 50, PI, TWO_PI);
//line(250,150, 350, 150);
arc(300, 235, 100, 50, 0, PI);
//line(250,250, 350, 250);
strokeWeight(20);
//M-Bottom

line(150, 160, 150, 240);
line(150,160, 200, 230);
line(200,230, 250, 160);
line(250,160, 250, 240);

//J-Top
stroke(0, 0, 0);
strokeWeight(3);
arc(100, 165, 100, 50, PI, TWO_PI);
//line(50, 150, 150, 150);
arc(100, 235, 100, 50, 0, PI);
//line(50, 250, 150, 250);
//M-Top

line(150, 165, 150, 235);
line(161,175, 200, 230);
line(200,230, 252, 158);
line(250,165, 250, 235);

line(161,177, 161, 239);

//C-Top
arc(300, 165, 100, 50, PI, TWO_PI);
//line(250,150, 350, 150);
arc(300, 235, 100, 50, 0, PI);
//line(250,250, 350, 250);


smooth();
//Point-Cover
stroke(255,255,255);
strokeWeight(9);
point(55, 165);
point(55, 235);
point(345, 165);
point(345, 235);

//M-Cover
noStroke();
fill(0, 0, 0);
//rect(140,160,9,80);
//rect(252,160,9,80);

fill(255, 0, 0);

//ellipse(200,150,20,20);
//triangle(200, 200, 250, 130, 150, 130);
//ellipse(100,200, 70, 70);
//ellipse(300,200, 70,70);

//saveFrame("hw1.jpg");

