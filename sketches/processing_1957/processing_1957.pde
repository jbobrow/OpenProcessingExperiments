

/****************************
 * 
 * OP-DRAWER 0.1
 * Christoph Tim Schneider
 * 
 *****************************/



int r = 40;         // Raster
int x, xr = 0;
int y, yr = 0;
int rx, ry;

int g = 1;          // Stift Größe 0: klein, 1: mittel, 2: groß

int[] raster;

PImage b, d;        // b: background, d: stift, m: kontextmenü


void setup() {

  size( 880, 440 );
  noStroke();

  xr = width/r;
  yr = height/r;

  raster = new int[xr*yr];

  // Bilder laden
  b = loadImage("back.gif");
  d = loadImage("draw.gif");

}


void draw() {



  //Steuerung Maus

  x = round( mouseX/r ) * r;
  y = round( mouseY/r ) * r;
  

  for ( int i = 0; i < raster.length; i++ ) {
    if ( raster[i] == 0 ) {

      image( b, r * (i%xr), r * (i/xr) );
    }

    else {
      image( d, r * (i%xr), r * (i/xr) );
    } 
  }


rx = mouseX/r;
ry = mouseY/r;
int idx = rx + ry*(width/r);


  if ( mousePressed && mouseButton == LEFT )
  {

    if ( mouseX >= 0 && mouseX < width && mouseY >= 0 && mouseY < height )
    {
      
      
      if ( idx >= 0 && idx < raster.length ) 
      {
          raster[idx] = mouseC;
      }
    }
  }
  else if ( mousePressed && mouseButton == RIGHT) 
  {

  }
  
  
}


int mouseC = 0;
void mousePressed ()
{
  int rx, ry;

  if ( mouseX >= 0 && mouseX < width && mouseY >= 0 && mouseY < height )
  {
    rx = mouseX/r;
    ry = mouseY/r;
    int idx = rx + ry*(width/r);
    if ( idx >= 0 && idx < raster.length ) {
      if( raster[idx] == 0) {
        mouseC = 1;
      }
      else {
        mouseC = 0;
      } 
    }
  }
  
  
}



