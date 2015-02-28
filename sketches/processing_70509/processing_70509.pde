
void setup() {
  size(800, 600);
  smooth();
}


void draw() {
  background(255);
 draw_robot(100,200,80,100,20);
  draw_robot(350,100,200,100,50);
   draw_robot(650,150,130,170,18);
 
}

void draw_robot(int x, int y, int w, int h, int n){
   int yb = y+220;
 
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
  ellipse (x-w/2-30, yb+15, 1.5*n, 1.5*n);  //left
  ellipse (x+w/2+30, yb+15, 1.5*n, 1.5*n); //right
  noFill();
  strokeWeight(7);
  line(x-w/2-30, yb+h-130, x-w/2-30, yb+h-40);
  line(x+w/2+30, yb+h-130, x+w/2+30, yb+h-40);
}
