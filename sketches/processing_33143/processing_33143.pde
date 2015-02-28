
float xPos = 0;
float speed = 3;

void setup(){
  size(800,600);

}

PImage firstImage;
PImage secondImage;
PImage thirdImage;
PImage fourthImage;

void draw(){
  background(255);

  firstImage = loadImage("landscape1.jpg");
    image(firstImage,xPos,0,700,107);
    
  xPos += speed;
  
  if(xPos < 0 || xPos > 100){
    speed *= -1.1;
  }  

  secondImage = loadImage("landscape2.jpg");
    image(secondImage,xPos,123,700,123);
    
  xPos += speed;
  
  if(xPos < 0 || xPos > 100){
    speed *= -1;    
 }
 
 thirdImage = loadImage("landscape3.jpg");
   image(thirdImage,xPos,262,700,135);
   
 xPos += speed;
 
 if(xPos < 0 || xPos > 100){
   speed *= -1; 
 }

 fourthImage = loadImage("landscape4.jpg");
   image(fourthImage,xPos,410,700,127);
   
 xPos += speed;
 
 if(xPos < 0 || xPos > 100){
  speed *= -1.1; 
 }
  
  


}


