
float x,y;
float angle = 0;
float laserLength = 200;

void setup() {
  size(640,720);
  strokeWeight(5);
  stroke(255,0,0,80);
  
  x = width * 0.5;
  y = height;
}

void draw() {
  background(255);
  
  angle = (mouseX/float(width) - 1) * PI;
  
// The laser function is defined below.
  laser(x, y, angle);
  
// Pressing one of the number keys will change the length of the line segment.
  if(keyPressed){
    if(key == '1'){
      laserLength = 100;
    }
    if(key == '2'){
      laserLength = 200;
    }
    if(key == '3'){
      laserLength = 300;
    }
    if(key == '4'){
      laserLength = 400;
    }
    if(key == '5'){
      laserLength = 500;
    }
    if(key == '6'){
      laserLength = 600;
    }
    if(key == '7'){
      laserLength = 700;
    }
    if(key == '8'){
      laserLength = 800;
    }
    if(key == '9'){
      laserLength = 900;
    }
  }
  if(keyPressed && (key == CODED)){
    if(keyCode == LEFT){
      x--;
    }
    if(keyCode == RIGHT){
      x++;
    }
  }
}

// Here is where we define laser. It has 3 arguements:
// 1 - x position
// 2 - y position
// 3 - rotation of the line
void laser(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, laserLength, 0);
}




