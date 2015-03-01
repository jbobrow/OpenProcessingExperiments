
/*@pjs preload="kadai.png";*/
PImage img_kadai;


size(400,400);
background(#03E7FA);

stroke(200,150,205);
strokeWeight(6);
line(400,400,0,0);
line(0,50,350,400);
line(50,0,400,350);
line(100,0,400,300);
line(0,100,300,400);

stroke(0,100,200);
fill(5,220,115);
rect(50,320,50,50);
rect(310,30,50,50);

img_kadai=loadImage("kadai.png");
image(img_kadai,130,110,150,150);


