

class Ball {
  float x;
  int y = 360;
  color c;
  int dia = 100;
  int radius = dia/2;
  int colorPicker = int(random(0,3));
  //float speed = 1.5;
  float speed = 1.5;

  Ball(int x_in) {
    x = x_in;
    
    colorPicker = int(random(0, 3));
    if(colorPicker == 0) {
      c = color(255,0,0);  
    } else if(colorPicker == 1) {
      c = color(0,255,0);
    } else if(colorPicker == 2) {
      c = color(0,0,255); 
    }
  }
  
  void move() {
    x += speed;
    if(x > 651.5) {
      reset();
    }  
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, dia, dia);
    fill(62, 61, 61);
    rect(600, 260, 200, 200);
  }

  void reset() {
    x = random(-200, -100);
    
    int colorPicker = int(random(0, 3));
    if(colorPicker == 0) {
      c = color(255,0,0);  
    } else if(colorPicker == 1) {
      c = color(0,255,0);
    } else if(colorPicker == 2) {
      c = color(0,0,255); 
    } 
  }
  
}







