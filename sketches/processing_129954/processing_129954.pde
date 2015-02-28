
int _num = 5;
circle[] _circleArr = {};

void setup(){
  size(500,500);
  background(255);
  smooth();
  colorMode(HSB);
  frameRate(30);
  translate(width/2,height/2);
  drawCircle();
}

void draw(){
  //background(255);
   translate(width/2,height/2);
  for (int i=0; i < _num; i++) {
  _circleArr[i].drawMe();
  }
}

void drawCircle(){
  for (int i=0; i < _num; i++) { 
    circle thisCirc = new circle();
    noStroke();
    _circleArr = (circle[])append(_circleArr, thisCirc);
  } 
}

class circle{
  float speed,rotateSpeed,diameter,H,S,B,r,x;
  circle(){
    speed = random(2,6);
    rotateSpeed = random(1);
    diameter = random(3,10);
    H = random(255);
    S = random(130,255);
    B = random(130,255);
    x = 0;
    r = 0;
  }
  
  void drawMe(){
    fill(H,S,B,120);
    rotate(radians(r));
    ellipse(x,0,diameter,diameter);
    r += rotateSpeed;
    x += speed;
    if(r > 360){
     r = r%360; 
    }
    if(x > 200 ||x < 0){
     speed = -speed; 
    }
  }
}
