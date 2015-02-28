
size(400, 400);
PImage img = loadImage("board.jpg");
background(img);
loadPixels();
for (int i = 0; i < width*height; i++) {
color p = pixels[i];
float r = 255 - red(p); 
float g = 255 - green(p); 
float b = blue(p); 
pixels[i] = color(r, g, b);
}
updatePixels();


