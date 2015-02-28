
int x = 300;
int y = 300;
smooth();
size(600,600);
 
//background
fill(36,18,250,100);
rect(0,0,600,300);
fill(158,255,75);
rect(0,300,600,300);
 
//moon
fill(255);
ellipse(50,50,150,150);
fill(200);
ellipse(55, 55, 25, 25);
ellipse(65, 30, 8, 8);
ellipse(15, 55, 10, 10);
fill(230);
ellipse(80, 15, 10, 10);
ellipse(5, 5, 15, 15);
ellipse(80, 80, 10, 10);
ellipse(50, 100, 7, 7);
 
 
//grass
stroke (1,59,0);
for (int g=1; g<600; g+=8)

for (int g1=305; g1<600; g1+=10){
 
line(g,g1,g+3,g1-10);
line(g+2, g1, g-3, g1-10);
 
 
}
stroke (0);
 
//legs1
fill(x-140,88,0);
ellipse(x-40, 500, 30, 90);
 
//body
//rect(x, y, width, height)
rect(250,250,100,250);
 
//ears
 
ellipse (240,40,60,80);
ellipse (360,40,60,80);
fill(255,77);
ellipse (240,40,40,80);
ellipse (360,40,40,80);
 
//head
fill(160,88,0);
ellipse (300,150,220,220);
 
//eyes
fill(255);
ellipse (250,110,40,40);
ellipse (350,110,40,40);
fill(0);
ellipse (245,118,25,25);
ellipse (345,118,25,25);
fill(255);
ellipse (240,118,10,10);
ellipse (340,118,10,10);
 
//eyebrows
line (x-50,60,x,100);
line (350,60,300,100);
 
//mouth
fill(255,155,155);
ellipse (320,200,80,50);
 
//Teeth
//triangle(x1, y1, x2, y2, x3, y3);
fill(255);
triangle (320, 180, 300, 180, 310, 200);
triangle (340, 180, 320, 180, 330, 200);
triangle (325, 220, 305, 220, 315, 200);
triangle (345, 220, 325, 220, 335, 200);
 
//arms
fill(160,88,0);
ellipse(230, 275, 90, 30);
ellipse(270, 275, 90, 30);
 
//legs2
ellipse(320, 500, 30, 90);


