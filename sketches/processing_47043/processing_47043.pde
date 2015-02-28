

//PImage myImage6; 
PImage myImage2;
PImage myImage5;

void setup() {
  size(500,500); 
  
myImage5 = loadImage( "Image5.jpeg"); 
myImage2 = loadImage("Image2.jpeg"); 

}

void draw() {
 
  tint(255,255,255,mouseY); 
  image(myImage5,0,0,500,500); 
  
  tint(255,255,255,50);
  image(myImage2, 0, random(0,250), 500,400); 
 
}

  


