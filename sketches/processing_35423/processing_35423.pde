
PImage img; 
int dimension = 0;

void setup() {
  size(700, 483);
  img = loadImage("arafat-rabin.jpg");    
  dimension = img.width*img.height;
  img.loadPixels();
  
}

void draw() {
  for (int i=0; i < dimension; i++) { 
      img.pixels[i] = img.pixels[i] + int(random(255)); 
  }
  
  img.updatePixels();
  image(img, 0, 0); 
  
}

