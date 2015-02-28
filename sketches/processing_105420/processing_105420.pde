
int counter;
Walker w;

void setup() {  //setup function called initially, only once
  size(600, 360);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode

  w = new Walker();
}

void draw() {  //draw function loops 
  w.step();
  w.display();  
}

class Walker {
  int x;
  int y;
  
  Walker() {
    x = width / 2;
    y = height / 2;
  }
  
  void display() {
    stroke(0);
    point(x, y);
  }
  
  void step() {
    float stepx = random(-1, 1);
    float stepy = random(-1, 1);
    
    x += stepx;
    y += stepy;
  }
}
