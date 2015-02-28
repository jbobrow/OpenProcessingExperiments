
PImage img = createImage(66, 66, RGB);
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
  img.pixels[i] = color(54, 98, 102); 
}
img.updatePixels();
image(img, 17, 17);
PImage img = createImage(98, 98, ARGB);
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
  img.pixels[i] = color(0, 90, 102, i % img.width * 2); 
}
    

fill(255);
rect(0, 0, 50, 50);  // White rectangle

pushMatrix();
translate(30, 20);
fill(0);  
rect(0, 0, 50, 50);  // Black rectangle
popMatrix();

fill(100);  
rect(15, 10, 50, 50);  // Gray rectangle

