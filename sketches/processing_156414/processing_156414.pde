
PImage salsa;
PFont mono;
void setup(){
  size (800, 800);
  salsa = loadImage("salsa.png");
  mono = loadFont("Monospaced-48.vlw");
  frameRate(200);
}

void draw (){
  background(255);
  textSize(32);
  textFont(mono);
  text("Livin la vida loca!", random(width/2 - 20, width/2 +20), 300); 
  fill(0, 102, 153);
  image(salsa, random(width/2 - 30, width/2 + 30), height/2);

}


