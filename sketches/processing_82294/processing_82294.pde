
PVector[][] G, oldG;
int levels, level, old_level;
float noiseFactor, old_noiseFactor, noiseRange, xM, yM;

void setup()
{
  size(800,800);
  levels = 8;
  noiseRange = 0.1;
  old_level = 0;
  old_noiseFactor = 0;
}

void draw()
{
  level = ceil((mouseX + 50) * levels / width);
  noiseFactor = mouseY * noiseRange / width ;
  if ((old_level != level) || (old_noiseFactor != noiseFactor))
  {
    fill(255);
    noStroke();
    rect(0,0,width,height);
    
    int lvl = 0;
    int n = 2;
 
//initiate first level grid with fixed points
    oldG = new PVector[n][n]; 
    oldG[0][0] = new PVector(100, 100, 0);
    oldG[0][1] = new PVector(100, width - 100, 0);
    oldG[1][0] = new PVector(height - 100, 100, 0);
    oldG[1][1] = new PVector(height - 100, width - 100, 0);
    
//iterate required levels
    while (lvl < level)
    {
      n = n * 2 - 1;
      G = new PVector[n][n];

// Generate G
      for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
          if ((i%2 == 0) && (j%2 == 0)) {
            int ii = i/2;
            int jj = j/2;
            G[i][j] = oldG[ii][jj];
          }
          else if ((i%2 == 0) && (j%2 != 0)) {
            PVector n1 = oldG[i/2][(j-1)/2];
            PVector n2 = oldG[i/2][(j-1)/2 + 1];
            G[i][j] = PVector.add(n1, n2);
            G[i][j].mult(0.5);
            float d = PVector.dist(n1, n2);
            PVector noiseVector = new PVector(random(-d*noiseFactor, d*noiseFactor),random(-d*noiseFactor, d*noiseFactor));
            G[i][j].add(noiseVector);
          }
          else if ((i%2 != 0) && (j%2 == 0)) {
            PVector n1 = oldG[(i-1)/2][j/2];
            PVector n2 = oldG[(i-1)/2 + 1][j/2];
            G[i][j] = PVector.add(n1, n2);
            G[i][j].mult(0.5);
            float d = PVector.dist(n1, n2);
            PVector noiseVector = new PVector(random(-d*noiseFactor, d*noiseFactor),random(-d*noiseFactor, d*noiseFactor));
            G[i][j].add(noiseVector);
          }
          else if ((i%2 != 0) && (j%2 != 0)) {
            PVector n1 = oldG[(i-1)/2][(j-1)/2];
            PVector n2 = oldG[(i-1)/2 + 1][(j-1)/2 + 1];
            G[i][j] = PVector.add(n1, n2);
            G[i][j].mult(0.5);
            float d = PVector.dist(n1, n2);
            PVector noiseVector = new PVector(random(-d*noiseFactor, d*noiseFactor),random(-d*noiseFactor, d*noiseFactor));
            G[i][j].add(noiseVector);
          }
        }
      }
      
// Get ready for next iteration
      lvl ++;
      oldG = G;
    }
      
// Draw result
    float normalDist = (width-200)/ pow(2, level);

    for (int i=0; i<n; i++) {
      for (int j=0; j<n; j++) {
        if ((i+1 < n) && (j+1 < n)) {
          PVector d1 = PVector.sub(oldG[i+1][j+1], oldG[i][j]);
          PVector d2 = PVector.sub(oldG[i][j+1], oldG[i+1][j]);
          PVector areaV = d1.cross(d2);
          float area = abs(areaV.mag())/2;
          float fillVal = 128 + 64*(area - sq(normalDist))/sq(normalDist);
          float colorVal = fillVal*60/255 -30;
          fill(fillVal + colorVal, fillVal + colorVal, fillVal - colorVal);
          quad(oldG[i][j].x, oldG[i][j].y, 
               oldG[i][j+1].x, oldG[i][j+1].y, 
               oldG[i+1][j+1].x, oldG[i+1][j+1].y, 
               oldG[i+1][j].x, oldG[i+1][j].y);
        }
      }
    }
    old_level = level;
    old_noiseFactor = noiseFactor;
  }
}
      
      
          


