
int x = 32;
PFont font;
void setup() {
  size(300, 300);
}

void draw() {
  stroke(0);
  //x+=12;
  font = createFont("Georgia", x); 
  textFont(font);
  textAlign(CENTER, CENTER);
  text("Broken", width/2, height/2);
}

void mousePressed() {
  exit(); 
}


