
size(800,600);

fill(23,210,255);
//left wing
arc(500, 325, 50, 225, 0,PI+QUARTER_PI,OPEN);

//feet
stroke(255,168,36);
fill(255,168,36);
triangle(350,500,375,400,400,500);
triangle(450,500,375,400,500,500);

//bird body
stroke(0);
fill(23,210,255);
ellipse(400,300,250,350);

//bird belly
stroke(157,236,255);
fill(255);
ellipse(425,350,125,150);

stroke(255,168,36);
fill(255,168,36);
triangle(400,250,425,225,500,250);

/*stroke(0);
line(425,250,425,275);*/

stroke(255,168,36);
fill(255,168,36);
triangle(400,250,425,275,450,275);

//bird eyes
stroke(255);
fill(0);
ellipse(400,200,15,15);
ellipse(450,200,13,13);

stroke(0);
line(390,175,410,180);
line(440,180,460,175);

stroke(0);
fill(23,210,255);
arc(320, 350, 50, 225, 0, PI+QUARTER_PI, OPEN);



