
int _num = 20;
float _mouseDia;
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
  background(255);
  fill(150);
   translate(width/2,height/2);
   _mouseDia=sqrt((mouseX-width/2)*(mouseX-width/2)+(mouseY-height/2)*(mouseY-height/2));
  for (int i=0; i < _num; i++) {
  _circleArr[i].drawMe();
  }
}

void mousePressed(){
   for (int k=0; k < _num; k++) {
  _circleArr[k].speed *= -1; 
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
    rotateSpeed = random(0.5,1.5);
    diameter = random(20,30);
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
    if(r>360){
     r=r%360; 
    }
    if(x>_mouseDia){
     x=_mouseDia; 
    }
     if(x<0){
     x=2; 
    }
    if (keyPressed) {
    if (key == 'r') {
      rotateSpeed /= 1.3;
    }
        if (key == 'd') {
      rotateSpeed *= 1.3;
    }
     if (key == 'x') {
      rotateSpeed = -rotateSpeed;
    }
  }
    
    
  }
  

}
