
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PImage gNumber;

int gField[][];
int gPrevField[][];
Block gBlock[][];


PImage gBg;
Minim minim;
AudioSample se;
AudioSample se_high;
AudioPlayer bgm;
int delayFrame = 70;

int cBlockSizeX = (int)17*1;
int cBlockSizeY = (int)25*1;
int cBlockH = 7;
int cBlockNumY = 7;
int cBlockNumX = 5;
int cBlockW = cBlockNumX*7;
int cSpace = 1;
int cWidth = 629;
int cHeight = 181;



  float getIdxPosX( int _idxX )
  {
    return _idxX * cBlockSizeX + _idxX * cSpace;
  }

  float getIdxPosY( int _idxY )
  {
    return _idxY * cBlockSizeY + _idxY * cSpace;
  }

class Block
{
  int idxX;
  int idxY;
  float x = 0;
  float y = 0;
  float tx;
  float ty;
  color c;

  void setIdx( int _idxX, int _idxY )
  {
    idxX = _idxX;
    idxY = _idxY;
    
    /*
    x = cWidth/2;
    y = cHeight/2;
    */
    /*    
    x = random(cWidth);
    y = - cHeight - random( 3000 );
    x = getIdxPosX( idxX );
    y = getIdxPosY( idxY );
    */
    x = cWidth/2;
    y = cHeight/2;
    
    tx = getIdxPosX( idxX );
    ty = getIdxPosY( idxY );
    colorMode( HSB );
    c = color( random( 255 ), 155, 205 );
    // c = 255/2;
  }

  void update()
  {
    float f = 5;
    x = x + (tx - x)/f;
    y = y + (ty - y)/f;
    if( dist( tx, ty, x, y ) < 0.5 )
    {
      x = tx;
      y = ty;
    }
  }

  void setTarget()
  {
    if( gField[idxY][idxX] == 1 )
    {
      // 
      targetByIdx( idxX, idxY );
    }
    else
    {
      // target( 0, 0 );
      // closest block
      serchCosestBlock( this );
    }
  }

  void serchCosestBlock( Block target )
  {
    Block ret = null;
    float minDistance = 100000.0f;

    for( int _y = 0; _y < cBlockH; ++_y )
    {
      for( int _x = 0; _x < cBlockW; ++_x )
      {
        if( gField[_y][_x] == 1 )
        {
          float d = dist( x, y, getIdxPosX( _x ), getIdxPosY( _y ) );

          if(   ( d < minDistance ) 
             || ( d == minDistance && random(2) < 1 ) )
          {
            target.targetByIdx( _x, _y );
            minDistance = d;
          }
        }
      }
    }

  }

  void targetByIdx( int _idxX, int _idxY )
  {
    target( getIdxPosX(_idxX), getIdxPosY(_idxY) );
  }

  void target( float _x, float _y )
  {
    tx = _x;
    ty = _y;
  }

  void draw()
  {
    noStroke();
    fill( c, 200 );
    rect( x, y, cBlockSizeX, cBlockSizeY );
    //ellipse( x, y, 13, 13 );
  }
}

void
setField(int x, int val)
{
  noStroke();
  for( int dy = 0; dy < cBlockNumY; ++dy )
  {
    for( int dx = 0; dx < cBlockNumX; ++dx )
    {
      if( gNumber.get( dx, dy + val * cBlockNumY ) != -1 )
      {
        gField[dy][x+dx] = 1;
      }
      else
      {
        gField[dy][x+dx] = 0;
      }
    }
  }
}

void
setup()
{
//  size( (int)getIdxPosX( cBlockNumX * 7 ) - 1, (int)getIdxPosY( cBlockNumY * 1 ) - 1 );
//  println( width + "," + height )
  size( cWidth, cHeight );
  gBg = loadImage("bg.jpg");
  smooth();
  minim = new Minim(this);
  se = minim.loadSample("tick.mp3");
  se_high = minim.loadSample("tick_high.mp3");
  bgm = minim.loadFile("tick_drum.mp3");
  
  gNumber = loadImage( "number.png" );  
  gField = new int[cBlockH][cBlockW];
  gPrevField = new int[cBlockH][cBlockW];
  gBlock = new Block[cBlockH][cBlockW];

  for( int y = 0; y < cBlockH; ++y )
  {
    for( int x = 0; x < cBlockW; ++x )
    {
      gBlock[y][x] = new Block();
      gBlock[y][x].setIdx( x, y );
    }
  }
  
}

void
invert()
{
  for( int y = 0; y < cBlockH; ++y )
  {
    for( int x = 0; x < cBlockW; ++x )
    {
      gField[y][x] = ( gField[y][x] == 0 ) ? 1 : 0; 
    }
  }

}

int gSec = -1;

void
draw()
{
  //background(255);
  background( gBg );
  
  if( delayFrame <= 0 && gSec != second() )
  {
    bgm.loop();
    /*
    if( second() % 30 == 0 )
    {
      se_high.trigger();
    }
    else
    */
    {
      se.trigger();
    }
    // println("tick" + second());
    int offsetX = 0;
    setField(offsetX, (hour()/10)%10 );
  
    offsetX += cBlockNumX;
    setField(offsetX, hour()%10 );
  
    offsetX += cBlockNumX;
    setField(offsetX, second()%2 == 0 ? 10 : 11 );
  
    offsetX += cBlockNumX;
    setField(offsetX, (minute()/10)%10 );
    offsetX += cBlockNumX;
    setField(offsetX, minute()%10 );
  
    offsetX += cBlockNumX;
    setField(offsetX, (second()/10)%10 );
    offsetX += cBlockNumX;
    setField(offsetX, second()%10 );
  
    
    if(  second() % 20  >= 10 )
    {
      invert();
    } 
    
    for( int y = 0; y < cBlockH; ++y )
    {
      for( int x = 0; x < cBlockW; ++x )
      {
        gBlock[y][x].setTarget();
      }
    }
    gSec = second();
  }

  noStroke();
  for( int y = 0; y < cBlockH; ++y )
  {
    for( int x = 0; x < cBlockW; ++x )
    {
      gBlock[y][x].update();
    }
  }

  for( int y = 0; y < cBlockH; ++y )
  {
    for( int x = 0; x < cBlockW; ++x )
    {
      gBlock[y][x].draw();
    }
  }
  --delayFrame;
  if( delayFrame == 0 )
  {
    gSec = second();
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  bgm.close();
  se_high.close();
  se.close();
  minim.stop();
  
  super.stop();
}



