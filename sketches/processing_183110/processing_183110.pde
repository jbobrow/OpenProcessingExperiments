
float y1 = 0;
float x1 = 0;
float x2 = 190;
float y2 = 190;
float speed = 3;
float r = 66;
float g = 232;
float b = 230;
int state = 0;



void setup() { 
  size(200, 200);
}

void draw() {
  background(29, 149, 156, 50);
  noStroke();
  fill(r, g, b);
  rect(75, 75, 50, 50);
  
  fill(252, 244, 76);
  rect(95, y1, 10, 10);
  
  fill(252, 244, 76);
  rect(x1, 95, 10, 10);
  
  fill(252, 244, 76);
  rect(x2, 95, 10, 10);
  
  fill(252, 244, 76);
  rect(95, y2, 10, 10);
  
  if (state == 0) {
    y1 = y1 + speed;
    x1 = x1 + speed;
    x2 = x2 - speed;
    y2 = y2 - speed;
    r = 66;
    g = 232;
    b = 230;
  if (y1 > height - 135 && x1 > width - 135 && x2 < width - 65 &&
  y2 < height - 65) {
    y1 = height - 135;
    x1 = width - 135;
    x2 = width - 65;
    y2 = height - 65;
    state = 1;
  }
  }else if (state == 1) {
    y1 = y1 - speed;
    x1 = x1 - speed;
    x2 = x2 + speed;
    y2 = y2 + speed;
    r = 250;
    g = 156;
    b = 239;
    if (y1 < 0 && x1 < 0 && x2 > 190 && y2 > 190) {
      y1 = 0;
      x1 = 0;
      x2 = 190;
      y2 = 190;
      state = 0;
    }
   }
}
   
  
  

  
  

     
   






