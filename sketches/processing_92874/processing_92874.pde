
/* send text & image directly to the printer
 *
 * HOW TO:
 *********
 * everything related to printing is declared in the the tab printer
 *
 * METHODS:
 **********
 *
 * printText( String ) -> send a text to the printer
 *
 * printFrame() -> send to current frame to the printer
 * printFrame( boolean ) -> same as previous, but if you set the argument to false, the temporary image will not be deleted
 *
 * printImage( String ) -> print an image located in the data folder
 * printImage( String, boolean ) -> same as previous, but if you set the second argument to false, you can use absolute path
 * note: the temporary files prefix is "frame2print"; to change it, got to printer tab and set TEMPORARYFILE_PREFIX
 * note: this will not works with urls
 * 
 * the code below send 3 jobs to the printer: a text, an image and the current frame
 *
 * developped by frankiezafe@gmail.com / www.frankiezafe.net
*/


void setup() {
  
  size( 800,600 );
  noLoop();
  
  printText( "Automatic text & image printing procedure with processing.\n" +
  "*****************************************\n\n" +
  "The default system printer will be used." );
  
  printImage( "bercage-desktop.png" );
}

void draw() {
  
  background( 0,0,0 );
  noStroke();
  for ( int i = 0; i < width; i++ ) {
    for ( int j = 0; j < height; j++ ) {
      stroke( ( i * 1.f / width ) * 255, ( j * 1.f / height ) * 255, 0 );
      point( i, j );
    }
  }
  
  printFrame( false );
  
}

