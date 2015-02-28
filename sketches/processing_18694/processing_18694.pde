
PFont f;

void setup(){
  size(300,300);
  f = loadFont ( "ACaslon-Bold-48.vlw");
  textFont(f);
  textAlign(CENTER);
  fill(0);
}

void draw(){
  background(204);
  text("avoid", width-mouseX, height-mouseY);
}

