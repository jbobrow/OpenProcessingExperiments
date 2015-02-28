
PImage img1;    
PImage img2;  
PImage img3;    
PImage img4;  
PImage img5;

int grenze = 589;

void setup() {
  noCursor();
  size(1002, 600);

  img1 = loadImage("hintergrund.png");
  img4 = loadImage("schwimmer.png");
  img2 = loadImage("hundlinks.png");
  img3 = loadImage("hund.png");
  img5 = loadImage("hollenhund.png");
}

void draw() {
  image(img1, 0, 0);  //koordinaten 0, 0

  if(mousePressed) {
    image(img5, mouseX-300, 25);
  }
  else {
    image(img4, mouseX-150, 125);
  }

  if (mouseX >= grenze) {
    image(img3, 500, 105);
  }
  else {
    image(img2, 500, 105);
  }
  println(mouseX);
}


