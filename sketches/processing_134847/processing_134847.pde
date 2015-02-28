
// 
// * Click the space bar to switch between the different camera modes: ARCBALL,
// * WALKTHROUGH, and THIRD_PERSON.
// *
// * Press 'm' to toggle (start/stop) animation.
// * Press 'x' to decrease the animation period (animation speeds up).
// * Press 'y' to increase the animation period (animation speeds down).
// * Press 'u' to toggle smoothing.
// * Press 'v' to toggle boids' wall skipping.
// * Press 'f' to toggle the drawing of the frame selection hits.
// * Press 'h' to display the global shortcuts in the console.
// * Press 'H' to display the current camera profile keyboard shortcuts
// * and mouse bindings in the console.
// */
// 

import remixlab.proscene.*;

Scene scene;
CameraProfile thirdPersonCP, currentCP;
//flock bounding box
int flockWidth = 1280;
int flockHeight = 720;
int flockDepth = 600;
int initBoidNum = 400; // amount of boids to start the program with
ArrayList flock;
boolean smoothEdges = false;
boolean avoidWalls = true;
float hue = random(255);

void setup() {
  size(640, 360, P3D);
stroke(random(255),random(255),random(255));
  scene = new Scene(this);
  thirdPersonCP =  new CameraProfile(scene, "THIRD_PERSON", CameraProfile.Mode.THIRD_PERSON );
  scene.registerCameraProfile( thirdPersonCP );
  currentCP = scene.currentCameraProfile();
  scene.setAxisIsDrawn(false);
  scene.setGridIsDrawn(false);
  scene.setBoundingBox(new PVector(0,0,0), new PVector(flockWidth,flockHeight,flockDepth));
  scene.showAll();


  flock = new ArrayList();
  for (int i = 0; i < initBoidNum; i++)
    flock.add(new Boid(new PVector(flockWidth/2, flockHeight/2, flockDepth/2 )));

  // press 'f' to display frame selection hints
  scene.setShortcut('f', Scene.KeyboardAction.DRAW_FRAME_SELECTION_HINT);
  // press 'm' to start/stop animation
  scene.setShortcut('m', Scene.KeyboardAction.ANIMATION);  

  scene.startAnimation();
}

void draw() {
  background(0);  
  ambientLight(128,128,128);
  directionalLight(255, 255, 255, 0, 1, -100);
  noFill();
  stroke(255);
 
  line(0, 0, 0, 0, flockHeight, 0);
  line(0, 0, flockDepth, 0, flockHeight, flockDepth);
  line(0, 0, 0, flockWidth, 0, 0);
  line(0, 0, flockDepth, flockWidth, 0, flockDepth);

  line(flockWidth, 0, 0, flockWidth, flockHeight, 0);
  line(flockWidth, 0, flockDepth, flockWidth, flockHeight, flockDepth);
  line(0, flockHeight, 0, flockWidth, flockHeight, 0);
  line(0, flockHeight, flockDepth, flockWidth, flockHeight, flockDepth);

  line(0, 0, 0, 0, 0, flockDepth);
  line(0, flockHeight, 0, 0, flockHeight, flockDepth);
  line(flockWidth, 0, 0, flockWidth, 0, flockDepth);
  line(flockWidth, flockHeight, 0, flockWidth, flockHeight, flockDepth);

  if(!currentCP.equals(scene.currentCameraProfile())) {  
    adjustFrameRate();
    currentCP = scene.currentCameraProfile();
  }

  for (int i = 0; i < flock.size(); i++) {
     Boid tempBoid = (Boid) flock.get(i);
    if(scene.animatedFrameWasTriggered)
      tempBoid.run(flock); // tell the temporary boid to execute its run method
    tempBoid.render(); // tell the temporary boid to execute its render method
  }

  if (smoothEdges)
    smooth();
  else
    noSmooth();
}

void adjustFrameRate() {
  if(scene.currentCameraProfile().equals(thirdPersonCP))
    scene.setFrameRate(1000/scene.animationPeriod());//restarts animation
  else
    scene.setFrameRate(60);//restarts animation
}

void keyPressed() {
 
    
  switch (key) {
  case 'u':
    smoothEdges = !smoothEdges;
    break;
  case 'v':
    avoidWalls = !avoidWalls;
    break;
  case 'x':
    scene.setAnimationPeriod(scene.animationPeriod()-2, false);
    adjustFrameRate();
    break;
  case 'y':
    scene.setAnimationPeriod(scene.animationPeriod()+2, false);
    adjustFrameRate();
    break;
  }
}
class Boid {
  InteractiveAvatarFrame frame;
  Quaternion q;
  int grabsMouseColor;//color
  int avatarColor;

