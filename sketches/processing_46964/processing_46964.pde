
float scaleUp = 0.5;
float wheel = 1.0;
float wheelMult =0.10;
float x;
float y;
float xOffset;
float yOffset;
float xold;
float yold;
float xpiv;
float xpivOld;
float ypiv;
float ypivOld;

void setup() {
  size(400, 400);
 // frame.addMouseWheelListener(new MouseWheelInput());
  smooth();
    addMouseWheelListener(new java.awt.event.MouseWheelListener() {
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
      mouseWheel(evt.getWheelRotation());
  }});
}

void draw() {
  scaleUp = wheel;
  background(64);
  strokeWeight(4);
  stroke(70);
  grid(40);
  strokeWeight(1);
  stroke(0);
  pushMatrix();
  transScale(mouseX, mouseY, scaleUp);
  noStroke();
  rect(100, 50, 40, 40);
  rect(300, 100, 40, 40);
  rect(40, 200, 60, 20);
  popMatrix();
 // ellipseMode(CENTER);
//  ellipse(mouseX, mouseY, 5, 5);
}

void mouseWheel(int step) {
      wheel=constrain(wheel+step*wheelMult*-1,0.1,50);
     println(wheel);
}

void transScale(float x, float y, float scale) {
  if (mousePressed == true) {
  xOffset = x-xold;
  yOffset = y-yold;
  xpiv = (xpivOld-xOffset/scaleUp);
  ypiv = (ypivOld-yOffset/scaleUp);
  xpiv = xpiv + (xOffset/scaleUp);
  ypiv = ypiv + (yOffset/scaleUp);
  xpivOld = xpiv;
  ypivOld = ypiv;
  xold = x;
  yold = y;
  }
  else{
  xOffset = x-xold;
  yOffset = y-yold;
  xpiv = (xpivOld-xOffset/scaleUp);
  xpivOld = xpiv;
  ypiv = (ypivOld-yOffset/scaleUp);
  ypivOld = ypiv;
  xold = x;
  yold = y;
  }
  // blue grid position
  translate(x, y);
  scale(scale);
  strokeWeight(2);
  stroke(70);
  grid(40);
  stroke(70);
  strokeWeight(2);
  // negate mouse position 
  translate(xpiv, ypiv);
  grid(40);
}

void grid(float spacing) {
  int count = int(height/spacing);
  int lineEvery = int(spacing/height);
  for (int i = 0; i <= count; i++) {
    line(0, i*spacing, width, i*spacing);
    line(i*spacing, 0, i*spacing, height);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ypiv= ypiv-40;
      ypivOld = ypiv;
    } 
    if (keyCode == DOWN) {
      ypiv= ypiv+40;
      ypivOld = ypiv;
    } 
    if (keyCode == LEFT) {
      xpiv= xpiv-40;
      xpivOld = xpiv;
    }
    if (keyCode == RIGHT) {
      xpiv= xpiv+40;
      xpivOld = xpiv;
    }
  }
}


