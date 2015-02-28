


int num = 15;
int count = 0;
float[] xArr;
float[] yArr;
int r,g,b;

//================================= init

void setup() {
  size(900, 450);
  smooth(); 
  frameRate(5);
  
  clearBackground();
  restart();
}

void clearBackground() {
  background(0);
}

void restart() {
 count = 0; 
 xArr = new float[num];
 yArr = new float[num];
 //println("rstart");
 r = int(random(255));
 g = int(random(255));
 b = int(random(255));
}

//================================= frame loop

void draw() {
  
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  
  drawPoints();
}

void drawPoints() {
  float newx = int(random(width + 100)) - 50;
  float newy = int(random(height + 100)) - 50;
  
  
  strokeWeight(1);
  stroke(r, g, b, 40);
  
  fill(100, 40);
  int rad = count * 5;
  ellipse(newx, newy, rad, rad);
  
  // new node
  point(newx, newy);
  //println("draw" + newx + ":" + newy);
  
  // line to all the others
  for (int i=1;i<count;i++) {
    line(newx, newy, xArr[i], yArr[i]);
  }
  
  if (count > 0) {
    fill(255);
    ellipse(newx, newy, 5, 5);
  }
  
  // next
  count++;
  if (count >= num) {
    restart(); 
  } else {
    xArr[count] = newx;
    yArr[count] = newy; 
  }
}

//================================= interaction

void mousePressed() { 
  clearBackground();
}

