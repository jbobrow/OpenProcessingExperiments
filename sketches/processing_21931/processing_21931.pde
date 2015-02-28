
// Image variable
PImage kitty,kitty2;
int pointillize = 16;


void setup() {
  size(400,272);
  // Load the file from the data folder
  kitty = loadImage("whiskers-sam.jpg");  
  kitty2 = loadImage("cutest-cat-face.jpg");
  smooth();
}

void draw() {
  if (keyPressed) {
  frameRate(500);
  int x = int(random(kitty2.width));
  int y = int(random(kitty2.height));
  int loc = x + y*kitty2.width;
  
  loadPixels();
  float r = red(kitty2.pixels[loc]);
  float g = green(kitty2.pixels[loc]);
  float b = blue(kitty2.pixels[loc]);
  
  noStroke();
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize); 
  
  } else if (!mousePressed) {
  loadPixels();  
  for (int y = 0; y < kitty.height; y+=10 ) {
  for (int x = 0; x < kitty.width+5; x+=5) {
  int loc = x + y*kitty.width;
  stroke(kitty.pixels[loc]);
  fill(kitty.pixels[loc]);
  if (x %3 == 0) triangle(x-40,y,x,y+45,x+40,y);
  else triangle(x-40,y+45,x,y,x+40,y+45);
   }
  }
}
}
      

 

