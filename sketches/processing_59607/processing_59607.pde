
class Particle {
 PVector mLoc, mVel, mAcc;
 float mRad;
 float mMass;
 boolean mFixed;
 
 Particle( float _rad, float _mass, PVector _loc, boolean _isCenter ) {
   randomSeed( (long)random( 0, 100000000 ) );
   mLoc = _loc;
   mRad = _rad;
   mMass = _mass;
   mAcc = new PVector( 0.0, 0.0 );
   if( _isCenter == true) {
     mVel = new PVector( 0.0, 0.0 );
     mFixed = true;
   }
   else {
     float xseed = random( 0, 100 );
     float yseed = random( 0, 1000 );
     PVector var = new PVector( noise( xseed, yseed, 0.001 )*random(50,100), noise( yseed, xseed, mMass )*random(50,100) );
     int sign = int( floor(random(0,2)) );
     if( sign > 0 ) var.mult( -1.0 );
     mLoc.add(var);
     mVel = new PVector( random( -1.0, 1.0 ), random( -1.0, 1.0 ) );
     mFixed = false;
   }
 }
 void applyForce( PVector _f ) {
   mAcc.add( _f );
 }
 void update() {
     mVel.add( mAcc );
     //mVel.add( new PVector( noise( mLoc.x*0.001, mLoc.y*0.0001, 0.001 )*((2-1)*0.01), noise( mLoc.y*0.001, mLoc.x*0.001, 0.001 )*((2-1)*0.01) ) );
     mVel.limit( 0.7 );
     mLoc.add( mVel );
     
     mAcc.x = 0.0;
     mAcc.y = 0.0;
 }
 void render() {
   //noFill();
   //noStroke();
   fill( 0,80 );
   ellipse( mLoc.x, mLoc.y, mRad, mRad );
   //point( mLoc.x, mLoc.y );
 }
}

