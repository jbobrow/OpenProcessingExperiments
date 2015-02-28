
boolean white = true;
boolean anm = false;

int x = 16, y = 120;
String textStr = "Hello Processing!";

void setup() {
  size(800,200); background(255,255,255);
  PFont f = loadFont("Arial.vlw");
  textFont(f,90);
  fill(0,10,52);  text(textStr, x+4,y+4);
  filter(BLUR, 2);
  fill(5,90,240); text(textStr, x,y);
  fill(220,64,48); rect(0,y+32, 800-1,8);
}

void draw() {
  if(anm) {
    filter(BLUR, 1);
    if(!white) fill(5,90,240);
    else fill(255,255,255);
    text(textStr, x,y);
  }
}

void mousePressed() {
  white = !white;
  anm = true;
}
                
