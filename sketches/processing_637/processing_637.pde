
float noiseScale1 = 0.7f;		
float noiseScale2 = 0.01f;
float zcount1,zcount2; 
int halftilex,halftiley,tilex,tiley,ntiles;

void setup() {
  size(600, 600);
  frameRate(30);
  ntiles = 10;
  tilex = width/(ntiles);
  tiley = height/(ntiles);
  halftilex = width/(2*ntiles);
  halftiley = height/(2*ntiles);
}

void draw() {
  background(0,0,128);
  stroke(255);
  strokeWeight(10);
  noFill();
  smooth();

  // using the 3rd noise dimension as time variance.
  zcount2 += 0.04f; 
  zcount1 += 0.005f;

  for (int i=0; i<ntiles; i++) {
    float xfactor = i*tilex;
    for (int j=0; j<ntiles; j++) {
      float yfactor = j*tiley;
      // noiseVal2 control the bend on the bezier curve and noiseVal1 control the type of tile.
      float noiseVal1 = noise(i*noiseScale1,j*noiseScale1,zcount1);
      float noiseVal2 = noise(i*noiseScale2,j*noiseScale2,zcount2);
      float rx = noiseVal2*tilex;
      float ry = noiseVal2*tiley;

      // bezier anchor points
      float py1 = ry;
      float px1 = rx < halftilex ? rx : tilex-rx;
      float py2 = ry < halftiley ? tiley-ry : ry;
      float px2 = rx < halftilex ? tilex-rx : tilex-rx;
      float py3 = ry < halftiley ? ry : tiley-ry;
      float px3 = rx;
      float py4 = ry < halftiley ? tiley-ry : tiley-ry;
      float px4 = rx < halftilex ? tilex-rx : rx;

      // the type of tile
      if (noiseVal1 < 0.5) {
        bezier(	0+xfactor, halftiley+yfactor, 
        px1+xfactor,py1+yfactor, 
        px2+xfactor,py2+yfactor, 
        halftilex+xfactor, tiley+yfactor);
        
        bezier(	halftilex+xfactor, 0+yfactor, 
        px3+xfactor, py3+yfactor, 
        px4+xfactor, py4+yfactor, 
        tilex+xfactor, halftiley+yfactor);
      } 
      else {
        bezier(	0+xfactor, halftiley+yfactor, 
        px1+xfactor, py1+yfactor, 
        px3+xfactor, py3+yfactor, 
        halftilex+xfactor, 0+yfactor);
        
        bezier( halftilex+xfactor, tiley+yfactor, 
        px2+xfactor, py2+yfactor, 
        px4+xfactor, py4+yfactor, 
        tilex+xfactor, halftiley+yfactor);
      }
    }
  }
}


