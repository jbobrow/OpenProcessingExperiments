
/* @pjs preload="treb-back.jpg"; */

size(1200,500);

//bg
PImage img = loadImage("treb-back.jpg");
image(img, 0,0);

//starting with the person
//legs
line(800,450,825,425);
line(850,450,825,425);

//torso
line(825,425,825,375);

//arms
line(850,400,800,400);

//head
fill(255,255,255);   //white
ellipseMode(CORNER);
ellipse(800,325,50,50);

//house
fill(200,0,0);      //slightly darkened red
rect(500,315,150,150);

//chimney
fill(100,100,100);  //medium gray
rect(600,265,25,50);

//doors
fill(100,100,100);  //medium gray
rect(550,425,15,40);
rect(565,425,15,40);

//smoke
fill(255,255,255);  //white
ellipseMode(CORNER);
ellipse(600,225,40,30);
ellipse(570,195,45,33);
ellipse(610,165,53,38);


