
/*@pjs preload="bird.png"; */
PImage img;

size(400,400);

background(127,82,0);


noStroke();
fill(253,255,202,200);
rect(220,20,20,20);
fill(253,255,202,200);
rect(360,160,20,20);
fill(253,255,202,200);
rect(300,20,80,80);
fill(253,255,202,80);
rect(240,120,40,40);
fill(253,255,202,140);
rect(266,74,60,60);

fill(253,255,202,200);
rect(20,220,20,20);
fill(253,255,202,200);
rect(160,360,20,20);
fill(253,255,202,200);
rect(20,300,80,80);
fill(253,255,202,140);
rect(74,266,60,60);
fill(253,255,202,80);
rect(120,240,40,40);



img = loadImage("bird.png");

tint(69,231,255);
image(img,330,330,50,50);


