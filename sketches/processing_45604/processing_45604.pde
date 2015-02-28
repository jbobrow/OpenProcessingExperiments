
PImage photo;

//Configuration
void setup(){
  size(640,480);
  photo=loadImage("Photo DGuedj.jpg");
} 
 
//Afficher
void draw(){
  background(235,0,0);
  image(photo,mouseX,mouseY,414/4,528/4);
}

