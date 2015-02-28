

class EmotivePixel {

  int uID;
  float x;
  float y;
  float temperature; // form -1 (cold) to 1 (hot)
  float[] mdists;

  public EmotivePixel( int ID ) {
    uID = ID;
    y = uID / base.width;
    x = uID - y * base.width;
    temperature = 0;
    mdists = null;
  }

  public void distances( ArrayList< MapZone > mzs, float mult ) {
    
    mdists = new float[ mzs.size() ];
    int i = 0;
    Iterator< MapZone > itr = mzones.iterator();
    while ( itr.hasNext () ) {
      MapZone mz = itr.next();
      float d = ( dist( x, y, mz.barycentre.x, mz.barycentre.y ) / mult );
      d = 1 - sin( d * HALF_PI );
      mdists[ i ] = pow( d, 5 );
      i++;
    }
  }

  public void update() {
    float target = 0;
    int i = 0;
    Iterator< MapZone > itr = mzones.iterator();
    while ( itr.hasNext () ) {
      MapZone mz = itr.next();
      target += mz.temperature * mdists[ i ];
      i++;
    }
    temperature += ( target - temperature ) * 0.1;
  }
  
}


