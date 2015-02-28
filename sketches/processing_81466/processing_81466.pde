
  PImage chip;
  PImage berry;
  PImage img;
void setup(){
    size(583,389);

  img = loadImage("waffleStrawberry.png");
  background(img);
  
  chip = loadImage("chocChip.png");
  berry = loadImage("berry.png");
  noStroke();
}
 
 
void draw() {

}
 
void mousePressed() {
  if (mouseButton == LEFT){
  image(chip,mouseX-40, mouseY-40);
 }
   if (mouseButton == RIGHT){
  image(berry,mouseX-40, mouseY-40);
 }
}

void keyPressed() {
  if (keyCode == ENTER) {
    image(img,0,0);
  }
}

