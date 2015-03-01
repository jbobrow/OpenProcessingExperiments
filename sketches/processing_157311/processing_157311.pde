

class Apple {

 int appleHeight;
 int appleColor;
 boolean isYummy;
 int xPos, yPos;
 int appleWidth;
 
 Apple() {

  appleColor = int(random(255));
  isYummy =  false;
  xPos = int(random(width));
  yPos= int(random(height));
  appleWidth= 200;
 
 }
 

 
 void display () {
   if(dist(mouseX, mouseY, (xPos+appleWidth/2), (yPos+appleHeight/2)) < appleWidth/2){
     //isYummy == true; 
     translate(width/2, height/2);
   rotate(radians(180));  
   }
//   imageMode(CORNER);
   image(appleImage, xPos,yPos, appleWidth, appleWidth);
 }
}


Apple apple [] = new Apple [10]; 
PImage appleImage;

void setup () {
  appleImage= loadImage("apple.png");
size (600,600);

for (int i=0; i<10; i++) {
    apple [i] = new Apple();
  }
}

void draw () {
 background (255);
 
 for (int i=0; i<10; i++) {
 apple[i].display();

}
}


