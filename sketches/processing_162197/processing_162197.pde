
// Week 3 Assignment 1 - Event Poster
// Sept 15 2014 / Deena Khattab

PImage cat;                            //cat photo
PImage galaxy;                         //space photo
 
void setup() {
  cat = loadImage("cat.png");
  galaxy = loadImage("galaxy.jpg");
  size(640,400);
}
 
void draw () { 
  image(galaxy, 0, 0);
  fill(255);
  textSize(40);
  text("cats in space", 10,50);
  textSize(18);
  text ("november 7, 2020 @ 2 am", 10, 280);
  text ("griffith observatory", 10,300);


 image(cat, mouseX, mouseY, pmouseX, pmouseY); //loads the cat on a 3D mouse

}
 




