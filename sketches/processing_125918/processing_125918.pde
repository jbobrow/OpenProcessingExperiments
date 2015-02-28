
PImage aviao;
PImage inferno_ceu;
int y = 500;


 

 
void setup() {
size(500, 500);

  aviao = loadImage("avião.png");
  inferno_ceu = loadImage("inferno_ceu.jpg");
}

void draw() {
  frameRate(120);
  image(inferno_ceu, 0, 0);
  image(aviao, 120,y,250, 250);
  y--;
}


