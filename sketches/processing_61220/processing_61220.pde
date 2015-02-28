
//  PDF
//  import processing.pdf.*;

//  
//  Map Board -> I <3 CO skateboard graphic
//  

Boolean isFinal = false;
Boolean drawBoard = false;
float alf = 36;
float centerX, centerY;

color[] p1 = { #EFEFEF, #FFFFFF, #EFEFEF,#3A3A3A,#4D4D4D,#606060,#737373,#868686,#9A9A9A,#ADADAD,#C0C0C0,#C6C6C6,#CDCDCD,#D3D3D3,#D9D9D9,#E0E0E0,#E6E6E6,#ECECEC,#F2F2F2,#F9F9F9, #FFFFFF};

color[] p2 = { 
#A59DA1,#D96D55,#F36613,#A9ABEA,#D23301,#F6FAFD,#AB6E9C,#D6F9FF,#F8751E,#900A00,#F05510,#FFEE51,#FFB02A,#D7D5FA,

};


PImage img;
ArrayList p3;

float x;
float y;
float outerRad = 2;
float innerRad = 2;
float px = 0, py = 0, angle = 0;
float pts = 36;
float rot = 360.0/pts;

int loc;

//  circle vars
float angle1, x1, y1, startX1, startY1, radius1;

////////////////////////////////////////////////////
//
void setup() {
  size(1440, 420 );  //900);

//  PDF
if(isFinal){
  beginRecord(PDF, "Map_Board.pdf");
}
  background(#EFEFEF);

  centerX = width * .5;
  centerY = height * .5;

  // sun starting point
  x  = 533;
  y  = centerY-21;


    // get colors from CO MAP
    img = loadImage( "colorado.jpg");
    p3 = getImgColors( img );

  // NOTE: using GRAYed CO since you can't use filter(GRAY) with PDF lib
  img = loadImage("gray-colorado.png");
    
//  - 476
    image(img, 0, -134 );

    noFill();
    smooth();
}



////////////////////////////////////////////////////
//
void draw()
{

  strokeWeight( random(1,2) );

  beginShape(TRIANGLE_STRIP); //  TRIANGLE_STRIP
  for (int i = 0; i < pts; i++) {

  
    px = x + cos(radians(angle))*outerRad;
    py = y + sin(radians(angle))*outerRad;
    angle += frameCount;//    angle += rot;
    
    ranPalStroke(p2);

    vertex(px, py);

    px = x + cos(radians(angle))*innerRad;
    py = y + sin(radians(angle))*innerRad;

    ranPalStroke(p3);
    vertex(px, py); 
    
    angle += frameCount;//    angle += rot+i;

  }
  endShape();
 
  //  make bigger
  innerRad += 15;
  outerRad += 25;


  if( innerRad > width ) {

//  line behind text
  strokeWeight(1);
//  stroke(#EFEFEF, 150 );

for( float yy = centerY-180; yy < centerY+185; yy+=1.5 ) {
  
  ranPalStroke100(p3);
  
  line( 0, yy, width, yy );
}  

//  tint(#EFEFEF, 50 );
//  image(img,0,0);


      iHeartCO();
      
//  stamp version number
/*
textFont( createFont( "American Typewriter", 36 ) );
fill(#EFEFEF);
text( pdeName(), centerX, centerY+180 );
*/
      exit();
  }
}

///////////////////////////////////
//  draw i HEART CO
//  and board frame
void iHeartCO() {

  float angle = 0;
  float x, y;
  float w = 210;
  float startX = 210; 
  float startY = 345;


  smooth();
  fill(0);
  stroke(0);
  strokeWeight( 1 );  // 5

////////////////////////////////////////////////////////////////
//  draw board frame
////////////////////////////////////////////////////////////////

if( drawBoard ) {

  while ( angle < 360 ) {

    x = startX - int( cos(radians(angle)) * w );
    y = startY - int( sin(radians(angle)) * w );

    smooth();

    if( angle == 90 ) {      
      line( 0,y-3, width, y-3 );
    }  
    
    if( angle >= 90 && angle < 270 ) {
      
      x+=1020;

    } else if( angle == 270 ) {
      line( 0,y-3, width, y-3 );
    }


    angle+= .5;
    
  }

}

////////////////////////////////////////////////////////////////
//  / BOARD FRAME
////////////////////////////////////////////////////////////////

  //  Team Fickes
  textFont( createFont( "AnonymousPro-Bold", 17 ) );//
  fill( #271200, 101 );
  text( "TEAM FICKES", centerX+75, (centerY-22) );

  //  I <3 CO
  textFont( createFont( "American Typewriter", 500 ) );  
  fill(0);

//  - 476
  bitHeart( 360, (centerY-160), false );
  text("I", 150, (centerY+170) );
  text("CO", 710, (centerY+170) );
}

/////////////////////////////////////////////////////////////////
//  spit out an 8bit heart
void bitHeart( float x, float y, boolean grid ) {

  int blockSize = 25;
  float htSize = 250;
  strokeWeight(.5);

  //  GRID
  if (grid) {
    stroke(#EFEFEF);//, 50);

    for ( int xx = 0 ; xx <= 13; xx++ ) {

      line( x+(blockSize*xx), 0, x+(blockSize*xx), height );
      line( 0, y+(blockSize*xx), width, y+(blockSize*xx) );
    }
  }
  //  GRID



  //  HEART
  stroke(#333333);

  //  white blocks
  fill(255);
  rect( x+(blockSize*2), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize), y+(blockSize*2), blockSize, blockSize );

  fill(0);
  // TODO: make this smarter
  rect( x+(blockSize*2), y, blockSize, blockSize );
  rect( x+(blockSize*3), y, blockSize, blockSize );
  rect( x+(blockSize*4), y, blockSize, blockSize );

  rect( x+(blockSize*8), y, blockSize, blockSize );
  rect( x+(blockSize*9), y, blockSize, blockSize );
  rect( x+(blockSize*10), y, blockSize, blockSize );

  rect( x+(blockSize), y+blockSize, blockSize, blockSize );

  fill(#EF0000);
  rect( x+(blockSize*3), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize*4), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize*2), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*11), y+(blockSize*2), blockSize, blockSize );

  rect( x+(blockSize), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*2), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*11), y+(blockSize*3), blockSize, blockSize );

  rect( x+(blockSize), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*2), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*11), y+(blockSize*4), blockSize, blockSize );

  rect( x+(blockSize*2), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*5), blockSize, blockSize );

  rect( x+(blockSize*2), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*6), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*6), blockSize, blockSize );

  rect( x+(blockSize*3), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*7), blockSize, blockSize );

  rect( x+(blockSize*4), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*8), blockSize, blockSize );

  rect( x+(blockSize*5), y+(blockSize*9), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*9), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*9), blockSize, blockSize );

  rect( x+(blockSize*6), y+(blockSize*10), blockSize, blockSize );

  fill(0);




  rect( x+(blockSize*5), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*2), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize), blockSize, blockSize );


  fill(#EF0000);  
  rect( x+(blockSize*4), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize*8), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize*9), y+blockSize, blockSize, blockSize );
  rect( x+(blockSize*10), y+blockSize, blockSize, blockSize );
  rect( x+blockSize, y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*2), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*9), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*10), blockSize, blockSize );  
  rect( x+(blockSize*6), y+(blockSize*11), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*10), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*9), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*11), y+(blockSize*5), blockSize, blockSize );

  fill(0);
  rect( x+(blockSize*11), y+blockSize, blockSize, blockSize );
  rect( x, y+(blockSize*2), blockSize, blockSize );
  rect( x, y+(blockSize*3), blockSize, blockSize );
  rect( x, y+(blockSize*4), blockSize, blockSize );
  rect( x, y+(blockSize*5), blockSize, blockSize );
  rect( x+blockSize, y+(blockSize*6), blockSize, blockSize );
  rect( x+blockSize, y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*2), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*3), y+(blockSize*9), blockSize, blockSize );
  rect( x+(blockSize*4), y+(blockSize*10), blockSize, blockSize );
  rect( x+(blockSize*5), y+(blockSize*11), blockSize, blockSize );
  rect( x+(blockSize*6), y+(blockSize*12), blockSize, blockSize );
  rect( x+(blockSize*7), y+(blockSize*11), blockSize, blockSize );
  rect( x+(blockSize*8), y+(blockSize*10), blockSize, blockSize );
  rect( x+(blockSize*9), y+(blockSize*9), blockSize, blockSize );
  rect( x+(blockSize*10), y+(blockSize*8), blockSize, blockSize );
  rect( x+(blockSize*11), y+(blockSize*7), blockSize, blockSize );
  rect( x+(blockSize*11), y+(blockSize*6), blockSize, blockSize );

  rect( x+(blockSize*12), y+(blockSize*5), blockSize, blockSize );
  rect( x+(blockSize*12), y+(blockSize*4), blockSize, blockSize );
  rect( x+(blockSize*12), y+(blockSize*3), blockSize, blockSize );
  rect( x+(blockSize*12), y+(blockSize*2), blockSize, blockSize );
}




