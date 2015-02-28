
int startX = 320;
int startY = 220;
float scale = 30;
float sizeEllipse = 100;
int color1 = 175;
int color2 = 0;
int color3 = 0;
int opacity = 200;
int frameScale = 5;
int frame = 0;
boolean ellipse1 = true;
boolean ellipse2 = true;
boolean ellipse3 = true;
boolean ellipse4 = true;
boolean blink = false;
int offsetX = startX;
int offsetY = 10;
 
 
void setup() {
  size(640, 480);
  ellipseMode(CENTER);
}
 
void draw() {
  background(0);
 
  if (mouseY < height && mouseY > 0) {
    if (mouseY > startY) {
      color1 = mouseY - startY;
    }
    else {
      color1 = startY - mouseY;
    }
  }
 
  fill(color1, color2, color3, opacity);
 
  if (ellipse1) {
    ellipse(startX - offsetX - 1*sizeEllipse, pmouseY - offsetY, int(.01*sizeEllipse*scale), int(.01*sizeEllipse*scale));
    ellipse(startX - offsetX + 1*sizeEllipse, pmouseY - offsetY, int(.01*sizeEllipse*scale), int(.01*sizeEllipse*scale));
  }
  if (ellipse2) {
    ellipse(startX - offsetX - int(.5*sizeEllipse), pmouseY - offsetY - int(.1*sizeEllipse), int(scale*.016*sizeEllipse), int(scale*.016*sizeEllipse));
    ellipse(startX - offsetX + int(.5*sizeEllipse), pmouseY - offsetY - int(.10*sizeEllipse), int(scale*.016*sizeEllipse), int(scale*.016*sizeEllipse));
  }
  if (ellipse3) {
    ellipse(startX - offsetX - int(.8*sizeEllipse), pmouseY - offsetY + int(.35*sizeEllipse), int(scale*.012*sizeEllipse), int(scale*.012*sizeEllipse));
    ellipse(startX - offsetX + int(.8*sizeEllipse), pmouseY - offsetY + int(.35*sizeEllipse), int(scale*.012*sizeEllipse), int(scale*.012*sizeEllipse));
  }
  if (ellipse4) {
    ellipse(startX - offsetX - int(.3*sizeEllipse), pmouseY - offsetY + int(.38*sizeEllipse), int(scale*.012*sizeEllipse), int(scale*.012*sizeEllipse));
    ellipse(startX - offsetX + int(.3*sizeEllipse), pmouseY - offsetY + int(.38*sizeEllipse), int(scale*.012*sizeEllipse), int(scale*.012*sizeEllipse));
  }
 
  if (mouseX < width && mouseX > 0) {
    offsetX += pmouseX - mouseX;
    sizeEllipse = abs(mouseX - startX);
  }
 
  if (blink == true) {
    if ((frame + frameScale*4) % 100 == 0) {
      ellipse1 = false;
    }
    if ((frame + frameScale*3) % 100 == 0) {
      ellipse1 = true;
      ellipse2 = false;
    }
    if ((frame + frameScale*2) % 100 == 0) {
      ellipse2 = true;
      ellipse3 = false;
    }
    if ((frame + frameScale) % 100 == 0) {
      ellipse3 = true;
      ellipse4 = false;
    }
    if (frame % 100 == 0) {
      ellipse4 = true;
      blink = false;
    }
  }
 
  frame++;
}
 
void mouseClicked() {
  blink = true;
}



