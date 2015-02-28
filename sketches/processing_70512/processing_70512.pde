
int n=18; //wheels
int x = 200;
int y = 100;
int h=170;  //body height
int w = 130; //body width


void setup() {
  size(400, 600);
  smooth();
}


void draw() {
  background(255);
  x+=random(-5,5);
  y+=random(-5,5);
  h+=random(-5,5);
  int yb = y+220+ int(random(-2,2));
  if(h<100) { h = 100; yb=200;}
 //body y
  
  
  //--------------STATIC--------------------------

  //body
  fill(0);
  rect(x-w/2, yb, w, h);
  strokeWeight(10);
  stroke(255);
  line(x+w/2, yb, x-w/2, yb+h);
  
  noFill();
  stroke(0);

  //wheels
  fill(0);
  ellipse(x-w/2-5, yb+h+25, n, n);
  ellipse(x-w/2+25, yb+h+25, n, n);
  ellipse(x+w/2+5, yb+h+25, n, n);
  ellipse(x+w/2-25, yb+h+25, n, n);
  //noFill();


  //---------------MOVING--------------------------

  //neck
  int neck = 20;
  int eye = 15;

  strokeWeight(8);
  line(x-15, y+160, x+15, y+160);
  line(x-15, y+160+neck, x+15, y+160+neck);
  line(x-15, y+160+2*neck, x+15, y+160+2*neck);

  //head
  strokeWeight(4);
  line(x, y-50, x, y);
  triangle(x, y, x+55, y+140, x-55, y+140);


  //eye
  strokeWeight(0);
  fill(255);
  ellipse(x, y+100, 45, 30);
  fill(0);
  ellipse(x, y+100, 15, 15);
  noFill();


  //hands
  fill(0);
  ellipse (x-w/2-30, yb+15, 30, 30);  //left
  ellipse (x+w/2+30, yb+15, 30, 30); //right
  noFill();
  strokeWeight(7);
  line(x-w/2-30, yb+h-130, x-w/2-30, yb+h-40);
  line(x+w/2+30, yb+h-130, x+w/2+30, yb+h-40);
}
