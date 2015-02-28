
// Apple coords
int[] xCoords = {150, 290, 200, 260, 200, 230};
int[] yCoords = {250, 200, 240, 130, 150, 200};

void setup() {
  size(500, 500);
}

void draw() {
  background(#70f870);  
 
  PImage img = loadImage("tree.png");
  image(img, 150, 100);
  
  drawBasket();
  drawApples();
}

void mousePressed() {
  for (int i = 0; i < 6; i++) {
    if ((mouseX <= xCoords[i] + 30 && mouseX >= xCoords[i]) &&
        (mouseY <= yCoords[i] + 30 && mouseY >= yCoords[i])) {
      xCoords[i] = 25 + i * 10;
      yCoords[i] = 400 + i * 10;
    }
  }
}

void drawApples() {
  PImage apple = loadImage("apple.png");  
  
  for (int i = 0; i < 6; i++) {
    if (xCoords[i] == 0 || yCoords[i] == 0) continue;
    image(apple, xCoords[i], yCoords[i]);
  }
}

void drawBasket() {
  PImage basket = loadImage("basket.png");
  image(basket, 20, 400);
}


