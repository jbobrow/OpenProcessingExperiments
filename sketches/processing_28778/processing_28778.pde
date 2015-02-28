
void setup () {
  size (400, 400);
  smooth ();
  }
  
  void draw () {
    for (int y = 0; y <= height; y = y + 39) {
      for (int x = 0; x <= width; x = x + 39) {
        stroke (255);
        rect (x, y, 39, 39);
        ellipse(x, y, 37, 37);
        
        fill (mouseX);
        // Bildwechsel
        
      }
    }
  }

