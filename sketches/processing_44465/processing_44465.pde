
/*Some auxiliar stuff here...*/

//This method returns a PGraphics with a polar degraded background
PGraphics degradedBackground (int W, int H, String renderingMode, int X, int Y,float f){ 
      PGraphics pg = createGraphics (W, H, renderingMode);
      pg.beginDraw();
        pg.smooth();
        for (int i=0,x,y; ++i<pg.width*pg.height;) {
          pg.set (x=i%pg.width,
                  y=i/pg.width, 
                  ( (0xFF - floor(dist(x,y,X,Y)*f)) * 0x01010101 ^ 0xFFFF0000 ) 
                 );
        }
      pg.endDraw();
      return pg;
  } 
  
//Overloaded noise method  
float noise (PVector or,int n,float f, int N) {
  return N * ( noise(or.x*f, or.y*f, n)-.5 );
}

//Random int method
int randomInt (int n){
  return int(random(n));  
}

//To reset the settings
void mousePressed() {
  background (bg);
  counter= 0;
  noiseDetail (randomInt(8), random(.5,.75));
}

