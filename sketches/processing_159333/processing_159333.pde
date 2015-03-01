
PImage foto;

void setup() {

  background(0);
  foto = loadImage("pastafarismo.jpg");
  size(800, 600);
  
  frameRate(13);
}
void draw() {
image(foto, 0, 0,800,600);
  stroke(255);
  line(random(800), random(600), 474, 159 );
  stroke(93, 68, 29);
  line(random(800), random(600), 474, 159);
  stroke(180, 134, 58);
  line(random(800), random(600), 585, 147);
  stroke(175, 163, 90);
  line( random(800), random(600), 585, 147);
}



