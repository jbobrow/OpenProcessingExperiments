
// GPL 3.0  
 // 2011 binarymillenium
 
 // TBD these numbers are too magic
 final float z_start = 1.8;
 final float z_step = 0.02;
 
 // find the smallest z
 float z_final; 
 float first_road_curve;
 float cnt = 0;
 float cnt_step = 0;//1.0;
 
int count;

void setup()
{
  size(640,480);
  frameRate(5);
  
  background(0);
  
 for (z_final = z_start; z_final > 2*z_step; z_final -= z_step) {
 }
 println("z_final " + z_final);
 
 first_road_curve = roadCurve(z_final + cnt);
}

PImage multImg(PImage i1, PImage i2) 
{
  i1.loadPixels();
  i2.loadPixels();
  
  PImage rv = createImage(i1.width, i2.height, RGB);
  
  if ((i1.width != i2.width) || (i1.height != i2.height))  {
    print("imgMult size mismatch");
    return rv; 
  }

  for (int y = 0; y < i1.height; y++) {
    for (int x = 0; x < i1.width; x++) {
      final int ind = y*i1.width+x;
      
      float i1p = red(i1.pixels[ind]);
      float i2p = red(i2.pixels[ind]);
      
      rv.pixels[ind] = color(i1p*i2p/255);
    }
  }
    
  rv.updatePixels();
  return rv;
}

PImage binarize(PImage img, int thresh, int fillc) 
{
img.loadPixels();

PImage bin_img = createImage(img.width, img.height, RGB);

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      final int ind = y*img.width+x;
      
      if (red(img.pixels[ind]) > thresh) {
        bin_img.pixels[ind] = color(fillc);
      }
    }
  }
    
  bin_img.updatePixels();
  return bin_img;
}

float[][] kernel = { { -1, -1, -1 },
                     { -1,  9, -1 },
                     { -1, -1, -1 } };
                     
PImage edgeDetect(PImage img) 
{
  /*
  float ksum = 0;
  for (int ky = -1; ky <= 1; ky++) {
    for (int kx = -1; kx <= 1; kx++) {
      ksum += kernel[ky+1][kx+1];
  }}*/
  
img.loadPixels();
// Create an opaque image of the same size as the original
PImage edgeImg = createImage(img.width, img.height, RGB);
// Loop through every pixel in the image.
for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
  for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
  
    float sum = 0; // Kernel sum for this pixel
    
    for (int ky = -1; ky <= 1; ky++) {
      for (int kx = -1; kx <= 1; kx++) {
        // Calculate the adjacent pixel for this kernel point
        int pos = (y + ky)*img.width + (x + kx);
        // Image is grayscale, red/green/blue are identical
        float val = red(img.pixels[pos]);
        // Multiply adjacent pixels based on the kernel values
        sum += kernel[ky+1][kx+1] * val;
      }
    }
    
    // For this pixel in the new image, set the gray value
    // based on the sum from the kernel
    edgeImg.pixels[y*img.width + x] = color(sum/8);
    //if (sum > 0) {print(sum + "\n");}
    
  }
}
// State that there are changes to edgeImg.pixels[]
edgeImg.updatePixels();
return edgeImg;
}
//image(edgeImg, 100, 0); // Draw the new image

float t = 0;
float mtn_off = 0;

///////////////////

PImage noiseImage(int w, int h, float nval, boolean radial_fade)
{
  
  PImage img = createImage(w, h, RGB);
  img.loadPixels();
  
  final int HW = img.width/2;
  final float MAX_R = 0.8 * sqrt(2.0*(HW*HW));
  final float LIM_R = MAX_R/2.0;
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      
      float val = noise(x/15.0,y/8.0, nval);
      float val2 = noise(x/50.0,y/30.0, nval);
      float val3 = noise(x/2.0,y/2.0, nval);
      float tval = (val*0.7 + val2*0.2 + val3*0.1);
      
      if (radial_fade) {
      float r = sqrt( (y-HW)*(y-HW) + (x-HW)*(x-HW));
      
      if (r > MAX_R) {r = MAX_R; }
      if (r > LIM_R) {
        tval *=  1.0 - (r - LIM_R)/(MAX_R - LIM_R);  
      }
      }
      
      tval *= tval;    
      
      img.pixels[y * img.width + x] = color(595*tval);
  }}
  
  img.updatePixels();
  
 return img; 
}

////////////////////////////////////////////////////////////////////////////
// TBD need to rethink this to generate curves into the distance- the target is always in the center of
// the screen
float roadCurve(float z) 
{
  //float val = (30/z * (noise(z/50.0 + (i + j)/55.0)-0.5));
  float nval = (noise(z/15.0 ) - 0.5);
  float val = 9*(width * nval);
    
   // print(z + " " + j + " " + nval  + " " + val + "\n");
  return val;
  /*
  float r = width * (noise(1000.0 + (i + j)/36.0) - 0.5);
  
  // off = r - r cos(theta) 
  // z = r sin(theta)
  // off = r - r cos(asin(z/r))
  float theta = asin( j/r);
  float off = 500 * (r - r * cos(theta) ); 
  
  print(z + " " + j + " " + theta + " " + r + " " + off + "\n");
  
  return off;
  */
}

