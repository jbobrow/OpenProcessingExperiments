
void setup(){
  size(480, 480);
  smooth();
  noLoop();
}
void draw(){
  drawRect(0,0, width, height, 7);
  save("gasket.tif");
}
void drawRect(float x, float y, float a, float b, int num){
  fill(random(0, 255),random(0, 255), random(0, 255));
  rect(x, y, a, b);
  float r = random(0.2, 0.8);
  num = num -1;
  if(num > 0){
    drawRect(x, y, r*a, r*b, num);
    drawRect(x + r * a, y, (1-r)*a, r*b, num);
    drawRect(x , y+ r * b, r*a, (1-r)*b, num);
    drawRect(x + r * a, y+ r * b, (1-r)*a, (1-r)*b, num);
  }
}
  
