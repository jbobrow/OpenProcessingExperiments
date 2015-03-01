
PImage img;

void setup() {
  size(800, 800);
  img = loadImage("1.jpeg");
}
void draw() {

  for(int x = 0; x < width; x = x + 180){
      for(int y = 0; y < height; y = y + 150){
          image(img, x, y, 200, 150);

      }
  }   
} 


