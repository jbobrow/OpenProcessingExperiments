
int speed = 5;
int xa = -100, ya=0;

void setup() {
  size (600, 600);
  drawbackground();
}
void draw () {

  droprect(xa, ya);
  ya += speed;
  
  /*if(ya > 600)
   {
   ya = 0;
   xa += 100;
   }
   if(xa >600)
   {
   drawbackground();
   xa = 0;
   ya = 0;
   }*/
}

void mouseClicked()
{
  if (mouseX < 100)
  {
    xa = 0;
    ya = 0;
  }
  else if (mouseX < 200)
  {
    xa = 100;
    ya = 0;
  }
  else if (mouseX < 300)
  {
    xa=200;
    ya=0;
  }
  else if (mouseX < 400)
  {
    xa=300;
    ya=0;
  }
  else if (mouseX < 500)
  {
    xa=400;
    ya=0;
  }
  else if (mouseX < 600)
  {
    xa=500;
    ya=0;
  }
}

void droprect (int x, int y) {
  fill(0);
  rect(x, y, 100, speed);
}

void drawbackground () {
  fill(255, 3, 7, 230);
  rect(0, 0, 100, 600);
  fill(255, 226, 3, 230);
  rect(100, 0, 100, 600);
  fill(3, 38, 255, 230);
  rect(200, 0, 100, 600);
  fill(255, 112, 3, 230);
  rect(300, 0, 100, 600);
  fill(149, 3, 255, 230);
  rect(400, 0, 100, 600);
  fill(78, 227, 96, 230);
  rect(500, 0, 100, 600);
}


