
void setup() {
  size(600, 600);
  background(10, 10, 183);

  stroke(255, 255, 255);
  strokeWeight(5);
  drawCircles(60, width-80, 60, 32); 


  noStroke();
  drawSquares(width/2, height/2);


  stroke(255, 255, 255);
  strokeWeight(5);
  fill(242, 143, 49);
  rect(width/2, 0, 100, 100);
  rect(width/2, 600, 100, 100);
  rect(0, height/2, 100, 100);
  rect(600, height/2, 100, 100);


  ellipse(0, 0, 100, 100);
  ellipse(600, 0, 100, 100);
  ellipse(0, 600, 100, 100);
  ellipse(600, 600, 100, 100);

  line(0, 0, 600, 600);
  line(600, 0, 0, 600);
  line(width/2, 0, 0, width/2);
  line(width/2, 0, 600, height/2);
  line(0, height/2, width/2, 600);
  line(width/2, 600, 600, height/2);
}


void drawCircles(int start, int end, int d, int spacing) {
  for (int i = start; i <= end; i+=spacing) { 
    fill(219, 117, 218);
    ellipse(i, i, d, d);
    ellipse(width - i, i, d, d);
  }
}


void drawSquares(int start, int end) {
  for ( int i = 0; i < 100; i++) {
    fill(255, 200, 0, 100-(i*5));
    rectMode(CENTER);
    rect(width/2, height/2, (i+1)*20, (i+1)*20);
  }
}


