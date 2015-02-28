
PImage source;
PImage dest;

void setup(){ 
   size(400, 300);
  source = loadImage("tiger.jpg");
  dest = createImage(source.width, source.height, RGB);
  
}

void draw(){
  
  source.loadPixels();
  dest.loadPixels();
  float threshold = mouseX;
  for (int y =0; y < source.height; y ++){
    for (int x =0; x < source.width; x ++){
      int loc = x + y *source.width;    
      if (brightness(source.pixels[loc]) <threshold){
        dest.pixels[loc] = color (0);
      }else{
        dest.pixels[loc] = color (255);
      }    
    }
  }dest.updatePixels();
  
  image(dest, 0,0);
  
}
  

