
import oscP5.*;
import netP5.*;//get osc going
OscP5 oscP5;
NetAddress myRemoteLocation;///declare osc listener
int KinectRefreshCounter;
float torsoX, torsoY, torsoZ, headX, headY, headZ, lhX, lhY, lhZ, rhX, rhY, rhZ;//kinect points to track

float clapVelocity;
PVector prevLH = new PVector();
PVector prevRH = new PVector();
PVector LHvel = new PVector();
PVector RHvel = new PVector();
PVector combinedClapVelocity = new PVector();

int numParts = 60000;

int FR = 40;//framerate
int simPF = 10;////Simulations Per Frame
float h = 1.0/((float)FR * (float)simPF); ///our timestep
//camera variables
float xmag, ymag = 0;////vector ends for camera movement
float newXmag, newYmag = 0;
//////////////////////////
///particle variables////
PVector indeGrav = new PVector();//uniform for all particles here
float aResist;// uniform for all particles here
PVector[] acceleration;
PVector[] location;
PVector[] prevLocation;
PVector[] prevLocation2;
PVector[] velocity;
PVector[] prevVelocity;
PVector[] prevVelocity2;
int[] age = new int[numParts];
boolean[] active = new boolean[numParts];
float[] mass = new float[numParts];
float[] elast = new float[numParts];
float[] fric = new float[numParts];
float[] colorR = new float[numParts];
float[] colorG = new float[numParts];
float[] colorB = new float[numParts];
//no double clap counter
int clapped = 1;
//array index counter
int Pindex = 0;




///////////////////////////
//////////////////////////collision function variables
float prevDistToPlane;
float distToPlane;
float fractionToCollision;
float nrmlVComponent;

float largestComponent;
char largestComponentChar;
int collapsedIntersectionCount;

PVector boundsTestLoc = new PVector();
PVector boundsTestAdder = new PVector();
PVector tangVelocityTemp = new PVector();//temporary pvector for the tangental part of the vel
PVector tempNorm = new PVector();//to store the normal aspect of the collision
PVector bouncedPosition = new PVector();
PVector VsubN = new PVector();//holder for the result

PVector collapsedP1 = new PVector();
PVector collapsedP2 = new PVector();
PVector collapsedP3 = new PVector();
PVector collapsedCollisionPoint = new PVector();

/////////////////////////////
////////////////////////////particle update variables
PVector acc = new PVector();
PVector scRes = new PVector();
PVector tempvel = new PVector();

triAngle tri;
vortex vtx;
//particle part;//were doing this unwrapped, remember?

PVector testTorsoLoc = new PVector();
PVector testHeadLoc = new PVector();
PVector LeftHand = new PVector();
PVector RightHand = new PVector();

void setup()
{
  oscP5 = new OscP5(this, 12345);
  myRemoteLocation = new NetAddress("127.0.0.1", 12346);
  int KinectRefreshCounter=0;//we have to refresh synnapse every while and then
  
  //the PVector inits
  acceleration = new PVector[numParts];
  location = new PVector[numParts];
  prevLocation = new PVector[numParts];
  prevLocation2 = new PVector[numParts];
  velocity = new PVector[numParts];
  prevVelocity = new PVector[numParts];
  prevVelocity2 = new PVector[numParts];
  
  ///set up all of the particle arrays! here we go!///
  //gravity
  indeGrav.set(0.0, 0.0, -600.0);
  
  //aResist
  aResist = -0.50;
  
  for(int i = 0; i < numParts; i++)
  {
    age[i] = 0;
  }
  
  //active
  for(int i = 0; i < numParts; i++)
  {
    active[i] = false;
  }
  
  //mass
  for(int i = 0; i < numParts; i++)
  {
    mass[i] = random(1)+0.5;
  }
  
  //elasticity
  for(int i = 0; i < numParts; i++)
  {
    elast[i] = random(1) + 0.4;  
  }
  
  //friction
  for(int i = 0; i < numParts; i++)
  {
    fric[i] = random(1)/4.0;
  }
  
  //acceleration
  for(int i = 0; i < numParts; i++)
  {
    acceleration[i] = new PVector(); 
  }
  
  //location
  for(int i = 0; i < numParts; i++)
  {
    location[i] = new PVector();  
  }
  
  //prevLocation
  for(int i = 0; i < numParts; i++)
  {
    prevLocation[i] = new PVector(); 
  }
  
  //prevLocation2
  for(int i = 0; i < numParts; i++)
  {
    prevLocation2[i] = new PVector();
  }
  
  //velocity
  for(int i = 0; i < numParts; i++)
  {
    velocity[i] = new PVector();
  }
  
  //prevVelocity
  for(int i = 0; i < numParts; i++)
  {
    prevVelocity[i] = new PVector();
  }
  
  //prevVelocity2
  for(int i = 0; i < numParts; i++)
  {
    prevVelocity2[i] = new PVector();
  }
  
  //
 
  testHeadLoc.set(headX, -headY*2, headZ/3-100);
  //
  size(1280, 800, P3D);
  smooth();
  frameRate(FR);
  lights();
 
 tri = new triAngle(); 
 vtx = new vortex();
}

