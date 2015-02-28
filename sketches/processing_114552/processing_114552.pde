
size(400,400);

/*@pjs preload="big_spd.png";*/


PImage img;

background(0,0,0,1000);
img = loadImage("big_spd.png");

tint(143,146,148);
image(img,-1,0);


rectMode(CENTER);
fill(0,255,0);
rect(50, 50, 50, 50);

rectMode(CENTER);
fill(100,255,100);
rect(50, 120, 50, 50);

rectMode(CENTER);
fill(200,255,200);
rect(50, 190, 50, 50);


rectMode(CENTER);
fill(0,255,0);
rect(350, 50, 50, 50);

rectMode(CENTER);
fill(100,255,100);
rect(350, 120, 50, 50);

rectMode(CENTER);
fill(200,255,200);
rect(350, 190, 50, 50);

rectMode(CENTER);
fill(100,255,100);
rect(120, 50, 50, 50);

rectMode(CENTER);
fill(100,255,100);
rect(280, 50, 50, 50);

rectMode(CENTER);
fill(200,10,10);
rect(50, 350, 50, 50);

rectMode(CENTER);
fill(200,10,10);
rect(350, 350, 50, 50);



stroke(255);
strokeWeight(20);
noFill();
ellipse(200, 140, 160, 160); 

strokeWeight(80);
point(200, 135);

noStroke();
fill(0,0,0);
ellipse(200, 135, 60, 60);

stroke(0);
strokeWeight(30); 
line(100, 135, 300, 135);

stroke(0,0,0);
strokeWeight(25); 
line(203, 30, 200, 370);

stroke(255,0,0);
strokeWeight(10); 
line(203, 30, 200, 370);


stroke(255,0,0);
strokeWeight(10); 
line(100, 135, 300, 135);











