
import ddf.minim.*;

Minim minim;
AudioPlayer groove;

float angle;
int   boxes = 16, SIDE = 200, side;

void setup() {
  size(SIDE * 2, SIDE * 2);

  stroke(100);
  fill(0, 0, 50, 10);

  smooth();
}

void draw() {
  translate(width/2, height/2);
  background(255);

  side = SIDE;
  angle = map(mouseX, 0, width, 0.0f, 0.5 * PI);

  pushMatrix();

  for(int i=0; i<boxes; i++) {
    rotate(angle);
    rect(-side, -side, side*2, side*2);
    side = (int) ( (side * tan(angle))/(sin(angle) * (tan(angle) + 1)) );
  }

  popMatrix();
}

void keyPressed() {
  switch(key) {
    case 115:
    save("screenshot.png");
    break;
    
    case 101:
    boxes++;
    break;
    
    case 100:
    boxes--;
    break;
    
    default:
    break;
  }
}