void draw()//>DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDrawl
{
 KinectRefreshCounter++;//////////////////////////
 KinectRefreshCounter = KinectRefreshCounter%20;//60 frames in 2 seconds, refresh synapse
 
 if(KinectRefreshCounter == 0)////////////////////
 {
   OscMessage trackTorso = new OscMessage("/torso_trackjointpos");
   trackTorso.add(2); /* add an int to the osc message */
     oscP5.send(trackTorso, myRemoteLocation);
     
   OscMessage trackHead = new OscMessage("/head_trackjointpos");  
   trackHead.add(1);
     oscP5.send(trackHead, myRemoteLocation);

   OscMessage trackLH = new OscMessage("/lefthand_trackjointpos");
   trackLH.add(1);
     oscP5.send(trackLH, myRemoteLocation);

   OscMessage trackRH = new OscMessage("/righthand_trackjointpos");
   trackRH.add(1);
     oscP5.send(trackRH, myRemoteLocation);
 }/////////////////////////////////////////////////
  testHeadLoc.set(headX, -headY + 500, headZ/3+100);
  
  prevLH.set(LeftHand.x, LeftHand.y, LeftHand.z);
  prevRH.set(RightHand.x, RightHand.y, RightHand.z);
  
  LeftHand.set(lhX, lhY, lhZ);
  RightHand.set(rhX, rhY, rhZ);
  
  //change aResist and indeGrav
  aResist = map(rhY, -500.0, 500.0, -5.0, 0.0);
  vtx.setG( map(rhY, -500.0, 500.0, 95000, 0) );  
 
  h = 1.0/((float)FR*(float)simPF); ///our timestep for the simulation
  
  
  //also if you "clap"!!!!
  if(abs(lhX - rhX) < 90 && abs(lhY - rhY) < 90 && abs(lhZ - rhZ) < 90)
  {
    if(clapped == 0)
    {
      LHvel.sub(LeftHand, prevLH, LHvel);
      RHvel.sub(RightHand, prevRH, RHvel);
      combinedClapVelocity.add(LHvel, RHvel, combinedClapVelocity);
      clapVelocity = combinedClapVelocity.mag();
      println("the clapVelocity is " + clapVelocity);
      generate((int)clapVelocity);
      clapped = 1;
    }
  }
  else if(abs(lhX - rhX) > 90 && abs(lhZ - rhZ) > 90)
  {
    clapped = 0;
  }
  
  if (keyPressed) {
    if (key == 'p' || key == 'P') 
      {
        if(clapped == 0)
        {
          generate();
          //println("PpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpPpP");
          clapped = 1;
        }
      }  
  }
  ///unClap is in keyReleased()
  
                                                                          //<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//
  for(int step = 0; step < simPF; step++)
  { 
     vtx.setLocation(testHeadLoc);
     tri.update(testTorsoLoc, LeftHand, RightHand);
     
     collisions();////////////<><><><><><>??needs re-writing with a for loop
     updateParts();//////////<><><><><><>??needs re-writing with a for loop on this tab!!//do gravity here!!!!!!!!!!!!!!!!!!!!!!!!!
     collisions(); 
  }
  
  /*//check the kinect stuff
  println("the torso position is: " + torsoX + " " + torsoY + " " + torsoY);
  println("the head position is: " + headX + " " + headY + " " + headZ);
  println("the left hand position is: " + lhX + " " + lhY + " " + lhZ);
  println("the right hand position is: " + rhX + " " + rhY + " " + rhZ);
  */
  
  background(180);
  lights();
  lightFalloff(1.0, 1.0, 10.0);
  rotatectrl();
  //orb.display();
  tri.display();
  

  displayParts();
  noStroke();
 //stroke(random(255), random(255), random(255), 10);

translate(testHeadLoc.x, testHeadLoc.y, testHeadLoc.z); 
 fill(100+random(255), 100+random(255), 100+random(255), 10);
 sphereDetail(30, 30);
 sphere(25+random(10));
 fill(100+random(255), 100+random(255), 100+random(255), 10);
 sphereDetail((int)random(30), (int)random(30));
  sphere(random(6));

}

