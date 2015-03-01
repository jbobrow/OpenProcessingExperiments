
/*@pjs preload="kadai1a.png,kadai1b.png";*/

PImage img1,img2;

size(400,400);
background(#642C2C);
img1 =loadImage("kadai1a.png");
img2 =loadImage("kadai1b.png");

imageMode(CENTER);
image(img1,100,100,200,200);
image(img2,100,100,200,200);

stroke(0);
ellipse(230,240,50,50);
stroke(0);
ellipse(290,240,50,50);
stroke(0);
ellipse(350,240,50,50);

stroke(0);
ellipse(230,300,50,50);
stroke(0);
ellipse(290,300,50,50);
stroke(0);
ellipse(350,300,50,50);


stroke(0);
ellipse(230,360,50,50);
stroke(0);
ellipse(290,360,50,50);
stroke(0);
ellipse(350,360,50,50);

strokeWeight(3);
line(230,240,230,265);
line(290,240,290,265);
line(350,240,350,265);

line(230,300,230,325);
line(290,300,290,325);
line(350,300,350,325);

line(230,360,230,385);
line(290,360,290,385);
line(350,360,350,385);

strokeWeight(8);
stroke (#B9B8B8);
line(180,100,350,50);
ellipse(300,65,50,50);
strokeWeight(15);
line(330,56,350,50);
strokeCap(PROJECT);
line(180,100,200,94);

noStroke();
fill(#5D5959);
rect(0,200,200,200);

fill(#FFFFFF);
ellipse(100,300,100,100);














