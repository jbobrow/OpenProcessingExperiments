
/*@pjs preload="ato.png";*/

size(400, 400);
background(100,150,200);

noStroke();
fill(150,255,255);
rect(0,210,400,30);
rect(0,260,400,30);
rect(0,310,400,30);
rect(0,360,400,30);

noStroke();
fill(150,255,150);
rect(0, 10, 400, 30);
rect(0, 60, 400, 30);
rect(0, 110, 400, 30);
rect(0, 160, 400, 30);


noStroke();
fill(150,255,200);
rect(20, 0, 30, 400);
rect(70, 0, 30, 400);
rect(120, 0, 30, 400);
rect(170, 0, 30, 400);
rect(220, 0, 30, 400);
rect(270, 0, 30, 400);
rect(320, 0, 30, 400);
rect(370, 0, 30, 400);


stroke(0);
strokeWeight(5); 
noFill();
rectMode(CENTER);
rect(200, 200, 400, 400);




PImage img;
img = loadImage("ato.png");
tint(100,100,100);
image(img,350,350,70,70);





