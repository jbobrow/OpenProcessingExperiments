
PImage img;
//PImage img_2;
PImage img2;
PImage img2_2;
PImage img3;
PImage img3_2;
PImage img4;
PImage img4_2;

void setup() {
  size(384, 512);

  img = loadImage("michael.jpg" /*volendo si può
  mettere il link http*/  );
  //img_2 = loadImage("michael_2.jpg");
  img2 = loadImage("debra.jpg");
  img2_2 = loadImage("debra_2.jpg");
  img3 = loadImage("laguerta.jpg");
  img3_2 = loadImage("laguerta_2.jpg");
  img4 = loadImage("batista.jpg");
  img4_2 = loadImage("batista_2.jpg");
}

void draw() {
  // image(imageVariable, x, y, width, height);
  tint(255, 255, 0);
  image(img, 0, 0);
  tint(255, 0, 0);
  image(img2_2, width/2, 0);
  tint(0, 255, 0);
  image(img3_2, 0, height/2);
  tint(0, 0, 255);
  image(img4_2, width/2, height/2);
  
  // controlling the position of the mouse
  //top left
  if (mouseX > 0 && mouseX < width/2 && mousePressed) {
    //bottom left
    if (mouseY > 0 && mouseY < height/2 && mousePressed) {
      noTint();
      image(img, 0, 0);
    }
    else {
      noTint();
      image(img3, 0, 0);
    }
  }
  //top right
  else {
    //bottom right
    if (mouseY > 0 && mouseY < height/2 && mousePressed) {
      noTint();
      image(img2, 0, 0);
    }
    else {
      noTint();
      image(img4, 0, 0);
    }
  }
  if (!mousePressed) {
    tint(255, 255, 0);
    image(img, 0, 0);
    tint(255, 0, 0);
    image(img2_2, width/2, 0);
    tint(0, 255, 0);
    image(img3_2, 0, height/2);
    tint(0, 0, 255);
    image(img4_2, width/2, height/2);
  }
}



