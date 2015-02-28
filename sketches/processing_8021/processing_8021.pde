
String[] filenames = {"1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"}; // mijn foto's


PImage[] images = new PImage[filenames.length];

int imageIndex = 0;

void setup() {
  size(800,600);  
  
  for(int i = 0; i<filenames.length; i++)
  { images[i] = loadImage(filenames[i]);    
  }     
}

void draw() {
  background(0);  
  image(images[imageIndex],0,0,width,height); // maakt de size goed.
}

void mousePressed() {
 
 if(imageIndex<filenames.length-1)
 { imageIndex++;
 }
 else imageIndex = 0; 
   
}