PImage treeImage()
{
   PImage img = noiseImage(32, 32, t,  true);
  
  PImage bin_img = binarize(img, 56, 255);
  // this doesn't work flexibily enough
  //bin_img.filter(THRESHOLD);
  
  PImage edge_img = edgeDetect(bin_img);
  edge_img = binarize(edge_img, 16, 255);
  img.filter(INVERT);
  PImage fin_img = (multImg(edge_img, img));
  fin_img.filter(POSTERIZE, 8);
  
  fin_img.format = ARGB;
  fin_img.loadPixels();
    for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      final int ind = y*img.width+x;
      
      if (red(fin_img.pixels[ind]) < 6) {
        fin_img.pixels[ind] = color(0, 0);
      }
    }
  }
  fin_img.updatePixels();
 
 return fin_img; 
}

float car_off = 0.0;

void keyPressed()
{
  final float steer_sz = 5 + 68.1 * cnt_step;
  
  if (key == 'a') {
    car_off += steer_sz;
    print(car_off + "\n");
  }
  if (key == 'd') {
    car_off -= steer_sz;
    print(car_off + "\n");
  }
  
    if (key == 'w') {
      final float MAX_SPEED = 0.75;
    cnt_step += 0.012;
    if (cnt_step > MAX_SPEED) { cnt_step = MAX_SPEED; }
    print(cnt_step + "\n");
  }
  if (key == 's') {
    cnt_step *= 0.9;
    print(cnt_step + "\n");
  }
}


 
void draw() 
{
  loadPixels();
  
  PImage road = noiseImage(16, 1, t + 100, false);
  PImage tree = treeImage();
  PImage car = noiseImage(16,2,  t + 10, false);
  PImage car_top = noiseImage(12, 2, t +2000, false);
  /////////////
  background(0);
 
 //image(img,      0,           0, img.width, img.height);
 //image(bin_img,  img.width,   0, img.width, img.height);
 noSmooth();
 //float sc = 16 * (0.5 + t * 5);
 //image(fin_img, img.width*2, 0, img.width*sc, img.height*sc);
 
 ///////////

 
 float road_curve = roadCurve(z_final + cnt);
 //float x_off = width/2 - road.width/(2*z_final) + road_curve;
 
 if ((road_curve + car_off - first_road_curve) > 10) {
   
 }
 
 //////////////////////////////////////////////////////////////////////////////////
 //////////////////////////////////////////////////////////////////////////////////
 // draw background mountains
 int MTN_SC = 4;
 for (int i = 0; i < width/MTN_SC; i++) {
   float hgt = 12 * noise( (i + 2*mtn_off)/60.0 ) + 8 * noise ( (i + 2*mtn_off)/5.0 );
   stroke(78);
   fill(78);
   rect(i*MTN_SC, height/2 - hgt*MTN_SC, MTN_SC, hgt*MTN_SC );
 }
 mtn_off -= cnt_step*road_curve/145.0;
 
 
 //////////////////////////////////////////////////////////////////////////////////
 // draw road
  for (float z = z_start; z > z_step; z -= z_step) {
   
   final float pos = z + cnt;

   final float x = width/2 + roadCurve(pos) + car_off - first_road_curve;
   
   //x -= x_off; // + 50.0*(noise(cnt/10.0)-0.5);
   final float y = height/2 + 8.0/z;
   
   float h = road.height*3;
   image(road, x - road.width/(2*z),  y - 2*h/(2*z), 
               road.width/z, 2*h/z);

   // center line
   int z_ind = (int) ((z-z_final)/z_step);
   
   if (cnt_step > z_step) { z_ind += count; }
   else { z_ind += (float)cnt/(float)z_step; }
   if (z_ind % 2 == 0) {
     noStroke();
     fill(0);
     rect( x - 1.0/(2*z),  y - 2*h/(2*z), 
               1.0/z, 2*h/z);
   }
   
   
   final float TSC = 0.13;
   // draw tree things on side of road
   if (noise( (pos)/TSC) > 0.7) {
     image(tree, x + 3.5*road.width/z, y - tree.height/(1.5*z), 
                 tree.width/z, tree.height/z);
   }
   if (noise(10000 + (pos)/TSC) > 0.7) {
     image(tree, x - 3.5*road.width/z, y - tree.height/(1.5*z), 
                 tree.width/z, tree.height/z);
   }
     
 }

 // draw car
 if (true) {
   float CAR_SC = 2.0;
   
   float car_y = 0.8*height - 20;
   image(car, width/2 - CAR_SC*8*car.width/2, car_y, 
             car.width*8 *CAR_SC, car.height*16*CAR_SC);
   image(car_top, width/2 - CAR_SC*8*car_top.width/2, car_y - CAR_SC*car.height*16, 
                car_top.width*8 * CAR_SC, car_top.height*16 *CAR_SC);
                
                 noStroke();
     fill(5);
     rect(  width/2 + CAR_SC*(8*car.width/3 ),            car_y + car.height*16 * CAR_SC, 
             16 * CAR_SC, car.height*16 * CAR_SC);
     rect(  width/2 - CAR_SC*(8*car.width/3 + 16), car_y + car.height*16 * CAR_SC, 
             16 * CAR_SC, car.height*16 * CAR_SC);
 }
  
 cnt += cnt_step;
 cnt_step *= 0.99;
 t += 0.008;
 count += 1;
}
                                                                
