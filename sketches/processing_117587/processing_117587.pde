
Brush b1;
Brush b2;
Brush b3;

void setup() {
  size(800, 800);
  smooth();
  //noLoop();

  b1 = new Brush(0.1, 0.1,  200, height/2);
  b2 = new Brush(0.001, 0.005, 600, height/2);
  b3 = new Brush(0.001, 0.001, 400, height/2);
}

void draw() {
  background(240);

  b1.display();
  b2.display();
  b3.display();
}



class Brush {
  float xs, ys;
  float xLo, yLo;
  float x1;
  float y1 ;

  //----------------------------constructor
  Brush(float x,float y, float xp, float yp) {
    xs = x;
    ys = y;
    xLo = xp;
    yLo = yp;
    
  }

  //-----------------------------functions
  void display() {
    handle();
    head();
  }

  //-------------------------- heads
  void head() {
    noStroke();
    float steps = 230/4;
    float value = 255/4;

    for ( int i = 0; i < 4; i++) {
      float x = xLo - i*5;
      float rx = 230 - i*steps - 60/(i+1);
      float ry = 230 - i*steps + i*15;
      
    fill(value*i + 100, 255, 255);
    ellipse(x, yLo, rx, ry);
  
  //-------------------------- bristle
      float d = 48;
      float inc = TWO_PI / d;
      for (int h=1; h<=d; h++) {
        float sw = 0.7*i + 0.5;
      
        
        x1 +=xs;
        y1 += ys;
     
        float xn = x+cos(h*(inc + x1/h) - HALF_PI) * rx/2;
        float yn =yLo+sin(h*(inc + y1/h) - HALF_PI) * ry/2;
        strokeWeight(sw);
        if ( h <= d/2) {
          line(xn, yn, xn - 30, yn);
          stroke(0, 255);
        } 
        else {
          line(xn, yn, xn - 20, yn);
          stroke(0, 150);
        }
      }
    }

}

//-------------------------- handle
void handle() {
  fill(0, 230, 255);
  noStroke();
  float size = 230;
  float y = 500;
  float c = 80;
  float e = 100 + size/1.2;
  quad(xLo-size/2+c, yLo, xLo-size/2+c, yLo + e, xLo+size/2-c, yLo + e, xLo+size/2-c, yLo);
}














}


