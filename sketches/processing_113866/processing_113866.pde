

size(600,500);
background(0,255,0);

//himmel
noStroke();
fill(3,206,255);
rect(0,0,600,270);

//sol
fill(255,243,3);
stroke(0,0,0);
ellipse(70,70,60,60);
triangle(60,35,70,10,80,35);
triangle(105,60,130,70,105,80);
triangle(35,60,10,70,35,80);
triangle(60,105,70,130,80,105);

//sky
fill(255,255,255);
noStroke();
ellipse(300,125,40,40);
ellipse(285,95,40,40);
ellipse(310,87,40,40);
ellipse(320,115,40,40);
ellipse(280,115,40,40);
ellipse(330,97,40,40);

ellipse(460,105,40,40);
ellipse(445,75,40,40);
ellipse(470,67,40,40);
ellipse(480,95,40,40);
ellipse(440,95,40,40);
ellipse(490,77,40,40);



//hus
fill(255,255,255);
stroke(100);
rect (200,250,50,40);
triangle(200,250,225,225,250,250);

quad(225,225,250,250,400,250,375,225);
rect(250,250,150,40);


//lille mand
line(170,290,175,283);
line(175,283,180,290);

line(175,283,175,275);
line(175,278,180,282);
line(175,278,170,282);
noFill();
ellipse(175,272,8,8);




