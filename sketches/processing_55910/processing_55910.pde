
size(500,500);
background(200);
fill(255);
stroke(0);

//head
smooth();
fill(255,128,0);
ellipse(335,150,20,30);//ear
ellipse(165,150,20,30);//ear
fill(255,255,255);
ellipse(250,150,180,100);//head
fill(244,164,96);
ellipse(250,140,100,60);//face
fill(255,128,0);
ellipse(215,180,15,15);
ellipse(285,180,15,15);


//wings
fill(244,164,96);
strokeWeight(8);
arc(210,350,120,250,3.14,4.71);//arm1
arc(290,350,120,250,4.71,6.28);//arm2
strokeWeight(1);
arc(225,365,120,250,3.30,4.71);//wings
arc(240,380,120,250,3.40,4.71);//wings
arc(275,365,120,250,4.71,6.1);//wings2
arc(260,380,120,250,4.71,6);//wings2

//body
fill(255,255,255);
ellipse(250,300,120,250);
noFill();

arc(260,310,120,250,0.785,1.57);//line outside body
arc(270,320,120,250,0.9,1.57);
arc(250,350,109,70,0.1,3);//line on body
arc(250,240,103,60,3.24,6.18);

//eyes
fill(0);
noStroke();
ellipse(235,130,10,10);
ellipse(265,130,10,10);

