

//Set UP
size(800, 800);
smooth();
background(color(255,255,255));

strokeWeight(3);
stroke(color(210,230,210));
line(40,0,40,120);
line(50,0,50,190);
strokeWeight(1);

//The Pacman
fill(color(10,30,10));
arc(430,430, 700,700, radians(25), radians(340));

fill(color(255,255,255));
ellipse(400,240, 90, 80);

//INSIDE Pacman
stroke(color(155,155,155));
fill(color(155,155,155));

//BRAIN
ellipse(300,160, 40, 40);
arc(300,160, 50, 50, radians(10), radians(40));
arc(300,160, 50, 50, radians(70), radians(100));
arc(300,160, 50, 50, radians(130), radians(160));
arc(300,160, 50, 50, radians(190), radians(220));
arc(300,160, 50, 50, radians(250), radians(280));
arc(300,160, 50, 50, radians(310), radians(340));

ellipse(310,200, 30, 30);
arc(310,200, 40, 40, radians(20), radians(50));
arc(310,200, 40, 40, radians(80), radians(110));
arc(310,200, 40, 40, radians(140), radians(170));
arc(310,200, 40, 40, radians(200), radians(230));
arc(310,200, 40, 40, radians(260), radians(290));
arc(310,200, 40, 40, radians(320), radians(350));

ellipse(360,140, 50, 50);
arc(360,140, 60, 60, radians(28), radians(70));
arc(360,140, 60, 60, radians(100), radians(142));
arc(360,140, 60, 60, radians(172), radians(214));
arc(360,140, 60, 60, radians(244), radians(286));
arc(360,140, 60, 60, radians(316), radians(358));

ellipse(250,210, 40, 40);
arc(250,210, 50, 50, radians(5), radians(30));
arc(250,210, 50, 50, radians(50), radians(75));
arc(250,210, 50, 50, radians(95), radians(120));
arc(250,210, 50, 50, radians(140), radians(165));
arc(250,210, 50, 50, radians(185), radians(210));
arc(250,210, 50, 50, radians(230), radians(255));
arc(250,210, 50, 50, radians(275), radians(300));
arc(250,210, 50, 50, radians(320), radians(345));

fill(color(0,0,0));
ellipse(300,160, 20, 20);
ellipse(310,200, 20, 20);

ellipse(360,140, 40, 40);
fill(color(155,155,155));
ellipse(360,140, 30, 30);
fill(color(0,0,0));
ellipse(360,140, 20, 20);

ellipse(250,210, 30, 30);
fill(color(155,155,155));
ellipse(250,210, 25, 25);
fill(color(0,0,0));
ellipse(250,210, 15, 15);


//Stomach

stroke(color(155,155,155));
fill(color(155,155,155));

ellipse(330,430, 180, 100);
ellipse(250,440, 100, 60);
ellipse(230,450, 90, 50);
ellipse(190,470, 60, 50);
ellipse(175,495, 50, 60);
ellipse(195,525, 55, 30);
ellipse(215,535, 60, 40);
ellipse(235,545, 60, 40);
ellipse(255,555, 50, 40);
ellipse(275,575, 40, 55);
ellipse(265,595, 40, 35);
ellipse(245,605, 60, 30);
ellipse(225,615, 60, 25);
ellipse(200,620, 70, 20);

//First Processor
strokeWeight(5);
stroke(color(155,155,155));
fill(color(0,0,0));
rect(355,385, 30, 40);
rect(360,360, 20, 40);

strokeWeight(0);
triangle(380,465, 390, 465, 385, 440);
triangle(370,465, 380, 465, 375, 440);
triangle(360,465, 370, 465, 365, 440);
triangle(350,465, 360, 465, 355, 440);

//Second Processor
strokeWeight(5);
stroke(color(155,155,155));
fill(color(0,0,0));
rect(315,375, 30, 40);
rect(320,350, 20, 40);

strokeWeight(0);
triangle(340,465, 350, 465, 345, 440);
triangle(330,465, 340, 465, 335, 440);
triangle(320,465, 330, 465, 325, 440);
triangle(310,465, 320, 465, 315, 440);

//Third Processor
strokeWeight(5);
stroke(color(155,155,155));
fill(color(0,0,0));
rect(275,395, 30, 40);
rect(280,370, 20, 40);

strokeWeight(0);
triangle(300,465, 310, 465, 305, 440);
triangle(290,465, 300, 465, 295, 440);
triangle(280,465, 290, 465, 285, 440);
triangle(270,465, 280, 465, 275, 440);

//triangle(0,10, 10, 10, 5, 0);


//Stomach

stroke(color(155,155,155));
fill(color(155,155,155));

ellipse(460,600, 110, 110);

stroke(color(0,0,0));
fill(color(0,0,0));
ellipse(445,590, 50, 50);
ellipse(475,590, 50, 50);
triangle(498,600, 422, 600, 460, 645);


