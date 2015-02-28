

float x= 345;
float y=100;

float easing= 0.025;


void setup() {
  size(720,480);
  smooth();
  background(255);
  ellipseMode(RADIUS);
  
}

void draw() {
background(255);
int targetX=mouseX;
x+= (targetX-x)*easing;

if (mousePressed) {
  y=150;
} else {
  y=100;
}


  
//neck
fill(100);
rect(x, y, 30, 200);

//body
fill(100);

rect(x-60, 200, 150, 200);
fill(255);
rect(x-50, 210, 130, 180);

int h=300;

fill(50);
rect(x+15,250,50,100);

fill(255,0,0,100);

rect(x-25, h, 50, 10);
h+=20;
rect(x-25, h,50,10);
h+=20;
rect(x-25, h,50,10);



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
ellipse(x-45, 400, 20, 20);
ellipse(x+75, 400, 20, 20);
fill(205);
ellipse(x-45, 400, 10, 10);
ellipse(x+75, 400, 10, 10);

}

