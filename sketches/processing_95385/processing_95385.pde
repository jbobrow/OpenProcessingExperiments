
class Follower {
  
  public static final float FOLLOWER_MAX_SPEED =       0.03f;
  public static final float FOLLOWER_ACCELERATION =    0.0001f;
  public static final int FOLLOWER_HISTORYSIZE =       50;
  public static final float FOLLOWER_HISTORYERROR =    0.0018f;
  
  private PVector position;
  private PVector direction;
  private PVector target;
  private PVector working;
  
  private PVector[] histo;
  
  private float maxspeed;
  private float acceleration;
  private float speed;
  private float prevspeed;
  private float horizon = 0.15f;
  private float adaptability = 0.5f;
  
  public Follower() {
    
    position = new PVector();
    direction = new PVector();
    target = new PVector();
    working = new PVector();
    
    target.x = 0;
    target.y = 0;
    target.z = 0;
    
    histo = new PVector[ FOLLOWER_HISTORYSIZE ];
    for ( int i = 0; i < FOLLOWER_HISTORYSIZE; i++ ) {
      histo[i] = new PVector();
      histo[i].set( target );
    }
    
    position.set( target );
    maxspeed = FOLLOWER_MAX_SPEED;
    acceleration = FOLLOWER_ACCELERATION;
    speed = 0;
    prevspeed = 0;
    
  }
  
  public void follow( float x, float y, float z ) {
    target.x = x;
    target.y = y;
    target.z = z;
  }
  
  public void update() {
    
    if ( position.dist( target ) > horizon ) {

      prevspeed = speed;
      if ( speed < maxspeed )
        speed += acceleration;
      
    } else {
      
      // distance to target
      float d = position.dist( target );
      float ns = ( 1 - exp( -d/horizon ) ) * prevspeed;
      if ( ns < speed )
        speed = ns;
      else
        speed *= 0.99f;
      if ( d / horizon < 0.2f )
        speed = 0;
      
//      speed = ( exp( -d/horizon ) ) * prevspeed;
//      println( exp( -d/horizon ) + "/" + exp( d/horizon ) );
//      speed = 0;
      
    }
    
    working.set( target );
    working.sub( position );
    
    // blending directions
    if ( direction.mag() == 0 )
      direction.set( working );
    else {
      working.mult( adaptability );
      direction.add( working );
    }
    direction.normalize();
    
    // and applying speed    
    working.set( direction );
    working.mult( speed );

    position.add( working );
    
    for ( int i = FOLLOWER_HISTORYSIZE-1; i >=0; i-- ) {
      if ( i > 0 ) {
        working.set( histo[i-1] );
        working.sub( histo[i] );
        working.mult( 0.18f );
        working.add( new PVector( 
          random( -FOLLOWER_HISTORYERROR,FOLLOWER_HISTORYERROR ), 
          random( -FOLLOWER_HISTORYERROR,FOLLOWER_HISTORYERROR ), 
          random( -FOLLOWER_HISTORYERROR,FOLLOWER_HISTORYERROR ) ) );
        histo[i].add( working );
      } else {
        histo[i].set( position );
      }
    }
    
  }
  
  public PVector getPosition() { return position; }
  public PVector getDirection() { return direction; }
  public PVector getTarget() { return target; }
  public float getHorizon() { return horizon; }
  public PVector[] getHisto() { return histo; }
  
  public void setMaxspeed( float maxspeed ) { this.maxspeed = maxspeed; }
  public void setAcceleration( float acceleration ) { this.acceleration = acceleration; }

}

