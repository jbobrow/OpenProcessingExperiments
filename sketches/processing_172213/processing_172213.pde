
//these color palettes were created by using color.adobe.com
color [] multicolorPalette= {#050000, #FDD700, #000000, #FFE200,#020000} ;
float x=0 ;
//setup -- used for initial settings
void setup () {
  //size and background
  size (800, 600) ;
  //local variables go inside code blocks
  background (multicolorPalette [int(x)]);
  }
  
  //draw
  void draw () {
    float r = random (5) ;
    strokeWeight (random (50)) ;
    stroke (multicolorPalette [int (r)]) ;
    triangle (random (width), random (height), random (400), random (200), random (100), random (75));
   
    fill (multicolorPalette [int (r)]) ;
    
    triangle (random (width), random (height), random (100), random (75), random (80), random (100)) ;
  }
