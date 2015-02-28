
int currentColor=#000000;
int myColors[]={#FF0000,#00FF00,#0000FF, #FFFF00, #00FFFF,#FF00FF, #000000, #FFFFFF};
int buttonSize = 50;
void setup() {
  size(500, 500);
  background(255);
}
void draw() {
  stroke(0);
  strokeWeight(1);
  for (int i=0;i<myColors.length;i++) {
    fill(myColors[i]);
    rect(0, i*50, 50, 50);
  }
  stroke(currentColor);
  if (mousePressed) {
    strokeWeight(dist(pmouseX, pmouseY, mouseX, mouseY));
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed() {
  // inside function has paramenters: left, right, top, bottom
  for (int i=0;i<myColors.length;i++) {
    if (inside(0, 50, i*50, i*50+50)) {
      currentColor=myColors[i];
    }
  }
  println(currentColor);
}

boolean inside(int left, int right, int top, int bottom) {
  if (mouseX>left && mouseX<right && mouseY>top && mouseY<bottom) {
    return true;
  }
  else {
    return false;
  }
}



