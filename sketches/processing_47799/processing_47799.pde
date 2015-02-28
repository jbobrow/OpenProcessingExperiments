
float x;
float y;
float _x;
float _y;
boolean toggleLoop = true;

void setup() {
  size(300, 300);
  background(0);
  stroke(255);
  smooth();
  x = width / 2;
  y = height / 2;
}

void draw() {
  positionCheck();
  strokeWeight(random(2));
  randLine();
}

void randLine() {		
  _x = (int) constrain(x + random(-20, 20), 0, width);
  _y = (int) constrain(y + random(-20, 20), 0, height);	

  line(x, y, _x, _y);

  x = _x;
  y = _y;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
}

void positionCheck() {
  if (x>width-_x || x<0+_x || y>height-_y || y<0+_y) {
    _x = width / 2;
    _y = height / 2;
  }
}



