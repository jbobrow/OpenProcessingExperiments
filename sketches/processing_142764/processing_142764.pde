
//Matrix-esque- class project by Luis Silva

int numberOfSymbols = 500;
Symbol[] symbols = new Symbol[numberOfSymbols];


void setup() {
  size(500, 1000);
  for (int i = 0; i < symbols.length; i++) {
    println(i);
    symbols[i] = new Symbol(color(28, random(252), 39), random(25), random(25), random(width), random(height), random(15));
    //greens
  }
}


void draw() {
  background(0);
  //add image?
  for (int i = 0; i < symbols.length; i++) {
    symbols[i].display();
    symbols[i].move();
  }
}


class Symbol {
  color symbolColor;
  float symbolWidth, symbolHeight;
  float symbolX, symbolY, speed;


  //
  Symbol(color symbolColorTemp, float symbolWidthTemp, float symbolHeightTemp, float symbolXTemp, float symbolYTemp, float speedTemp) {
    symbolColor = symbolColorTemp;
    symbolWidth = symbolWidthTemp;
    symbolHeight = symbolHeightTemp;
    symbolX = symbolXTemp;
    symbolY = symbolYTemp;
    speed = speedTemp;
  }

  void display() {
    noStroke();
    rectMode(CENTER);
    fill(symbolColor);
    rect(symbolX, symbolY, symbolWidth, symbolHeight, 10); //round off character
  }

  void move() {
    symbolY = symbolY + speed;
    if (symbolY > height) {  //top to bottom
      symbolY = 0;
    }
  }
}



