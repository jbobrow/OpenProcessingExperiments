
Wheel[] wheels = new Wheel[100];

void setup(){
  size(640,480);
  noStroke();
  fill(255);
  
  smooth();
  
  for(int i=0; i<wheels.length; i++){
    wheels[i] = new Wheel(rand(width),rand(height),random(90)+15,
        color(rand(255),rand(255),rand(255),100));
  }
  
  frameRate(30);
}

void draw(){
  background(0);
  
  for(int i=0; i<wheels.length; i++){
    wheels[i].update();
    wheels[i].draw();
  }
}


void snow(int x, int y, int r, float rad){
  pushMatrix();
  
  translate(x,y);
  
  rotate(rad);
  
  for(int i=0;i<6; i++){
    rotate(TWO_PI/6);
    diamond(0,-r/2,r/2,r);
  }
  
  popMatrix();
}

void diamond(int x, int y, int w, int h){
  beginShape();
  vertex(x-w/2, y);
  vertex(x,y-h/2);
  vertex(x+w/2,y);
  vertex(x,y+h/2);
  endShape(CLOSE);
}

int rand(int n){
  return int(random(n));
}


class Wheel{
  int x;
  int y;
  float rad;
  float speed;
  color col;
  
  final int R = 40;
  
  Wheel(int x,int y,float speed,color col){
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.col = col;
  }
  
  void draw(){
    fill(col);
    snow(x,y,R,rad);
  }
  
  void update(){
    rad += speed/60*PI/15;
  }
}

