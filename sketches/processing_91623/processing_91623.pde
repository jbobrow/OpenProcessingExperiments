
Squares h1 = new Squares(20,20);
PFont f;


void setup() {
  size (500, 500);
  smooth(); 
  frameRate(10);
  background(0);
  noLoop();
   f = loadFont("Flama-Medium-48.vlw");
}

void draw() {
 h1.display();
}

void mousePressed () {
  redraw();
}


class Squares {

  float xpos, ypos;

  Squares (float i, float j) {
    xpos=i;
    ypos=j;
  }

  void display() {
    for (int i = 0; i>=0 && i<=width; i+=20) {
      for (int j = 0; j>=0 && j<=height; j+=20) {
        pushMatrix();
        translate(i, j);
        fill(random(0, i), random(0,j), 170);
        rect(0, 0, 20, 20);
        stroke(random(0, mouseX), random(j, mouseY), 170);
        line(0, 0, width, height); 
        textFont(f, 16);
      fill(random(0,90),random(i, 90), 90);
    text ("I", random(0,width),random(0,j));
    text ("A", random(0,i),random(0,height));
    text ("N", random(0,i),random(0,j));
        popMatrix();
      }
    }
  }
  
  
}



