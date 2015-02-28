
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup() {

  background(255);
  size(400, 400, P2D);
  smooth(5); 
  img = loadImage("cilindro-01.png");
  img2 = loadImage ("cilindro-02.png");
  img3 = loadImage ("cilindro-03.png");
  img4 = loadImage ("esplosione.png");
  img5 = loadImage ("magic_area.png");
}

void draw() {
  background (255);
  image (img5, 80, 150);
  image (img3, 80, 150);
  fill(0);


  if (mousePressed && mouseY > 100 && mouseY < 300 ) {
    if (mouseX >  width/2) {
      image (img2, 120, 20);
      image (img, 40, 60);
      fill(0);
      ellipse( 112, 50, 10, 10);
      rect(mouseX, mouseY, -80, 10, 5);
      imageMode(CENTER);
      image (img4, mouseX-110, mouseY);
      imageMode(CORNER);
    }

    if (mouseX < width/2) {
      image (img2, 120, 20);
      image (img, 40, 60);
      fill(0);
      ellipse( 112, 50, 10, 10);
      rect(mouseX, mouseY, 80, 10, 5);
      imageMode(CENTER);
      image (img4, mouseX+110, mouseY);
      imageMode(CORNER);
    }
  }
  else {
    rect(mouseX, mouseY-80, 10, 80, 5);
  }
}



