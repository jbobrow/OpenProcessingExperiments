
import beads.*;
 
class Inc extends UGen
{
  boolean inCalc = false;
  
  int[] samples = new int[ 8192 ];
  int[] diffs   = new int[ 8192 ];
 
  float[] mysamp = new float[ 512 ];
   
  int nextSampleToRead  = 0;
  int nextSampleToWrite = 0;
  int sampleCount       = 0;
  
  float damp = 0.94;
   
  int y  = 0;
  int x1 = 0;
  int x2 = 0;
  int x3 = 0;
  int x4 = 0;
  int s1 = 0;
  int s2 = 0;
  int s3 = 0;
  int s4 = 0;
  int d = 17;
  int c = 0;
  float hi = 0.0;
   
  boolean mygenerate( )
  {       
    if ( sampleCount == mysamp.length )
      return false;
       
    {      
      for ( int j = 0; j < d; j++ )
      {        
        y += diffs[ ( x1 )  ] +
             diffs[ ( x2 )  ] +
             diffs[ ( x3 )  ] +
             diffs[ ( x4 )  ];         
         
      //  x1 = ( x1 + s1 ) & 0x1fff;
        x2 = ( x2 + s2 ) & 0x1fff;
        x3 = ( x3 + s3 ) & 0x1fff;
        x4 = ( x4 + s4 ) & 0x1fff;
   
      }
      
      y = ( int )( ( float )y * damp );
     
      if ( y * y > hi * hi )
        hi = y;
        
      mysamp[ nextSampleToWrite ] = y / 512.0;
      nextSampleToWrite = ( nextSampleToWrite + 1 ) & ( mysamp.length - 1 );
      sampleCount++;
      c++; 
    }
     
    if ( c == 6144 )
    {
      c = 0;
     // s1 = ( s1 + 3 ) % 5;
      s2 = ( s2 + 5 ) % 7;
      s3 = ( s3 + 3 ) % 4;
      s4 = ( s4 + 7 ) % 9;
      
      if ( hi < 0 )
        hi = -hi;
      
      int j = nextSampleToWrite - 1;
      if ( false )for ( int i = 0; i < 6144; i++ )
      {
        if ( j < 0 ) j += mysamp.length;
        mysamp[ j-- ] /= ( hi / 512.0 ); 
      }
      hi = 0.0;
      //y = 0;
    }
     
    return sampleCount <= mysamp.length;   
  }
  
  Inc( AudioContext ac )
  {
    super( ac, 1 );
    
    for ( int i = 0; i < 8192; i++ ) {
      samples[ i ] = ( int ) ( 1024.0 * Math.sin( 3.141592654 * ( ( float )i / 4096 ) ) );
    }
    for ( int i = 0; i < 8192; i++ ) {
      diffs[ i ] = samples[ ( i + 1 ) % 8192 ] - samples[ i ];
    }
  }
  
  void calculateBuffer( )
  {
    while ( sampleCount < bufOut[ 0 ].length )
      mygenerate( );
      
    if ( bufOut[ 0 ].length > mysamp.length - nextSampleToRead )
    {
      System.arraycopy( mysamp, nextSampleToRead, bufOut[ 0 ], 0, mysamp.length - nextSampleToRead );
      System.arraycopy( mysamp, 0,                bufOut[ 0 ], 0, bufOut[ 0 ].length - ( mysamp.length - nextSampleToRead ) );
    }
    else
    {
      System.arraycopy( mysamp, nextSampleToRead, bufOut[ 0 ], 0, bufOut[ 0 ].length );
    }
     
    sampleCount -= bufOut[ 0 ].length;
    nextSampleToRead = ( nextSampleToRead + bufOut[ 0 ].length ) & ( mysamp.length - 1 );
  }
}

Inc          anInc; 
AudioContext ac;
 
void setup() {
  ac = new AudioContext( 512 );
  anInc = new Inc( ac );
  //while( anInc.mygenerate( ) );
  ac.start();
  ac.out.addInput( anInc );
  size(512,200);
}
 
void draw()
{
  background(0);
  stroke(( anInc.s2 + 1 ) * 255/ 7.0, ( anInc.s3 + 1 ) * 255 / 4.0, ( anInc.s4 + 1 ) * 255 / 9.0 );
  strokeWeight( 6 );
  // draw the waveforms
  float offs =  anInc.mysamp[ ( 0 + anInc.nextSampleToRead ) & ( anInc.mysamp.length - 1 )]*40.0;
  for(int i = 0; i < 512; i+= 8)
    line(i, 100 - offs + anInc.mysamp[ ( i + anInc.nextSampleToRead ) & ( anInc.mysamp.length - 1 )]*40, i + 8, 100 - offs +  anInc.mysamp[( i + 7 + anInc.nextSampleToRead ) & ( anInc.mysamp.length - 1 )]*40);
}
 
void keyPressed( )
{
  if ( keyCode == LEFT )
    anInc.damp -= 0.005;
  if ( keyCode == RIGHT && anInc.damp < 0.99 )
    anInc.damp += 0.005;
  if ( keyCode == UP )
    anInc.d -= 1;
  if ( keyCode == DOWN )
    anInc.d += 1;
}

