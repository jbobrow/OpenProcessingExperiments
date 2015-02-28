
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  size(500, 700);

  //or internet imagecode, but internet connection
  img1 = loadImage("rosso.jpg");
  img2 = loadImage("blu.jpg");
  img3 = loadImage("giallo.jpg");
  img4 = loadImage("verde.jpg");

  image(img1, 0, 0);
  image(img2, 0, 350);
  image(img3, 250, 0);
  image(img4, 250, 350);
}


void draw() {
  
//rosso
  if ((mouseX < width/2)
     && (mouseY < height/2)) {
    tint(255, 150, 150);
    image(img1, 0, 0, 250, 350);
  } else {
  noTint();
    image(img1, 0, 0, 250, 350);
}

//blu
  if ((mouseX < width/2)
     && (mouseY > height/2)) {
    tint(150, 150, 255);
    image(img2, 0, 350, 250, 350);
  } else {
  noTint();
    image(img2, 0, 350, 250, 350);
}

//giallo
  if ((mouseX > width/2)
     && (mouseY < height/2)) {
    tint(250, 250, 100);
    image(img3, 250, 0, 250, 350);
  } else {
  noTint();
    image(img3, 250, 0, 250, 350);
}

//verde
  if ((mouseX > width/2)
     && (mouseY > height/2)) {
    tint(150, 255, 150);
    image(img4, 250, 350, 250, 350);
  } else {
  noTint();
    image(img4, 250, 350, 250, 350);
  }
  
  //altrimenti
  if (mousePressed){
      tint(255, 0, 0);
    image(img1, 0, 0, 250, 350);
        tint(0, 0, 255);
    image(img2, 0, 350, 250, 350);
        tint(255, 250, 0);
    image(img3, 250, 0, 250, 350);
        tint(0, 255, 0);
    image(img4, 250, 350, 250, 350);
  }

}

