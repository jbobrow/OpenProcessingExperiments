
import pKinect.PKinect;
import pKinect.SkeletonData;
import traer.physics.*;

PKinect kinect;
ArrayList<SkeletonData> bodies;

Particle attractor;
Particle [] others;
ParticleSystem physics;

void setup()
{
  size(1000, 600);
  kinect = new PKinect(this);
  bodies = new ArrayList<SkeletonData>();
  smooth();
  background(255);
  
  frameRate(20);
  fill(0);
  noStroke();
  ellipseMode(CENTER);
  
  physics = new ParticleSystem(0,0.08);
  attractor = physics.makeParticle();
  attractor.makeFixed();
  
  others = new Particle[6000];
  for (int i=0; i<others.length; i++){
    others[i] = physics.makeParticle(1.0, random(0,width), random(0,height),0);
    physics.makeAttraction(attractor, others[i], 12000, 60);
  }

}

void draw()
{
  //background(255);
  for (int i=0; i<bodies.size(); i++) 
  {
    drawSkeleton(bodies.get(i));
   
  }
 
   
}

void drawSkeleton(SkeletonData _s) 
{
  drawCircle(_s, 
  PKinect.NUI_SKELETON_POSITION_HAND_RIGHT, 
  PKinect.NUI_SKELETON_POSITION_HAND_RIGHT);
}

void drawCircle(SkeletonData _s, int _j1, int _j2) 
{
  if (_s.skeletonPositionTrackingState[_j1] != PKinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != PKinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
      
    
   fill(0);
  attractor.position().set(_s.skeletonPositions[_j1].x*width,_s.skeletonPositions[_j1].y*height,0);
  physics.tick();
  background(255);
  for (int i=0; i<others.length; i++){
    Particle p = others[i];
    fill(0,70);
    
    ellipse(p.position().x(), p.position().y(), 5, 5);
  }
  
    
     fill(149,38,38);
     ellipse(_s.skeletonPositions[_j1].x*width, 
    _s.skeletonPositions[_j1].y*height, 
    15, 15);
 } 
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == PKinect.NUI_SKELETON_NOT_TRACKED) 
  {
       return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

    
void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
               
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == PKinect.NUI_SKELETON_NOT_TRACKED) 
  {
        
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}


