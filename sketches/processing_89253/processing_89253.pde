
color[] colors = { 
  #FF0000, #0000FF, #00FF00, #000000, #ffffff, #00F9FF, #FEFF00, #FF9100
};
String alphabet = "abcdefghijklmnopqrstuvwxyz";
PFont font = createFont("Arial", 36, true);

int randomInt(int limit) {
  return int(random(limit));
}

void setup() {
  size(640, 480);
  smooth(); 
  curveTightness(0);
  strokeWeight(3);
}
void draw(){
}
void mouseMoved() {
  fill(0, randomInt(255));
  char letter = alphabet.charAt(randomInt(alphabet.length()));
  textFont(font, randomInt(100));
  text(letter, pmouseX, pmouseY);
}
