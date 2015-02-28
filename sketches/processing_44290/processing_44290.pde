

Ball sa = new Ball (20, 20);
 
void setup() {
  size(256,256);
 
  }

void draw() {
  background (90);
  sa.update();
 
  }


class Ball {
  float x,y,v;
 
  Ball(float x_, float y_){
    x = x_;
    y = y_;
    v = 10;
  }
 
  void update(){
 
    float distance = dist(mouseX,mouseY,x,y);
 
 if (distance < 3 ){

        float radians = atan2(mouseY-y,mouseX-x)+PI;
        x = x + v * cos(radians);
        y = y + v * sin(radians);

    }

    noStroke();
    fill(#FFFFFF);
    ellipse(x,y,10,10);
  }
 
 
}

