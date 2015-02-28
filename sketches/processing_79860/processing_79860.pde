
/*
This sketch is a research about the best way to generate a gradient to merge two projections
together. To be tested, it obviously requires 2 projectors :)
- Use arrow up & down to adapt the size of the overlap
- Use arrow left & right to switch gradient calculation method
- Use 'f' to enable or disable fullscreen
- Use 'p' to print the current conifguration
*/

int screenw = 300;
int screenh = 200;
String mode = P3D;

PGraphics screen1;
PGraphics screen2;

PImage mire;

int overlap = 50;
PGraphics screen1overlap;
PGraphics screen2overlap;

public static final int GRADIENT_NONE =     0;
public static final int GRADIENT_LINEAR =   1;
public static final int GRADIENT_SINUS =    2;
public static final int GRADIENT_SQUARE =   3;
public static final int GRADIENT_EXP =      4;
int gradientmode = GRADIENT_LINEAR;

boolean fullscreenenabled = false;

void setup() {
  
  size( 600, 200 ); // for openprocessing, using (screenw * 2, screenh) is not working...
  
  mire = loadImage("mire_1024x768.png");
  
  screen1 = createGraphics( screenw, screenh, mode );
  screen2 = createGraphics( screenw, screenh, mode );
  
  renderOverlaps();
  
  printConfiguration();

}

void setPlainWhiteBg( PGraphics pg ) {
  pg.beginDraw();
  pg.background(color(255));
  pg.endDraw();
}

void renderOverlaps() {
  screen1overlap = createGraphics( overlap, screenh, mode );
  screen2overlap = createGraphics( overlap, screenh, mode );
  renderOverlap( screen1overlap, true );
  renderOverlap( screen2overlap, false );
  renderMire();
}

void renderMire() {
  setPlainWhiteBg( screen1 );
  setPlainWhiteBg( screen2 );
  screen1.beginDraw();
  screen1.image( mire, 0, 0, screenw * 2 - overlap, screenh );
  screen1.endDraw();
  screen2.beginDraw();
  screen2.image( mire, -(screenw - overlap), 0, screenw * 2 - overlap, screenh );
  screen2.endDraw();
}

void renderOverlap( PGraphics pg, boolean revert ) {
  
  setPlainWhiteBg( pg );
  pg.loadPixels();
  int[] blackvalues = new int[ pg.width ];
  
  float b;
  float bgap;
  
  switch (gradientmode) {
    
    case GRADIENT_NONE:
      for ( int x = 0; x < pg.width; x++ )
        blackvalues[ x ] = color(0);
      break;
    
    case GRADIENT_LINEAR:
      b = 0;
      bgap = 255.f / (pg.width-1);
      if (revert) {
        b = 255;
        bgap *= -1;
      }
      for ( int x = 0; x < pg.width; x++ ) {
        blackvalues[ x ] = color(b);
        b += bgap;
      }
      break;
      
    case GRADIENT_SINUS:
      b = 0;
      bgap = (PI * 0.5f) / (pg.width-1);
      if (revert) {
        b = PI * 0.5f;
        bgap *= -1;
      }
      for ( int x = 0; x < pg.width; x++ ) {
        blackvalues[ x ] = color( sin( b ) * 255 );
        b += bgap;
      }
      break;
      
    case GRADIENT_EXP:
      b = 0;
      bgap = 1.f / (pg.width-1);
      if (revert) {
        b = 1;
        bgap *= -1;
      }
      float emax = exp(1);
      for ( int x = 0; x < pg.width; x++ ) {
        blackvalues[ x ] = color( (1 - (emax - exp(b)) / emax ) * 255 );
        b += bgap;
      }
      break;
      
    case GRADIENT_SQUARE:
      b = 1;
      bgap = -1.f / (pg.width-1);
      if (revert) {
        b = 0;
        bgap *= -1;
      }
      for ( int x = 0; x < pg.width; x++ ) {
        blackvalues[ x ] = color( (1 - (b * b)) * 255 );
        b += bgap;
      }
      break;
      
  }
  
  for ( int x = 0; x < pg.width; x++ ) {
    for ( int y = 0; y < pg.height; y++ )
      pg.pixels[ x + y * pg.width ] = blackvalues[x];
  }
  pg.updatePixels();
  
}

void draw() {
  background(255);
  image( screen1, 0, 0 );
  image( screen2, screenw, 0);
  blend( screen1overlap, 0, 0, overlap, screenh, screenw - overlap, 0, overlap, screenh, MULTIPLY );
  blend( screen2overlap, 0, 0, screenw, screenh, screenw, 0, overlap, screenh, MULTIPLY );
}

void keyPressed() {
  switch ( keyCode ) {
    case 38: // '[arrow up]'
      overlap++;
      if (overlap > screenw)
        overlap = screenw;
      renderOverlaps();
      break;
    case 40: // '[arrow down]'
      overlap--;
      if ( overlap < 0 )
        overlap = 0;
      renderOverlaps();
      break;
    case 37: // '[arrow left]'
      gradientmode--;
      if ( gradientmode < 0 )
        gradientmode = GRADIENT_EXP;
      renderOverlaps();
      break;
    case 39: // '[arrow right]'
      gradientmode++;
      if ( gradientmode > GRADIENT_EXP )
        gradientmode = GRADIENT_NONE;
      renderOverlaps();
      break;
    case 70: // 'f'
      if ( frame != null && fullscreenenabled ) {
        frame.setResizable(true);
        frame.dispose();
        frame.setUndecorated(false);
        frame.resize(screenw * 2, screenh);
        frame.setVisible(true);
        fullscreenenabled = false;
        this.requestFocusInWindow();
      } else if ( frame != null && !fullscreenenabled ) {
        frame.setResizable(true);
        frame.dispose();
        frame.setUndecorated(true);
        frame.resize(
           (int) java.awt.Toolkit.getDefaultToolkit().getScreenSize().getWidth(),
           (int) java.awt.Toolkit.getDefaultToolkit().getScreenSize().getHeight()
           );
        frame.setVisible(true);
        this.requestFocusInWindow();
        fullscreenenabled = true;
      }
      break;
    case 80:
      printConfiguration();
      break;
    default:
      println( keyCode );
  }
}

void printConfiguration() {
 String s = "Current configuration is: \n";
 s += "-screens overlap: " + overlap +"\n-mode: ";
  switch( gradientmode ) {
    case GRADIENT_NONE:
      s += "GRADIENT_NONE ("+GRADIENT_NONE+")";
      break;
    case GRADIENT_LINEAR:
      s += "GRADIENT_LINEAR ("+GRADIENT_LINEAR+")";
      break;
    case GRADIENT_SINUS:
      s += "GRADIENT_SINUS ("+GRADIENT_SINUS+")";
      break;
    case GRADIENT_EXP:
      s += "GRADIENT_EXP ("+GRADIENT_EXP+")";
      break;
    case GRADIENT_SQUARE:
      s += "GRADIENT_SQUARE ("+GRADIENT_SQUARE+")";
      break;
    default:
      s += "???";
      break;
  }
  s += "\n--------------------------";
  println(s);
}

