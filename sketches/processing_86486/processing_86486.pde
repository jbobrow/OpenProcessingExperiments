
//soheew soheewoo Assignment 2 copyright

size(400,400);
background( 255, 242, 201);

float x, y, wd, ht;
x= 200;
y=200;
wd=100;
ht=100;

//glasses
fill(158, 215, 245);
stroke (35, 26, 183);
strokeWeight(1.5);
arc( 120, 110, 170, 170, 0, PI);
arc( 289, 120, 170, 170, PI, TWO_PI);


//eyes
fill (255,255, 255);
noStroke();
ellipse( x-80, y-100, wd, ht);
ellipse( x+90, y-100, wd, ht);
fill ( 46, 27, 22);
ellipse( x-80, y-100, wd/4, ht/4);
ellipse( x+90, y-100, wd/4, ht/4);

//nose

arc(180, 240, 50, 50, PI, TWO_PI);
arc( 230, 240, 50, 50, PI, TWO_PI);


//mustache

fill (150, 147, 178);
stroke(255,255,255);
arc(205, 330, 200, 150, PI, TWO_PI);
strokeWeight( .5);
line ( 170, 300, 170, 330);
line ( 200, 300, 200, 330);
line ( 140, 300, 140, 330);
line ( 230, 300, 230, 330);
line ( 260, 300, 260, 330);

saveFrame("hw2.jpg");



   

