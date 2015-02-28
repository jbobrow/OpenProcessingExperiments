
float x, y, a, b;
float targetX, targetY, targetA, targetB;
float easing = 0.3;

float lx0, ly0, lx1, ly1, lx2, ly2;

void setup(){
  size(500, 500);
  smooth();

}

void draw (){
  background (mouseX, mouseY, 170);
  x = pmouseY - 10;
  y = pmouseX -10;
  targetX = mouseX;
  targetY = mouseX;
  a = (x * 2);
  b = (a - 10);
  targetA = (b/2);
  targetB = (PI * x);
  stroke(255, 240);
  strokeWeight(4);
  line (x, y, targetX, targetY);
  x = x + 1;
  
  
  // last triangle

//  beginShape();
//  noStroke();
//  fill (0,0,0, 50);
//  vertex (lx0, ly0);
//  vertex (lx1, ly1);
//  vertex (lx2, ly2);
//
//  endShape(CLOSE);  
  
  // current triangle
  beginShape();
  noStroke();
  fill (a, b, targetY, 100);
  x = mouseX + 50;
  y = mouseY -50;
  vertex (a, b);
  vertex (targetA, targetB);
  vertex (y, x);
    vertex (a, b);
  endShape(CLOSE);
//Figure out a way to trace the last four/five shapes/lines created
//  lx0 = a;
//  lx1 = b
// lx2 =  
}

