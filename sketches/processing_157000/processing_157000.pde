
  float a, b, c, d, e, f;
  float r_,g_,b_;

void setup() {
  size(480, 480);
  noStroke();
  newFN();
}

void newFN() {
  a = random(400)*0.01 - 1.0;
  b = random(400)*0.01 - 1.0;
  c = random(400)*0.01 - 2.0;
  d = random(2000)*0.01 - 8.0;
  e = random(2000)*0.01 - 8.0;
  f = random(2000)*0.01 - 5.0;
  
  r_ = random(155);
  g_ = random(155);
  b_ = random(155);
  
  println(a);
  println(b);
  println(c);
  println(d);
  println(e);
  println(f);
}



void draw() {
  
  float x_, y_;
  
  for(int x = 0; x <= width; x += 4) {
    for (int y = 0; y <= height; y += 5) {
      x_ = (x-width/2) / 30.0;
      y_ = (y-height/2) / 30.0;
      
      float result = a*x_*x_ + b*y_*y_ + c*x_*y_ + d*x_ + e*y_ + f;
      //int a = int(abs(result)*100);
      noStroke();
      fill( r_+random(90),g_+random(90),b_+random(90) );
      
      if (result < 0.4) {
        ellipse(x,y, 6,7);
      }
    }
  }
  if (!keyPressed && random(100)>40) {
    newFN();
  }
}


