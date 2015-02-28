
/*@pjs preload="1.png";*/

size(400,400);
stroke(0);
strokeWeight(40);
line(0,0,400,0);
line(0,100,400,100);
line(0,200,400,200);
line(0,300,400,300);
line(0,400,400,400);
line(0,0,0,400);
line(100,0,100,400);
line(200,0,200,400);
line(300,0,300,400);
line(400,0,400,400);

int a = 20;
int b = 60;
int c = 100;

fill(50);
strokeWeight(0);
rect(a,a,b,b);
rect(a,a+c,b,b);
rect(a,a+c*2,b,b);
rect(a,a+c*3,b,b);

fill(100);
rect(a+c,a,b,b);
rect(a+c,a+c,b,b);
rect(a+c,a+c*2,b,b);
rect(a+c,a+c*3,b,b);

fill(150);
rect(a+c*2,a,b,b);
rect(a+c*2,a+c,b,b);
rect(a+c*2,a+c*2,b,b);
rect(a+c*2,a+c*3,b,b);

fill(200);
rect(a+c*3,a,b,b);
rect(a+c*3,a+c,b,b);
rect(a+c*3,a+c*2,b,b);
rect(a+c*3,a+c*3,b,b);

int d = 80;
int e = 40;

fill(100);
rect(d,d,e,e);
rect(d,d+c,e,e);
rect(d,d+c*2,e,e);

fill(150);
rect(d+c,d,e,e);
rect(d+c,d+c,e,e);
rect(d+c,d+c*2,e,e);

fill(200);
rect(d+c*2,d,e,e);
rect(d+c*2,d+c,e,e);
rect(d+c*2,d+c*2,e,e);

PImage img;


img = loadImage("1.png");
tint(200,255,80,50);
image(img,60,200);
tint(200,255,80,50);
image(img,40,100);
tint(200,255,80,50);
image(img,200,20);
tint(200,255,80,50);
image(img,100,30);
tint(200,255,80,50);
image(img,80,40);
tint(200,255,80,50);
image(img,80,100);
tint(200,255,80,50);
image(img,-20,60);
tint(200,255,80,50);
image(img,60,-40);
tint(200,255,80,50);
image(img,100,-90);
tint(200,255,80,50);
image(img,200,200);
tint(200,255,80,50);
image(img,300,100);
tint(200,255,80,50);
image(img,0,300);
tint(200,255,80,50);
image(img,200,60);
tint(200,255,80,50);
image(img,0,200);
tint(200,255,80,50);
image(img,-60,-60);
tint(200,255,80,50);
image(img,300,-60);
tint(200,255,80,50);
image(img,-60,200);
tint(200,255,80,50);
image(img,-80,100);
tint(200,255,80,50);
image(img,100,350);
tint(200,255,80,50);
image(img,200,350);
tint(200,255,80,50);
image(img,300,350);
tint(200,255,80,50);
image(img,200,150);
tint(200,255,80,50);
image(img,150,150);
tint(200,255,80,50);
image(img,100,350);
tint(200,255,80,50);
image(img,50,350);
tint(200,255,80,50);
image(img,125,300);
tint(200,255,80,50);
image(img,100,-50);
tint(200,255,80,50);
image(img,200,-100);





































