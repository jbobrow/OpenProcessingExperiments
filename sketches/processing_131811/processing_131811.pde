
size (400,400);
background (0);
for (int i = 10; i <= 400; i +=20) {
for (int j = 10; j <= 400; j +=20) {
float r = random (100);
float s = random (100);
stroke (255);
line (j,r,i,s);
}
}
for (int i = 10; i <= 400; i +=30) {
for (int j = 10; j <= 400; j +=30) {
float r = random (300,400);
float s = random (300,400);
stroke (0,154,205);
line (j,r,i,s);
}
}
for (int i = 10; i <= 400; i +=20) {
for (int j = 10; j <= 400; j +=20) {
float r = random (50,350);
float s = random (50,350);
stroke (176,23,31);
line (j,r,i,s);
}
}
fill (0);
ellipse (200,200,100,100);
noFill();
stroke (0);
strokeWeight (4);
//ellipse (200,200,300,100);
noStroke ();
fill (176,23,31);
ellipse (200,200,30,30);
stroke (176,23,31);
strokeWeight (2);
line (200,200,240,170);
line (200,200,180,180);
line (180,180,140,200);
line (200,200,220,250);
