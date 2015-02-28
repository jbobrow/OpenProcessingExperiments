
int each = 0;
PImage[] images = new PImage[5];


void setup () {
  size (960, 540);
  images [0] = loadImage ( "13.jpg" );
  images [1] = loadImage ( "6.jpg" );
  images [2] = loadImage ( "8.jpg" );
  images [3] = loadImage ( "14.jpg" );
  images [4] = loadImage ( "21.jpg" );
  
}

void draw () {
  
  //make the image half its size
  scale (0.5);
  
  
  //define what images pop up when mouse is moved
  if ((mouseX > width/2) && (mouseY > height/2)) {
    image (images [1], 0, 0);
  } else if ((mouseX > width/2) && (mouseY < height/2)) {
    image (images [2], 0, 0);
  } else if ((mouseX < width/2) && (mouseY < height/2)) {
    image (images [3], 0, 0);
  } else if ((mouseX < width/2) && (mouseY > height/2)) {
    image (images [4], 0, 0);
  }
  
  if (mousePressed){
    image (images [0], 0,0);
  }
  
// // load each image's pixels
//  images [0].loadPixels ();
//  images [1].loadPixels ();
//  images [2].loadPixels ();
//  images [3].loadPixels ();
//  images [4].loadPixels ();
//  
//  int x = int(random(images [0].width));        // random X position
//    int y = int(random(images [0].height));      // random Y position
//  
//   int loc = x + y*images [0].width;
//  
//  color blacks = color (0);
//  
//  for (int i = 0; i < 255 ; i++) {
//    fill(blacks);
//    rect (x, y, 10,10);
//    blacks ++ ;
//    
//  }
    
    
    
  }
  
  
  



  


