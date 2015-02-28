
// Acceleration with Gravity
import processing.opengl.*;
float speedX, speedY;
float x, y, w, h;
int[] data_vals;
// acceleration force
float gravity;
void setup() {
  smooth();
  size(400, 400,OPENGL); hint(ENABLE_OPENGL_4X_SMOOTH);
  x=random(0, width);
  y=random(0, height/5);
  speedY = random(3, 6);
  speedX = random(8, 8);
  w=20;
  h=w;
  fill(0);


  // set acceleration force
  gravity = .5;
  data_vals = new int[width];
}
void draw() {
  fill(255, 110);  rect(0, 0, width, height);
  noStroke(); fill(123);  rect(0, height-10, 2000, 200);
 
  for (int i=1; i<width; i++) { 
    data_vals[i-1] = data_vals[i];
  } 
  for (int i=1; i<width; i++) {
    stroke(0, 144, 0);
    line(i, height-300, i, height-map(data_vals[i], 380, 0, 0+300, height/5+300));
  }
  
fill(0);   noStroke();      ellipse(x, y, w, h);

  data_vals[width-1] = int(y);
  x+=speedX;
  speedY+=gravity;
  y+=speedY;
  // Check display window edge collisions



  if (x > width) {
    x = width-w/2;
    speedX*=-1;
  }
  else if (x < 0+w/2) {
    x = 0+w/2;
    speedX*=-1;
  }
  else if (y > height-h) {
    y = height-h;
    speedY*=-0.9;
    speedX=speedX*(0.9);
  }
  else if (y < 0) {
    y = 0;
    speedY*=-1;
  }

  if ((speedY>-0.3 && speedY<0) &&( y==380.0)) {
    y=0;
    speedX = random(4, 9);
    speedY = random(4, 9);
    fill(125);
  }




  print(y);
  print(" ");
  println(speedY);
}

