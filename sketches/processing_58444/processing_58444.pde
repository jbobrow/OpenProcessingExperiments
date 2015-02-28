

float x = 400;
float y = 300;
float bx = 400;
float by = 300;
float cx = 400;
float cy = 300;
float d = 300;
float easing = 0.02;
float easingb = 0.02;
float easingc = 0.02;
float angle = 0.0;
float speed = 0.0;
PImage metalbg;
PFont title;

void setup() {
  size(800, 600);
   metalbg = loadImage("metalbg.jpg");
   title = loadFont("Bauhaus93-48.vlw");
  smooth();
}
void draw() {
  
  if (mousePressed && (mouseButton == LEFT)) {
  easing = 0.01;
  easingb = 0.007;
  easingc = 0.004;
  } else {
  easing = 0.002;
  easingb = 0.0007;
  easingc = 0.0004;
  }
  
  float targetX = mouseX;
  float targetY = mouseY;
  
  if (mousePressed && (mouseButton == RIGHT)) {
  targetX = 400;
  targetY = 300;
  }
  
  x += (targetX - x) * easing;
  bx += (targetX - bx) * easingb;
  cx += (targetX - cx) * easingc;
  y += (targetY - y) * easing;
  by += (targetY - by) * easingb;
  cy += (targetY - cy) * easingc;
  
  println(mouseX);
  println(mouseY);
  background(100);
  //background image
  image(metalbg, 0, 0);
  fill(60,160);
  textFont(title);
  text("Robot Cat", 40, 560);
  
  cat(400,300,0.5);
  cat(30,220,0.25);
  cat(0,0,1);
   
  //red dot
  noStroke();
  float dotease = 0.5;
  float dotsize = 30;
  if (mousePressed && (mouseButton == LEFT)) {
  dotsize = 30;
  speed = 0.5;
  fill(255,0,0,160);
  } else if (mousePressed && (mouseButton == RIGHT)) {
  dotsize = 0; 
  } else {
  dotsize = 10;
  speed = 0.1;
  fill(180,40,40,160);
  }
  d += (dotsize - d) * dotease;
  float wx = 0 + cos(angle) * 10;
  float wy = 0 + sin(angle) * 10;
  ellipse(wx+mouseX, wy+mouseY, d, d);
  angle += speed;
  
  

} 
  
  
void cat(int vx, int vy, float vs) {
  
  pushMatrix();
  translate (vx, vy); //position of cat
  scale (vs); //size of cat
  
  //body
  noStroke();
  fill(170);
  ellipse(bx, by, 200, 160);
  stroke(170);
  strokeWeight(24);
  //tail
  line(bx, by-40, cx, cy-200);
  //legs
  line(bx-40, by, x-40, by+140);
  line(bx+40, by, x+40, by+140);
  line(bx-40, cy+20, bx-40, by+100);
  line(bx+40, cy+20, bx+40, by+100);

  //face
  noStroke();
  fill(200);
  ellipse(x, y, 200, 160);
  triangle(x-90, y-140, x-90, y-20, x+40, y-20);
  triangle(x+90, y-140, x+90, y-20, x-40, y-20);
  fill(240);
  ellipse(x-50, y-20, 68, 68);
  ellipse(x+50, y-20, 68, 68);
  
  //eyes
  float eyex = map(mouseX, 0, 800, 0, 60);
  float eyey = map(mouseY, 0, 800, 0, 60);
  fill(200);
  noStroke();
  if (mousePressed && (mouseButton == RIGHT)) {
  ellipse(x-50, y-20, 20, 40);
  ellipse(x+50, y-20, 20, 40);
  } else { 
  ellipse(eyex+x-80, eyey+y-40, 20, 40);
  ellipse(eyex+x+20, eyey+y-40, 20, 40);
  }
  noFill();
  stroke(120);
  strokeWeight(3);
  ellipse(x-50, y-20, 68, 68);
  ellipse(x+50, y-20, 68, 68);
 
  //nose
  noStroke();
  fill(140);
  triangle(x, y+25, x-15, y+5, x+15, y+5);
 
  //mouth
  stroke(140);
  strokeWeight(2);
  line (x, y+25, x, y+40);
  line (x-10, y+40, x+10, y+40);
  
  popMatrix();
  
}

