
PImage img;
PImage img2;
PImage img3;

void setup(){
  smooth();
  cursor(HAND);
  
  img = loadImage("147380-stock-photo-wall-building-graffiti-concrete-communicate-characters-simple.jpg");
  img2 = loadImage("sticker,375x360.png");
  img3 = loadImage("spray-can.png");
    size(img.width,img.height);

}

void draw(){
  
image(img,0,0);
  
if(mousePressed){
image(img2,-17,0);
}else{
 image(img3,mouseX,mouseY);
}

if(keyPressed){
image(img2,-17,0);
}
  
}

