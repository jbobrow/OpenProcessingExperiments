
PImage img1;
PImage img1b;
PImage img2;
PImage img2b;
PImage img3;
PImage img3b;
PImage img4;
PImage img4b;

int counter = 0;

int mouseXpos = 0;
int mouseYpos = 0;

void setup() {
  size(400, 400);

  img1 = loadImage("torta1.jpg");
  img1b = loadImage("torta1b.jpg");
  img2 = loadImage("torta2.jpg");
  img2b = loadImage("torta2b.jpg");
  img3 = loadImage("torta3.jpg");
  img3b = loadImage("torta3b.jpg");
  img4 = loadImage("torta4.jpg");
  img4b = loadImage("torta4b.jpg");
}

void draw() {
  //image(imageVariable, x, y);

  if (mouseY < 40) {
    image(img1, 200, 200, -width/2, -height/2);
    image(img2, width/2, 0, 200, 200);
    image(img3, 0, 200, 200, 200); 
    image(img4, width/2, height/2, 200, 200);
  }
  else {
    //torta cioccolato
    if ((mouseX>1) && (mouseX<width/2) && (mouseX> 1) && (mouseY<height/2)) {
      image(img1b, 0, 0, width, height);
    } 
    else if ((mouseX>1) && (mouseX<width/2) && (mouseY>200) && (mouseY<height)) {
      //torta crostata
      image(img3b, 0, 0, width, height);
    } 
    else if ((mouseX>200) && (mouseX<width) && (mouseY>200) && (mouseY<height)) {
      //torta fragole 
      background(100);
      image(img4b, 0, 0, width, height);
    }
    else if (mouseX>200 && mouseY<200) {
      image(img2b, 0, 0, 400, 400);
    }
  }
}


