
  float a, b, c, d, e, f;
  float r_,g_,b_;

void setup() {
  size(480, 480);
  noStroke();
  newFN();
}

void newFN() {
  a = random(400)*0.01 - 2.0;
  b = random(400)*0.01 - 2.0;
  c = random(400)*0.01 - 3.0;
  d = random(1000)*0.01 - 5.0;
  e = random(1000)*0.01 - 5.0;
  f = random(1000)*0.01 - 5.0;
  
  r_ = random(205);
  g_ = random(205);
  b_ = random(205);
  
  println(a);
  println(b);
  println(c);
  println(d);
  println(e);
  println(f);
}



void draw() {
  
  float x_, y_;
  
  for(int x = 0; x <= width; x += 3) {
    for (int y = 0; y <= height; y += 2) {
      noStroke();
      fill( r_+random(50),g_+random(50),b_+random(50) );
      x_ = (x-width/2) / 10;
      y_ = (y-height/2) / 10;
      
      float result = a*x_*x_ + b*y_*y_ + c*x_*y_ + d*x_ + e*y_ + f;
      if (result < 1.4) {
        ellipse(x,y, 5,5);
      }
    }
    if (mousePressed) {
      newFN();
    }
  }
}


