
class StreetLight {
  float x1, y1, w1, h1;
  color c;
  color c2;
  color c3;
  color c4;
  boolean on;

  StreetLight(float tx, float ty, float th) {

    x1 = tx - .4*th;
    y1 = ty - 2.2*th;

    w1 = th/4;
    h1 = 4*th;

    c = color (95, 90, 90);
    c2= color (232, 221, 103);
    c3= color (191, 190, 181);
    c4= color (198, 227, 41);
    on= true;
  }

  void display() {
    fill(c);
    rectMode(CENTER);
    //pole
    rect(x1, y1, w1, h1);
    //knob on top of bulb
    ellipse(x1, y1 - h1/1.9, w1, h1/3);
    //bulb
    if (on)
      fill(c2);
    else
      fill(100);
    ellipse(x1, y1 - h1/2, 5*w1, h1/4);
    //decor at base of bulb
    fill(c3);
    ellipse(x1, y1- h1/2.7, w1/1.1, w1/1.1);
    ellipse(x1+w1/1.1, y1- h1/2.7, w1/1.1, w1/1.1);
    ellipse(x1-w1/1.1, y1- h1/2.7, w1/1.1, w1/1.1);
  }

  /*void turnOn() {
   if (color = c2) {
   fill(c4);
   ellipse(x1, y1 - h1/2, 5*w1, h1/4);
   }
   }
   
   void turnOff() {
   }
   */
  boolean isOn() {
    return on;
  }

  void turnOn() {
    on = true;
  }

  void turnOff() {
    on = false;
  }

//  void display() {
//    drawLight();
//  }
}


