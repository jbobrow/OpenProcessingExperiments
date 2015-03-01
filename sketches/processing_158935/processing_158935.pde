
//siamese cat face
size(700,700);
background(255,255,255);
smooth();
 
//basic face form
fill(228,209,167);
noStroke(); //do this to get rid of the lines
//ears start here
arc(40,90,600,600,PI/12,PI/2-PI/12);
arc(660,90,600,600,PI/2+PI/12,PI-PI/12);
//face starts here(including the brown part)
ellipse(350,400,500,500);
fill(111,99,70);
ellipse(350,450,300,300);
 
//ear pink
fill(255,171,171);
triangle(80,130,125,310,260,173);
triangle(620,130,575,310,440,173);
 
//eye starts here
fill(0,0,0);
arc(230,370,170,180,PI/14,PI+PI/14);
arc(470,370,170,180,-PI/14,PI-PI/14);
fill(255,255,255);
arc(230,370,150,160,PI/14,PI+PI/14);
arc(470,370,150,160,-PI/14,PI-PI/14);
fill(0,0,0);
arc(230,370,120,130,PI/14,PI+PI/14);
arc(470,370,120,130,-PI/14,PI-PI/14);
fill(255,255,255);
arc(230,370,90,100,PI/14,PI+PI/14);
arc(470,370,90,100,-PI/14,PI-PI/14);
fill(90,108,166);
arc(230,370,50,60,PI/14,PI+PI/14);
arc(470,370,50,60,-PI/14,PI-PI/14);

 
//mouh
fill(255,74,82);
arc(350,550,180,140,PI,TWO_PI);
 
//whiskers
stroke(1);
strokeCap(SQUARE);
strokeWeight(7);
line(220,490,80,440);
line(220,520,70,520);
line(220,550,80,600);
line(480,490,620,440);
line(480,520,630,520);
line(480,550,620,600);
 
//nose
fill(0,0,0);
arc(370,455,15,9,PI+PI/10,TWO_PI-PI/14);
fill(0,10,0);
arc(330,455,15,9,PI+PI/10,TWO_PI-PI/14);


