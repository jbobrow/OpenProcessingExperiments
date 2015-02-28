
int numBlobs = 20;
int[] blogPx;
int[] blogPy;
int[] blogsize;
int[] expandratio;

// Movement vector for each blob
int[] blogDx;
int[] blogDy;
 
PGraphics pg;
int[][] vy,vx;
 
void setup() {
  mysize = 200;
  size(mysize , mysize );
  pg = createGraphics(mysize , mysize , P2D);   
  vy = new int[numBlobs][pg.height];
  vx = new int[numBlobs][pg.width];
  blogPx = new int[numBlobs];
  blogPy = new int[numBlobs];
  blogDx = new int[numBlobs];
  blogDy = new int[numBlobs];
  blogsize = new int[numBlobs];
  expandratio = new int[numBlobs];
    blogsize[0] = 3;
  expandratio [0] = 1.02;
   blogPx[0] = mysize /2;
   blogPy[0] = mysize /2;
   blogDx[0] = 0;
   blogDy[0] = 0;
  for(int i = 1; i<numBlobs;i++)
  {
  blogsize[i] = random(0.1,2);
  expandratio [i] = random(1.01,1.03);
   blogPx[i] = mysize /2;
   blogPy[i] = mysize /2;
   blogDx[i] = random(-1,1);
   blogDy[i] = random(-1,1);
  }
}
 
void draw() {
 
  for (int i=0; i<numBlobs; ++i) {
    blogPx[i]+=blogDx[i];
    blogPy[i]+=blogDy[i];
    blogsize [i] *= expandratio[i];

 
    for (int x = 0; x < pg.width; x++) {
      vx[i][x] = int(sq(blogPx[i]-x));
    }
 
    for (int y = 0; y < pg.height; y++) {
      vy[i][y] = int(sq(blogPy[i]-y));
    }
  }
  
  // Output into a buffered image for reuse
  pg.beginDraw();
  pg.loadPixels();
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int m = 1;
      for (int i = 0; i < numBlobs; i++) {
        // Increase this number to make your blobs bigger
        m += blogsize[i]*6000/(vy[i][y] + vx[i][x]+1);
      }
      
      if(m>(100) )
      pg.pixels[x+y*pg.width] = color(255, 255, 255);
      else
      pg.pixels[x+y*pg.width] = color(0, 0, 0);
    }
  }
  pg.updatePixels();
  pg.endDraw();
 
  // Display the results
  image(pg, 0, 0, width, height);
}
      //=========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
//=================
