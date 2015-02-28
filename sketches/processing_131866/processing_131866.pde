
/*@pjs preload="space.jpg";*/



size (600, 700);
background (154, 217, 221);
PImage img = loadImage("space.jpg");
image(img, 0,0);
//face
noStroke();
fill(227,185,219);
rect(150, 180, 190, 190, 50, 6, 50, 18);
ellipse (250, 290, 150, 200);
//nose
fill(201, 131, 191);
rect(237, 270, 25, 25);
//eyes
//left
noStroke();
fill(188, 117, 183);
ellipse (220, 250, 35, 35);
noStroke();
fill(125,158,192);
ellipse (225, 250, 10, 10);
//right
noStroke();
fill(188, 117, 183);
ellipse (280, 250, 35, 35);
noStroke();
fill(125,158,192);
ellipse (275, 250, 10, 10);
//mouth
noStroke();
fill(188, 117, 183);
rect( 220, 310, 60, 30);
//ears
//left
noStroke();
fill(164, 70, 159);
ellipse (139, 250, 15, 15);
//right
noStroke();
fill(164, 70, 159);
ellipse (350, 250, 15, 15);
//body
noStroke();
fill(227,185,219);
rect(150, 385, 200, 250);
// feet
//left
noStroke();
fill (164, 70, 159);
rect(185, 640, 50, 30);
rect(185, 675, 50, 30);
//right
fill (164, 70, 159);
rect(265, 640, 50, 30);
rect(265, 675, 50, 30);
//hands 
//left
fill (164, 70, 159);
rect(95, 385, 50, 150);
fill(201, 131, 191);
rect(85, 540, 60, 40);
//right
fill (164, 70, 159);
rect(355, 385, 50, 150);
fill(201, 131, 191);
rect(355, 540, 60, 40);




