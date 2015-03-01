
int ellipseSize;
int growRate;
float x;
float y;
float easing = .05;

void setup() {
  size (800, 800);
  background (255);
  ellipseSize = 50;
  growRate = 1;
}

void draw() {
  float targetX = mouseX;
 float dx = targetX - x;
 if (abs(dx) > 1) {
   x += dx * easing;
     }
  float targetY = mouseY;
  float dy = targetY - y;
 if (abs(dy) > 1) {
   y += dy * easing;
     }
  
  //main ellipse quadrant 1
  fill ((abs(ellipseSize) % 255), mouseY, mouseX);
  ellipse (x, y, ellipseSize, ellipseSize);
  //quadrant 4
  ellipse (width - x, height - y, ellipseSize, ellipseSize);
  //quadrant 2
  fill (mouseX, mouseY, (abs(ellipseSize) % 255));
  ellipse (width - x, y, ellipseSize, ellipseSize);
  //quadrant 3
   ellipse (x, height - y, ellipseSize, ellipseSize);

 if (keyPressed){
     if( key == 'w'){ ellipseSize=(ellipseSize+growRate); }
     if( key == 's'){ ellipseSize=(ellipseSize-growRate); }
     if( key == 'd'){ growRate = (growRate - 1); }
     if( key == 'a'){ growRate = (growRate + 1); }
     if( key == 'p'){ saveFrame(); }
     println ("ellipse size:" + ellipseSize + " grow rate:" + growRate);
  }
}