  // fields
  PVector pos, vel, acc, ali, coh, sep; // pos, velocity, and acceleration in
  float neighborhoodRadius; // radius in which it looks for fellow boids
//  float maxSpeed = mouseX/100;
 float maxSpeed = 4; // maximum magnitude for the velocity vector
  float maxSteerForce = .1f; // maximum magnitude of the steering vector
  float sc = random(5); 
  float flap = 0;
  float t = 0;

  // constructors
  Boid(PVector inPos) {
      grabsMouseColor = color(random(150,255),random(150,255),random(255));
    avatarColor = color(random(255),random(255),random(255));		
    pos = new PVector();
    pos.set(inPos);
    frame = new InteractiveAvatarFrame(scene);	
    frame.setPosition(pos);
    frame.setAzimuth(-HALF_PI);
    frame.setInclination(PI*(4/5));
    frame.setTrackingDistance(scene.radius()/10);   
    
    //ADD AUDIO, use song elements to control flock behaviour
//      for(int i = 0; i < player.bufferSize() - 1; i++)
// acc= new PVector(player.left.get(i), player.right.get(i), player.left.get(i));

//   vel = new PVector(player.left.get(i), player.right.get(i), player.left.get(i));
   vel = new PVector(random(-1,1),random(-1,1),random(-1,1)); //<>//
 acc = new PVector(0, 0, 0);
    neighborhoodRadius = 100;
  }

  Boid(PVector inPos, PVector inVel, float r) {
    grabsMouseColor = color(random(255),random(255),random(255));
    avatarColor = color(random(255),random(255),random(255));
    pos = new PVector();
    pos.set(inPos);
    frame = new InteractiveAvatarFrame(scene);
    frame.setPosition(pos);
    frame.setAzimuth(-HALF_PI);
    frame.setTrackingDistance(scene.radius()/10);
    vel = new PVector();
    vel.set(inVel);
    acc = new PVector(0, 0);
    neighborhoodRadius = r;
  }

  void run(ArrayList bl) {
    t += .1;
    flap = 10 * sin(t);
    // acc.add(steer(new PVector(mouseX,mouseY,300),true));
    // acc.add(new PVector(0,.05,0));
    if (avoidWalls) {
      acc.add(PVector.mult(avoid(new PVector(pos.x, flockHeight, pos.z), true), 5));
      acc.add(PVector.mult(avoid(new PVector(pos.x, 0, pos.z), true), 5));
      acc.add(PVector.mult(avoid(new PVector(flockWidth, pos.y, pos.z),	true), 5));
      acc.add(PVector.mult(avoid(new PVector(0, pos.y, pos.z), true), 5));
      acc.add(PVector.mult(avoid(new PVector(pos.x, pos.y, 0), true), 5));
      acc.add(PVector.mult(avoid(new PVector(pos.x, pos.y, flockDepth), true), 5));
    }
    flock(bl);
    move();
    checkBounds();
    //render();
  }

  // ///-----------behaviors---------------
  void flock(ArrayList bl) {
    ali = alignment(bl);
    coh = cohesion(bl);
    sep = seperation(bl);
    acc.add(PVector.mult(ali, 1));
    acc.add(PVector.mult(coh, 3));
    acc.add(PVector.mult(sep, 1));
  }

  void scatter() {

  }

  // //------------------------------------

  void move() {
    vel.add(acc); // add acceleration to velocity
    vel.limit(maxSpeed); // make sure the velocity vector magnitude does not
    // exceed maxSpeed
    pos.add(vel); // add velocity to position
    frame.setPosition(pos);
    acc.mult(0); // reset acceleration
  }

  void checkBounds() {
    if (pos.x > flockWidth)
      pos.x = 0;
    if (pos.x < 0)
      pos.x = flockWidth;
    if (pos.y > flockHeight)
      pos.y = 0;
    if (pos.y < 0)
      pos.y = flockHeight;
    if (pos.z > flockDepth)
      pos.z = 0;
    if (pos.z < 0)
      pos.z = flockDepth;
  }
  
  // check if this boid's frame is the avatar
  boolean isAvatar() {
    if ( scene.avatar() == null )
      return false;
    if ( scene.avatar().equals(frame) )
      return true;
    return false;
  }

