
class Mosca{
  float posX, posY, PposX, PposY;
  float prevX, prevY;
  float incX = 0.005;
  float incY = 0.005;
  float R;
  float speed = 0;
  float read_speed = 0;
  float dampen = 10;
  color cp;
  
  Mosca(float Xarg,float Yarg, float Rarg){
    prevX = Xarg;
    prevY = Yarg;
    posX = prevX + incX;
    posY = prevY + incY;
    R = Rarg;
  }
  
  void display(PImage what){
     
  read_speed = abs(PposX-posX)+abs(PposY-posY);
  if (read_speed > speed){
    speed = speed + (read_speed-speed)/dampen;
  } else {
    speed = speed - (speed-read_speed)/dampen;
  }
    
  
  cp = what.get(int(posX),int(posY));
  stroke(cp,map(mouseX,0,width,30,255));
  strokeWeight(speed*(map(mouseY,0,height,.2,4)));
  line(PposX,PposY,posX,posY);  
  }
  
void fly(){
    PposX = posX;
    PposY = posY;
    posX = noise(prevX)*width*4-width*1.5;
    posY = noise(prevY)*height*4-height*1.5;
    prevX = prevX + incX;
    prevY = prevY + incY;
  }
}

