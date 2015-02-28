
PImage img; 

void setup() {
  size(720,479);
  img = loadImage("contemplate.jpg");
}
  
 void draw() {
 //  tint(255,127);
  image(img, 0, 0);
  loadPixels();
  
  //tracking pixel information
  for (int y = 0; y < img.height; y+=10 ) {
    for (int x = 0; x < img.width+5; x+=5) {
      int loc = x + y*img.width;
      
  //color
   stroke(img.pixels[loc]);
   fill(img.pixels[loc],255,120,mouseX);
   
      
 //triangles
      if (x %10 == 0) triangle(x-5,y,x,y+10,x+5,y);
      else triangle(x-5,y+10,x,y,x+5,y+10);
    }
  } 
}

