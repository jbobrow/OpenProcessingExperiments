
class StreetLight {
  float x,y,h;
  float c = 0;
  boolean on;
  // constructor
  StreetLight(float tx, float ty, float th) {
    x = tx;
    y = ty;
    h = th/1.2;

    on = true;
  }
  boolean isOn() {
    return on;
   
  }
  void turnOn() {
    on = true;
  }
  void turnOff() {
     on = false;
  }
  void display() {
    drawLight();
  }
  void drawLight() {
    if (on==true){
       c+=10;
     } else {
       c-=10;
     }
    fill (0);
    rect (x,y-h,h/20,h);
    rect(x-h/10,y-h/10, 2.5*h/10, h/7);
    fill (c);  
    quad(x,y-h,x-h/10,y-(h+h/5),x+h/6.6,y-(h+h/5),x+h/20,y-h);
    fill(0);
    triangle(x-h/10,y-(h+h/5),x+h/29,y-(h+h/3),x+h/6.6,y-(h+h/5));
    stroke(0);
    line(x+h/29,y-(h+h/3),x+h/32, y-(h+(h*.1)/20));
    noStroke();
  }
} 
// end of class StreetLight

