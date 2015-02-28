
PImage star;

void setup(){
 size(476,351);
 background(255);    
 
    frameRate(12);
   star = loadImage("star.bmp");
   image(star, 0, 0, width, height); 

}

void draw(){
   star = loadImage("star.bmp");
   image(star, 0, 0, width, height); 
  
   loadPixels();
   
   for(int i = 0; i<width*height; i++){
      pixels[i] = color(pixels[i]*-5);
   }

   updatePixels(); 
}

