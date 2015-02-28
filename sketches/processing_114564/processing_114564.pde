
/*@pjs preload="car.png";*/
PImage img;

size(400, 400);
background(0, 0, 0);
img = loadImage("car.png");

tint(165, 165, 165);
image(img, -5, 5);

noStroke();
ellipse(200,340,80,80);
fill(255, 0, 0);

noStroke();
ellipse(50,60,80,80);
fill(157, 4, 214);

noStroke();
ellipse(50,200,80,80);
fill(3, 0, 227);

noStroke();
ellipse(50,340,80,80);
fill(255, 132, 0);

noStroke();
ellipse(200,60,80,80);
fill(255, 243, 0);

noStroke();
ellipse(350,60,80,80);
fill(21, 124, 22);

noStroke();
ellipse(350,340,80,80);
fill(35, 255, 3);

noStroke();
ellipse(350,200,80,80);
fill(3, 244, 255);

noStroke();
ellipse(200,340,80,80);
fill(255, 255, 255);

stroke(255);
strokeWeight(10);
line(0,130,400,130);

stroke(255);
strokeWeight(10);
line(0,270,400,270);

stroke(255);
strokeWeight(10);
line(105, 0,105,400);

stroke(255);
strokeWeight(10);
line(295, 0,295,400);


