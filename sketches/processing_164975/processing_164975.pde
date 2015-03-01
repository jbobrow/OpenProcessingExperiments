
/*@pjs preload="u4.png,s1.png,sr.png,k2.png"*/

PImage img1,img2,img3,img4;


size(400,400);
background(40,37,116);
img1 = loadImage("u4.png");
img2 = loadImage("s1.png");
img3 = loadImage("sr.png");
img4 = loadImage("k2.png");

noStroke();
tint(255,255,255);
image(img1,290,291);
//tint(255,255,255);
tint(#72A549);
image(img2,50,285);
//tint(255,255,255);
tint(#72A549);
image(img3,130,285);
tint(#D6D6D6);
image(img4,203,85);

stroke(1);
stroke(255,255,255);
line(0,15,400,15);
line(15,0,15,400);
line(0,350,400,350);
line(350,0,350,400);



strokeWeight(2);
stroke(0,0,0,100);
line(0,375,400,375);
line(375,0,375,400);

noStroke();
fill(255,255,255);

ellipse(100,319,10,10);
ellipse(110,319,10,10);
ellipse(120,319,10,10);
ellipse(105,311,10,10);
ellipse(115,311,10,10);
ellipse(110,303,10,10); 

rectMode(CENTER);
rect(110,340,30,20);
rect(110,327,40,6);

noStroke();
fill(240,231,162);
ellipse(100,100,90,90);





