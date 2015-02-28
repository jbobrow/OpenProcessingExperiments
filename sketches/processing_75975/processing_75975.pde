
void setup()
{
  size(400, 400);
}

int rectx = 50;
int recty = 50;
void draw()
{
  if (mousePressed == false) {
    background(110, 100, 150);
    rect(mouseX-2*rectx, mouseY-2*recty, rectx, recty);
    fill(155, 110, 155);
    rect(mouseX+rectx, mouseY+recty, rectx, recty);
    ellipse(mouseX, mouseY, 20, 20);
    fill(155, 0, 155);
  }
    else {
    
    background(110,100,150);
    rect(mouseX-2*rectx, mouseY-2*recty, rectx, recty);
    fill(random(255),random(255),random(255));
    rect(mouseX+rectx, mouseY+recty, rectx, recty);
    ellipse(mouseX,mouseY,20,20);
    fill(random(255),random(255),random(255));
    }
}



