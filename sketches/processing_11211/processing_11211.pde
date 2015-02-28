
void setup(){
  size(500, 500);
  colorMode(HSB);
  background(255);
  noStroke();
  smooth();
  noLoop();
}

void draw(){
  
  //背景
  drawBack(0, 0);
  
  //緑
  for(int i = 0 ; i < 1000 ; i++){
    drawGreen(random(width), random(0, 500));
  }
  
 //赤
  for(int i = 0 ; i < 1500 ; i++){
    drawRed(random(width), random(200, 500));
  }
  
  //種
  drawTane(100, 400);
 
 save("0812082, png");

}

//背景
void drawBack(int x, int y){
  fill(110, 200, 70);
  rect(x, y, 500, 500);
}


//緑
void drawGreen(float x, float y){
    fill(90, 200, 180, 50);
    rect(x, y, 30, 30);
}


//赤
void drawRed(float x, float y){
    fill(0, 240, 200, 70);
    ellipse(x, y, 30, 30);
}


//種
void drawTane(int x, int y){
  fill(0, 0, 0, 150);
  ellipse(x, y, 20, 40);
  ellipse(x+160, y, 20, 40);
  ellipse(x+300, y, 20, 40);
}

