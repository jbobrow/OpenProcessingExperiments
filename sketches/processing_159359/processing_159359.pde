

void setup() {
  size(500,400);
  background(0);
  noLoop();
}

void draw() {
  stroke(255,30);
  int i = 0;
  while(i<100000) {
    line(0,200+i,500,200-i);
    i = i + 10;
  }
  i = 0;
  stroke(255,30);
 while(i<100000) {
    line(250+i,400,250-i,0);
    i = i + 10;
  }
  fill(255,30);
  noStroke();
 rect(75,50,50,300);
 
 fill(255,30);
  noStroke();
 rect(425,350,-50,-300);
 
 fill(255,30);
  noStroke();
 rect(125,50,250,50);fill(255,30);
 
 fill(255,30);
  noStroke();
 rect(375,350,-250,-50);
}



