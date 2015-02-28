
//background color
background(100);

size(590,480);

noStroke();

fill(110);

rect(0, 0, 640, 30);

rect(0, 80, 640, 30);

rect(0, 160, 640, 30);

rect(0, 240 , 640,30);

rect(0, 320, 640, 30);

rect(0, 400 , 640, 30);

noFill();

fill(90);

rect(0, 0, 640, 5);

rect(0, 80, 640,5);

rect(0, 160, 640, 5);

rect(0, 240 , 640,5);

rect(0, 320, 640, 5);

rect(0, 400 , 640,5);

noFill();




//HEAD-----------------

//face fill
fill(140);

//top of head
ellipse(300,160,200,200);

ellipse(300,170,200,200);

//bottom of head
ellipse(300,200,200,270);

noFill();

//EYES*------------------

fill(200);
//left eye
ellipse(255,190,40,50);

//right eye
ellipse(345,190,40,50);

//left pupil
fill(30);

ellipse(255,190,20,20);

//right pupil
ellipse(345,190,20,20);

noFill();

//MOUTH*------------------

fill(200);

ellipse(300,269,80,60);
fill(140);

rect(260,230,80,40);


noFill();
//NECK*-------------------

fill(140);
rect(260,300,80,80);

//BODY*------------------
fill(200);
rect(185,360,230,200,40,40,10,10);

//BOW TIE*---------------

fill(0);

ellipse(300,375,20,20);

fill(0);

triangle(300,375,350,340,350,400);

triangle(300,375,250,340,250,400);

//SHIRT DETAIL-----------------

stroke(3);

line(235,410,235,480);

line(365,410,365,480);

ellipse(300,400,5,5);
ellipse(300,430,5,5);
ellipse(300,460,5,5);


noFill();

//Hair-------------------
fill(0);

ellipse(325,100,120,80);
ellipse(270,100,100,70);
ellipse(300,90,130,65);


strokeWeight(15);
line(315,250,285,250);
noStroke();
endShape();

//NOSE-------------------

fill(100);
triangle(290,235,300,230,300,210);
fill(80);

triangle(290,235,300,230,310,235);
