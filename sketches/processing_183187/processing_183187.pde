

PImage mynd;  // PImage er gagnategund (datatype)

void setup() {
  size(640, 360);
  mynd = loadImage("apple.png");  //ath ad setja mynd i moppuna: data
}

void draw() {
  image(mynd, 0, 0);  //i vinstra horni efst
  image(mynd, mouseX, mouseY, 55, 44); //thar sem musin er
}





