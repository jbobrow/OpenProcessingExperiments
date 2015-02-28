
import rita.*;

void setup() {
  size(400, 400); 

  // set some defaults   
  RiText.setDefaultMotionType(RiTa.EASE_IN_OUT);
  RiText.setDefaultFont("Ziggurat32.vlw");    

  // 2 RiTexts, moving to random spots
  moveToRandom(new RiText(this, "zig"));
  moveToRandom(new RiText(this, "zag"));
}

// called whenever a 'move' behavior finishes
void onRiTaEvent(RiTaEvent re) {
  if (re.getType() == RiTa.BEHAVIOR_COMPLETED)
    moveToRandom((RiText)re.getSource());
}

void moveToRandom(RiText r) {
  float newX = random(width-r.textWidth());
  float newY = random(r.textHeight(), height-7);
  float dist = dist(r.x, r.y, newX, newY);
  r.moveTo(newX, newY, dist/width);
}

void draw() {
  fill(255, 100); // leave trails
  rect(0, 0 , width, height);
}


