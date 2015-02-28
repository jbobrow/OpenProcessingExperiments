
int mouseXit = 102;
int mouseYit = 60;


void setup() {

  size (640, 480);
  background (200, 18);
    patternIt();
}


void draw() {
//background (200, 18);

}

void patternIt() {

  for (int j = 1; j < mouseYit; j = j + 1) {
    for (int i = 1; i < mouseXit; i = i + 1) {
      line ((map(i, 0, mouseXit, 0, width)), map(j, 0, mouseYit, 0, height),
      (map(i, 0, mouseXit, 0, width)+mouseX)+random(0,3), ((map(j, 0, mouseYit, 0, height)) +mouseY)+ random(0, 3));
    }
  }
}


void keyPressed() {
  if (key == ' ') {
    setup();
  }
}

void mouseMoved() {
  mouseYit = floor(map( mouseX, 0, width, 0, 40));
  mouseXit = floor(map( mouseY, 0, height, 0, 40));
  patternIt();
}


