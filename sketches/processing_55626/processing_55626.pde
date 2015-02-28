


size(720, 480);
smooth();
background(255);
ellipseMode(RADIUS);

int x= 345;
int y=100;


//neck
fill(100);
rect(x, y, 30, 200);

//body
fill(100);

rect(285, 200, 150, 200);
fill(255);
rect(295, 210, 130, 180);
int w=320;
int h=300;

fill(50);
rect(360,250,50,100);

fill(255,0,0,100);

rect(w, h, 50, 10);
h+=20;
rect(w, h,50,10);
h+=20;
rect(w, h,50,10);



//head
fill(100);
ellipse(x+15, y, 50, 50);

fill(255);
ellipse(x+15, y, 40,40);

fill(0);
arc(x+15, y, 40,40, radians(0), radians(180));

//eyes
fill(0);
ellipse(x-45, y-50, 10, 10);
ellipse(x+75, y-50, 10, 10);
fill(255);
ellipse(x-49, y-55, 5, 5);
ellipse(x+71, y-55, 5, 5);
//wheels
fill(0);
ellipse(300, 400, 20, 20);
ellipse(420, 400, 20, 20);
fill(205);
ellipse(300, 400, 10, 10);
ellipse(420, 400, 10, 10);



