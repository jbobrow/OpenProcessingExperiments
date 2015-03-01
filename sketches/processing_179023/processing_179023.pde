
PImage fondjpg;
PImage Godzilla;
PImage fondpng;
void setup() {
  size(704, 528);
  fondjpg = loadImage("fond.jpg");
  Godzilla = loadImage("Godzilla.png");
  fondpng = loadImage("fond.png");
  noCursor();
}

void draw() {
  
  int Y;
  if (mouseY < 100){
    Y=100;
  }
  else if (mouseY>250){
    Y=250;
  }
  else {
    Y=mouseY;
  }
  
  
  image(fondjpg, 0, 0);
  image(Godzilla,mouseX-150,Y);
  image(fondpng, 0, 0);
}


