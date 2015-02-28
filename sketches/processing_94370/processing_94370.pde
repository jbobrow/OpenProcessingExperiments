
int ellipse_w;
int ellipse_h;

void setup(){
  background(255);
  size(600, 600);
  sketchFullScreen();
  stroke(0);
  noCursor();
  frameRate(30);
}

void draw(){
  //Dim
  fill(255, 255, 255, 10);
  stroke(255);
  rect(0,0,width, height);
  //Draw
  stroke(0);
  ellipse(mouseX, mouseY, ellipse_w, ellipse_h);
  ellipse_w = (int) random(30, 70);
  ellipse_h = (int) random(30, 70);
}

boolean sketchFullScreen() {
  return true;
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}
