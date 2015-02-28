
void setup(){
  size(500, 500);
  colorMode(HSB, 100);
  background(99);
  smooth();
  noLoop();
}

void draw(){
    drawKawa(0);   // 皮ｙ軸
    drawTane(80);  // 種ｙ軸
    drawSuika(160);  // 食べるところｙ軸
    drawKawa(240);  // 皮ｙ軸
    drawTane(320);  // 種ｙ軸
    drawSuika(400);  // 食べるところｙ軸
    drawKawa(480);   // 皮ｙ軸
    save("0812021すいか.png");
}


// 種を描く関数
void drawTane(int x){ 
  fill(0);
  noStroke();
  for(int i= 0; i < width; i++){ 
    if(i % 30 == 0){
      pushMatrix();
      beginShape();
      vertex(i + 3, x +   0);
      vertex(i + 8, x +  15);
      vertex(i + 8, x +  18);
      vertex(i + 3, x +  20);
      vertex(i + 0, x +  18);
      vertex(i + 0, x +  15);
      endShape();
      popMatrix();
    }
  }
}


// 身を描く関数
void drawSuika(int x){
  for(int i= 0; i < width; i++){ 
    fill(0, 80, 90);
    noStroke();
    arc(120 * i , x, 100, 90, 0, PI);
  }
}

//  皮を描く関数
void drawKawa(int x){
  for(int i = 0; i < width; i++){
    noFill();
    stroke(20, 80, 50);
    strokeWeight(9);
    strokeCap(SQUARE);
    arc(120 * i , x, 92, 80, 0, PI);
  }
}



