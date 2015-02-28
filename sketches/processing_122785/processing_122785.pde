
PImage img;
PImage img2;

void setup() {
  size(1000,700);
  img = loadImage( "Background 2.jpg" );
  img2 = loadImage( "Object 2.2.jpg");
}

void draw() {
  background(0);
   image(img2,750,30);
  textAlign(CENTER);
         fill(255);
         textSize(20);
         text("Find This Object", 850,25);
         text("Click & Drag to Find", 850,250 );
         
if (mousePressed) {
  loadPixels();
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      int loc = x + y*img.width;
      
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      float distance = dist(x,y,mouseX,mouseY);
 
      float adjustBrightness = (50-distance)/50;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
      
      color c = color(r,g,b);
      pixels[loc] = c;
    }
  }
  
  updatePixels();  
}

}


