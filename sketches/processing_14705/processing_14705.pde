
/**********************\
* 2010_11_02 
* Konkuk_UNIV
* Kwon_DaeSung
\**********************/
int largeRect;
int smallRect;
int elementsSize;
int elementsInterval;
int elementsNum;
int margin;
int colorB;
int colorG;
int changeColor;
void setup() {
  size( 400, 400 );
  largeRect = 360;
  smallRect = 100;
  elementsSize = 2;
  elementsInterval = 4;
  elementsNum = largeRect / elementsInterval;
  margin = ( width - largeRect ) / 2;
  noStroke();
  background( 255 );
  fill( 0 );
  colorB = 0;
  colorG = 255;
  changeColor = 2;
}//setup
void draw() {
  // option :: change Color
  colorB += changeColor;
  colorG -= changeColor;
  if( colorB > 253 ){
    changeColor = -2;
  }else if( colorB < 2 ){
    changeColor = 2;
  }
  colorB += changeColor;
  colorG -= changeColor;
  
  fill( 255, colorG, colorB );
  
  // draw Rect
  for( int i = 0; i < elementsNum + 1; i++ ) {
    for( int j = 0; j < elementsNum + 1; j++ ) {
      int rectX = margin + ( j * elementsInterval ) - ( elementsInterval / 2 );
      int rectY = margin + ( i * elementsInterval ) - ( elementsInterval / 2 );
      
      if( rectY > ( height - smallRect )/2 && rectY < ( height - smallRect )/2 + smallRect ){
        if( rectX < ( width - smallRect )/2 || rectX > ( width - smallRect )/2 + smallRect ){
          rect(  rectX, rectY, elementsSize, elementsSize );
        }
      }else{
        rect(  rectX, rectY, elementsSize, elementsSize );
      }
      
    }//for
  }//for
}//draw

