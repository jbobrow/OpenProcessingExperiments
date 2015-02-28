
final int OBJ_SIZE = 20;
color objColor;
int objTop, objLeft;

void setup() {
  size(500,500);
  objTop = height / 2 - OBJ_SIZE / 2;
  objLeft = width / 2 - OBJ_SIZE / 2;
  objColor = color(0,0,0,127.5);
  noLoop();
} 

void draw() {
  frameRate(2);
  size(500,500);
  background(0);
  smooth();
  fill(0);
  stroke(255,255,0);
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  stroke(0,255,255);
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  stroke(255,0,255);
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  stroke(0,0,255);
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  rect(30,20,504,260);
  rect(200,150,300,50);
  rect(39,403,20,123);
  stroke(255,0,0);
  rect(24,36,58,53);
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  rect(random(500),random(500),random(50),random(50));
  stroke(0,255,0);
  rect(random(500),random(500),random(50),random(50));
  fill(objColor);
  ellipse(objLeft,objTop,OBJ_SIZE,OBJ_SIZE);
}

void keyPressed(KeyEvent evt) {
  int key = evt.getKeyCode();
  if (key == KeyEvent.VK_LEFT) {
    objLeft -= 10;
    if (objLeft < 3)
      objLeft = 3;
    redraw();
  }
  else if (key == KeyEvent.VK_RIGHT) {
    objLeft += 10;
    if (objLeft > getSize().width - 3 - OBJ_SIZE)
      objLeft = getSize().width - 3 - OBJ_SIZE;
    redraw();
  }
  else if (key == KeyEvent.VK_DOWN) {
    objTop += 10;
    if (objTop > getSize().height - 3 - OBJ_SIZE)
      objTop = getSize().height - 3 - OBJ_SIZE;
    redraw();
  }
  else if (key == KeyEvent.VK_UP) {
    objTop -= 5;
    if (objTop < 3)
      objTop = 3;
    redraw();
  }
}


