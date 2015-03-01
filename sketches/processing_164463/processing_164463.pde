
void drawMyBarbell(int startX, int startY, int endX, int endY) {
  stroke(0,0,200);
  strokeWeight(5);
  line(startX,startY,endX,endY);
  stroke(0,200,0);
  ellipse(startX,startY,20,20);
  stroke(200,0,0);
  triangle(endX,endY,endX+10,endY-20,endX+20,endY);
}

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  drawMyBarbell(100,200,300,200);
  drawMyBarbell(20,20,50,75);
  drawMyBarbell(200,350,350,250);
}


