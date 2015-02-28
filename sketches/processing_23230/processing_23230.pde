
PImage source;
PImage destination;
 
void setup() {
  size(302,450);
  source = loadImage("lighton.png");
  destination = createImage(source.width, source.height, RGB);
  smooth();
}
 
void draw() {
  float threshold = 120;
   
  source.loadPixels();
  destination.loadPixels();
   
  for (int x = 0; x <source.width; x++){
    for(int y = 0; y <source.height; y++){
      int loc = x + y*source.width;
      if (brightness(source.pixels[loc]) < threshold) {
        destination.pixels[loc] = color(0);
      }else{
        destination.pixels[loc] = color(mouseX,13,mouseY);
      }
    }
  }
  destination.updatePixels();
  image(destination,0,0);
}

//Image Processor by Kelsey Cole, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: http://openprocessing.org/visuals/?visualID=21921
//License:
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/ 


