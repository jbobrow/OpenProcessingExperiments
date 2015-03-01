
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// "Histogram" by Miguel Alejandro Moreno Barrientos, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
// Work: http://openprocessing.org/visuals/?visualID= 183594
// License:
// http://creativecommons.org/licenses/by-sa/3.0/
// http://creativecommons.org/licenses/GPL/2.0/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
*  This class implements an ADT to store the histogram of a PImage
*  and calculates some statistic parameters
*/
class Histogram
{
  static final int RED = 0, GREEN = 1, BLUE = 2, ALPHA = 3, RGB = 012, ARGB = 0123;  // color channels (RGB/ARGB for the three/four RGB/ARGB channels) 
  private final int[] v_channels = new int[] { RED, GREEN, BLUE, Histogram.ALPHA };  // channel sequence for loops
  private final int[][] frequencies = new int[4][256];  // histogram frequencies
  private final ImageConfig config = new ImageConfig();  // image config singleton
  private final int size;  // number of pixels in the image
  
  
  /**
  *  Creates an histogram from a PImage
  */
  Histogram( PImage img )
  {
    img.loadPixels();

    size = img.pixels.length;

    // calculate an store frequencies
    for ( int i = 0; i < size; i++ )
    {
      color c = img.pixels[i];
      for ( int channel : v_channels )
      {
        int intensity;
        switch ( channel )
        {
          case RED: intensity = int( red( c ) ); break;
          case GREEN: intensity = int( green( c ) ); break;
          case BLUE: intensity = int( blue( c ) ); break;
          case Histogram.ALPHA: intensity = int( alpha( c ) ); break;
          default: intensity = 0;
        }
        frequencies[ channel ][ intensity ]++;
      }
    }
  }
  
  
  /**
  * Get (channel,index) frequency
  */
  int get( int channel, int index )
  { 
    //index = constrain( index, 0, 255 );
    switch ( channel )
    {
      case Histogram.RGB: return frequencies[ RED ][ index ] + frequencies[ GREEN ][ index ] + frequencies[ BLUE ][ index ];
      case Histogram.ARGB: return frequencies[ RED ][ index ] + frequencies[ GREEN ][ index ] + frequencies[ BLUE ][ index ] + frequencies[ Histogram.ALPHA ][ index ];
      default: return frequencies[ channel ][ index ];
    }
  }
  
  
  /** 
  *  Get mode (max frecuency) for every channel in an interval
  */
  int getMode( int channel, int start, int end )
  { 
    int v = Integer.MIN_VALUE;
    int mode = -1;
    
    for ( int i = start; i <= end; i++ )
    {
      int f = get( channel, i );
      if ( f > v )  // update current mode
      {
        v = f;
        mode = i;
      }
    }
      
    return mode;
  }
   
    
  /**
  *  get mode (max frecuency) for every channel
  */
  int getMode( int channel ) { return getMode( channel, 0, 255 ); }
  
  
  /**
  *  Get mean for every channel in an interval
  */
  double getMean( int channel, int start, int end )
  {
    double sum = 0.0;

    for ( int i = start; i <= end; i++ )
      sum += get( channel, i ) * i;
    
    return sum / getCount( channel, start, end );
  }
  
  
  /**
  *  Get mean for every channel
  */
  double getMean( int channel ) { return getMean( channel, 0, 255 ); } 
  
  
  /**
  *  Get the unbiased sample variance for every channel in an interval
  */
  double getVariance( int channel, int start, int end )
  {
    double sum = 0.0;
    double mean = getMean( channel, start, end );
    
     for ( int i = start; i <= end; i++ )
       sum += ( i - mean ) * ( i - mean ) * get( channel, i );
     
     return sum / ( getCount( channel, start, end ) - 1 ); 
  }

  
  /**
  *  Get the unbiased sample variance for every channel
  */
  double getVariance( int channel ) { return getVariance( channel, 0, 255 ); }
  

  /**
  *  Get the unbiased sample standard deviation for every channel in an interval
  */
  double getSD( int channel, int start, int end ) { return Math.sqrt( getVariance( channel, start, end ) ); }
  

  /**
  *  Get the unbiased sample standard deviation for every channel
  */
  double getSD( int channel ) { return getSD( channel, 0, 255 ); }
  
  
  /**
  *  Get median for every channel in an interval
  */
  float getMedian( int channel, int start, int end )
  {
    int n = getCount( channel, start, end );    
    int x = ( n + 1 ) / 2;    
    int sum = 0;
    
    for ( int i = start; i <= end; i++ )
    {
      sum += get( channel, i );
      if ( n % 2 == 1 && sum >= x )  // sample with an odd number of elements
        return i;
      else if ( n % 2 == 0 && sum >= x )  // sample with an odd number of elements
        return i + 0.5f; 
    }
    
    return 0.0f;
  }
  
  
  /**
  *  Get median for every channel
  */
  float getMedian( int channel ) { return getMedian( channel, 0, 255 ); }
  
  
  /**
  *  Get pixel count for every channel in an interval
  */
  int getCount( int channel, int start, int end )
  {
    int sum = 0;
    
    for ( int i = start; i <= end; i++ )
      sum += get( channel, i );
     
    return sum; 
  }
  
  
  /**
  *  Get pixel count for every channel
  */
  int getCount( int channel )
  { 
    switch( channel )
    {
      case RGB:  return size * 3;
      case ARGB: return size * 4;
      default:   return size;
    }
  }
  
