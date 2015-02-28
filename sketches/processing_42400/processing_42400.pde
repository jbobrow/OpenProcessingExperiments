
int x = 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  for (int y = 0; y <= width; y = y + 20) {
    for (int x = 0; x <= height; x = x + 20) {
      if ((dist(x, y, mouseX, mouseY)) < 40) {
        if(mouseX>=0 && mouseX<=400){
    fill(252,0,160);}
      }
      else {
        fill(0);
      }

      noStroke();
      ellipse(x, y, 2, 2);
      
    }
  }
}
              
                
