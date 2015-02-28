
/*@pjs preload="kadai.png";*/

size(400, 400);

PImage img; 

size(400, 400);
background(255,255,255);
img = loadImage("kadai.png");

stroke(243,129,182);     
strokeWeight(5);
line(400,0,400,400);  

stroke(172,175,175);     
strokeWeight(5);
line(350,0,350,400); 

stroke(244,67,150);     
strokeWeight(5);
line(300,0,300,400); 

stroke(255,0,120);     
strokeWeight(5);
line(250,0,250,400); 

stroke(243,129,182);     
strokeWeight(5);
line(200,0,200,400);

stroke(172,175,175);     
strokeWeight(5);
line(150,0,150,400);

stroke(244,67,150);     
strokeWeight(5);
line(100,0,100,400);

stroke(255,0,120);     
strokeWeight(5);
line(50,0,50,400);

stroke(243,129,182);     
strokeWeight(5);
line(1,0,1,400);

tint(222,11,81);
image(img,33,40);



