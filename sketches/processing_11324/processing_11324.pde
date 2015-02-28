
void setup() {
  size(500, 500);
  smooth();
  colorMode(RGB, 256);
  background(198, 172, 138);//薄茶色
  noLoop();
}

void draw() {
  
//砂浜
  for(int i = 0; i <= 350; i++) {
     strokeWeight(1.5);
     stroke(0, 0, 0);//黒
     point(random(width), random(0, 500));
}

//大波
  drawBigwave(0, 0);
  
//小波
  drawSmallwave(0, 0);
}

//大波
void drawBigwave(int x, int y) {
   noStroke();
   fill(255, 255, 255);//白
   beginShape();
   curveVertex(0, 0);
   curveVertex(0, 0);
   for(int i = 0; i <= 3; i++) {
     curveVertex(i*150, random(300, 500));
   }
   curveVertex(500, 0);
   curveVertex(500, 0);
   endShape();
}

//小波
void drawSmallwave(int x, int y) {
   noStroke();
   fill(74, 203, 200, 150);//水色
   beginShape();
   curveVertex(0, 0);
   curveVertex(0, 0);
   for(int i = 0; i <= 3; i++) {
     curveVertex(i*150, random(50, 250));
   }
   curveVertex(500, 0);
   curveVertex(500, 0);
   endShape();
   
}

