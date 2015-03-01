
PImage photo1;
PImage[]imgs=new PImage[15];
PImage left;
int loc;
int x;
int y;
PImage right;


void setup() {
  size(1000, 1000);
  noSmooth();
  frameRate(40);
  background(150);
  colorMode(ARGB,255);

  imgs[0]=loadImage("DSC_0543.jpg");
    imgs[1]=loadImage("DSC_0695.jpg");
  left=imgs[0];
  right=imgs[1];
  
}
  
  void draw() {
    background(225);
    image(left,0,0, width, height);
    image(right, 0,0,width, height);
    
loadPixels();
// Loop through every pixel column
for (x = 0; x < width; x++) {
  // Loop through every pixel row
  for (y = 0; y < height; y++){
   // Use the formula to find the 1D location
   loc = x + y * width;
 if (x<=mouseX){
    float r = red(pixels[loc]);
    float g = green(pixels[loc]);
    float b = blue(pixels[loc]);
    float a=alpha(pixels[loc]);
   
pixels[loc]=color(r,g,b,50);
//pixels[loc]=alpha(128);

    // println(alpha(color(r,g,b)));
 }
  }
}
updatePixels();    
  }

