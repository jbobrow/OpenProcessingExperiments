
//Timing example.
//
//Use millis() to drawLissajous every 5 seconds
//number of milliseconds (thousandths of a second) since starting an applet
//


FixLib fix = new FixLib();
Boolean isFinal = false;


float alf = 75, tX, tY, szW, szH, cX, cY, inc, m; 
float r,g,b, maxCt;

int tmr_Interval = 10;  // seconds

float x, y, angle, sz;
float x2, y2, angle2, sz2; 
float x3, y3, angle3, sz3; 
float x4, y4, angle4, sz4; 

//////////////////////////////////////////////
void setup() { 
  background(#110000);
  size(1024,768);  //  big:  1024x768

  noFill();
  cX = width/2;
  cY = height/2;
  sz = 11;
  sz2 = 37;
  sz3 = 75;
  sz4 = 185;
  maxCt = (width*2);
} 
//////////////////////////////////////////////
void draw() {
  
  
  
  
  smooth();

  x = cX - int( cos(radians(angle)) * sz );  // * noise(frameCount);
  y = cY - int( sin(radians(angle)) * sz );  // * noise(frameCount);
  x2 = cX - int( cos(radians(angle2)) * sz2 );  // * noise(frameCount);
  y2 = cY - int( sin(radians(angle2)) * sz2 );  // * noise(frameCount);
  x3 = cX - int( cos(radians(angle3)) * sz3 );  // * noise(frameCount);
  y3 = cY - int( sin(radians(angle3)) * sz3 );  // * noise(frameCount);
  x4 = cX - int( cos(radians(angle4)) * sz4 );  // * noise(frameCount);
  y4 = cY - int( sin(radians(angle4)) * sz4 );  // * noise(frameCount);


m = random(height);
strokeWeight(.37);
stroke(frameCount%75);
ellipse( cX, cY, m, m );


  strokeWeight(random(TWO_PI));
  stroke(0);
//  stroke(random(255), random(alf),random(alf),alf);
  point( x, y );
  point( x2, y2 );
  point( x3, y3 );
  point( x4, y4 );



  strokeWeight(.75);
  r = random(255);
  g = random(37);
  b = random(37);
  stroke(r,g,b,alf);
  bezier(x, y, x2, y2, x3, y3, x4, y4 );
  bezier(x2, y2, x3, y3, x4, y4, x, y );
  stroke(r,g,b,alf);
  bezier(x3, y3, x4, y4, x, y, x2, y2 );
  bezier(x4, y4, x, y, x2, y2, x3, y3 );


//  strokeWeight(.75);
//  stroke(frameCount%2==0?255:#EFEFEF, alf);
//  line( x, y, x2, y2 );
//  line( x3, y3, x4, y4 );

//  strokeWeight(2);
//  stroke(frameCount%2==0?0:#220000, alf);
//  bezier(x, y, x2, y2, x3, y3, x4, y4 );
//  bezier(x2, y2, x3, y3, x4, y4, x, y );
//  bezier(x3, y3, x4, y4, x, y, x2, y2 );
//  bezier(x4, y4, x, y, x2, y2, x3, y3 );
//
//
//  strokeWeight(.37);
//  stroke(frameCount%2==0?0:#EF1234, alf);
//  bezier(x, y, x2, y2, x3, y3, x4, y4 );
//  bezier(x2, y2, x3, y3, x4, y4, x, y );
//  bezier(x3, y3, x4, y4, x, y, x2, y2 );
//  bezier(x4, y4, x, y, x2, y2, x3, y3 );



    strokeWeight(TWO_PI*noise(y));
//    stroke(37,37,random(255));
    stroke(frameCount%255);
    point(x,y);
    r = random(255);
    g = random(75);
    b = random(75);
    stroke(r,g,b );
    point(x2, y2);
    point(x3, y3);
    point(x4, y4);

// HACK: save on checking every single frame
//if( frameCount % tmr_Interval == 0 ) {
//  LOFI timer.
// TODO: Is millis() function causing the sketch pausing?
    if( millis()/1000 % tmr_Interval == 0 ) {
      strokeWeight(noise(frameCount));
      r = random(255);
      g = random(255);
      b = random(11);
      stroke(r,g,b);
//      m = random(angle2,angle3);
      fix.circle(r, g, b, m);
}
//println( millis() + " : " + millis()/1000 + " : " + tmr_Interval);
//}
//  END LOFI TIMER //


  angle += 10;
  angle2 += 15;
  angle3 += 20;
  angle4 -= 5;

  if ( angle2 % 360 == 0 ) {
    inc += TWO_PI;//cos(frameCount)*cos(frameCount)+PI;
    sz += inc;
    sz2 += inc;
    sz3 += inc;
    sz4 += inc;
      
    //  safe it
    if( sz > height || sz4 > height ) {
      sz = alf;
      sz2 = sz+5; 
      sz3 = sz+10;
      sz4 = sz+15;
    }
    

  }

  if ( frameCount > maxCt ) {
    exit();
  }


/*
/////////////////////////////
//  FRAME COUNTDOWN
if(frameCount<maxCt){
stroke(255);
strokeWeight(2);
fill(0);
stroke(255);
fill(0);
rect( width-200, 0, 200, 20 );
fill(255,360);
text( maxCt - frameCount, width-200, 15 );
} else {
  fill(#EF2012);
  rect( width-200, 0, 200, 20 );
}
noFill();
/////////////////////////////

*/

}


///////////////////////////////////////////////////////////
//  End handler, saves png
void exit() 
{

  artDaily( fix.pdeName() );

  //  if final, save output to png
  if ( isFinal )
  {
    save( fix.pdeName() + "-" + fix.getEpoch()+".png" );
  }

  System.gc();

  super.stop();
}

///////////////////////////////////////////////////////////
//
//  Spit out ART DAILY message
void artDaily( String dailyMsg ) {

  textFont( createFont( "AppleGaramond", 37 ) );  //  "TrajanPro-Bold"
  smooth();

  fill(#EF2012);
  text( " "+dailyMsg, -1, height-2);

  fill(#efefef);
  text( " "+dailyMsg, 0, height-3);
}

/*
FixLib is your new utility library.  House all your helper code here,
 and keep the main sketch.pde as light as possible ( setup, draw, exit, artDaily )
 */
class FixLib {

  public int alf;
  
  FixLib() {
  }


  ////////////////////////////////////////////////////////////
  //  Call this to make your sketch window resizable ( * desktop Processing only )
  void makeResizable() {
    if (frame != null) {
      frame.setResizable(true);
    }
  }

  ////////////////////////////////////////////////////////////
  //  
  //  Draw an organic ellipse growing outwards like the trunk of a tree
  void trunk(float x, float y ) {
    ellipse( x, y, frameCount, frameCount );
  }


  //////////////////////////////////////////////////////
  //  Draw grid of circles that grow as the page builds
  public void circleGrid( int gWidth, int gHeight ) 
  {
    float x = 0, y=0;
    float inc = PI*TWO_PI;  //  INCREMENTOR
    float sz = inc;

    // circle grid
    for ( int a = 0; a < (gWidth*gHeight)/2; a+= inc ) {
      smooth();

      ellipse( x, y, sz, sz );

      if ( x < gWidth ) {
        x += sz;
      } 
      else {
        x = 0;
        y += sz;
        sz += inc;
      }
    }
  }

  //////////////////////////////////////////////////////
  //  
  public void drawLissajous( float a, float b, float amp )
  {
    //  float amp = 33;
    float x, y;
    float sz = amp / PI;  //TWO_PI;

    for ( float t = 0; t <= 360; t += 1)
    {
      x = a - amp * sin(a * t * PI/180);
      y = b - amp * sin(b * t * PI/180);
      noFill();
      ellipse(x, y, sz, sz);
    }
  }



  //////////////////////////////////////////////////////
  //  Pass in a color, and this will fill even frames with 255,
  //  odd frames with clr
  public void evenOddFill( color clr ) {
    if ( frameCount % 2 == 0 ) {
      fill(255);
    } 
    else {
      fill( clr );
    }
  }
  //////////////////////////////////////////////////////
  //  Pass in a color, and this will fill even frames with 255,
  //  odd frames with clr
  //  * INVERTED for evenOddFill() pleasure
  public void evenOddStroke( color clr, float alf ) {

    if ( frameCount % 2 == 0 ) {
      stroke(clr, alf);
    } 
    else {
      stroke(0, alf);
    }
  }



  /////////////////////////////////////////////////////////////////
  //  spit out an 8bit heart
  public void bitHeart( float x, float y, boolean grid ) {

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
  //  draw a star
  public void star(int n, float cx, float cy, float w, float h, float startAngle, float proportion)
  {
    if (n > 2)
    {
      float angle = TWO_PI/ (2 *n);  // twice as many sides
      float dw; // draw width
      float dh; // draw height

      w = w / 2.0;
      h = h / 2.0;

      beginShape();
      for (int i = 0; i < 2 * n; i++)
      {
        dw = w;
        dh = h;
        if (i % 2 == 1) // for odd vertices, use short radius
        {
          dw = w * proportion;
          dh = h * proportion;
        }
        vertex(cx + dw * cos(startAngle + angle * i), 
        cy + dh * sin(startAngle + angle * i));
      }
      endShape(CLOSE);
    }
  }





  //////////////////////////
  int f0 = 0;
  int f1 = 1;
  //int f2 = 1;

  public int nextFib( int f2)
  {
    int result = f2;
    f0 = f1;
    f1 = f2;
    f2 = f0 + f1;
    return result;
  }

  //////////////////////////
  //  Calculate max loop count
  public float getMax( float shapeSize ) {
    return ( ( width * height ) / shapeSize );
  }


  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //  pull colors out of image and return color[]
  //  http://forum.processing.org/topic/extract-colors-from-images
  //  * UPDATE : GToLT = BOOLEAN controlling the color comparison before 
  //  adding to the ArrayList.
  public ArrayList getImgColors( PImage img, Boolean GToLT ) 
  {
    ArrayList alColors = new ArrayList();

    img.loadPixels();

    int color1, color2;
    // TODO: what's a good way to pull DISTINCT colors with a color[]?
    for ( int c = 0; c < img.pixels.length; c++ ) 
    {
      if ( alColors.size() == 0 ) { 
        alColors.add( (color)img.pixels[ c ] );
      } 
      else 
      {

        if ( ! alColors.contains( (color)img.pixels[ c ] ) ) 
        {
          color1 = (Integer) alColors.get( alColors.size()-1 );
          color2 = img.pixels[c];

          if ( GToLT ) {
            if ( color1 > color2 )
              alColors.add( (color)img.pixels[ c ] );
          } 
          else {
            if ( color1 < color2 )
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
    public void paletteGrid( ArrayList pall ) {

      float xx = 0;
      float yy = 0;  
      float sz = 30;

      // debug
      //text( pall.size() + " colors ", sz, sz );
      color tmp;
      for ( int cc = 0; cc < pall.size(); cc++ ) {

        noStroke();
        tmp = (Integer)pall.get(cc);
        fill( tmp, alf*4 );
        rect( xx, yy, sz, sz );

        if ( xx < width ) {
          xx += (sz *1.25);
        } 
        else {
          xx = 0;
          yy += (sz *1.25);
        }
      }




      textFont( createFont( "HiraMaruProN-W4", 222 ) );
      fill(random(alf));
      text( pall.size(), random( alf, width/3 ), random(height) );
    }




    ///////////////////////////////////////////////////////
    //  Make grid of shapes filled with each color in supplied
    //  color[], fills entire screen
    public void paletteGridFull( ArrayList pall ) {

      float xx = 0;
      float yy = 0;  
      float sz = 30;
      float startX;  //  the X where the previous loop left off
      float startY;  //  the Y where the previous loop left off
      color tmp;
      int clridx = 0;  // use this index to walk through the supllied ArrayList of colors

      for ( int gg = 0; gg < (height+width)/2; gg++ ) {


        noStroke();
        tmp = (Integer)pall.get(clridx);
        fill( tmp, alf*3 );

        rect( xx, yy, sz, sz );

        if ( xx < width ) {
          xx += (sz *1.25);
        } 
        else {
          xx = 0;
          yy += (sz *1.25);
        }

        //  make sure the color index doesn't get larger than the array
        if ( clridx == pall.size()-1 )
          clridx = 0;
        else
          clridx++;
      }
    }




    //////////////////////////////////////////////////////////////////////////
    //  Draw manual circle
    //  ellipse(x, y, width, height)
    public void circle( float startX, float startY, float w, float h ) {

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
    public void circle( float startX, float startY, float w, float h, float modAngle ) {

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
    public void hexagon( float startX, float startY, float shapeSize ) {

      line( startX, startY+(shapeSize*.5), startX+(shapeSize*.25), startY );
      line( startX+(shapeSize*.25), startY, startX+(shapeSize*.75), startY );
      line( startX+(shapeSize*.75), startY, startX+(shapeSize), startY+(shapeSize*.5) );

      line( startX+(shapeSize), startY+(shapeSize*.5), startX+(shapeSize*.75), startY+shapeSize );
      line( startX+(shapeSize*.75), startY+shapeSize, startX+(shapeSize*.25), startY+shapeSize );
      line( startX+(shapeSize*.25), startY+shapeSize, startX, startY+(shapeSize*.5) );
    }

    ////////////////////////////////////////////////////
    //  Return a random color from supplied palette
    public color getRanColor(ArrayList palette)
    {
      return (Integer)palette.get( (int)random( palette.size()-1 ) );
    }


    ////////////////////////////////////////////////////
    //  Randomly stroke using image from color list
    public void ranPalStroke(color[] palette)
    {
      // pallete
      stroke( palette[ int(random( palette.length-1 )) ], alf );
    }
    public void ranPalStroke(ArrayList palette)
    {
      // pallete
      stroke( (Integer)palette.get( (int)random( palette.size()-1 ) ), alf );
    }
    public void ranPalStroke100(color[] palette)
    {
      // pallete
      stroke( palette[ int(random( palette.length-1 )) ], 100 );
    }
    public void ranPalStroke100(ArrayList palette)
    {
      // pallete
      stroke( (Integer)palette.get( (int)random( palette.size()-1 ) ), 100 );
    }
    public void ranPalFill(color[] palette)
    {
      fill( palette[ int(random( palette.length-1 )) ], alf );
    }
    public void ranPalFill(ArrayList palette)
    {
      // pallete
      fill( (Integer)palette.get( (int)random( palette.size()-1 ) ), alf );
    }
    public void ranPalFill100(color[] palette)
    {
      // pallete
      fill( palette[ int(random( palette.length-1 )) ], 100 );
    }
    public void ranPalFill100(ArrayList palette)
    {
      // pallete
      fill( (Integer)palette.get( (int)random( palette.size()-1 ) ), 100 );
    }

    ///////////////////////////////////////////////////////////
    //  Helper to random(255) stroke
    public void randFill() {  
      fill( random(255), random(255), random(255), alf );
    }
    public void randFill100() {  
      fill( random(255), random(255), random(255), 100 );
    }
    public void randStroke() {  
      stroke( random(255), random(255), random(255), alf );
    }
    public void randStroke100() {  
      stroke( random(255), random(255), random(255), 100 );
    }

    ///////////////////////////////////////////////////////////
    //  get EPOCH timestamp
    public long getEpoch() {
      return new Date().getTime()/1000;
    }

    public String getTimestamp() {
      //  Calendar now = Calendar.getInstance();
      //  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM", now);


      return new Date().toString();
    }


    //////////////////////////////////////////////////////
    //  Returns the file name that is calling this function ( minus the .pde )
    public String pdeName() {
      return split( this.toString(), "$")[0];
    }
  }


/*
FixLib is your new utility library.  House all your helper code here,
 and keep the main sketch.pde as light as possible ( setup, draw, exit, artDaily )
 */
class FixLib {

  public int alf;
  
  FixLib() {
  }


  ////////////////////////////////////////////////////////////
  //  Call this to make your sketch window resizable ( * desktop Processing only )
  void makeResizable() {
    if (frame != null) {
      frame.setResizable(true);
    }
  }

  ////////////////////////////////////////////////////////////
  //  
  //  Draw an organic ellipse growing outwards like the trunk of a tree
  void trunk(float x, float y ) {
    ellipse( x, y, frameCount, frameCount );
  }


  //////////////////////////////////////////////////////
  //  Draw grid of circles that grow as the page builds
  public void circleGrid( int gWidth, int gHeight ) 
  {
    float x = 0, y=0;
    float inc = PI*TWO_PI;  //  INCREMENTOR
    float sz = inc;

    // circle grid
    for ( int a = 0; a < (gWidth*gHeight)/2; a+= inc ) {
      smooth();

      ellipse( x, y, sz, sz );

      if ( x < gWidth ) {
        x += sz;
      } 
      else {
        x = 0;
        y += sz;
        sz += inc;
      }
    }
  }

  //////////////////////////////////////////////////////
  //  
  public void drawLissajous( float a, float b, float amp )
  {
    //  float amp = 33;
    float x, y;
    float sz = amp / PI;  //TWO_PI;

    for ( float t = 0; t <= 360; t += 1)
    {
      x = a - amp * sin(a * t * PI/180);
      y = b - amp * sin(b * t * PI/180);
      noFill();
      ellipse(x, y, sz, sz);
    }
  }



  //////////////////////////////////////////////////////
  //  Pass in a color, and this will fill even frames with 255,
  //  odd frames with clr
  public void evenOddFill( color clr ) {
    if ( frameCount % 2 == 0 ) {
      fill(255);
    } 
    else {
      fill( clr );
    }
  }
  //////////////////////////////////////////////////////
  //  Pass in a color, and this will fill even frames with 255,
  //  odd frames with clr
  //  * INVERTED for evenOddFill() pleasure
  public void evenOddStroke( color clr, float alf ) {

    if ( frameCount % 2 == 0 ) {
      stroke(clr, alf);
    } 
    else {
      stroke(0, alf);
    }
  }



  /////////////////////////////////////////////////////////////////
  //  spit out an 8bit heart
  public void bitHeart( float x, float y, boolean grid ) {

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
  //  draw a star
  public void star(int n, float cx, float cy, float w, float h, float startAngle, float proportion)
  {
    if (n > 2)
    {
      float angle = TWO_PI/ (2 *n);  // twice as many sides
      float dw; // draw width
      float dh; // draw height

      w = w / 2.0;
      h = h / 2.0;

      beginShape();
      for (int i = 0; i < 2 * n; i++)
      {
        dw = w;
        dh = h;
        if (i % 2 == 1) // for odd vertices, use short radius
        {
          dw = w * proportion;
          dh = h * proportion;
        }
        vertex(cx + dw * cos(startAngle + angle * i), 
        cy + dh * sin(startAngle + angle * i));
      }
      endShape(CLOSE);
    }
  }





  //////////////////////////
  int f0 = 0;
  int f1 = 1;
  //int f2 = 1;

  public int nextFib( int f2)
  {
    int result = f2;
    f0 = f1;
    f1 = f2;
    f2 = f0 + f1;
    return result;
  }

  //////////////////////////
  //  Calculate max loop count
  public float getMax( float shapeSize ) {
    return ( ( width * height ) / shapeSize );
  }


  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //  pull colors out of image and return color[]
  //  http://forum.processing.org/topic/extract-colors-from-images
  //  * UPDATE : GToLT = BOOLEAN controlling the color comparison before 
  //  adding to the ArrayList.
  public ArrayList getImgColors( PImage img, Boolean GToLT ) 
  {
    ArrayList alColors = new ArrayList();

    img.loadPixels();

    int color1, color2;
    // TODO: what's a good way to pull DISTINCT colors with a color[]?
    for ( int c = 0; c < img.pixels.length; c++ ) 
    {
      if ( alColors.size() == 0 ) { 
        alColors.add( (color)img.pixels[ c ] );
      } 
      else 
      {

        if ( ! alColors.contains( (color)img.pixels[ c ] ) ) 
        {
          color1 = (Integer) alColors.get( alColors.size()-1 );
          color2 = img.pixels[c];

          if ( GToLT ) {
            if ( color1 > color2 )
              alColors.add( (color)img.pixels[ c ] );
          } 
          else {
            if ( color1 < color2 )
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
    public void paletteGrid( ArrayList pall ) {

      float xx = 0;
      float yy = 0;  
      float sz = 30;

      // debug
      //text( pall.size() + " colors ", sz, sz );
      color tmp;
      for ( int cc = 0; cc < pall.size(); cc++ ) {

        noStroke();
        tmp = (Integer)pall.get(cc);
        fill( tmp, alf*4 );
        rect( xx, yy, sz, sz );

        if ( xx < width ) {
          xx += (sz *1.25);
        } 
        else {
          xx = 0;
          yy += (sz *1.25);
        }
      }




      textFont( createFont( "HiraMaruProN-W4", 222 ) );
      fill(random(alf));
      text( pall.size(), random( alf, width/3 ), random(height) );
    }




    ///////////////////////////////////////////////////////
    //  Make grid of shapes filled with each color in supplied
    //  color[], fills entire screen
    public void paletteGridFull( ArrayList pall ) {

      float xx = 0;
      float yy = 0;  
      float sz = 30;
      float startX;  //  the X where the previous loop left off
      float startY;  //  the Y where the previous loop left off
      color tmp;
      int clridx = 0;  // use this index to walk through the supllied ArrayList of colors

      for ( int gg = 0; gg < (height+width)/2; gg++ ) {


        noStroke();
        tmp = (Integer)pall.get(clridx);
        fill( tmp, alf*3 );

        rect( xx, yy, sz, sz );

        if ( xx < width ) {
          xx += (sz *1.25);
        } 
        else {
          xx = 0;
          yy += (sz *1.25);
        }

        //  make sure the color index doesn't get larger than the array
        if ( clridx == pall.size()-1 )
          clridx = 0;
        else
          clridx++;
      }
    }




    //////////////////////////////////////////////////////////////////////////
    //  Draw manual circle
    //  ellipse(x, y, width, height)
    public void circle( float startX, float startY, float w, float h ) {

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
    public void circle( float startX, float startY, float w, float h, float modAngle ) {

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
    public void hexagon( float startX, float startY, float shapeSize ) {

      line( startX, startY+(shapeSize*.5), startX+(shapeSize*.25), startY );
      line( startX+(shapeSize*.25), startY, startX+(shapeSize*.75), startY );
      line( startX+(shapeSize*.75), startY, startX+(shapeSize), startY+(shapeSize*.5) );

      line( startX+(shapeSize), startY+(shapeSize*.5), startX+(shapeSize*.75), startY+shapeSize );
      line( startX+(shapeSize*.75), startY+shapeSize, startX+(shapeSize*.25), startY+shapeSize );
      line( startX+(shapeSize*.25), startY+shapeSize, startX, startY+(shapeSize*.5) );
    }

    ////////////////////////////////////////////////////
    //  Return a random color from supplied palette
    public color getRanColor(ArrayList palette)
    {
      return (Integer)palette.get( (int)random( palette.size()-1 ) );
    }


    ////////////////////////////////////////////////////
    //  Randomly stroke using image from color list
    public void ranPalStroke(color[] palette)
    {
      // pallete
      stroke( palette[ int(random( palette.length-1 )) ], alf );
    }
    public void ranPalStroke(ArrayList palette)
    {
      // pallete
      stroke( (Integer)palette.get( (int)random( palette.size()-1 ) ), alf );
    }
    public void ranPalStroke100(color[] palette)
    {
      // pallete
      stroke( palette[ int(random( palette.length-1 )) ], 100 );
    }
    public void ranPalStroke100(ArrayList palette)
    {
      // pallete
      stroke( (Integer)palette.get( (int)random( palette.size()-1 ) ), 100 );
    }
    public void ranPalFill(color[] palette)
    {
      fill( palette[ int(random( palette.length-1 )) ], alf );
    }
    public void ranPalFill(ArrayList palette)
    {
      // pallete
      fill( (Integer)palette.get( (int)random( palette.size()-1 ) ), alf );
    }
    public void ranPalFill100(color[] palette)
    {
      // pallete
      fill( palette[ int(random( palette.length-1 )) ], 100 );
    }
    public void ranPalFill100(ArrayList palette)
    {
      // pallete
      fill( (Integer)palette.get( (int)random( palette.size()-1 ) ), 100 );
    }

    ///////////////////////////////////////////////////////////
    //  Helper to random(255) stroke
    public void randFill() {  
      fill( random(255), random(255), random(255), alf );
    }
    public void randFill100() {  
      fill( random(255), random(255), random(255), 100 );
    }
    public void randStroke() {  
      stroke( random(255), random(255), random(255), alf );
    }
    public void randStroke100() {  
      stroke( random(255), random(255), random(255), 100 );
    }

    ///////////////////////////////////////////////////////////
    //  get EPOCH timestamp
    public long getEpoch() {
      return new Date().getTime()/1000;
    }

    public String getTimestamp() {
      //  Calendar now = Calendar.getInstance();
      //  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM", now);


      return new Date().toString();
    }


    //////////////////////////////////////////////////////
    //  Returns the file name that is calling this function ( minus the .pde )
    public String pdeName() {
      return split( this.toString(), "$")[0];
    }
  }