  void render() {
    pushStyle();
    stroke(random(90,98),random(26),random(224,234),40);
    strokeWeight(2);
    fill(random(90,98),random(26),random(224,234),40);
//    fill(random(26),random(177),random(224,234),40);
//   noStroke();
    fill(random(255));		

    q = Quaternion.multiply(new Quaternion( new PVector(0,1,0),  atan2(-vel.z, vel.x)), 
                            new Quaternion( new PVector(0,0,1),  asin(vel.y / vel.mag())) );		
    frame.setRotation(q);

    pushMatrix();
    // Multiply matrix to get in the frame coordinate system.
    frame.applyTransformation();

    // highlight boids under the mouse
    if (frame.grabsMouse()) {
      fill(grabsMouseColor);
      // additionally, set the boid's frame as the avatar if the mouse is pressed
      if (mousePressed == true) 
        scene.setAvatar(frame);			
    }
    
    // highlight the boid if its frame is the avatar
    if ( isAvatar() ) {
      fill( avatarColor );
    }

    //draw boid
    beginShape(TRIANGLES);
    vertex(3 * sc, 0, 0);
    vertex(-3 * sc, 2 * sc, 0);
    vertex(-3 * sc, -2 * sc, 0);

    vertex(3 * sc, 0, 0);
    vertex(-3 * sc, 2 * sc, 0);
    vertex(-3 * sc, 0, 2 * sc);

    vertex(3 * sc, 0, 0);
    vertex(-3 * sc, 0, 2 * sc);
    vertex(-3 * sc, -2 * sc, 0);

    vertex(-3 * sc, 0, 2 * sc);
    vertex(-3 * sc, 2 * sc, 0);
    vertex(-3 * sc, -2 * sc, 0);
    endShape();		

    popMatrix();

    popStyle();		
  }

  // steering. If arrival==true, the boid slows to meet the target. Credit to
  // Craig Reynolds
  PVector steer(PVector target, boolean arrival) {
    PVector steer = new PVector(); // creates vector for steering
    if (!arrival) {
      steer.set(PVector.sub(target, pos)); // steering vector points
      // towards target (switch
      // target and pos for
      // avoiding)
      steer.limit(maxSteerForce); // limits the steering force to
      // maxSteerForce
    } 
    else {
      PVector targetOffset = PVector.sub(target, pos);
      float distance = targetOffset.mag();
      float rampedSpeed = maxSpeed * (distance / 100);
      float clippedSpeed = min(rampedSpeed, maxSpeed);
      PVector desiredVelocity = PVector.mult(targetOffset,
      (clippedSpeed / distance));
      steer.set(PVector.sub(desiredVelocity, vel));
    }
    return steer;
  }

  // avoid. If weight == true avoidance vector is larger the closer the boid
  // is to the target
  PVector avoid(PVector target, boolean weight) {
    PVector steer = new PVector(); // creates vector for steering
    steer.set(PVector.sub(pos, target)); // steering vector points away from
    // target
    if (weight)
      steer.mult(1 / sq(PVector.dist(pos, target)));
    // steer.limit(maxSteerForce); //limits the steering force to
    // maxSteerForce
    return steer;
  }

  PVector seperation(ArrayList boids) {
    PVector posSum = new PVector(0, 0, 0);
    PVector repulse;
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);
      float d = PVector.dist(pos, b.pos);
      if (d > 0 && d <= neighborhoodRadius) {
        repulse = PVector.sub(pos, b.pos);
        repulse.normalize();
        repulse.div(d);
        posSum.add(repulse);
      }
    }
    return posSum;
  }

  PVector alignment(ArrayList boids) {
    PVector velSum = new PVector(0, 0, 0);
    int count = 0;
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);
      float d = PVector.dist(pos, b.pos);
      if (d > 0 && d <= neighborhoodRadius) {
        velSum.add(b.vel);
        count++;
      }
    }
    if (count > 0) {
      velSum.div((float) count);
      velSum.limit(maxSteerForce);
    }
    return velSum;
  }

  PVector cohesion(ArrayList boids) {
    PVector posSum = new PVector(0, 0, 0);
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);
      float d = dist(pos.x, pos.y, b.pos.x, b.pos.y);
      if (d > 0 && d <= neighborhoodRadius) {
        posSum.add(b.pos);
        count++;
      }
    }
    if (count > 0) {
      posSum.div((float) count);
    }
    steer = PVector.sub(posSum, pos);
    steer.limit(maxSteerForce);
    return steer;
  }
}


