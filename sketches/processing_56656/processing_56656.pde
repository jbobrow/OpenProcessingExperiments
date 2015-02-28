

int value = 0;
int lastx;
int lasty;
void setup()
{
  size(400, 400);
  background(255);
  rectMode(CENTER);
}

void draw() {}
void mouseReleased(){
  
    fill(200, 150, 50);
    //background(255);
    line (lastx, lasty, mouseX, mouseY);
    rect(lastx, lasty, 5, 5);
     lastx=mouseX;
     lasty=mouseY;
  
}
