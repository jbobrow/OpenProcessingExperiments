
int _num=5;
float x;
float y;
float d1;
float d2;
float L1=100;
float W1=50;
float L2=100;
float ii=1;
float _mouseDia;
circle[] _circleArr = {};

void setup() {
  size(500, 500);
  background(255);
  translate(width/2, height/2);
  frameRate(30);
  colorMode(HSB);
  stroke(255, 255, 255, 50);
  strokeWeight(1);
  fill(130, 255, 255, 10);

  drawCircle();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  _mouseDia=100;
  rotate(radians(-90));
  for(int i=0;i<_num;i++){
    rotate(radians(360/_num));
    pushMatrix();
    translate(100,0);
    rotate(radians(90));
  for (int j=0;j<2*int(ii)-1;j++) {
    _circleArr[i*(2*int(ii)-2)+j].drawMe();
  }
  popMatrix();
  }
}

void mousePressed() {
  _circleArr[0].speed *= -1;
  for(int i=0;i<_num;i++){
  for (int j=1; j < 2*int(ii)-1;j++) {
    _circleArr[i*(2*int(ii)-2)+j].speed *= -1; 
  }
  }
}

void drawCircle() {
  for(int i=0;i<_num;i++){
    ii=1;
  L2=L1;
  circle thisCirc0 = new circle(W1, L2, 0, L2/2);
  _circleArr = (circle[])append(_circleArr, thisCirc0);
  while (L2 > 0.0) {
    x=ii/5;
    d1=pow(x, 2);
    d2=2*pow(x, 2);
    L2=L1-d1-d2;
    circle thisCirc1 = new circle(L2/L1*W1, L2, ii, d2+L2/2);
    _circleArr = (circle[])append(_circleArr, thisCirc1);
    circle thisCirc2 = new circle(L2/L1*W1, L2, -ii, d2+L2/2);
    _circleArr = (circle[])append(_circleArr, thisCirc2);
    ii += 1.0;
  }
  }
}

class circle {
  float speed, rotateSpeed, diameterX, diameterY, H, S, B, r, x, traX, traY,temp,tempR;
  circle(float DiaX, float DiaY, float TraX, float TraY) {
    speed = random(2, 6);
    rotateSpeed = random(4,5);
    temp=rotateSpeed;
    diameterX = DiaX;
    diameterY = DiaY;
    traX=TraX;
    traY=TraY;
    H = 255;
    S = 255;
    B = 255;
    x = 0;
    r = 0;
    tempR=0;
  }

  void drawMe() {
    
    fill(H, S, B, 10);
    stroke(H,S,B, 50);
    strokeWeight(1);
    pushMatrix();
    translate(traX, traY-L1/2);
    rotate(radians(r));
    ellipse(x, 0, diameterX, diameterY);
    popMatrix();
    if(speed>0){
       rotateSpeed=temp; 
    }
    r += rotateSpeed;
    x += speed;
    if(mousePressed){
    tempR=r;  
    }
    if (x>_mouseDia) {
      x=_mouseDia;
    }
    if (x<0) {
      x=0;
    }
    if (r>360) {
       if(x==0){
        rotateSpeed=0;
        r=0;
       }
      r=r%360;
    }
  }
}


