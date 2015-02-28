
class Ball{

  float x;
  float y;
  float speedx;
  float speedy;
  float r;

  Ball(float tempx, float tempy, float tempspeedx, float tempspeedy, float tempr){
    speedx = random(tempspeedx,tempspeedx+5);
    speedy = random(tempspeedy,tempspeedy+5);
    x = tempx;
    y = tempy;
    r = tempr;

  }

  void display(){
    stroke(255,10,255);
    //gradient fill
    fill(y/(height/255),x/(width/255),10);
    //solid fill
    //fill(10,255,10);
    ellipse(x,y,r,r);
  }

  void move(){
    x = x + speedx;
    y = y + speedy;
    if(x > width || x < 0){
      speedx = speedx * -1;
    }
    if(y > height || y < 0){
      speedy = speedy * -1;
    }
  }
}



