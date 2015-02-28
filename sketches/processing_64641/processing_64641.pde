

void setup () {
  background(255);
  size (400, 400);
  smooth();
  strokeWeight(10);


  float space=40;


  for ( float y = 15; y < height; y = y + space) {
    for ( float x = 15; x < width; x = x + space  ) {
      if (random(100) >= 90) {
        strokeWeight(100);
        stroke(44,122);
        point(x + random (10, 50), y + random (10, 50));
      }
      else {
        strokeWeight(25);
        stroke (200, 11, 55.122);
        point( x + random (10, 100), y + random (0, 50));
      }
    }
  }
}

void keyPressed() {
  saveFrame ("wahrscheinlih.png");
}



