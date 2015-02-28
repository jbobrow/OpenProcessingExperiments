
void setup(){
size(500, 500);
colorMode(RGB, 255);
background(255, 255, 255);
smooth();
noLoop();
}

void draw(){
//水面
  for(int i = 0 ; i < 70 ; i++){
  drawWater(0, 500, random(height));
  stroke(random(40, 70), random(150, 200), random(130, 230));
}
//波
  for(int i = 0 ; i < 150 ; i++){  
  drawNami(10, 10);
  } 
}
 
void drawWater(float a, float b, float c){
  strokeWeight(1);
  line(a, c, b, c);
  filter(BLUR);
}

void drawNami(float a, float b){
  scale(random(1, 1.07));  
  strokeWeight(2);  
  stroke(random(0, 100), random(0, 150), random(200, 255), random(90,100));
  noFill(); 
  rotate(random(0, PI)); 
  arc(a, b, a+50, b+50, 0, PI);
}


