
/* by Guigui 8^) */
PFont saxMono;

void setup() {
  size(400, 180);
  colorMode(HSB);
  saxMono = loadFont("saxMono-48.vlw");
  textFont(saxMono);
  textAlign(CENTER);
  smooth();
}

void draw() {
  background(0);
  if (focused) {  // or "if (focused == true)"
    fill(keyCode%255,255,255); // it's stupid, just for fun
    textSize(24);
    text ("the key is coded ? " + (key == CODED), width/2,height/2-50);
    textSize(36);
    text ("keyCode = " + keyCode, width/2,height/2+5);
    textSize(48);
    text ("key = " + key, width/2,height/2+60);
  } 
  else {
    fill((frameCount/5)%255,255,255);
    textSize(18);
    text ("The sketch is not focused. You have to click on it to make it focus." + key, width/4, height/4, width/2, height/2);
  }
}

