
/*@pjs preload="cat.png";*/

size(400,400);

PImage img;


background(201,153,227);

stroke(242,238,186);
strokeWeight(40);
line(0,100,400,100);
line(0,300,400,300);

stroke(223,221,153);
strokeWeight(3);
line(0,10,400,10);
line(0,20,400,20);
line(0,30,400,30);
line(0,40,400,40);
line(0,50,400,50);
line(0,60,400,60);
line(0,70,400,70);
line(0,330,400,330);
line(0,340,400,340);
line(0,350,400,350);
line(0,360,400,360);
line(0,370,400,370);
line(0,380,400,380);
line(0,390,400,390);

 
img = loadImage("cat.png");


tint(0,0,0);
image(img,120,120);

tint(0,0,0,0);
image(img,200,200,50,50);

















