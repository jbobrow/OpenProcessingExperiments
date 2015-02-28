
PImage img;
PImage img2;
PImage img3;
PImage img4;

  
void setup(){
  size(800,661);
  smooth();
  
  img=loadImage("hintergrund.jpg");
  img2=loadImage("seifenblasen.jpg");
  img3=loadImage("fish_seifenblase.png");
  img4=loadImage("fish_normal.png");
}
  
void draw(){
image(img,0,0);
image(img4,mouseX,0);
    
if(mousePressed){
image(img2,-mouseX,-35);
image(img3,mouseX,0);
}
}
 

