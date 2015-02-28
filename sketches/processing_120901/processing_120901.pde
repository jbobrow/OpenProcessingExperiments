
PImage img;
int pointillize = 8;
int numPoints = 100;
PVector v1;
PVector radialpoint;
int linelength = 10;
int curveamount=20;
 
void setup() {
  v1= new PVector(0,0);
  radialpoint = new PVector(0,0);
  size(350,350);
  img = loadImage("ashwin.jpg");
  background(0);
  smooth();
}
 
void draw() {
 
  int newX, newY, loc, leftloc;
      loadPixels();
  // Pick a random point
  for (int i=0;i <= numPoints;i++){
    int x = int(random(img.width));
    int y = int(random(img.height));
     
    v1.x= x - radialpoint.x;
    v1.y= y - radialpoint.y;
    v1.normalize();
   
     
     
     
    loc = x + y*img.width;
    color pix = img.pixels[loc];
    leftloc = (x-1) + y*img.width;
    //constrain(leftLoc, 0, img.width*img.height);
    if (leftloc < 0 ) leftloc = 0;
    color leftPix = img.pixels[leftloc];
   
   
  // Look up the RGB color in the source image
 
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    noStroke();
   
   
  noFill();
    stroke(r,g,b);
    curve(x-curveamount,y-curveamount,x,y,v1.x*linelength+x,v1.y*linelength+y,v1.x*linelength+x -curveamount ,v1.y*linelength+y-curveamount );
 
  }
}




