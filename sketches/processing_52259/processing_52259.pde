
void setup() {
  size(400, 400);
  smooth();

  bendas = new ArrayList();
  for (int i = 0; i < banyaknya; i ++) {
    float z = TWO_PI * i / banyaknya;
    
    bendas.add(
      new Benda(
        //200 + 50 * cos(z),
        //200 + 50 * sin(z)
        200,200
      )
    );
  }  
}

int banyaknya = 230;

class Benda {
  float x, y;
  float v, a;
  float p;
  float r;
  float dir;
  
  Benda(float x0, float y0) {
    x = x0;
    y = y0;
    
    p = random(0, TWO_PI);
    r = random(10, 40);
    dir = random(-1, 1);
  }
  
  void draw(float t) {
    float px = x;// + r * cos(2 * dir * t + p);
    float py = y;// + r * sin(3 * dir * t + p);
    
    //fill(#ffffff, 80);
    //ellipse(px, py, 5, 5);
    stroke(#ffffff, 80);
    strokeWeight(1);
    line(
      px - 3 * cos(t - p),
      py - 3 * sin(t - p),
      px + 3 * cos(t - p),
      py + 3 * sin(t - p)
    );
  }
  
  void calc(float t) {
    float dx = mouseX - x;
    float dy = mouseY - y;
    
    v = 2;
    a = atan2(dy, dx) + 1. * sin(t + p);
    
    x = x + v * cos(a);
    y = y + v * sin(a);
  }
}

ArrayList bendas;

void draw() {
  float t = (float) millis() / 600;
  
  hapus();
  
  //fill(#ffff00);
  //ellipse(mouseX, mouseY, 20, 20);

  Benda bp = null;
  for (int i = 0; i < bendas.size(); i++) {
    Benda b = (Benda) bendas.get(i);
    
    b.draw(t);
    
    if (bp != null) {
      stroke(#00ff00, 30);
      line(bp.x, bp.y, b.x, b.y);
    }
    
    b.calc(t);
    
    bp = b;
  }  
}

void hapus() {
  fill(#000000, 250);
  noStroke();
  rect(0, 0, width, height);
}                                                                                               
