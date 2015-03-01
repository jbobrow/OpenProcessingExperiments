
PImage img, sample;
int res, n, d;
int l;
 
// list of resolutions
//int[] rlist = { 25, 50,  100, 10, 20 };
int[] rlist = { 100};
 
   
void setup() {
   
  size(400, 400);
  img = loadImage("final.jpg");
  nextRes();
  frameRate(2);
  
}
 
 
void nextRes() {
   
  // resample the image
  res = (res + 1) % rlist.length;
  n = rlist[res];
  sample = img.get();
  sample.resize(n, n);
  d = width/n;
   
}
 
 
void draw() {
  
  
  
  int m = constrain(130 * mouseX / width, 1, 129);
 
  loadPixels();
  
  // iterate over all blocks
  for(int x = 0; x < n; x++) {
    for(int y = 0; y < n; y++) {
       
      // sample pixel brightness
      float val = 256 - (sample.pixels[y*n+x] & 255);
       
      // iterate over all pixels of a block
      for(int dx = 0; dx < d; dx++) {
        for(int dy = 0; dy < d; dy++) {
           
          // get diagonal coordinate
          int z = val % (2*m) < m ? (dx+dy+1) * 255 / d : (dx+d-dy) * 255 / d;
                    
          // black and white dithering
          pixels[ (y*d + dy) * width + (x*d + dx) ] = val > 2 * abs(z - 255) + 2 ? #000000 : #ffffff;
           
        }
      }
       
    }
  }
     
  updatePixels();
   nextRes();
   
   //image pixelated...//
   tint (255, 150);
   image (img, 0, 0);
   
   filter(POSTERIZE,8);
   //filter(THRESHOLD, 0.6);
   //filter(DILATE);
   
   
   
   
   
   //lined background//
   for (l=0; l <= 400; l+=5) {
    line (0, l,400,l);
   strokeWeight(.7); 
   line (l-0.5,0, l-0.5, 400);
}


  for (int i = 5; i<400; i=i+10) {
    float r=random(1);
    strokeWeight(10);
    point(i,r);
    point(r,i);
  }
    //line(0,i, i,r);
    
    rect(0,0,10,10);
    fill(255);
    translate(width/2, height/2);
  rotate(PI/3.0);
    rect(-26, -26, 52, 52);
    
  
 
 //flipped image//
   tint(200, 100);
   pushMatrix();
 scale(-1.0, 1.0);
 image(img,-img.width,0);
 
 popMatrix;
 
 

 




 
}



