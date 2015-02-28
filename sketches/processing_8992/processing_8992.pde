
// SRTM shuttle elevation topography model demo
// by Steven Kay, Apr 2010
// draws a 1x1 degree square of digital elevation data
// you can download your own squares here...
// http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/
// squares are zipped raw binary files named after the lower-left corner
// e.g. N00E103.hgt.zip contains the tile whose lower-left corner is 0N, 103E
//
// * colours are scaled from black (sea level) to white (highest point)
// * blue shows sea areas
// * red shows void areas (errors).
//
// this sample uses N59E010.hgt, which shows Norway south of Oslo (Oslo appears
// at the top of the square).
// The result is an equirectangular projection, so the map will look distorted as you move away
// from the equator.
//
// Not very exciting, but gives an example of how to read binary files.


int[][] elevation; // elevations in meters
float[][] felevation; // scaled to range [0,1] where 1=max
int maxheight;

void setup(){
  size(600,600,P2D);
  
  // read srtm binary file
  elevation=new int[1201][1201];
  felevation=new float[1201][1201];
  byte b[] = loadBytes("N59E010.hgt"); // sample data - square shows Oslo, Norway at top.
  int ix=0;
  maxheight=0;
  for (int row=0;row<1201;row++) {
    for (int col=0;col<1201;col++) {
      // bytes are signed, from -128 to 127, converts to unsigned...
      int hi = b[ix] & 0xff; 
      int lo = b[ix+1] & 0xff; 
      int el=(int)((hi<<8)|lo); // big endian!
      elevation[row][col]=el;
      if (el>maxheight && el<32000) maxheight=el; 
      ix+=2;
    }
  }
  // work out scaled values
  for (int row=0;row<1201;row++) {
    for (int col=0;col<1201;col++) {
      felevation[row][col]=255.0*(float)elevation[row][col]/(float)maxheight;
    }
  }
  noLoop();
}

void draw() {
  background(0);
  noStroke();
  for (int row=0;row<1201;row+=2) {
    for (int col=0;col<1201;col+=2) {
      float el=felevation[row][col];
      fill(el);
      if (el==0.0) {
        fill(0,0,255); // sea level
      };
      if (elevation[row][col]>32000) {
        fill(255,0,0); // void
      };
      rect(col/2,row/2,1,1);
    }
  }
}

