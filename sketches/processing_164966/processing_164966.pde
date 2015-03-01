

/*@pjs preload="hana2.png,hana3.png,hana4.png";*/

PImage img1,img2,img3;



size(400,400);

background(246,210,227);
stroke(237,128,162);
strokeWeight(20);

line(0,50,400,50);

strokeWeight(15);

line(0,370,400,370);

stroke(240,130,165);
strokeWeight(30);

line(50,0,50,400);

strokeWeight(15);

line(3,3,3,400);

img1 = loadImage("hana2.png");
img2 = loadImage("hana3.png");
img3 = loadImage("hana4.png");



tint(170,134,214);
image(img1,140,285);

image(img2,-10,265);

image(img3,260,218);


tint(229,0,74);
image(img1,-10,290);

image(img2,300,300);

tint(209,56,142);
image(img3,185,280);

image(img2,50,295);






