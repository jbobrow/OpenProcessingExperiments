
int iterations = 4;
int siz = 7;
int len = 1;
int total;
float angle = 2*PI-2*PI/7;
float radius = 200;
Point[] myPoint = new Point[round(pow(siz, iterations+1))+1];
void setup(){
  size(800, 800);
  stroke(255, 255, 255, 25);
  background(0);
  colorMode(HSB, 255);
  smooth();
  myPoint[0] = new Point(width/2, height/2, angle, siz, radius, -PI/2, 0);
  for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
}
}

void draw(){
  fill(0, 100);
  rect(-1, -1, width+1, height+1);
  if(keyPressed == true){
    if(key == '2'){
      siz = 2;
        total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
    }
    }
  }
    if(keyPressed == true){
    if(key == '3'){
      siz = 3;
        total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
    }
    }
  }
      if(keyPressed == true){
    if(key == '4'){
      siz = 4;
        total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
    }
    }
  }
      if(keyPressed == true){
    if(key == '5'){
      siz = 5;
        total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
    }
    }
  }
      if(keyPressed == true){
    if(key == '6'){
      siz = 6;
      if(iterations >= 5){
        iterations = 4;
      }
        total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
    }
    }
  }
      if(keyPressed == true){
    if(key == '7'){
            if(iterations >= 5){
        iterations = 4;
      }
      siz = 7;
        total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
    }
    }
  }
    if(len <= pow(siz, iterations)){
    for(int j = 0; j < pow(siz, iterations); j++){
      myPoint[j].calcPoints();
      len += myPoint[j].num;
    }
    for(int j = 0; j < total; j++){
      myPoint[j].drawLines();
    }
len = 1;
myPoint[0] = new Point(width/2, height/2, dist(mouseX, mouseY, 400, 400)/400*(2*PI-2*PI/siz), siz, radius, -PI/2, PI/2-atan2(mouseX-400, mouseY-400));
}
}
class Point{
  float x, y, r, currentTheta, theta, offset;
  int num;
  Point(float x_, float y_, float theta_, int num_, float r_, float currentTheta_, float offset_){
    x = x_;
    y = y_;
    theta = theta_;
    num = num_;
    r = r_;
    currentTheta = currentTheta_;
    offset = offset_;
  }
  void calcPoints(){
    for(int i = 0; i < num; i++) {
      myPoint[len+i] = new Point(x+r*cos(currentTheta-theta/2+offset+theta/(num-1)*i), y+r*sin(currentTheta-theta/2+offset+theta/(num-1)*i), theta,  num, r/2, currentTheta-theta/2+offset+theta/(num-1)*i, offset);
    }
  }
    void drawLines(){
      for(int k = 0; k < num; k++) {
        line(x, y, x+r*cos(currentTheta-theta/2+offset+theta/(num-1)*k), y+r*sin(currentTheta-theta/2+offset+theta/(num-1)*k));
      }
    }
  }
void mousePressed() {
  if(keyPressed == false){
    if(siz >= 5){
      if(iterations < 4){
        iterations += 1;
        total = 0;
        for(int j = 0; j < iterations+1; j++){
          total += pow(siz, iterations-j);
        }
      }
}
        if(siz < 5){
  if(iterations <= 5){
  iterations += 1;
  total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
}
  }
        }
  }
  if(keyPressed == true){
    if(key == CODED) {
      if(keyCode == SHIFT){
        if(iterations >= 1){
  iterations -= 1;
  total = 0;
    for(int j = 0; j < iterations+1; j++){
  total += pow(siz, iterations-j);
}
      }
    }
  }
  }
}

