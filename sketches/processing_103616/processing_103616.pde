
// Jefferson Lam
// December 9th, 2012
// Random stripe project

//[n] stripes are created (default 8)
//The stripes slowly move left and right
//Edges of the screen are continuous
//When you mouseover a stripe, the color becomes more opaque
//You can click and drag them around, and also fling them
//There is friction
//Stripe color changes over time
//Stripe color changes faster when it's moving fast

int n = 8;
Stripe[] A = new Stripe[n];

void setup() {
  size(825, 450);
  smooth();
  colorMode(HSB, 360, 100, 100);
  for (int i=0; i<A.length; i++) {
    A[i] = new Stripe();
  }
}

void draw() {
  background(0, 0, 100);
  for (int i=0; i<A.length; i++) {
    A[i].display();
    A[i].mouse();
  }
}

class Stripe {
  float x;
  int y;
  int w;
  float speed;
  float accel;
  int o;
  float clr;
  float clrSpeed;

  Stripe() {
    x = random(0, width);
    y = 0;
    w = int(random(10, 50));
    speed = random(-0.6, 0.6);
    accel = 0;
    clr = random(0, 360);
    o = 100;
    clrSpeed=random(0.1, 0.3);
  }

  void display() {
    noStroke();
    fill(clr, 100, 100, o);
    rect(x, y, w, height);
    accel += random(-0.01, 0.01);
    x += speed+accel;
    if (abs(speed)>0.25) speed *= 0.99;
    
    if (x>width) x=0-w;
    else if (x<0-w) x=width;

    
    if (abs(speed)>1) clrSpeed = speed*0.2;
    else clrSpeed = random(-0.3, 0.3);
    
    clr += clrSpeed;
    
    if (clr>360) clr = 0;
    else if (clr<0) clr = 360;
  }
  
  void mouse() {
    if (mouseX>=x && mouseX<=x+w) {
      o = 225;
      if (mousePressed){
        x = mouseX-(w/2);
        speed = mouseX-pmouseX;
      }
    } else {
      o=125;
    } 
  }
  
}



