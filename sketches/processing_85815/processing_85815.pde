
void setup(){
  size(500, 500, P3D);
  background(188, 143, 143);
}
void draw(){
  strokeWeight(4);
  stroke(0);
  fill(240, 230, 140);
  ellipse(250, 250, 200, 200);
  rect(228, 350, 50, 500);
  fill(255, 255, 255);
  ellipse(200, 220, 70, 30);
  ellipse(290, 220, 70, 30);
  fill(255, 255, 0);
  ellipse(200, 220, 15, 15);
  ellipse(300, 220, 15, 15);
  fill(255, 0, 0);
  triangle(250, 240, 230, 290, 280, 290);
  noStroke();
  fill(30, 144, 255);
  rect(200, 160, 30, 30);
  fill(0, 100, 0);
  rect(230, 180, 30, 30);
  fill(255, 255, 0);
  rect(260, 165, 30, 30);
  fill(0, 255, 255);
  rect(242, 350, 20, 500);
}


