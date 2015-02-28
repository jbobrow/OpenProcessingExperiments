
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.joints.*;

Physics physics;

void setup() {
  size(640,480,P3D); // Let's go with P3D from now on for greater speed
  frameRate(60);
  initScene();
}


void initScene() {
  
  float gravX = 0.0;                 
  float gravY = -10.0;
  float AABBWidth = 2*width;   
  float AABBHeight = 2*height;
  float borderBoxWidth = width;      
  float borderBoxHeight = height;
  float pixelsPerMeter = 30;
  physics = new Physics(this, width, height,
		              gravX, gravY,
			      AABBWidth, AABBHeight,
			      borderBoxWidth, borderBoxHeight,
			      pixelsPerMeter);
  physics.setDensity(1.0f);
  
//  float sz = random(5,10);

  Body corp     = physics.createRect(90, 110, 110, 150);
  Body head     = physics.createCircle(100, 100, 10);
  Body lArm     = physics.createRect(80, 110, 90, 135);
  Body rArm     = physics.createRect(110, 110, 120, 135);
  Body lHand    = physics.createRect(80, 135, 90, 160);
  Body rHand    = physics.createRect(110, 135, 120, 160);
  Body lThigh   = physics.createRect(90, 150, 100, 175);
  Body rThigh   = physics.createRect(100, 150, 110, 175);
  Body lLeg     = physics.createRect(90, 175, 100, 195);
  Body rLeg     = physics.createRect(100, 175, 110, 195);
  physics.createDistanceJoint(head, corp, 100, 100, 100, 101);
  
  physics.createDistanceJoint(lArm, corp, 89, 110, 90, 110);
  physics.createDistanceJoint(rArm, corp, 111, 110, 110, 110);
  
  physics.createDistanceJoint(lArm, lHand, 89, 134, 89, 136);
  physics.createDistanceJoint(rArm, rHand, 111, 134, 111, 136);
  
  physics.createDistanceJoint(corp, lThigh, 89, 149, 89, 151);
  physics.createDistanceJoint(corp, rThigh, 111, 149, 111, 151);
  
  physics.createDistanceJoint(lLeg, lThigh, 91, 176, 91, 174);
  physics.createDistanceJoint(lLeg, lThigh, 99, 176, 99, 174);
  physics.createDistanceJoint(rLeg, rThigh, 109, 176, 109, 174);
  physics.createDistanceJoint(rLeg, rThigh, 101, 176, 101, 174);
  

}

void draw() {
  background(0);

//  physics.setFriction(0.0200);
  physics.setRestitution(1.10);
  if(mousePressed) {
    physics.createCircle(mouseX, mouseY, 10);
  }
}

