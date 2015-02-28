
PImage dvd;
PImage games;
PImage glass;
PImage notebook;
PImage dvdbig;
PImage gamesbig;
PImage glassbig;
PImage notebookbig;
PImage bg;

float xpos;
float ypos;

void setup() {
  size(1000,667);
  dvd = loadImage("dvd.png");
  games = loadImage("games.png");
  glass = loadImage("glass.png");
  notebook = loadImage("notebook.png");
  dvdbig = loadImage("dvdbig.png");
  gamesbig = loadImage("gamesbig.png");
  glassbig = loadImage("glassbig.png");
  notebookbig = loadImage("notebookbig.png");
  bg = loadImage("unit.png");
}

void draw() {
  background(bg);
  if (mouseX > 310 && mouseX < 420 && mouseY > 480 && mouseY < 520) {
    background(notebook);
    if (mousePressed == true){
      background(notebookbig);
    }
  }
  if (mouseX > 610 && mouseX < 680 && mouseY > 480 && mouseY < 520) {
    background(dvd);
    if (mousePressed == true){
      background(dvdbig);
    }
  }
  if (mouseX > 490 && mouseX < 590 && mouseY > 540 && mouseY < 580) {
    background(games);
    if (mousePressed == true){
      background(gamesbig);
    }
  }
  if (mouseX > 910 && mouseX < 950 && mouseY > 290 && mouseY < 330) {
    background(glass);
    if (mousePressed == true){
      background(glassbig);
    }
  }
}

