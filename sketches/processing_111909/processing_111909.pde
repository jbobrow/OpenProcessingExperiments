
int rectsize=50, up, down, right, left;
Rectpush[] rects;
void setup()
{
  size(600, 300);
  rects = new Rectpush[8];
  for (int i=0;i<rects.length;i++) {
    float x = random(0, width-50);
    float y = random(0, height-50);
    rects[i] = new Rectpush(x, y, rectsize, i );
  }
}
 
void draw()
{
  background(#00CAFF);
    noStroke();
  for (int i=0;i<rects.length;i++) {
    if ( rects[i].x< mouseX && mouseX < rects[i].x+rectsize && rects[i].y< mouseY && mouseY < rects[i].y+rectsize) {
      fill(#FFC800);
      if (right==1) rects[i].x++;
      if (left==1) rects[i].x--;
      if (down==1) rects[i].y++;
      if (up==1) rects[i].y--;
    }
    else {
      fill(255);
    }
    rects[i].update();
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) up=1;
    if (keyCode == DOWN) down=1;
    if (keyCode == LEFT) left=1;
    if (keyCode == RIGHT)right=1;
  }
}
 
void keyReleased()
{
  up=0;
  down=0;
  right=0;
  left=0;
}

class Rectpush {
  float x, y;
  int rectsize;
  private int i;
  Rectpush(float _x, float _y, int _rectsize, int _i)
  {
    x = _x;
    y = _y;
    i = _i;
    rectsize = _rectsize;
  }
  void update()
  {
    rect(x, y, rectsize, rectsize);
    fill(#FF0077);
    textAlign(CENTER);
    text( i ,x+25,y+30);
  }
}
