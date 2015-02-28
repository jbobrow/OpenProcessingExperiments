
PImage[] images = new PImage[4];int counter =0;

PImage img;
void setup () {

 size (900, 600);

  
//load images into the array
for (int i=0; i<images.length; i++) {
 images[i] = loadImage(i+1+".png");
   
 }frameRate (11);
    
    img =loadImage("girasol.png");
}
  
void draw () {

    
  imageMode(CENTER);
  
  image (img, width/2, height/2);
 image(images[counter], mouseX,mouseY);
   
 counter ++;
   
 if (counter>3) {
  counter = 0;
    
    
 }
    
    
}

