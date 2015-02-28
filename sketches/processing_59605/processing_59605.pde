
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
  mRad = random(6.0,14.0f);
  mDead = false;
  age = frameCount % 360;
  life = 255;
 }
 
 boolean isTouching( Particle p ) {
  if ( dist( p.mLoc.x, p.mLoc.y, mLoc.x, mLoc.y ) < p.mRad ) {
   mDead = true;
   return true;
  } 
  return false;
 }

 void update() {
  if( mDead == false ) {
    mVel.x = random(0.0f,1.0f)*10-5;
    mVel.y = random(0.0f,1.0f)*10-5;
    mLoc.add(mVel);
    age += 20;
    if( age >= 360 ) age = 0;
  }
  else {
   if( frameCount % 15 == 0 ) life--; 
  }
 }
 
 void render() {
  stroke(360, 0, life);
  fill(age, 100, 100, life/2);
  ellipse( mLoc.x, mLoc.y, mRad, mRad );
 } 
}

