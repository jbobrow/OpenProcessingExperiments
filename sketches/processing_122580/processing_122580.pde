
int _width = 800;
int _height = 800;

float x1 = 0;
float y1 = 0;
float x2 = _width/2;
float y2 = _height/2;
float x3 = _width/2;
float y3 = _height/2;

void setup() {
  size(_width, _height);
  background(0);
}

void draw() {
  float x4 = mouseX;
  float y4 = mouseY;

  stroke(random(255),random(255),random(255),10);
  noFill();
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
}

void keyPressed() {
  if (key == ' ') {
    background(0);
  }
  if (key == CODED) {
    if (keyCode == UP) { 
      y1-=10;
      y2-=10;
    }
    if (keyCode == DOWN) { 
      y1+=10;
      y2+=10;
    }
    if (keyCode == LEFT) { 
      x1-=10;
    }
    if (keyCode == RIGHT) { 
      x1+=10;
    }
//    println(x1,y1);
  }
      println("x1 = " + x1);
  
}

