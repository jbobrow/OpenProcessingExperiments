
// this signal uses the mouseX and mouseY position to build a signal
class IncSignal implements AudioSignal
{
  int[] samples = new int[ 8192 ];
  int[] diffs   = new int[ 8192 ];

  float[] mysamp = new float[ 8192 ];
  
  int nextSampleToRead  = 0;
  int nextSampleToWrite = 0;
  int sampleCount       = 0;
  
  boolean inGenerate = false, inMyGenerate = false;
  
  int y  = 0;
  int x1 = 0;
  int x2 = 0;
  int x3 = 0;
  int x4 = 0;
  int s1 = 0;
  int s2 = 0;
  int s3 = 0;
  int s4 = 0;
  int d = 23;
  int c = 0;
  
  IncSignal( ) {
    for ( int i = 0; i < 8192; i++ ) {
      samples[ i ] = ( int ) ( 1024.0 * Math.sin( 3.141592654 * ( ( float )i / 4096 ) ) );
    }
    for ( int i = 0; i < 8192; i++ ) {
      diffs[ i ] = samples[ ( i + 1 ) % 8192 ] - samples[ i ];
    }
  }
  
  void generate( float[] samp )
  {
    inGenerate = true;
    
    if ( samp.length > mysamp.length - nextSampleToRead )
    {
      System.arraycopy( mysamp, nextSampleToRead, samp, 0, mysamp.length - nextSampleToRead );
      System.arraycopy( mysamp, 0,                samp, 0, samp.length - ( mysamp.length - nextSampleToRead ) );
    }
    else
    {
      System.arraycopy( mysamp, nextSampleToRead, samp, 0, samp.length );
    }
    
    sampleCount -= samp.length;
    nextSampleToRead = ( nextSampleToRead + samp.length ) & ( mysamp.length - 1 );
      
    inGenerate = false;
  }
  
  boolean mygenerate( )
  {
    if ( inGenerate )
      return true;
      
    if ( sampleCount == mysamp.length )
      return false;
      
    inMyGenerate = true;
      
    for ( ; c < 6144; c++ )
    {       
      for ( int j = 0; j < d; j++ )
      {         
        y += diffs[ ( x1 )  ] +
             diffs[ ( x2 )  ] +
             diffs[ ( x3 )  ] +
             diffs[ ( x4 )  ];          
        
        x1 = ( x1 + s1 ) & 0x1fff;
        x2 = ( x2 + s2 ) & 0x1fff;
        x3 = ( x3 + s3 ) & 0x1fff;
        x4 = ( x4 + s4 ) & 0x1fff;
  
      }
      
      y = ( int )( 0.96 * ( float )y );
    
      mysamp[ nextSampleToWrite ] = y / 512.0;
      nextSampleToWrite = ( nextSampleToWrite + 1 ) & ( mysamp.length - 1 );
      sampleCount++;
      
      if ( sampleCount == mysamp.length )
        break;
        
      if ( inGenerate )
      {
        break;
      }
    }
    
    if ( c == 6144 )
    {
      c = 0;
      //s1 = ( s1 + 3 ) % 5;
      s2 = ( s2 + 3 ) % 7;
      s3 = ( s3 + 3 ) % 4;
      s4 = ( s4 + 7 ) % 9;
    }
    
    inMyGenerate = false;
    
    return sampleCount <= mysamp.length;    
  }
  
  // this is a stricly mono signal
  void generate(float[] left, float[] right)
  {
    generate(left);
    System.arraycopy( left, 0, right, 0, left.length );
  }
}

