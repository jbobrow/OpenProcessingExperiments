
void setup(){
  size(500, 500);
  colorMode(HSB, 100);
  background(99);
  smooth();
  noLoop();
}

void draw(){
// 海を描く
  drawSea(100);
  drawSea(150);
  drawSea(200);
  drawSea(250);
  drawSea(300);
  drawSea(350);
  drawSea(400);
  drawSea(450);
  drawSea(500);

// 飛沫を描く
  drawSpray(30);
  drawSpray(150);
  drawSpray(270);
  drawSpray(390);
  drawSpray(410);
  drawSpray(430);
  drawSpray(440);
  drawSpray(450);
  drawSpray(460);
  drawSpray(470);
  drawSpray(480);
    save("0812021なみ.png");
}


// 海を描く関数
void drawSea(int y){
  for(int i = 0; i < 200 + y; i+=5){
    strokeWeight(6);
    stroke(53 - y/1000, 99, 50, 60 - y/10);
    line(0, i, width, i);
  }
}

// 飛沫を描く関数
void drawSpray(int y){
  for(int i = 0; i < 30 + y/3; i++){
    strokeWeight(8);
    stroke(0, 0, 99, 30);
    point(random(width), random(y, y + y/10));
  }
}




