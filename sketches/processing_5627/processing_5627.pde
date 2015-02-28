
class Snake {
  color c;
  color d;
  color e;
  int tailShape;
  int[] tailX;
  int[] tailY;
  int xpos;
  int ypos;
  int speed;
  
  Snake(float tempLength, int tempShape, float tempSpeed) {
    xpos = int(random(0,width));
    ypos = int(random(0,height));
    
    speed = int(tempSpeed);
    c = color(random(30,250),random(30,250),random(30,250), 100);
    d = color(random(30,250),random(30,250),random(30,250), 100);
    e = color(random(30,250),random(30,250),random(30,250), 100);
    
    tailShape = tempShape; // 0 = ellipse, 1 = rect
    
    tailX = new int[int(tempLength)]; // This should initialize the array to the length specified
    tailY = new int[int(tempLength)];
    
    // Put zero values into the arrays
    for (int i = 0; i < tailX.length; i++) {
     tailX[i] = xpos;
     tailY[i] = ypos; 
    }
  }
  
  void display () {
    
    // Shift the array values
    for (int i = 0; i < tailX.length - 1; i++) {
     tailX[i] = tailX[i + 1];
     tailY[i] = tailY[i + 1]; 
    }
    
    // Add the current location to the end
    tailX[tailX.length - 1] = xpos;
    tailY[tailY.length - 1] = ypos;
    
    noStroke();
    if (tailShape == 0) {
      // ellipse
      ellipseMode(CENTER);
      for (int i = 0; i < tailX.length; i++) {
        fill(c);
        ellipse(tailX[i], tailY[i], i, i);
        fill(d);
        ellipse(tailX[i], tailY[i], i/2, i/2);
        fill(e);
        ellipse(tailX[i], tailY[i], i/3, i/3); 
      }
      
    } else {
      // rect
      rectMode(CENTER);
      for (int i = 0; i < tailX.length; i++) {
         fill(c);
         rect(tailX[i], tailY[i], i, i);
         fill(d);
         rect(tailX[i], tailY[i], i/2, i/2);
         fill(e);
         rect(tailX[i], tailY[i], i/3, i/3);
      }
    }
    
    if (xpos < 0) {
      xpos = xpos + speed * 2;
    } else if (xpos > width) {
      xpos = xpos - speed * 2; 
    } else {
      xpos = xpos + int(random(speed * -1, speed));
    }
    
    if (ypos < 0) {
      ypos = ypos + speed * 2;
    } else if (ypos > height) {
      ypos = ypos - speed * 2; 
    } else {
      ypos = ypos + int(random(speed * -1, speed));
    }
    
  }
}

