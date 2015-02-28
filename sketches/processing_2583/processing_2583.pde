
// very simple sketch to simulate chalk pencil & charcoal drawing
// with symmetry around many axes

int segments = 5;
int pencil_col = 240, chalk_col = 40, canvas_col = 80;
float rf;

void setup() {
  size(500, 500);
  background(canvas_col);
  smooth();
  strokeCap(ROUND);
  strokeJoin(ROUND);
  cursor(CROSS);
}

void draw() {
  int stroke_weight, pressure;
  pressure = 20;

  if (mouseButton == LEFT) { // chalk pencil
    stroke(pencil_col, pressure);
    strokeWeight(1.5);
    rf = 0;
  } 
  else if (mouseButton == RIGHT) { // charcoal stick
    stroke(chalk_col, pressure/2);
    strokeWeight(3.5);
    rf = 4;
  } 
  else if (mouseButton == CENTER) { // eraser
    stroke(canvas_col, pressure*3);
    strokeWeight(5);
    rf = 0;
  }

  if (mousePressed) {
    float fx = mouseX-(width/2), fy = mouseY-(height/2), px = pmouseX-(width/2), py = pmouseY-(height/2);
    translate(width/2,height/2);
    for (int i=0; i<segments; i++) {
      line(fx+random(-rf,rf),fy+random(-rf,rf),px+random(-rf,rf),py+random(-rf,rf));
      rotate(TWO_PI/segments);
    }
  }
}

void keyReleased() {
  if (key == ' ') { 
    background(canvas_col); 
  }
  else if (key == 's') { 
    saveFrame("chalkcoal-####.png"); 
  }
  else if (key == '=') { 
    segments++;
    if (segments<1) { 
      segments=1;
    }
  }
  else if (key == '-') {
    segments--;
  }
}