///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////

///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////

///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////

///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////

///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
void collisions()
{//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
///////////////////<><><><><><><><><><<>(starting here)<><><><><><><><><><><>//////////////////////
///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
///////////////////<><><><><><><><><><><><><><><><><><><><><><><><><><><><><>//////////////////////
for(int w = 0; w<numParts; w++)
{
  if(active[w])
  {
 //println("checking collisions");
 prevDistToPlane = prevLocation[w].dot(tri.nrml) - tri.d; 
 distToPlane = location[w].dot(tri.nrml) - tri.d;
 //println( "right after the particle update the particle's position is: " + part.location);

 if(prevDistToPlane*distToPlane <= 0)//we found the distances of the particle from the triangle's plane at the current and prev step, now see if on opposite sides
 {
   //println("A COLLISION IS HAPPENING.");
   
   fractionToCollision = prevDistToPlane / (prevDistToPlane - distToPlane); 
   //println(fractionToCollision + " is the fraction of that timestep before the collision");
   boundsTestLoc.set(prevLocation[w]);//STORE POSITION SO WE CAN ADD FRACTIONAL VELOCITY
   boundsTestAdder.set(velocity[w]);
   boundsTestAdder.mult(h*fractionToCollision);//fraction of the velocity step to collision from prevLocation
   boundsTestLoc.add(boundsTestAdder);///move to the plane!!
   
   if(inBounds(boundsTestLoc, tri))
   {
   //check to see that boundsTestLoc is on the plane!!! //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//<><><><><><><><><><><><><><_-_-_-_-_-_-_-_-_-_><><><><><><><><><><><><><><>//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
   //but moving on://%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%// 
   //println("we're going to move the particle back by: " + boundsTestAdder);   
   /*
   PVector checkP1 = new PVector();///////////more checks
   checkP1.set(boundsTestLoc);
   float check = checkP1.dot(t.nrml) - t.d;
   println("the normal is " + t.nrml);
   println("the distance of plane to origin is " + t.d);
   println("the points of the triangle are " + t.p1 + " " + t.p2 + " " + t.p3);
   println("the position of the collision check particle position is " + boundsTestLoc);
   println("is the collision point on the triangle?????: " + check);
   println("the particle is at: " + p.location);
   println("prevDistToPlane is " + prevDistToPlane);
   println("prevDistToPlane - distToPlane is " + (prevDistToPlane - distToPlane));
   
   println("distToPlane is " + distToPlane);
   */
   
   
   tempNorm.set(tri.nrml);
   tempNorm.mult((1+elast[w])*distToPlane);// 1 plus the elasticity * dist to plane will replace us at the wall and then bounce (we still haven't moved the particle back from the wall)
   bouncedPosition.set(location[w]);///about to bounce....
   //println("the POSITION RIIIGHT BEFORE THE BOUNCE IS: " + p.location);
   bouncedPosition.sub(tempNorm);///move the position back from the bounce
   //println("the bounce sets the ball at " + bouncedPosition);
   location[w].set(bouncedPosition);///set the particle's position!
   
   
   ////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%////updating velocity now//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
   
   tangVelocityTemp.set(velocity[w]);//set this up before we get the normal vel
   nrmlVComponent = velocity[w].dot(tri.nrml);// .dot() method returns a float......
   VsubN.set(tri.nrml);//prepare it with the triangle normal
   VsubN.mult(nrmlVComponent);//make a vector the size of the particles velocity in the normal direction of the plane!
   tangVelocityTemp.sub(VsubN);//isolate the tangential part of the particle's velocity
   VsubN.mult(-elast[w]);//reverse the particles velocity across the direction of the triangle
   tangVelocityTemp.mult(1-fric[w]);//reduce the tangential part of the velocity by friction coeff.
   tangVelocityTemp.add(VsubN);//recombine the tangential and normal aspects of the particle's velocity
   
   velocity[w].set(tangVelocityTemp);//////%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//SET THE VELOCITY OF THE PARTICLE TO NEW STATE
   
   
   //println("the timestep is " + h);
   //println("right after the collision function, the particle's position is: " + part.location);
  }
 }
  }//end of if(active)
}

}


