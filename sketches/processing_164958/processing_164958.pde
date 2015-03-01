
/*@pjs preload="hana.png";*/

size(400,400);

background(92,162,252);

stroke(252,148,247);
strokeWeight(10);
line(0,150,150,150);
line(150,150,150,0);
line(250,400,250,250);
line(250,250,400,250);

stroke(255,28,28);
strokeWeight(10);
line(75,75,75,325);
line(75,325,325,325);
line(325,325,325,75);
line(325,75,75,75);

fill(34,114,240);
rect(75,75,250,250);

stroke(245,59,220);
line(150,75,150,150);
line(75,150,150,150);
line(250,325,250,250);
line(250,250,325,250);

PImage img;

img = loadImage("hana.png");

tint(39,214,183,170);
image(img,0,0);







