

PImage sImage; // image to process
// define color channel to update
int sCurrentColorChannel;
final int COLOR_CHANNEL_ALPHA = 0x00;
final int COLOR_CHANNEL_RED   = 0x01;
final int COLOR_CHANNEL_GREEN = 0x02;
final int COLOR_CHANNEL_BLUE  = 0x03;


void setup() {
  sImage = loadImage( "image.jpg" );
  size( sImage.width, sImage.height );
//  size( displayWidth, displayHeight );
  
  // set initial color
  sCurrentColorChannel = COLOR_CHANNEL_RED;
}


void draw() {
  image(sImage, 0, 0);
  int currentColorValue = 0;
  
  // background init
  background(0xffffffff);
  
  // check input color channel mode
  if( keyPressed ) {
     if( key == 'a' || key == 'A' ) {
        sCurrentColorChannel = COLOR_CHANNEL_ALPHA;
        println("Pressed: A");
     } else if( key == 'r' || key == 'R' ) {
        sCurrentColorChannel = COLOR_CHANNEL_RED;
        println("Pressed: R");
     } else if( key == 'g' || key == 'G' ) {
        sCurrentColorChannel = COLOR_CHANNEL_GREEN;
        println("Pressed: G");
     } else if( key == 'b' || key == 'B' ) {
        sCurrentColorChannel = COLOR_CHANNEL_BLUE;
        println("Pressed: B");
     }
  }
  
  // detect color value
  if( mouseX != 0 ) {
    currentColorValue = (int) ( mouseX * 255 / sImage.width );
  }
  
  // get current color
  color currentColor = get( mouseX, mouseY );
  color tintColor = #000000;
  
  // update tint color base on mouse position and color channel
  if( sCurrentColorChannel == COLOR_CHANNEL_RED ) {
     tintColor = color( currentColorValue, green(currentColor), blue(currentColor) ); 
     println( "Updated: RED | 0x" + hex(tintColor) );
  } else if( sCurrentColorChannel == COLOR_CHANNEL_GREEN ) {
     tintColor = color( red(currentColor), currentColorValue, blue(currentColor) );
     println( "Updated: GREEN | 0x" + hex(tintColor) ); 
  } else if( sCurrentColorChannel == COLOR_CHANNEL_BLUE ) {
     tintColor = color ( red(currentColor), green(currentColor), currentColorValue );
     println( "Updated: BLUE | 0x" + hex(tintColor) ); 
  } else if( sCurrentColorChannel == COLOR_CHANNEL_ALPHA ) {
     tintColor = color ( red(currentColor), green(currentColor), blue(currentColor), currentColorValue );
     println( "Updated: ALPHA | 0x" + hex(tintColor) ); 
  }
  
  // tint image
  tint(tintColor);
  
  // draw mage
  image( sImage, 0, 0 );
}

