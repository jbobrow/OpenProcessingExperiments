
int x = 0;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  fill(0);
  background(0);
}

//--------------------------------
void draw() {
  //background(255);
}

//--------------------------------
void mouseDragged() {
  fill(random(255), 50);            //ドラッグすると白色
  ellipse(mouseX, mouseY, 40, 40);
}

//---------------------------------
void keyPressed() {
  ellipse(mouseX, mouseY, 40, 40);

  switch(key) {
  case'g':                          //ｇを押すと緑色
    fill(0, random(200), 0, 50);
    break;
  case'r':                          //rを押すと赤色
    fill(random(200), 0, 0, 50);
    break;
  case'b':                          //bを押すと青色
    fill(0, 0, random(200), 50);
    break;
  case' ':                          //spaceキーでリセット
    background(0);
  }
}


