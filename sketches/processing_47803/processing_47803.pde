
boolean toggleLoop = true;

void setup() {
  size(300, 300);
  smooth();
  frameRate(10);
}

void draw() {
  squares(0, 0, 5, 5);
  squares(0, 0, 25, 25);
}

void squares(int _x, int _y, int _space, int _size) {	
  noStroke();			
  for (_x = 0; _x <= width; _x += _space) {
    for (_y = 0; _y <= height; _y += _space) {		
      if (_y > random(1500)) {
        fill(random(0, 255), random(0, 255), random(0, 255));
      } 
      else { 					
        fill(random(0, 200), random(100, 200));
      } 
      rect(_x, _y, _size, _size);
    }
  }
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


