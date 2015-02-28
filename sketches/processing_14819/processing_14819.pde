
//Microscopic Images
//by Brianna Hoftun

PImage myImage;

void setup () {
  size(500,500);
  myImage = loadImage("1.JPG");
  image(myImage, 0, 0);
}

void draw() {
  if(mouseY < 250) {
    if (mouseX > 250) {
      myImage = loadImage("2.JPG");
      tint(255, 255, 255, 50);
      image(myImage, 0, 0);
    }
    else if(mouseX < 250) {
      myImage =loadImage("1.JPG");
      tint(255, 255, 255, 50);
      image(myImage, 0, 0);
    }
  }
  else if(mouseY >250) {
    if (mouseX < 250) {
      myImage = loadImage("3.JPG");
      tint(255, 255, 255, 50);
      image(myImage, 0, 0);
    }
    else if(mouseX >250) {
      myImage =loadImage("4.JPG");
      tint(255, 255, 255, 50);
      image(myImage, 0, 0);
    }
  }
}


