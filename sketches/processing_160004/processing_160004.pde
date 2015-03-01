
//declaring variables
int a = 25;
int b = 30;
int c = 35;
int d = 40;
int e = 45;
int f = 50;
int WIDTH = 200;
int HEIGHT = 300;

//structure
size(WIDTH, HEIGHT);
background(000);
strokeWeight(20);
stroke(random(b, e), random(f, a));
line(WIDTH/2, HEIGHT/2, d, e);

//triangle
triangle(random(a, 230), random(50, 250), random(10, 200), random(20, 290), random(30, 170), random(25, 270));
stroke(random(0,255), random(0,255), random(0,255));

//rectangle
rect(random(20, 320), random(45, 230), random(30, 280), random(50, 400));
stroke(random(0,255), random(0, 255), random(0, 255));


