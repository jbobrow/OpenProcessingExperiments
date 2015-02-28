
//no points for originality!!! I got inspired by Selin's tv and Poltergeist!!!

PImage tv;
PImage nosignal;
int buttonxPos;
int buttonyPos;
boolean isSwitch;

void setup() {
  size(600, 369);
  noStroke();
  tv = loadImage("tv.png");
  nosignal = loadImage("nosignal.jpg");
  isSwitch = true;
  buttonxPos = 525;
  buttonyPos = 65;

}

void draw() {
  for (int i = 0; i < width; i+=4) {
    for (int k = 0; k < height ; k+=4) {
      if (isSwitch == false) {
        fill(random(255));
        rect(i, k, 4, 4);
      } 
      else {
        image (nosignal, 25, 25);
      }
    }
    image(tv, 0, 0);
  }
}

void mouseReleased() {
  if (dist (mouseX, mouseY, buttonxPos, buttonyPos) <50) {
    isSwitch =!isSwitch;
  }
}


