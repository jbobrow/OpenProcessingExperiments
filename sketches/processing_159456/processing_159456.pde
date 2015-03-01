

float num, pathR, pathG, pathB;
boolean doOnce = true;
void setup() {
  size(640, 640);
}
 void draw() {
  rect(-1, -1, width+1, height+1);
  translate(width/4, height/4);
  for (int i = 0; i < 360; i+=2) {
   
    float angle = sin(i+num)*50;
   
    float x = sin(radians(i))*(100+angle);
    float y = cos(radians(i))*(100+angle);
    float x2 = sin(radians(i))*(200+angle);
    float y2 = cos(radians(i))*(200+angle);
    float x3= sin(radians(i))*(500+angle);
    float y3= sin(radians(i))*(500+angle);
    float x4= cos(radians(i))*(550+angle);
    float y4= sin(radians(i))*(550+angle);
  
    pathR = (((float)255/width)*mouseX+angle)+125*sin(i+num*3);
    pathG = (50+angle)+89*sin(i+num*3);
    pathB = (((float)0/height)*mouseY+angle)+125*sin(i+num*3);
     
     
    stroke(pathR, pathG, pathB);
    fill(pathR, pathG, pathB);
  
    ellipse(x, y, angle/1, angle/1);
    ellipse(y2, x2, 8, 8);
    ellipse(y3,x3,8,8);
    ellipse(y4,x4,5,5);
    ellipse(x,y,50,50);
  }
  num+=0.01;
}
 void mouseReleased(){
  doOnce = true;
}

