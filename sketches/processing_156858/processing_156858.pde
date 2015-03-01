
int number = 20;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {  
  noStroke();
  ellipseMode(CORNER);


  for (int i = 0; i<number; i++) {
    for (int j = 0; j<number; j++) {

      int w = width/number;
      int h = height/number;

      int x = i*w;
      int y = j*h;

      if ((i+j) % 2 == 0) {
        
        fill(mouseX, mouseY, 0);
        ellipse(x, y, w, h);
        
      } else if ((i+j) % 1 == 0) {
        
        fill((255-mouseX), (255-mouseY), 0);
        rect(x, y, w, h);
      }
      
    }
  }
}



