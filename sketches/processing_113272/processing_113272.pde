
PImage img; 

void setup(){
  size(720,360);
  background(255);
  img = loadImage("character.gif");
}
void draw(){
  imageMode(CENTER);
  image(img,width/2,height/2);
}
  


