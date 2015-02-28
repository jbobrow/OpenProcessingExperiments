
PImage myImage1;
PImage myImage2;
PImage myImage3;
PImage myImage4;
PImage myImage5;
PImage myImage6;
PImage myImage7;
PImage myImage8;
PImage myImage9;
PImage myImage10;
int yPosition = 100;
int xPosition = 0;
int speed = 2;

void setup (){
  size(525,700);
  background(0);
  myImage1 = loadImage("image1.jpg");
  myImage2 = loadImage("image2.jpg");
  myImage3 = loadImage("image3.jpg");
  myImage4 = loadImage("image4.jpg");
  myImage5 = loadImage("image5.jpg");
  myImage6 = loadImage("image6.jpg");
  myImage7 = loadImage("image7.jpg");
  myImage8 = loadImage("image8.jpg");
  myImage9 = loadImage("image9.jpg");
  myImage10 = loadImage("image10.jpg");
}

void draw (){ 
  
   image(myImage9, 60, 0);
   
   tint (255, 170);
   image(myImage10, 0, -30);
  
   tint (255, 130);
   image(myImage2, 0, 0);  
   
   tint (255, 100);
   image(myImage5, 340, 0);
   
   tint (255, 100);
   image(myImage4, 400, 0);
   
   tint (255, 100);
   image(myImage6, 270, 0);
   
   tint (255, 100);
   image(myImage1, 220, 150);
   
   tint (255, 50);
   image(myImage7, 0, 450);
   
    tint (255, 150);
   image(myImage8, xPosition, 500);
   
   xPosition = xPosition + speed;
  
   if (xPosition > width){
    speed = speed * -1;
  } else if (xPosition < 0){
    speed = speed * -1;
  } 
  
     tint (255, 150);
   image(myImage3, 350, yPosition);
   
   yPosition = yPosition + speed;
  
   if (yPosition > width){
    speed = speed * -1;
  } else if (yPosition < 0){
    speed = speed * -1;
  } 
   
}
  

