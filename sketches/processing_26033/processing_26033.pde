
PImage[] images = new PImage[3];
 
 
int counter =0;
 
void setup () {
 size (700,300);
//load images into the array
for (int i=0; i<images.length; i++) {
 images[i] = loadImage(i+1+".png");
  
 }
  
 
 frameRate (10);
   
}
 
void draw () {
  background (70, 120, 150);
   
  imageMode(CENTER);
 image(images[counter], mouseX, mouseY);
  
 counter ++;
  
 if (counter>2) {
  counter = 0;
   
   
 }
   
   
} 

