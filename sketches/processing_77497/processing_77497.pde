
class Speck {
  float xpos;
  float ypos;
  float zpos;
  
  float q;
  float w;
  float e;
  
  Speck(float tempX, float tempY, float tempZ){
    xpos = tempX;
    ypos = tempY;
    zpos = tempZ;
  }
  
  void display(){
    point(xpos, ypos, zpos);
    xpos += random(-speed, speed);
    ypos += random(-speed, speed);
    zpos += random(-speed, speed);
    if(xpos < -width/2){
      xpos = -width/2;
    }
    if(xpos > width/2){
      xpos = width/2;   
    }
    if(xpos < -width/2){
      xpos = -width/2;
    }
    if(ypos > height/2){
      ypos = height/2;   
    } 
    if(ypos < -height/2){
      ypos = -height/2;
    }
    if(zpos < -width/2){
      zpos = -width/2;
    }
    if(zpos > width/2){
      zpos = width/2;   
    }
  }
  
    void colour(){
    q = random(0.0,255.0);
    w = random(0.0,255.0);
    e = random(0.0,255.0);
    stroke(q,w,e);
  }
}



