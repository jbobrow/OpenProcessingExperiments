
PImage img;
PImage img2;
PImage img3;

float xPos = 0; 
float yPos = 0;
int dirX = 1; 
int dirY = 1;

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
 image(img3,xPos,yPos);
 if  (xPos > width || xPos < 0)
 dirX = dirX * -1;} 
 if  (yPos > height || yPos < 0){
 dirY = dirY * -1;}
    xPos = xPos + dirX;
  yPos = yPos + dirY;

}


