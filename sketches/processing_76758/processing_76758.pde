
void setup() {
  smooth();
  size(600, 600);
  background(0);
  PFont font;
  font = loadFont("AgencyFB-Reg-48.vlw"); 
  textFont(font); 
  textAlign(CENTER);
}


int currentKey;
int lastKey;


void keyReleased() {

  lastKey = currentKey;
  currentKey = key-48;

  println(lastKey);
  println(currentKey);
}


void draw() {
  for (int i = 1; i < 10; i++) {
    for (int j = 1; j < 10; j++) {
      fill(255);
      if (i == 1 && currentKey == j) {
        fill(0, 255, 0);
      }
      else if (j == 1 && lastKey == i) {
        fill(0, 255, 0);
      }
      if (i == lastKey && j == currentKey) {
        fill(255, 0, 0);
      }
      text(i * j, i * 60, j * 60);
    }
  }
}