///////////////////////////////////////////////////////////
//  
//  End handler, saves png
void exit() 
{

//  artDaily("ARTDAILY "+ getEpoch() );

  //  if final, save output to png
  if ( isFinal )
  {
    save( pdeName() + "-" + getEpoch()+".png" );
  }

  System.gc();

  //  PDF
  if( isFinal ) {
    endRecord();
  }

  super.stop();
}

//////////////////////////
int f0 = 0;
int f1 = 1;
//int f2 = 1;

int nextFib( int f2)
{
  int result = f2;
  f0 = f1;
  f1 = f2;
  f2 = f0 + f1;
  return result;
}

//////////////////////////
//  Calculate max loop count
float getMax( float shapeSize ) {
  return ( ( width * height ) / shapeSize );
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  pull colors out of image and return color[]
//  http://forum.processing.org/topic/extract-colors-from-images
ArrayList getImgColors( PImage img ) 
{
  ArrayList alColors = new ArrayList();
  
  img.loadPixels();
  
  int color1, color2;
  // TODO: what's a good way to pull DISTINCT colors with a color[]?
  for( int c = 0; c < img.pixels.length; c++ ) 
  {
      if( alColors.size() == 0 ) { 
        alColors.add( (color)img.pixels[ c ] );
      } else 
      {
         
        if( ! alColors.contains( (color)img.pixels[ c ] ) ) 
        {
          color1 = (Integer) alColors.get( alColors.size()-1 );
          color2 = img.pixels[c];
          // filter out colors    
          if( color2 > color1 )
          {
        
            alColors.add( (color)img.pixels[ c ] );
        
          }
        }
      }

  }
  
  return alColors;

}



///////////////////////////////////////////////////////
//  Make grid of shapes filled with each color in supplied
//  color[]
void paletteGrid( ArrayList pall ) {
    
  float xx = 0;
  float yy = 0;  
  float sz = 30;

// debug
//text( pall.size() + " colors ", sz, sz );
  color tmp;
  for( int cc = 0; cc < pall.size(); cc++ ) {
    
    noStroke();
    tmp = (Integer)pall.get(cc);
    fill( tmp, alf*4 );
    rect( xx, yy, sz, sz );
    
    if( xx < width ) {
      xx += (sz *1.25);
    } else {
      xx = 0;
      yy += (sz *1.25);
    }
  }
  



    textFont( createFont( "HiraMaruProN-W4", 222 ) );
    fill(random(alf));
    text( pall.size(), random( alf, width/3 ), random(height) );
  
}







//////////////////////////////////////////////////////////////////////////
//  Draw manual circle
//  ellipse(x, y, width, height)



void circle( float startX, float startY, float w, float h ) {

  float angle = 0;
  float x, y;

  while ( angle < 360 ) {

    // make circle draw faster by skipping angles
    if ( angle % 10 == 0 ) {

      x = startX - int( cos(radians(angle)) * w );
      y = startY - int( sin(radians(angle)) * w );

      smooth();
      ellipse( x, y, w, h );
    }
    angle++;
  }
}

///////////////////////////////////////////////////////////////////////////
//  draw a circle of circles
void circle( float startX, float startY, float w, float h, float modAngle ) {

  float angle = 0;
  float x, y;

  while ( angle < 360 ) {

    // make circle draw faster by skipping angles
    if ( angle % modAngle == 0 ) {

      x = startX - int( cos(radians(angle)) * w );
      y = startY - int( sin(radians(angle)) * w );

      smooth();
      ellipse( x, y, w, h );
    }
    angle++;
  }
}

//////////////////////////////////////////////////////////////////////////
//  HEXAGON inspired by http://www.rdwarf.com/lerickson/hex/index.html
void hexagon( float startX, float startY, float shapeSize ) {

  line( startX, startY+(shapeSize*.5), startX+(shapeSize*.25), startY );
  line( startX+(shapeSize*.25), startY, startX+(shapeSize*.75), startY );
  line( startX+(shapeSize*.75), startY, startX+(shapeSize), startY+(shapeSize*.5) );

  line( startX+(shapeSize), startY+(shapeSize*.5), startX+(shapeSize*.75), startY+shapeSize );
  line( startX+(shapeSize*.75), startY+shapeSize, startX+(shapeSize*.25), startY+shapeSize );
  line( startX+(shapeSize*.25), startY+shapeSize, startX, startY+(shapeSize*.5) );
}

////////////////////////////////////////////////////
//  Return a random color from supplied palette
color getRanColor(ArrayList palette)
{
  return (Integer)palette.get( (int)random( palette.size()-1 ) );
}


////////////////////////////////////////////////////
//  Randomly stroke using image from color list
void ranPalStroke(color[] palette)
{
  // pallete
  stroke( palette[ int(random( palette.length-1 )) ], alf );
}
void ranPalStroke(ArrayList palette)
{
  // pallete
  stroke( (Integer)palette.get( (int)random( palette.size()-1 ) ), alf );
}
void ranPalStroke100(color[] palette)
{
  // pallete
  stroke( palette[ int(random( palette.length-1 )) ], 100 );
}
void ranPalStroke100(ArrayList palette)
{
  // pallete
  stroke( (Integer)palette.get( (int)random( palette.size()-1 ) ), 100 );
}
void ranPalFill(color[] palette)
{
  fill( palette[ int(random( palette.length-1 )) ], alf );
}
void ranPalFill(ArrayList palette)
{
  // pallete
  fill( (Integer)palette.get( (int)random( palette.size()-1 ) ), alf );
}
void ranPalFill100(color[] palette)
{
  // pallete
  fill( palette[ int(random( palette.length-1 )) ], 100 );
}
void ranPalFill100(ArrayList palette)
{
  // pallete
  fill( (Integer)palette.get( (int)random( palette.size()-1 ) ), 100 );
}

///////////////////////////////////////////////////////////
//  Helper to random(255) stroke
void randFill() {  
  fill( random(255), random(255), random(255), alf );
}
void randStroke() {  
  stroke( random(255), random(255), random(255), alf );
}
void randStroke100() {  
  stroke( random(255), random(255), random(255), 100 );
}

///////////////////////////////////////////////////////////
//  get EPOCH timestamp
long getEpoch() {
  return new Date().getTime()/1000;
}

String getTimestamp() {
  return new Date().toString();
}


/////////////
//  TODO: Is there a better way to get the current sketch name?
String pdeName() {
  return split( this.toString(), "[")[0];
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  textFont( createFont( "AndaleMono", 18 ) );
  smooth();

  fill(#690000);
  text( " "+dailyMsg, this.width-230, this.height-14);
  /*
float y = 0;
   while( y <= height ) {
   
   fill(#EFEFEF, y*.15);
   text( " "+dailyMsg, 5, y);
   y += 18; 
   }
   */
}


