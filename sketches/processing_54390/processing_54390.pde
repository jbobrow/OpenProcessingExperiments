
PFont myfont;

void setup(){
  size(628,371);
  PImage water = loadImage("h-wd0409-poland-spring-3[1].jpg");
  background(water);
  myfont = loadFont("LucidaCalligraphy-Italic-48.vlw");
}
void draw(){
}
void mousePressed(){
    textFont(myfont);
    fill(random(255),random(255),random(255),random(255));
    textSize(random(2,50));
    text("Smaller Cap=Less Plastic",mouseX,mouseY);
  }



