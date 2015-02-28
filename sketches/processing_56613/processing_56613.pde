


int value = 0;
int lastx;
int lasty;
void setup()
{
  size(400, 400);
  background(255);
  rectMode(CENTER);
}

void draw() {
  if (mousePressed) {
    fill(200, 150, 50);
    //background(255);
    line (lastx, lasty, mouseX, mouseY);
    rect(lastx, lasty, 5, 5);
    delay(70);
    lastx=mouseX;
    lasty=mouseY;
    print("lasx="+ " "+lastx+" - ");
  }
  // background(255);
  // line (lastx, lasty, mouseX, mouseY);
  fill(255);
}


