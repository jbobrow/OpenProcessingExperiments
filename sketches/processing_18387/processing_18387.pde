
void setup() {
  size(250,250);
  background(25);
  smooth();
  noStroke();
  fill(25);
}

void draw() {
  if (mousePressed)
  {
    float rad = dist(width/2,height/2,mouseX,mouseY);
    ellipse(mouseX,mouseY,rad/4,rad/4);
    ellipse(250-mouseX,mouseY,rad/4,rad/4);
    ellipse(mouseX,250-mouseY,rad/4,rad/4);
    ellipse(250-mouseX,250-mouseY,rad/4,rad/4);
    if((mouseX<125)&&(mouseY<125))
    {
      fill(150,100,150,100);
    }
    else if ((mouseX>125)&&(mouseY<125))
    {
      fill(100,100,150,100);
    }
    else if ((mouseX<125)&&(mouseY>125))
    {
      fill(100,150,150,100);
    }
    else if ((mouseX>125)&&(mouseY>125))
    {
      fill(150,50,50,100);
    }
  }
  
    if (keyPressed) {
      background(25);
    }
}


