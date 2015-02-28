
Swarm[] bugs = new Swarm[16];
int r = 255;
int g = 255;
int b = 255;
int counter = 1;

void setup() {
  size(700, 700);
  background(0);
  smooth();

    for (int i = 0; i < bugs.length; i ++ ) {
      bugs[i] = new Swarm(350,height);
    
  }
}
 
void draw() {
  for (int i = 0; i < bugs.length; i ++ ) {
    bugs[i].move();
    bugs[i].display();
  }
  
  if( keyPressed) {
    switch(key) {
    case('r'):g = g - 1;b = b - 1;break;
    case('g'):b = b - 1;r = r - 1;break;
    case('b'):r = r - 1;g = g - 1;break;
    case('y'):b = b - 1;break;
    case('t'):r = r - 1;break;
    case('p'):g = g - 1;break;
    case('w'):g=255;b=255;r=255;break;
    }
    if( key == ' ') {
    save("capture_" + counter + ".png");
    counter++;
    }
  }
}


class Swarm {
  float x;
  float y;

  
  Swarm( int x_, int y_) {
    x = x_;
    y = y_;
  }
  
  void display() {
    ellipseMode(CENTER);
    stroke(r,g,b);
    fill(r,g,b);
    ellipse(x, y, 5, 5);
  }
  
  void move() {
    x = x + random(-5,5);
    y = y + random(-3,1);
    if( y < 0 ) {
      y = height;
    }
  }

}