  /**
  *  Get the number of pixels (non channel dependent)
  */
  int getSize() { return size; }
  
  
  /**
  *  Get the pixel ratio interval/size in an interval
  */
  double getPixelRatio( int channel, int start, int end ) { return getCount( channel, start, end ) / (double) getCount( channel ); }
  
  
  /**
  *  Get how many different colors there are for a channel in an interval
  */
  int getColors( int channel, int start, int end )
  {
    int count = 0;
    
    for ( int i = start; i <= end; i++ )
      if ( get( channel, i ) > 0 )
        count++;
        
    return count;
  }
    
  /**
  *  Get how many different colors there are for a channel
  */
  int getColors( int channel ) { return getColors( channel, 0, 255 ); }
  
  
  /**
  *  Returns a string with the frequencies for ARGB channels (order: R,G,B,ALPHA)
  */
  String toString()
  {
    StringBuilder sb = new StringBuilder( "[" );
    
    for ( int c : v_channels )
    { 
      sb.append( "[" );
      for ( int i = 0; i < 256; i++ )
      {
        sb.append( String.valueOf( i ) );
        sb.append( ":" );
        sb.append( String.valueOf( frequencies[c][i] ) );
        sb.append( "," );
      }
      sb.deleteCharAt( sb.length() - 1 );
      sb.append( "]," );
    }
    sb.deleteCharAt( sb.length() - 1 );
    sb.append( "]" );
    
    return sb.toString();
  }
  
  
  /**
  *  Returns a string with the frequencies for any channel
  */
  String toString( int channel )
  {
      StringBuilder sb = new StringBuilder( "[" );
      
      for ( int i = 0; i < 256; i++ )
      {
        sb.append( String.valueOf( i ) );
        sb.append( ":" );
        sb.append( String.valueOf( get( channel, i ) ) );
        sb.append( "," );
      }
      sb.deleteCharAt( sb.length() - 1 );
      sb.append( "]" );
      
      return sb.toString();
  }
  
  
  /**
  *  This class store the configuration for the histogram image obtained by getImage method
  */
  class ImageConfig
  {
    private color background = color( 0 );  // bg color
    private color foreground = color( 255 );  // frequencies color
    private boolean axis = true;  // show axis
    private int padding = 0;  // padding around image
    private boolean mode = false;  // show mode (max frecuency)
    private boolean ln = false;  // logarithmic output
    
    ImageConfig setBackground( color background ) { this.background = background; return this; }

    ImageConfig setForeground( color foreground ) { this.foreground = foreground; return this; }

    ImageConfig setAxis( boolean axis ) { this.axis = axis; return this; }

    ImageConfig setPadding( int padding ) { this.padding = padding; return this; }
        
    ImageConfig setMode( boolean mode ) { this.mode = mode; return this; }
    
    ImageConfig setLn( boolean ln ) { this.ln = ln; return this; }
    
    color getBackground() { return background; }
    
    color getForeground() { return foreground; }
    
    boolean getAxis() { return axis; }
    
    int getPadding() { return padding; }
    
    boolean getMode() { return mode; }
    
    boolean getLn() { return ln; }
  }
  
  
  /**
  *  Get configuration singleton
  */
  ImageConfig getImageConfig() { return config; }
 
  
  /**
  *  Get an histogram image (customize using getImageConfig)
  *  Note: You can override this class to do your own image method or create an external method. This method is only a suggestion
  */
  PGraphics getImage( int channel )
  {
    int n = 256;
    int mode = getMode( channel ), vmode = get( channel, mode );
    float k = vmode / log( vmode + 1 );  // logarithm scale constant 
    int padding = getImageConfig().getPadding();
    int waxis = getImageConfig().getAxis() ? 1 : 0;
    int size = n + padding * 2 + waxis;
    PGraphics img = createGraphics( size, size );
    
    img.beginDraw();    
    img.background( getImageConfig().getBackground() );
    img.stroke( getImageConfig().getForeground() );
    for ( int i = 0; i < n; i++ )
    {
      int f = get( channel, i );
      if ( getImageConfig().getLn() )
        f = int( k * log( f + 1 ) );
      if ( f > 0 )
        img.line( padding + waxis + i, n + padding - ceil( f / (float) vmode * n ), padding + waxis + i, n + padding - 1 );
    }
    if ( getImageConfig().getMode() )
    {
      img.stroke( color( 255, 255, 0 ) );
      img.line( padding + waxis + mode, padding, padding + waxis + mode, n + padding - 1 );
    }
    if ( getImageConfig().getAxis() )
    {
      img.stroke( color( 0, 255, 0 ) );
      img.line( padding, padding, padding, padding + n );
      img.line( padding, padding + n, padding + n, padding + n );
    }    
    img.endDraw();
    
    return img;
  }
 
}

