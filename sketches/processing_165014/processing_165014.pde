
/*@pjs preload="ue.png,moji1.png,moji2.png,moji3.png";*/

size(400,400);
background(0,0,255);

/*main*/
stroke(255);
fill(255);
rect(49,99,300,150);/*main*/

stroke(0);
fill(0);
rect(51,101,300,150);

stroke(145);
fill(145);
rect(50,100,300,150);

PImage img1,img2,img3,img4;

img1 = loadImage("ue.png");
image(img1,52,102,298,20);

img2 = loadImage("moji1.png");
image(img2,100,120,250,55);

img3 = loadImage("moji2.png");
image(img3,50,80,250,55);



stroke(255);
fill(255);
rect(329,104,15,15);

stroke(0);
fill(0);
rect(331,106,14,14);


stroke(145);
fill(145);
rect(330,105,14,14);

stroke(0);
strokeWeight(1);
line(332,107,342,117);
line(332,117,342,107);



stroke(100);
fill(100);
ellipse(93,168,40,40);

stroke(125,0,0);
fill(255,50,50);
ellipse(90,165,40,40);

stroke(255);
strokeWeight(4);
line(80,155,100,175);

line(100,155,80,175);



stroke(0);
fill(0);
rect(140,206,124,34);

stroke(255);
fill(255);
rect(141,207,120,30);

stroke(145);
fill(145);
rect(142,208,120,30);

img4 = loadImage("moji3.png");
image(img4,140,205,180,50);







