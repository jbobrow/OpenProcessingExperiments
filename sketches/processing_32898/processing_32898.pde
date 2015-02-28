
PFont helvet;
PFont frudiger;

PImage kitty;

void setup(){
  size(500,400);
  background(255,0,127);
  
  helvet = createFont("Helvetica.dfont", 60);
  kitty = loadImage("kittens.jpg");
}

void draw(){
  
  textFont(helvet);
  text("hello world", 100, height/2);

  text("Blue is the best", 50, 300);


  image(kitty, 0, 0);
}



