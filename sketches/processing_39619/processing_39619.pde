
PImage Door;
PImage nosferatu;
void setup() {
  size(450, 530);
  Door= loadImage ("Door.png");
  nosferatu= loadImage ("nosferatu.jpg");
}

void draw() {
  fill(255);

  if (millis() < 5000 || millis() == 5000) {
    image (Door, 0, 0);
  } else {
    
    image (nosferatu, 0, 0);
    
  }
}

