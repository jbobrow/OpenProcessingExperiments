
// Declaring a variable of type PImage 
PImage img;
PImage img2;
PImage img3;
//Declaring a variable of type PImage
void setup() { 
  size(650, 650); 
  // Make a new instance of a PImage by loading an image file 
  img = loadImage("im1.jpg");
  
  img2 = loadImage("im2.jpg");
  
  img3 = loadImage("im3.jpg");
  
  img4 = loadImage("im4.jpg");
}
void draw() { 
  background(0); 
  
  image(img, 0, 0);
  
    image(img2, 400, 400);
    
        image(img3, 200, 250);
        
          image(img4, 0, 0);

 

}



