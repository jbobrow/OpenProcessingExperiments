
void setup(){
  size(400, 400);
  background(146, 250, 78);
  noStroke();
  smooth();
}

void draw(){
  smooth();
  //capelli
  fill(0);
  rect(50, 0, 300, 120, 0, 15, 45, 45);
  //face
  fill(160, 123, 42);
  rect(width/2 - 110, 120, 220, 200, 0, 0, 40, 40);
  fill(255, 0, 0);
  rect(width/2 - 50, 320, 100, 50, 30);
  rect(width/2 - 40, 320, 80, 80);
  fill(255, 0, 0);
  rect(width/2 - 170, 380, 340, 30, 10, 6, 0, 0);
  //zip
  fill(0);
  rect(width/2 - 5, 320, 10, 100);
  fill(200);
  //cursore zip
  rect(width/2 - 11, 330, 22, 14, 6);
  //glasses
  fill(0);
  ellipse(150, 180, 90, 90);
  ellipse(250, 180, 90, 90);
  fill(0, 80);
  rect(width/2 - 11, 180, 22, 5, 6);
  //nouse
  fill(129, 99, 35);
  ellipse(185, 240, 15, 15);
  ellipse(215, 240, 15, 15);
  //lips
  fill(0);
  rect(width/2- 40, 280, 80, 10, 10);
  //ears
  fill(160, 123, 42);
  rect(80, 180, 20, 50, 7);
  rect(300, 180, 20, 50, 7);
  //earings
  fill(0);
  ellipse(85, 225, 15, 15);
  ellipse(315, 225, 15, 15);
  
}