boolean inBounds(PVector p, triAngle t)///called from within collisions()
{
  largestComponent = 0.0;
  largestComponentChar = 'x';
  if(abs(t.nrml.x) > largestComponent)
  {
    largestComponent = t.nrml.x;
  }
  if(abs(t.nrml.y) > largestComponent)
  {
    largestComponent = t.nrml.y;
    largestComponentChar = 'y';
  }
  if(abs(t.nrml.z) > largestComponent)
  {
    largestComponent = t.nrml.z;
    largestComponentChar = 'z';
  }
  
  switch(largestComponentChar)
  {
    case 'x'://z becomes x, y is y
    collapsedP1.set(t.p1.z, t.p1.y, 0);
    collapsedP2.set(t.p2.z, t.p2.y, 0);
    collapsedP3.set(t.p3.z, t.p3.y, 0);
    collapsedCollisionPoint.set(p.z, p.y, 0);
    break;
    case 'y'://x is x, z becomes y
    collapsedP1.set(t.p1.x, t.p1.z, 0);
    collapsedP2.set(t.p2.x, t.p2.z, 0);
    collapsedP3.set(t.p3.x, t.p3.z, 0);
    collapsedCollisionPoint.set(p.x, p.z, 0);
    break;
    case 'z'://x is x, y is y
    collapsedP1.set(t.p1.x, t.p1.y, 0);
    collapsedP2.set(t.p2.x, t.p2.y, 0);
    collapsedP3.set(t.p3.x, t.p3.y, 0);
    collapsedCollisionPoint.set(p.x, p.y, 0);
    break;
    default:
    break;
  }
  
  collapsedIntersectionCount=0;

  
  if((collapsedCollisionPoint.y-collapsedP1.y)*(collapsedCollisionPoint.y-collapsedP2.y) < 0)
  {
    if(  ((collapsedCollisionPoint.y - collapsedP1.y)/(collapsedP2.y - collapsedP1.y)*(collapsedP2.x - collapsedP1.x)+collapsedP1.x) >= collapsedCollisionPoint.x)
    {
      collapsedIntersectionCount++;
    }   
  }
  if((collapsedCollisionPoint.y-collapsedP2.y)*(collapsedCollisionPoint.y-collapsedP3.y) < 0)
  {
    if(  ((collapsedCollisionPoint.y - collapsedP2.y)/(collapsedP3.y - collapsedP2.y)*(collapsedP3.x - collapsedP2.x)+collapsedP2.x) >= collapsedCollisionPoint.x)
    {
      collapsedIntersectionCount++;
    }
  }
  if((collapsedCollisionPoint.y-collapsedP3.y)*(collapsedCollisionPoint.y-collapsedP1.y) < 0)
  {
    if(  ((collapsedCollisionPoint.y - collapsedP3.y)/(collapsedP1.y - collapsedP3.y)*(collapsedP1.x - collapsedP3.x)+collapsedP3.x) >= collapsedCollisionPoint.x)
    {
      collapsedIntersectionCount++;
    }
  } 
  
  if(collapsedIntersectionCount%2 == 1)
  {
    return true;
  }
  else
  {
    return false;
  }
 
}

void generate()
{
  for(int e = 0; e < 537; e++)
  {
   Pindex++; 
   Pindex = Pindex% numParts;
   if(!active[Pindex])
   { location[Pindex].set(testHeadLoc);
     prevLocation[Pindex].set(testHeadLoc);
     prevLocation2[Pindex].set(testHeadLoc);
     
     active[Pindex] = true;
     
     velocity[Pindex].set(random(1000)-500,random(1250)-350,random(700)-350);
     colorR[Pindex] = velocity[Pindex].x;
     colorG[Pindex] = velocity[Pindex].y;
     colorB[Pindex] = velocity[Pindex].z;
     age[Pindex] = 0;    
   }
   
   
  }
}

