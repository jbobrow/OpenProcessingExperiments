
void setup() {
  size(300, 300);
  colorMode(RGB, width);
  noStroke();
}

void draw() {

  if (mouseY < height/4) {
    background(0, width/3, width); //sky
    fill(width, width, 0);
    ellipse(mouseX, mouseY, 50, 50); //sun during daytime
    fill(width, 25); //transparency
    ellipse((3*width)/4, height-mouseY, 50, 50);
    fill (0, width/3, width);//same as background for cresent
    ellipse((3*width)/4-10, height-mouseY, 50, 50); //moon
    fill(0, width, 0);
    rect(0, (3*height)/4, width, (3*height)/4);//ground
  }

  if ((mouseY < height/2) && (mouseY> height/4)) {
    background(width/2, width/3, width);//sky
    fill(width, 50); //transparency
    ellipse((3*width)/4, height-mouseY, 50, 50); 
    fill (width/2, width/3, width);//same as background for cresent
    ellipse((3*width)/4-10, height-mouseY, 50, 50);//moon
    fill(width, (3*width)/4, 0);
    ellipse(mouseX, mouseY, 50, 50);//sun middle sunset
    fill(0, width/2, 0);
    rect(0, (3*height)/4, width, (3*height)/4);//ground
  }

  if ((mouseY>height/2) && (mouseY< (3*height)/4)) {
    background(width, width/2, 0);//sky
    fill(width, width/4, 0);
    ellipse(mouseX, mouseY, 50, 50); //sun at sunset
    fill(width, 75); //transparency
    ellipse((3*width)/4, height-mouseY, 50, 50); 
    fill (width, width/2, 0); //same as background for cresent
    ellipse((3*width)/4-10, height-mouseY, 50, 50);//moon
    fill(0, width/4, 0);
    rect(0, (3*height)/4, width, (3*height)/4);//ground
  }

  if (mouseY>(3*height)/4) {
    background(0); //sky
    fill(255);
    ellipse((3*width)/4, height/4, 50, 50);
    fill(0);
    ellipse(((3*width)/4) - 10, height/4, 50, 50);
  }
}


