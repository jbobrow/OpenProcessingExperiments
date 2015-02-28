

/*
 * This function produces an average scan from a list of scans.
 *
 * Useful to reduce the noise in the data.
 * It produces also some funny/blurry effects if you move while the scans are taken.
 */

Scan averageScans(ArrayList scans){
  // Get the first scan to calculate the dimensions of the arrays.
  // It assumes all scans have the same dimensions. 
  Scan s0 = (Scan) scans.get(0);
  int xSize = s0.xSize;
  int ySize = s0.ySize;
  int nPoints = s0.nPoints;
  
  PVector[] map3D = new PVector[nPoints];
  PImage rgbImg = createImage(xSize,ySize,RGB); 
  boolean[] consImg = new boolean[nPoints]; 
  PVector scanCenter = new PVector(0,0,0);
  float[] n = new float[nPoints];  // number of points per pixel to average
  float[] r = new float[nPoints];  // red color 
  float[] g = new float[nPoints];  // green color
  float[] b = new float[nPoints];  // blue color
  
  // Initialize the arrays
  for(int i = 0; i < nPoints; i++){
    map3D[i] = new PVector(0,0,0);
    consImg[i] = false;
    n[i] = r[i] = g[i] = b[i] = 0;
  }
  
  // Loop over the scans and add the points and the colors
  for(int i = 0; i < scans.size(); i++){
    Scan s = (Scan) scans.get(i);
    scanCenter.add(s.scanCenter);
    s.rgbImg.loadPixels();
    for(int j = 0; j < nPoints; j++){
      if(s.consImg[j]){
        map3D[j].add(s.map3D[j]);
        consImg[j] = true;
        n[j]++;
        r[j] += red(s.rgbImg.pixels[j]);
        g[j] += green(s.rgbImg.pixels[j]);
        b[j] += blue(s.rgbImg.pixels[j]);
      }
    }
  }

  // Divide by the number of scans that contributed to the points
  scanCenter.div(scans.size());
  rgbImg.loadPixels();
  for(int i = 0; i < nPoints; i++){
    if(consImg[i]){
      map3D[i].div(n[i]);
      r[i] /= n[i];
      g[i] /= n[i];
      b[i] /= n[i];
      rgbImg.pixels[i] = color(r[i],g[i],b[i]);
    }
  }
  rgbImg.updatePixels();

  return new Scan(map3D,rgbImg,consImg,scanCenter);
}


