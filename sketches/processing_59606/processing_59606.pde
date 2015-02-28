
class Particle {
 PVector mLoc, mVel; 
 float mRad;
 boolean mDead;
 int age;
 int life;
  
 Particle() {
  mLoc = new PVector( 0.0f, 0.0f );
  mVel = new PVector( random(0.0f,1.0f)*2-1,random(0.0f,1.0f)*2-1);
  mRad = 10.0f;
  mDead = false;
  age = 0;
  life = 200;
 }
 
 Particle( PVector loc ) {
  mLoc = new PVector( 0.0f, 0.0f );
  mLoc.set(loc);
  mVel = new PVector( random(0.0f,1.0f)*2-1,random(0.0f,1.0f)*2-1 );
  mRad = 8;
  mDead = false;
  age = frameCount % 360;
  life = 255;
 }
 
 boolean isTouching( Particle p ) {
  if ( dist( p.mLoc.x, p.mLoc.y, mLoc.x, mLoc.y ) < p.mRad+mRad ) {
   mDead = true;
   return true;
  } 
  return false;
 }

 void update() {
  mRad += cos((mLoc.x*10 + frameCount)*0.003)*0.1;
  if( mDead == false ) {
    mVel.x = random(0.0f,1.0f)*30-15;
    mVel.y = random(0.0f,1.0f)*30-15;
    mLoc.add(mVel);
    age += 20;
    if( age >= 360 ) age = 0;
  }
  else {
    if(frameCount % 30 == 0 ) life--; 
  }
 }
 
 void render() {
  stroke(255,255,200,40);
  fill(205,15);
  //ellipse( mLoc.x, mLoc.y, mRad, mRad );
  
  int randHairs = (int)random( 3, 6 );
  float theta = random( 0, TWO_PI );
  for( int i = 0; i < randHairs; i++ ) {
   line( mLoc.x + (mRad-1)*cos(theta), mLoc.y + (mRad-1)*sin(theta), mLoc.x+(mRad+1)*cos(theta), mLoc.y+(mRad+1)*sin(theta) );
   theta = random( 0, PI );
  }
 } 
}

