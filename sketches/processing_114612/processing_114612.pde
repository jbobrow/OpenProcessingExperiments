
/*@pjs preload="dog2.png";*/
PImage img;
tint(204,255,102);
size(400, 400);


background(51,255,204);
img = loadImage("dog2.png");
image(img,0,0);

tint(125, 50, 0);
image(img, 30, 65,100,100);
image(img, 0,250,140,140);
image(img, 200,65,150,150);
image(img,250,240,100,100);


stroke(0);
strokeWeight(20);
line(10, 20, 35, 55);

strokeWeight(20);
line(35,55,50,25);
line(50,25,70,55);
line(70,55,90,25);

line(125,10,95,55);
line(125,10,152,55);

stroke(0);
strokeWeight(15);
line(110,45,140,45);

stroke(0);
strokeWeight(20);
line(170,10,170,55);
line(170,10,205,55);
line(205,55,205,10);

stroke(0,255,0);
strokeWeight(5);
line(0,70,230,70);

stroke(0);
strokeWeight(20);
line(150,350,175,390);
line(175,390,190,360);
line(190,360,205,390);
line(205,390,225,355);

line(250,340,230,390);
line(250,340,275,390);

stroke(0);
strokeWeight(15);

stroke(0);
strokeWeight(20);
line(235,380,265,380);
line(290,340,290,390);
line(290,340,330,390);
line(330,390,330,340);

fill(204,255,102);
stroke(0,255,0);
strokeWeight(5);
line(160,400,350,400);

fill(204,255,102);
ellipse(370,370,50,50);
ellipse(370,290,50,100);




