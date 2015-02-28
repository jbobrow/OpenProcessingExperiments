

public static final float TEXCELL_MAX_ENERGY =      10;
public static final float TEXCELL_MIN_MULTIPLIER =  0.1f;
public static final float TEXCELL_INFLUENCE =       300.f;

public static final int TEXCELL_TYPE_RED =          0;
public static final int TEXCELL_TYPE_GREEN =        1;
public static final int TEXCELL_TYPE_BLUE =         2;
public static final int TEXCELL_TYPE_YELLOW =       3;
public static final int TEXCELL_TYPE_CYAN =         4;
public static final int TEXCELL_TYPE_MAGENTA =      5;
public static final int TEXCELL_TYPE_DOTS =         6;
public static final int TEXCELL_TYPE_CONTRAST =     7;

class TexCell {
  
  private int UID;
  private int type;
  public ArrayList< TexCell > foreign;
  private float multiplier;
  private float energy;
  public float x,y,influence;
  
  public TexCell( int UID, float x, float y ) {
    this.UID = UID;
    type = (int) random( 0, 8 );
    foreign = new ArrayList< TexCell >();
    energy = 0;
    multiplier = TEXCELL_MIN_MULTIPLIER;
    this.x = x;
    this.y = y;
    influence = TEXCELL_INFLUENCE;
  }
  
  public int getUID() { return UID; }
  public int getType() { return type; }
  public float getEnergy() { return energy; }
  
  public void boost() {
      multiplier = 1;
  }
  
  public void addenergy( float e ) {
    energy += e;
    if ( energy > 1 )
      energy = 1;
  }
  
  public void update( int[] pixels, int w, int h ) {
    
    if ( multiplier < TEXCELL_MIN_MULTIPLIER )
      multiplier = TEXCELL_MIN_MULTIPLIER;
    if ( energy == 0 )
      return;
    
    // influence area
    int influ = (int) ( influence * energy );
    
    switch( type ) {
      case TEXCELL_TYPE_RED:
      case TEXCELL_TYPE_GREEN:
      case TEXCELL_TYPE_BLUE:
      case TEXCELL_TYPE_YELLOW:
      case TEXCELL_TYPE_CYAN:
      case TEXCELL_TYPE_MAGENTA:
      case TEXCELL_TYPE_CONTRAST:
        for( int r = (int) y - influ; r <= (int) y + influ; r++ ) {
          for( int c = (int) x - influ; c <= (int) x + influ; c++ ) {
              if ( r >= 0 && r < h && c >= 0 && c < w ) {
                float d = dist( c,r,x,y ) / influ;
                if ( d <= 1 ) {
                  int ppos = c + r * w;
                  int p = pixels[ ppos ];
                  float red = p >> 16 & 0xFF;
                  float green = p >> 8 & 0xFF;
                  float blue = p & 0xFF;
                  float[] nc = { red, green, blue };
                  float colorstrength = 2;
                  
                  if ( type == TEXCELL_TYPE_RED || type == TEXCELL_TYPE_MAGENTA || type == TEXCELL_TYPE_YELLOW ) {
                    
                    nc[ 0 ] = red + ( energy * colorstrength * ( 1 - d ) );
                    
                  } else if ( type == TEXCELL_TYPE_GREEN || type == TEXCELL_TYPE_CYAN || type == TEXCELL_TYPE_YELLOW ) {
                    
                    nc[ 1 ] = green + ( energy * colorstrength * ( 1 - d ) );
                    
                  } else if ( type == TEXCELL_TYPE_BLUE || type == TEXCELL_TYPE_CYAN || type == TEXCELL_TYPE_MAGENTA ) {
                    
                    nc[ 2 ] = blue + ( energy * colorstrength * ( 1 - d ) );
                    
                  } else if ( type == TEXCELL_TYPE_CONTRAST ) {
                    
                    for ( int col = 0; col < 3; col ++ ) {
                      if ( nc[ col ] < 127 )
                        nc[ col ] *= 0.995f;
                      else
                        nc[ col ] *= 1.005f;
                    }
                    
                  }
                  red = red * d + nc[ 0 ] * ( 1 - d );
                  green = green * d + nc[ 1 ] * ( 1 - d );
                  blue = blue * d + nc[ 2 ] * ( 1 - d );
                  pixels[ ppos ] = color( red,green,blue );
                }
              }
          }
        }
        break;
      case TEXCELL_TYPE_DOTS:
        int dotnum = (int) ( 100 * energy );
        if ( dotnum == 0)
          dotnum = 1;
        for ( int i = 0; i < dotnum; i++ ) {
          float a = random( 0, TWO_PI );
          float r = random( 1, influ );
          int dx = (int) ( x + cos(a) * r );
          int dy = (int) ( y + sin(a) * r );
          if ( dy >= 0 && dy < h && dx >= 0 && dx < w ) {
            int ppos = dx + dy * w;
            int p = pixels[ ppos ];
            float red = p >> 16 & 0xFF;
            float green = p >> 8 & 0xFF;
            float blue = p & 0xFF;
            red *= 1.1f * ( 1 - energy );
            green *= 1.1f * ( 1 - energy );
            blue *= 1.1f * ( 1 - energy );
            pixels[ ppos ] = color( red,green,blue );
          }
        }
        break;
    }
    
    for ( int i = 0; i < foreign.size(); i++ ) {
      foreign.get( i ).addenergy( energy * 0.85f / foreign.size() );
    }
    
    energy *= multiplier;
    if ( multiplier > TEXCELL_MIN_MULTIPLIER )
      multiplier *= 0.9f;
    if ( energy < 0.01f )
      energy = 0;
  }

}

