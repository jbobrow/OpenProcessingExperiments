
PImage img;
PImage img2;
PImage img3;
PImage img4;
int a=80;

void setup() {
  size (400, 400);
  img=loadImage("annaffiatoio.jpeg");
  img2=loadImage("margherita.jpeg");
  img3=loadImage("mela.jpeg");
  img4=loadImage("cono.jpeg");
}

void draw() {
  image(img2, 0, 0);

  if (mouseX < width/2 && mouseX>0) {
    if (mouseY < height/2 && mouseY >0) {
      //      for (int i=0; i<height/2; i= i+1) {
      // color picking image at mouse position
      color c =img2.get(mouseX, mouseY);
      noStroke();
      fill(c);
      rect(mouseX-40, mouseY-40, 80, 80);
      //      }
    }
  }

  image(img, width/2, 0);

  if (mouseX > width/2 && mouseX< width) {
    if (mouseY > 0 && mouseY < height/2) {
      noStroke();
      copy(mouseX, mouseY, 20, 20, mouseX-40, mouseY-40, a, a);
      //      ellipse(mouseX, mouseY, a, a);
    }
  }

  image(img3, 0, height/2);

  if (mouseX > 0 && mouseX< width/2) {
    if (mouseY > height/2 && mouseY < height) {
      noStroke();
      blend(mouseX-40, mouseY-40, 80, 80, mouseX-40, mouseY-40, a, a, DODGE);
    }
  }
  
    image(img4, width/2, height/2);
  if (mouseX > width/2 && mouseX< width) {
    if (mouseY > height/2 && mouseY < height) {
      noStroke();
      blend(mouseX-40, mouseY-40, 80, 80, mouseX-40, mouseY-40, a, a, EXCLUSION);
    }
  }
}


