
void setup() {
  background(int(random(255)), int(random(255)), int(random(255)));
  size(500, 500);
  noLoop();
}

void draw() {
  
  int numberOfShapes = int(random(200,501));
  
  for (int i=0; i<numberOfShapes; i++) {
    
    int x = int(random(500));
    int y = int(random(500));
    int z = int(random(80));
    int w = int(random(80));
    
    int a = int(random(500));
    int b = int(random(500));
    int c = int(random(80));
    int d = int(random(80));
    int e = int(random(80));
    int f = int(random(80));
    
    int shapeWidth = int(random(100));
    int shapeHeight = int(random(100));
    
    int shapeChoice = int(random(4));
    
    int strokeColor = int(random(256));
    int RGBrValue = int(random(256));
    int RGBgValue = int(random(256));
    int RGBbValue = int(random(256));
    int alphaValue = int(random(256));
    
    int bool1 = int(random(4));
    int bool2 = int(random(8));
    
    stroke(strokeColor);
    fill(RGBrValue, RGBgValue, RGBbValue, alphaValue);
    
    if (shapeChoice == 0) {
      ellipse(x, y, shapeWidth, shapeHeight);
    }
    
    else if (shapeChoice == 1) {
      if (bool1 == 0) {
        triangle(x, y, x+c, y+d, x+e, y+f);
      }
      else if (bool1 == 1) {
        triangle(x, y, x+c, y+d, x+e, y-f);
      }
      else if (bool1 == 2) {
        triangle(x, y, x+c, y-d, x-e, y+f);
      }
      else if (bool1 == 3) {
        triangle(x, y, x+c, y+d, x-e, y-f);
      }
      else if (bool1 == 4) {
        triangle(x, y, x+c, y-d, x+e, y+f);
      }
      else if (bool1 == 5) {
        triangle(x, y, x-c, y-d, x+e, y-f);
      }
      else if (bool1 == 6) {
        triangle(x, y, x-c, y+d, x-e, y+f);
      }
      else {
        triangle(x, y, x-c, y-d, x-e, y-f);
      }
    }
    
    else if (shapeChoice == 2) {
      if (bool2 == 0) {
        quad(x, y, x+c, y+d, x+e, y+f, x+z, y+w);
      }
      else if (bool2 == 1) {
        quad(x, y, x+c, y+d, x+e, y+f, x-z, y-w);
      }
      else if (bool2 == 2) {
        quad(x, y, x+c, y+d, x-e, y-f, x+z, y+w);
      }
      else if (bool2 == 3) {
        quad(x, y, x+c, y+d, x-e, y-f, x-z, y-w);
      }
      else if (bool2 == 4) {
        quad(x, y, x-c, y-d, x+e, y+f, x+z, y+w);
      }
      else if (bool2 == 5) {
        quad(x, y, x-c, y-d, x+e, y+f, x-z, y-w);
      }
      else if (bool2 == 6) {
        quad(x, y, x-c, y-d, x-e, y-f, x+z, y+w);
      }
      else {
        quad(x, y, x-c, y-d, x-e, y-f, x-z, y-w);
      }
    }
    
    else {
      rect(x, y, shapeWidth, shapeHeight);
    }
  
    
  }  
}  


