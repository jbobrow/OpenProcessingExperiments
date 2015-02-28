
PImage img;
//Photo by Dene Miles

void setup() {
  size(634, 419);
  img = loadImage("landscape.png");
  background(img);
  smooth();
  frameRate(10000);
}//set up

void draw() {
  if(mousePressed && (mouseButton == RIGHT)) {
    for(int i = 0; i < width; i = i+6) {
      for(int j = 0; j < height; j = j+6) {
        strokeWeight(1);
        stroke(0);
        point(i, j);
      }//for
    }//for

  }//if 
  
  if(mousePressed && (mouseButton == LEFT)){ 
   
    //pick a random point
    int x;
    x = int(random(img.width));
    int y;
    y = int(random(img.height));
    int loc = x + y*img.width;
  
    //look up color
    loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
  
    //brush strokes
    noStroke();
    fill(r, g, b, 100);
    ellipse(x, y, 15, 5);  
    
   }//if
}//draw

 


