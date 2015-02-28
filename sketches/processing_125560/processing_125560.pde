

float myRefX = 0;
float myRefY = 0;

void setup() {
  size (displayWidth, displayHeight);
//  size(400, 400);
}


void draw() {
  background (0);

  for (float i = 20.0; i < 1440.0; i = i + 60.0) {
    float x = i;
    
    for (float j = 20.0; j < 900.0; j = j + 60.0) {
      float y = j;
      fill(0);
      if (mouseY > y) {  
        if (y > 700) { 
          fill(240, 230, 235);
        } 
        else if (y > 500) { 
          fill(39, 230, 195);
        } 
        else if (y > 300) { 
          fill(28, 166, 141);
        } 
        else if (y > 100) {
          fill (17, 102, 86);
        }
        else if (y > 0) {
          fill (15,89,76);}
      }

      noStroke();
      ellipse(x, y, 5, 5);
      x = (myRefX - x) * 0.1 + x;
    }


  }
}


void mouseMoved() {
  myRefX = myRefX + (mouseX - pmouseX);
  myRefY = myRefY + (mouseY - pmouseY);
}
