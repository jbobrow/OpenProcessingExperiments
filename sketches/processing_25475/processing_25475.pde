
size(400,400);
smooth();

//Handle//
line(150,75,150,50);
line(250,75,250,50);
line(150,50,250,50);

//Top Box//
fill(0);
rect(100,75,200,20);

//Eyes//
fill(255);
ellipse(150,110,30,30);
ellipse(250,110,30,30);

//Pupils//
fill(0);
ellipse(150,110,15,15);
ellipse(250,110,15,15);

//Main box//
fill(255);
rectMode(CENTER);
rect(200,200,200,150);

//Smile//
arc(200,200,50,50,QUARTER_PI, PI+QUARTER_PI);

//Hands//
line(50,175,100,175);
line(300,175,350,175);

//Legs//
line(150,275,150,350);
line(250,275,250,350);
//Feet//
line(125,350,150,350);
line(250,350,275,350);

