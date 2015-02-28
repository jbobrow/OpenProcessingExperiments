
PImage[] images = new PImage[8];
int counter =0;
 
PImage img;
void setup () {
 
 size (1200,900);
 
   
//load images into the array
for (int i=0; i<images.length; i++) {
 images[i] = loadImage(i+1+".png");
    
 }frameRate (8);
     
}
   
void draw () {
  background(255);
 
     
  imageMode(CENTER);
 image(images[counter], mouseX,mouseY);
    
 counter ++;
    
 if (counter>7) {
  counter = 0;
     
     
 }
     
     
}


