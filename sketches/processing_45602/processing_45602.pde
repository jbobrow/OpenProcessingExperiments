
PImage photo;

//Configuration
void setup(){
  size(640,480);
  photo=loadImage("Photo DGuedj.jpg");
} 
 
//Afficher
void draw(){
  background(255);
  image(photo,width/4,height/4,207,264);
//transparence
  tint(255,230); 
}

