
PFont arial;

void setup() {
  size(800, 300);
  f = createFont("Arial",16,true); // STEP 3 Create Font
}

void randomBackground() {
 textFont(f, 150);
 fill(0);
 textAlign(CENTER, CENTER);
 text("0x81c", width/2, height/2);
 loadPixels();
 
 float rand_red, rand_green, rand_blue;
 
 for (int y = 0; y < height; y++) {
   for (int x = 0; x < width; x++) {
    int location = x + y * width;
    if (pixels[location] != color(0)) {
      rand_red = random(255);
      rand_green = random(255);
      rand_blue = random(255);
    }
    else {
      rand_red = random(40, 255);
      rand_green = random(40, 255);
      rand_blue = random(40,255);
    }
  
    color c = color(rand_red, rand_green, rand_blue);
    pixels[location] = c;
   }
 } 
 updatePixels();
}
// When we are finished dealing with pixels

void draw() {
 randomBackground();
 print("The color is " + get(25,25));
}
