
void setup() { 
  size(600, 300);
} 
void draw() { 
loadPixels();
for (int i = 0; i < (width*height)-width; i++) {
  color randomColor = color(random(255), random(255), random(255));
  pixels[i] = randomColor;

  } 
  updatePixels();

} 


