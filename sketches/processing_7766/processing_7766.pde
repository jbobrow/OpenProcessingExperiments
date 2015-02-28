
class Sable {
  float x,y,v,r;

  Sable(float x_, float y_, float r_){
    x = x_;
    y = y_;
    v = 17;
    r = r_;
  }

  void update(){


    float distance = dist(mouseX,mouseY,x,y);

    if (distance < 14 ){
      if (mousePressed){
        float radians = atan2(mouseY-y,mouseX-x)+PI;
        x = x + v * cos(radians);
        y = y + v * sin(radians);
      }
    }

    x = constrain (x,r/2,width-r/2);
    y = constrain(y,r/2,height-r/2);

    noStroke();
    fill(242,238,110);
    ellipse(x,y,r,r);
  }


}






