
color c1;
float scaler = 5;
float offset = 15;

class Robo {
  int x;
  int y;
  float hh=250;
  int p;
  float clicker, clicker1;
  float a1,a2,a3;
  //  float clicker, clicker1;
  //  float scaled= 200;
  //  float scaled1= 200+ clicker;
  //  float scaled2=200 +clicker1;
  color c;





  Robo (int x_, int y_, int p_) {

    x=x_;
    y=y_;
    p = p_;
    clicker=0;
    clicker1=0;


    if (p==1) {
      c = color (20, 166, 193);
    }
    else if (p==2) {
      c=color(108, 9, 116);
    }
    else if (p==3) {
      c=color(152, 81, 5);
    }
  }
 

  void display() {
    float d1 = offset + sin(a1) * scaler;
    float d2 = offset + sin(a2) * scaler;
    float d3 = offset + sin(a3) * scaler;
    float scaled = 200;
    float scaled1 = 200+ clicker;
    float scaled2 = 200 +clicker1;
    float s=0;
    float d=0;
    if (p==1) {
      s= scaled;
      d=d1;
    }

    else if (p==2) {
      s= scaled1;
      d=d2;
    }

    else if (p==3) {
      s= scaled2;
      d=d3;
    }

    pushMatrix();
    translate (x, y);
    strokeWeight(5);
    fill(c);
    rect(hh, hh, 80, 80);
    fill(255);
    ellipse (hh, hh, 45, 45);
    fill(0);
    ellipse (hh, hh, d, d);//iris also d's=15's
    line (hh, 210, hh, s); // antenna
    triangle (220, s, hh, s, 280, s);//tip
    line(210, hh, 190, 280);// arm
    line (290, hh, 310, 280);//arm
    fill(c);
    //rectMode(CORNER);
    rect(280, 305, 20, 25);// legs
    rect(220, 305, 20, 25);

    popMatrix();
  }
  void mousePressed() {
    println(clicker);
    clicker=clicker -10;
    clicker1= clicker1- 25;
  }

  void pulse() {
    a1 = a1 + 0.1; //angle controls speed
    a2= a2 +0.2;
    a3= a3 + 577;
    
  }
}


