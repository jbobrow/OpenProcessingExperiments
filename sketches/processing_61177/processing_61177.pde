
class Particle {
  PVector mLoc, mVel, mAcc;
  int mRad, mLife;
  float mMaxForce, mMaxSpeed;
  
  Particle( PVector _loc ) {
   randomSeed( (long)random(0, 100000000) );
   mMaxForce = random( 0.4, 0.8 );
   mMaxSpeed = random( 0.8, 1.6 );
   mLoc = new PVector();
   mLoc.set( _loc );
   mVel = new PVector( random( -1.5, 1.5 ), random( -1.5, 1.5 ) );
   mAcc = new PVector( 0.0, 0.0 );
   mRad = 1;
   
   mLife = (int)random(250,360);
  }
  
  Particle( PVector _loc, PVector _vel ) {
   randomSeed( (long)random(0, 100000000) );
   mMaxForce = random( 0.4, 0.8 );
   mMaxSpeed = random( 0.8, 1.6 );
   mLoc = new PVector();
   mLoc.set( _loc );
   mVel = new PVector();
   mVel.set( _vel );
   mAcc = new PVector( 0.0, 0.0 );
   mRad = 1;
   randomSeed( (long)random(0, 100000000) );
   mLife = (int)random(250,360);
  }
  
  void update() {
   mVel.add( mAcc );
   float nX = mLoc.x * 0.05;
   float nY = mLoc.y * 0.05;
   float nZ = 0.001;
   float nTheta = noise( nX, nY, nZ ) * 30-15 ;
   mVel.add( new PVector( 0.05 * cos(nTheta), 0.05*sin(nTheta) ) );
   mVel.limit( mMaxSpeed );
   mLoc.add( mVel );
   mAcc.set( new PVector( 0.0, 0.0 ) );
   mLife--;
  }
   
  void render() {
    noStroke();
    fill( mLife, 100, 100, 150 );
    ellipse( mLoc.x, mLoc.y, mRad, mRad );
  }
  
  void applyForce( PVector _f ) {
    mAcc.add( _f );
  }
  
  boolean isDead() {
    if( mLife <= 0 ) return true;
    return false; 
  }
  
  boolean spawnNew() {
   if( frameCount % random(400, 1000) == 0 ) return true;
   return false;
  }
}

