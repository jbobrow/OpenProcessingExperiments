
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);
  strokeWeight(5);  //head
  ellipse(235, 160, 110, 110);   
  strokeWeight(7);  //glasses
  line(182, 152, 288, 152);  
  quad(191, 152, 279, 152, 279, 169, 191, 169);
  strokeWeight(4);
  for (int i = 199; i < 279; i+=8) {
    line(i, 152, i, 169);
  }
  noFill();  //smile
  strokeCap(SQUARE);
  arc(235, 186, 27, 29, 0, PI);  
  strokeWeight(5);  //body
  strokeJoin(BEVEL);
  triangle(235, 215, 312, 334, 163, 334);  
  arc(186, 130, 20, 20, radians(110), radians(320));  //left ponytail
  arc(284, 130, 20, 20, radians(220), radians(360) + radians(70));  //right ponytail
  strokeCap(ROUND);
  strokeWeight(4);
  line(122, 35, 182, 119);
  line(114, 80, 176, 126);
  line(87, 114, 175, 133);
  line(110, 160, 178, 139);
  
}