void generate(int amt)
{
  for(int e = 0; e < amt*3; e++)
  {
   Pindex++; 
   Pindex = Pindex% numParts;
   if(!active[Pindex])
   { location[Pindex].set(testHeadLoc);
     prevLocation[Pindex].set(testHeadLoc);
     prevLocation2[Pindex].set(testHeadLoc);
     
     active[Pindex] = true;
     
     velocity[Pindex].set(random(1000)-500,random(1250)-350,random(700)-350);
     colorR[Pindex] = velocity[Pindex].x;
     colorG[Pindex] = velocity[Pindex].y;
     colorB[Pindex] = velocity[Pindex].z;
     age[Pindex] = 0;    
   }
   
   
  }
}


void displayParts() 
 {
   for(int u = 0; u < numParts; u++)
   {
     if(active[u] ==true)
     {
       strokeWeight(7);
       stroke(colorR[u], colorG[u], colorB[u], 255-(age[u]/10) );
       //noStroke();
       line(prevLocation[u].x+velocity[u].x*0.07, prevLocation[u].y+velocity[u].y*0.07, prevLocation[u].z+velocity[u].z*0.07, location[u].x, location[u].y, location[u].z);
     }
   }
 }

 void updateParts()
 {
   
   //println(vtx.vortexForce(location[1], mass[1]));
  for(int s = 0; s < numParts; s++)
  {
   age[s]++;
   
   if(age[s] >= 2550)
   {
     active[s] = false;
     
   }
   
    
   if(active[s] == true)
   {
     acc.set(indeGrav);
    acc.add(vtx.vortexForce(location[s], mass[s]));//add in any other forces
    // println("the velocity of teh particle is: " + velocity[s]);
     
     scRes.set(velocity[s]);
     scRes.mult(aResist);
   
     acc.add(scRes);
   
     prevVelocity2[s].set(prevVelocity[s]);
     prevLocation2[s].set(prevLocation[s]);
     prevVelocity[s].set( velocity[s] );
     prevLocation[s].set(location[s]);////make duplicates before changing to new state

     
     tempvel.set(velocity[s]);
     acc.mult(h);
     tempvel.add(acc);
   
     velocity[s].set(tempvel);
     tempvel.mult(h);
     location[s].add(tempvel);
   }
  } 
 }

void keyReleased()
{
  if (key == 'p' || key == 'P')
  {
    clapped = 0;
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) 
{
  
 if(theOscMessage.checkAddrPattern("/torso_pos_world")==true) 
 {
       torsoX = theOscMessage.get(0).floatValue();
       torsoY = theOscMessage.get(1).floatValue();
       torsoZ = theOscMessage.get(2).floatValue();
 }
 if(theOscMessage.checkAddrPattern("/head_pos_body")==true) 
 {
       headX = theOscMessage.get(0).floatValue();
       headY = theOscMessage.get(1).floatValue();
       headZ = theOscMessage.get(2).floatValue();
 }  
 if(theOscMessage.checkAddrPattern("/lefthand_pos_body")==true) 
 {
       lhX = theOscMessage.get(0).floatValue();
       lhY = theOscMessage.get(1).floatValue();
       lhZ = theOscMessage.get(2).floatValue();
 } 
 if(theOscMessage.checkAddrPattern("/righthand_pos_body")==true) 
 {
       rhX = theOscMessage.get(0).floatValue();
       rhY = theOscMessage.get(1).floatValue();
       rhZ = theOscMessage.get(2).floatValue();
 }  
}

void rotatectrl()
{
    camera(0, 0, 900, 0, 0, 0, 0, 0.5, -1);
    translate(0, 0, 0);
   
  newXmag = torsoX/5000 * TWO_PI;//mousex and y changed from....
  newYmag = -headZ/3000 * TWO_PI;
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) {
    xmag -= diff/4.0;
  }
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) {
    ymag -= diff/4.0;
  }
  rotateX(-ymag);
  rotateY(-xmag);
}



