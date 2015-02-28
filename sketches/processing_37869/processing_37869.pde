
//Gina DeMatteo
//Nested Loop
//September 18,2011

void setup() {
  size(400, 400);
  colorMode(HSB);
  smooth();
}

void draw() {
  background(0);
  ellipseMode(CENTER);
  //Below is the Loop setup for the ellipses.The loop creates the repetitive pattern for the composition
  for (int x=0; x<width/50; x++) {
    for (int y=0; y <height/50; y++) {
      for (int ellipseSize=200; ellipseSize>=30; ellipseSize-=30) {
        //Below is the code that establishes the ellipse and it's properties      
        noFill();
        stroke(23, 180, 240, 90);
        ellipse(25+ (x *50), 25+ (y*50), ellipseSize, ellipseSize);
      }
    }
  }
}


