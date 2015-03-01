
int Num = 2;
Wheel[] wheels = new Wheel[Num];
Actractor actractor;

void setup(){
  size(800,600);
  
  colorMode(HSB,360,360,360);
  background(360,0,100);
  for (int i=0; i<Num; i++){
  wheels[i] = new Wheel(200, random(width), random(height), random(-5,5), random(-5,5), random(360), random(-5,5),color(100,100,100), 8);
  actractor = new Actractor(random(width), random(height), random(10,60), random(360), random(0.5));
}
}
void draw(){
  for (int i=0; i<Num; i++){
    wheels[i].display();
    wheels[i].move(actractor.getX(),actractor.getY());
    actractor.move();
    if (mousePressed) {
      actractor.setX(mouseX);
      actractor.setY(mouseY);
    }
  }
  if (keyPressed){
    saveFrame();
  }
}

class Actractor {
  float posX, posY, centerX, centerY, radius, omega, alpha;
  Actractor(float cenX, float cenY, float rad, float alp, float omg){
    centerX = cenX;
    centerY = cenY;
    radius = rad;
    alpha = alp;
    omega = omg;
    posX = cos(radians(alpha))*radius+centerX;
    posY = sin(radians(alpha))*radius+centerY;
  }
  void move(){
    alpha = (alpha + omega)%360;
    posX = cos(radians(alpha))*radius+centerX;
    posY = sin(radians(alpha))*radius+centerY;
  }
  float getX(){
    return posX;
  }
  float getY(){
    return posY;
  }
  void display(){
    noStroke();
    ellipse(posX,posY,10,10);
  }
  void setX(float X){
    centerX = X;
  }
  void setY(float Y){
    centerY = Y;
  }
}
    
class Wheel {
  int N;
  float alpha;
  color c;
  float radius;
  float omega;
  float posX;
  float posY;
  float velX;
  float velY;
  float alpha0 = random(360);
  Wheel(float initR, float initX, float initY, float initVx, float initVy, float initAlpha, float initOmega, color initC, int initN){
    radius = initR;
    posX = initX;
    posY = initY;
    velX = initVx;
    velY = initVy;
    alpha = initAlpha;
    omega = initOmega;
    N = initN;
    c = initC;
  }
  void display(){
    noFill();
    for (int i = 0; i<N; i++){
      float ang = alpha+360/N*i;
      stroke((ang+alpha0)%360,360,360);
      line(posX+cos(radians(ang))*radius,posY+sin(radians(ang))*radius,actractor.getX(),actractor.getY());
     
    }
  }
  void move(float actX, float actY){
    float accX, accY, acc;
    acc = 5/sqrt((posX-actX)*(posX-actX) + (posY-actY)*(posY-actY));
    float vrad;
    if (posX-actX<0){
      vrad = atan((posY-actY)/(posX-actX));
    }
    else{
      vrad = atan((posY-actY)/(posX-actX))+radians(180); 
    }
    accX = cos(vrad)*acc - 0.01*velX;
    accY = sin(vrad)*acc - 0.01*velY;
   
    
    velX += accX;
    velY += accY;
    alpha += omega+10/sqrt((posX-actX)*(posX-actX) + (posY-actY)*(posY-actY))-0.01*omega;
    posX += velX;
    posY += velY;
    if (posX > width){
    velX = -velX;
    }
    if (posX < 0){
    velX = -velX;
    }
    if (posY > height){
    velY = -velY;
    }
    if (posY < 0){
    velY = -velY;
    }
    if (alpha > 360){
    alpha = 0;
    }
    if (alpha < 0){
    alpha = 360;
    }
  }
}


