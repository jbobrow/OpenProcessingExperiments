
PImage source;      
PImage destination; 

void setup() {
  size(600,400);
  frameRate(15);
  source = loadImage("peoplespark-1.jpg");
  destination = createImage(source.width, source.height, RGB);
}

void draw() {
  
  float threshold = 127 ;
  source.loadPixels();
  destination.loadPixels();
  
  for (int x = 0; x < source.width; x++ ) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold){
        destination.pixels[loc] = color(mouseX,150,200); 
      } else {
        destination.pixels[loc] = color(mouseX,mouseY,255);   
      }
    }
    
  }
  //change pixels at destination
  destination.updatePixels();
  // Display the destination
  image(destination,0,0);
  
if (mousePressed) {
  frameRate(5);
   //pick random point
  int x1 = int(random(destination.width));
  int y1 = int(random(destination.height));
  int loc1 = x1 + y1*destination.width;
  
  //look up rgb color in the source img
  float r = red(source.pixels[loc1]);
  float g = green(source.pixels[loc1]);
  float b = blue(source.pixels[loc1]);
  noStroke();  
  
  fill(r,g,b,100);
//  triangle(x1,y1,x1+20,y1-30,x1-20,y1-30);
  rect((mouseX),mouseY,random(width/4),height);
  }

  
}



