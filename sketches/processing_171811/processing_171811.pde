
Walker w;
int xdist;
int ydist;

void setup() {
  size(800, 800);
  w = new Walker();
  background(255);
  frameRate(2000);
}

void draw() {
  w.step();
  w.display();
}

class Walker {
  int x;
  int y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
  
  void step() {
    xdist = mouseX-x;
    ydist = mouseY-y;
    float stepx = random(3)-1+(mouseX-x)/10;
    float stepy = random(3)-1+(mouseY-y)/10;
    x+= stepx;
    y+= stepy;
  }
}


