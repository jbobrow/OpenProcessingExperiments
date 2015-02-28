
/*@pjs preload="pictsan.png";*/
PImage img;

size(400, 400);
background(255, 255, 255);
img = loadImage("pictsan.png");

stroke(0);
strokeWeight(35);

line(100, -100, -100, 100);
line(200, -100, -100, 200);
line(300, -100, -100, 300);
line(400, -100, -100, 400);
line(500, -100, -100, 500);
line(500, 0, 0, 500);
line(600, 0, 0, 600);
line(700, 0, 0, 700);
line(800, 0, 0, 800);


 


 
tint(255, 0, 0, 255);
image(img, 200, 200, 200, 200);


noStroke();
fill(255,0,0);

ellipse(120, 240, 120, 120);
ellipse(150, 70, 60, 60);
ellipse(300, 90, 80, 80);


