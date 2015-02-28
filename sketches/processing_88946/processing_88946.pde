
Pimage img;
Pimage img2;
PFont font;

void setup(){
  size(1000,1000);
  smooth();
  img = loadImage("bear.png");
  img2 = loadImage("bg.jpg");
  font = loadFont("COLONNA.TTF");
  textFont(font);
}

void draw(){
  
  image(img2,0,0);
  image(img,mouseX,670,150,150);
  stroke(0);
  textSize(24);
  text("Search for a child",50,900);
  fill(0);
}


