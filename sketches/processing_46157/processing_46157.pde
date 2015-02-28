
PImage myImage1;
PImage myImage2;
PImage myImage3;
PImage myImage4;

void setup(){
  size (1000,1000);
  myImage1=loadImage ("images1.jpg");
  myImage2=loadImage ("images2.jpg");
  myImage3=loadImage ("images3.jpg");
  myImage4=loadImage ("images4.jpg");
}

void draw(){
  tint(220,80, 80,53);
  image(myImage1,mouseX,mouseY);
  
  tint(255, 90, 89, 150);
  image(myImage2,200,200);
  
  tint(255, 90, 89, 150);
  image(myImage3,300,500); 
 

  
}

