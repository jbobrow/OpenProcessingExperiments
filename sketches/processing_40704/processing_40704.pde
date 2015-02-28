
smooth();
size(500,500);
background(166,211,234);

//ears
noStroke();
fill(245,190,188);
ellipse(100,250,30,70);
ellipse(400,250,30,70);

stroke(106,81,65);
ellipse(100,250,15,15);
ellipse(400,250,15,15);

//face
noStroke();
fill(252,211,209);
ellipse(250,250,300,300);

//white eyes
fill(255);
noStroke();
ellipse(210,200,30,12);
ellipse(290,200,30,12);

//black eyes
fill(0);
stroke(1);
ellipse(210,200,10,10);
ellipse(290,200,10,10);

//sopracciglia
stroke(106,81,65);
strokeWeight(2);
strokeJoin(ROUND);
line(270,170,280,180);
line(280,180,320,170);
line(240,160,230,170);
line(230,170,190,160);

//nose
line(250,200,270,280);
line(270,280,250,300);

//white mouth
fill(255);
noStroke();
ellipse(250,335,80,30);

//theeth
stroke(106,81,65);
line(210,335,290,335);
line(230,322,230,348);
rect(250,320,0,30);
rect(270,322,0,26);

//cheeks
noStroke();
fill(245,161,163);
ellipse(150,260,50,50);
ellipse(350,260,50,50);


