
int abstand = 20;

void setup () {
  
  size (400, 400);
  noStroke ();
  smooth ();
  }
  
  
  void draw () {
  
  background (255);

  for (int y = 0; y <= height; y = y + abstand){
      for (int x = 0; x <= width; x = x + abstand){
        fill (random(mouseY));
        stroke (0);
        ellipse (x, y, 10, 10);
      }
    }
  
}

