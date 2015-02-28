
void setup()
  {
    size(400, 600);
    background(255, 255, 255);
    smooth();
    frameRate (30);
  }

  void draw()
  {
    fill(random(255), random(255),random(255));

    textSize(48);
    textSize(mouseY/5);
    textAlign(CENTER);
    text("¢", mouseX,mouseY);
    text("$",mouseY,mouseX);
    text("Young Money",200,300);

    //noLoop();
  }
