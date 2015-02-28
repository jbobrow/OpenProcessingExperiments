
PImage teahupoo1;
PImage teahupoo2;
PImage teahupoo3;
PImage teahupoo4;

void setup() {
  size(900, 900);
  teahupoo1 = loadImage("chopes-teahupoo.jpg");
  teahupoo2 = loadImage("SR064178teahupoo_l.jpg");
  teahupoo3 = loadImage("11-04-THP-1130.jpg");
  teahupoo4 = loadImage("surf-mural-tim-mckenna-TeahupooFrenchPolynesia2.jpg");
   image(teahupoo2, 0, 0, 900, 900);
  image(teahupoo3, 0, 0, 900, 900);
  image(teahupoo4, 0, 0, 900, 900);
  image(teahupoo2, 0, 0, 900, 900);
  image(teahupoo3, 0, 0, 900, 900);
  image(teahupoo3, 0, 0, 900, 900);
}

void draw() {
  tint(mouseX, mouseY, 255, 50);
  image(teahupoo1, mouseX, mouseY, 200, 200);
 

}


