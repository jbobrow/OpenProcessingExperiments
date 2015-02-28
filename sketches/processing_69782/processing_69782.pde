
/** 
Assignment1
Susan Anderson
swanderson@brynmawr.edu
CS110-001
9/12/12
A picture of Ben Franklin being electrocuted 
during his kite experiment.
*/

size(600,600);
smooth();
background(24,22,93);

//body
noStroke();
fill(30,75,147);
rectMode(CORNERS);
rect(190,330,310,490);
triangle(190,330, 140,490, 190,490);
triangle(310,330, 360,490, 310,490);
fill(255);
triangle(190,330, 310,330, 250,400);

//face circles
stroke(0);
fill(255,245,242);
ellipse(250,250,200,200);
fill(255);
ellipse(290,220,25,25);
ellipse(210,220,25,25);
fill(0);
ellipse(250,300,50,50);
ellipse(290,220,10,10);
ellipse(210,220,10,10);

//glasses
noFill();
rectMode(CENTER);
rect(290,220,65,30);
rect(210,220,65,30);
arc(250,230,20,30,3.634,5.783);
line(320,220,340,200);
line(180,220,160,200);

//nose 
arc(250,260,30,20,-.75,0.848);
arc(250,260,30,20,2.294,3.75);
fill(0);
ellipse(258,265,6,3);
ellipse(240,265,6,3);

//buttons of jacket
stroke(0);
fill(0);
line(253,400, 253,490);
ellipse(249,415,4,4);
ellipse(249,445,4,4);
ellipse(249,475,4,4);

//pants
fill(50,40,25);
noStroke();
rectMode(CORNER);
rect(190,490,120,120);
stroke(0); 
line(250,490,250,600);

//hair
noStroke();
fill(85,50,27);
arc(340,235,50,70,4.593,7.1);
arc(160,235,50,70,2.3,4.793);
arc(350,300,50,90,4.593,7.1);
arc(150,300,50,90,2.3,4.793);
triangle(340,235, 350,300, 370,275);
triangle(160,235, 150,300, 130,275);

//arms
stroke(30,75,147);
strokeWeight(25);
strokeJoin(ROUND);
line(200,400, 120,370);
line(300,400, 380,370);
line(120,370, 150,300);
line(380,370, 410,300);

//hands
fill(255,245,242);
stroke(0);
strokeWeight(1);
ellipse(150,300,35,35);
ellipse(410,300,35,35);

//kite string
noFill();
bezier(419,283, 420,243, 600,185, 592,0);

//key
strokeWeight(5);
ellipse(525,185, 20,20);
strokeWeight(2);
line(523,195, 523,230);
line(523,230, 533,230);
line(523,220, 530,220);
  
//electricity
fill(255,255,0);
stroke(255,255,0);

//upper left bolt
triangle(42,42, 72,102, 102,102);
triangle(90,90, 120,90, 150,150);

//upper right bolt
triangle(458,42, 428,102, 398,102);
triangle(410,90, 380,90, 350,150);

//lower left bolt
triangle(150,420, 120,480, 90,480);
triangle(102,468, 72,468, 42,528);

//lower right bolt
triangle(350,420, 380,480, 410,480);
triangle(398,468, 428,468, 458,528);

