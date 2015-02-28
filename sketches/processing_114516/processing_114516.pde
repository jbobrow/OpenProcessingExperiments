
/*@pjs preload="hannkati2.png";*/
PImage img;


size(400, 400);

background(234, 188, 121);

img=loadImage("hannkati2.png");

tint(145,87,0);

image(img,300,300,100,100);




stroke(219,161,77); 


strokeWeight(5);
line(0, 100, 400, 100);

strokeWeight(5);
line(0, 200, 400, 200);

strokeWeight(5);
line(0, 300, 400, 300);

strokeWeight(5);
line(100, 0, 100, 400);

strokeWeight(5);
line(200, 0, 200, 400);

strokeWeight(5);
line(300, 0, 300, 400);





stroke(145,87,0);

strokeWeight(10);
line(398, 0, 398, 400);

strokeWeight(10);
line(1, 0, 1, 400);

strokeWeight(10);
line(0, 398, 400, 398);

 strokeWeight(10);
line(0, 1, 400, 1);



