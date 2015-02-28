
PImage foto1;
PImage img2;

void setup () {
  size (331, 500);

  foto1 = loadImage( "foto1.png");
}

void draw () {
  image (foto1, 0, 0);
  noTint();

  if (mouseX < width/2 && mouseX>0) {
    if (mouseY > height/2 && mouseY <height) {
      tint(255, 0, mouseY, 50);
    }
  }
  else {
  }



  if (mouseX > width/2 && mouseX < width) {
    if (mouseY > height/2 && mouseY <height) {
      tint(0, mouseX, 0, 50);
    }
  }
  else {
  }

  if (mouseX > width/2) {
    if (mouseY > 0 && mouseY < height/2) {
      tint(0, pmouseX, 250, 50);
    }
  }
  else {
  }


  if (mouseX< width/2) {
    if (mouseY > 0 && mouseY < height/2) {

      tint(200, 100, 250, 50);
    }
  }
}


