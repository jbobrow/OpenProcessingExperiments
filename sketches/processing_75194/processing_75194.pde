
PImage img1;
PImage img2;
PImage imgUI;


void setup() {
  size (400, 400);

  img1 = loadImage("joplin.jpeg");
  imgUI = loadImage("joplinUI.jpg");
  img2 = loadImage("joplinRed.jpg");
}

void draw() {
  //image(imageVariable, x, y);

  image(img1, 0, 0);

  color col = imgUI.get(mouseX, mouseY);
  if (mousePressed) {
    text("clicked in the glasses", 20, 20);
  }

  if (mousePressed && col==-65512) {
    image(img2, 0, 0);


    //}else{
    //image(img1, 0, 0);
  }
}


