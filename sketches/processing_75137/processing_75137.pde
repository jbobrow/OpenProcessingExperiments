
void setup() {
  size(400, 400);
  noLoop();
  colorMode(HSB);
  noStroke();
}


void draw() {
  noStroke();
colorMode(RGB, 500);
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
  
  
  //background (255);
 for (int i=0;i<20;i++)
  {
    rectangle(int(random(width)), int(random(height)), 50, 50);
  }
}

void rectangle(int x, int y, int wi, int hi) {
  noStroke();
  fill(#E5B2B2);
  //println(x+" "+y);
  rect(x+15, y, wi/2, hi);
  fill(#D80000);
  ellipse(x+wi/2,y-hi/3,2*wi,hi);
  fill(#FCFDFF);
  ellipse(x+wi/4,y-hi/3,wi/4,hi/4);
  ellipse(x+40,y-5,wi/4,hi/4);
  ellipse(x+60,y-22,wi/3,hi/3);
}

void mousePressed(){
redraw();
}
