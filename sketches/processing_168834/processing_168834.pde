
class Bolo{
  float r;
  float low;
  float high;
  int theta = int(random(0, 360)); //angle for use in sine and cosine.
  float x1;
  float x2;
  float y1;
  float y2;
  float posX1 = width/2+sin(theta)*r;
  float posY1;
  float posX2 = width/2+sin(-theta)*r;
  float posY2;
  boolean go;
  color c = color(255);
  float speed = 5;
  float grav = .2;
  float size = 10;
  
  Bolo(float low_, float high_, float posY1_, float posY2_){  
    low = low_;
    high = high_;
    posY1 = posY1_;
    posY2 = posY2_;
 
    go = true; 
  }
  
  void display(){
    fill(c);
    ellipse(posX1,posY1,size,size);
    ellipse(posX2,posY2,size,size);
  }
  
  void rotate(){
    c = color(255);
    float r;
    theta += .5;
    r = random(1,200);
    if (theta > 360){
      theta=0;
    }
    if (theta == 1){
      r = random(1,200);
    }
    posX1 = width/2+sin(theta)*r;
    posX2 = width/2+sin(-theta)*r;
    size = sin(theta)*30 + 20;
  }
  
  
}

