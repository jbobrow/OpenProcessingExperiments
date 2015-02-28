
//moving mouse across image will render flatten effect
PImage img;
//float adj;

void setup()
{
  img = loadImage("basharasad.jpg");
  //size(img.width, img.height);
  size(318, 414);
  //background(255);
  //img = loadImage("IMG.jpg");
}

void draw() {
  //x = img.width;
  //y = img.height;

  //loadImage("IMG.jpg");
  // x = width;
  //y= height;
  //int [] loc == [x+y*width];
  //image(img, 0, 0);
  img.loadPixels();
  loadPixels();
  for ( int row = 0; row < height; row++) 
    for( int col = 0 ; col < width; col++){
    //array varaible
    int loc = row*width+col;
    
    //finds r,g,b values
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    
    
    //fixes glitch... without, screen goes black at mouseX = 0 position
    if(mouseX <= 0){
      mouseX = 1;
    }
    
    //flattening adjustment
    float adj = ((float) mouseX/width)*100;
    //if(mouseX = 0) {
    //  mouseX
    r = ((int)(r/adj))*adj;
    g = ((int)(g/adj))*adj;
    b = ((int)(b/adj))*adj;
    
    //takes adjusted color and restores them into pixel location
    color flat = color(r, g, b);
    pixels[loc] = flat;
  }
  

    updatePixels();
    //image(img, 0, 0);
  }



