
int value;
int sX;
int sY;
int rX;
int rY;
int m;
int f;

void setup()
{
  size(600,600);
  smooth();
  background(255);
  ellipseMode(CENTER);
  fill(255);
}

void draw()
{
   if (keyPressed) {
    if (key == 'z' || key == 'Z') { 
      if (m == 0) {
        ellipseMode(CORNER);
        m = 100;
      } else if (m == 100) {
        ellipseMode(CENTER);
        m = 0;
      }
    } 
    else if (key == 'x' || key == 'X') { 
      if (f == 0) {
        noFill();
        f = 100;
      } else if (f == 100) {
        fill(255);
        f = 0;
      }
    }
    else if (key == ' ') { 
      background(255);
    }
  }
  
  if (mousePressed) {
    if (value == 0) { 
      value = 100;
      sX = mouseX;
      sY = mouseY;
    } 
  }

  ellipse(sX,sY,rX,rY);
}

void mouseDragged() {
      rX = mouseX;
      rY = mouseY;
}

void mouseReleased() { 
  if(value == 100) { 
    value = 0; 
  }
} 


