
/*
    This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.*/

int nSteps = 1000;
ArrayList harmonicList = new ArrayList<Harmonic>();

void setup()
{
 size(800, 600); 
 Spring s = new Spring( width/2, height/2, width/2+100, height/2, 0.0001, 10^50);
 Spring s1 = new Spring( width/2, height/2, width/2-100, height/2+100, 0.0001, 10^50);
 harmonicList.add(s);
 harmonicList.add(s1);

 HardPendulum h = new HardPendulum(width/2, height/2, width/2, height/2+100, 10^50);
 harmonicList.add(h);
 rectMode(CENTER);
}

void draw()
{
  background(0);
  moveAllHarmonics();
  drawAllHarmonics();
}

PVector hat( PVector input )
{
 PVector returnMe = input.get();
 returnMe.mult(1/returnMe.mag());
 return returnMe; 
}

PVector getGravitationalField( PVector pos )
{
 int numItems = harmonicList.size();
 PVector field = new PVector(0,0);
 float mass;
 PVector otherPos, r, rhat;
 for( int i = 0; i < numItems; i ++ )
 {
   mass = ((Harmonic)harmonicList.get(i)).mass;
   otherPos = ((Harmonic)harmonicList.get(i)).pos;
   r = otherPos.get();
   r.sub(pos);
   /*If this is an object that's REALLY close skip it so we don't have integration problems*/
   if( r.mag() < 5 )
     continue;
     
   rhat = hat(r);
   rhat.mult(-mass / (r.mag()*r.mag()));
   field.sub( rhat );
 } 
 
 return field;
}

class Harmonic
{
  PVector pos, vel, accel;
  float mass;  
  boolean isClicked; //lets you move the bob
  public void move()
  {
  }
  public void drawSelf()
  {
  }
}

class HardPendulum extends Harmonic
{
 PVector pivot;
 float cordLen; //This is the distance the pendulum is restricted to being from the pivot 
 boolean pivotClicked;
 float theta; //Angle made with the vertical.
 float theta_dot; //rate of change of theta
 
 HardPendulum( float pivotX, float pivotY, float x, float y, float mass )
 {
  pivot = new PVector(pivotX, pivotY);
  pos = new PVector(x ,y);
  this.mass = mass;
  vel = new PVector(0,0);
  accel = new PVector(0,0); 
  cordLen = dist( pivotX, pivotY, x, y );
  
  theta_dot = 0.0;
  /* Figure out theta now*/
  if(pos.y < pivot.y)
    theta = atan((pos.x-pivot.x)/(pos.y-pivot.y));
  else if(pivot.x < pos.x)
    theta = PI/2 + atan((pivot.y-pos.y)/(pos.x-pivot.x));
  else
    theta = -PI/2 - atan((pivot.y-pos.y)/(pivot.x-pos.x));
 }
 
 void move()
 {
   float theta_dot_dot; //Angular accelleration
   float down;
   accel.set(getGravitationalField(pos));
   /*calculate where "down" is*/
   down = theta - atan2(accel.y, accel.x);
   
   theta_dot_dot = -1*accel.mag()/cordLen*sin(down);
   theta_dot = theta_dot + theta_dot_dot;
   theta = theta + theta_dot;
   pos.set( pivot.x + cordLen*sin(theta), pivot.y + cordLen*cos(theta));
 }
 
 void drawSelf()
 {
   stroke(155,235,11);
   line(pos.x, pos.y, pivot.x, pivot.y);
   fill(0, 155, 235);
   stroke(0);
   rect(pos.x, pos.y, 10, 10);
 }
}

class SoftPendulum extends Harmonic
{
 PVector pivot;
 float cordLen; //This is the distance the pendulum is restricted to being from the pivot 
 boolean pivotClicked;
 
 SoftPendulum( float pivotX, float pivotY, float x, float y, float mass )
 {
  pivot = new PVector(pivotX, pivotY);
  pos = new PVector(x ,y);
  this.mass = mass;
  vel = new PVector(0,0);
  accel = new PVector(0,0); 
  cordLen = dist( pivotX, pivotY, x, y );
 }
 
 void move()
 {
   accel.set(getGravitationalField(pos));
   float gravDotNorm;
   float radialVel;
   PVector PVectorNorm = pos.get();
   PVectorNorm.sub(pivot);
   PVectorNorm.rotate(PI/2);
   //print(PVectorNorm.y+"\n");
   /*
   PVectorNorm = hat( PVectorNorm );
 //  print(PVectorNorm.x+"\n");
   gravDotNorm = PVectorNorm.dot(gravField);
  // print(gravField.x+"\n");
   PVectorNorm.mult(gravDotNorm);
  // print(PVectorNorm.x+"\n");
   accel.set(PVectorNorm);
   accel.mult(10000);*/
   if( dist(pos.x, pos.y, pivot.x, pivot.y) > cordLen )
   { 
    /* Find the unit normal vector pointing 90 degrees out from the pivot->bob vector*/
    PVectorNorm = hat( PVectorNorm );
    PVectorNorm.rotate(PI/2);
    /* Find the velocity in this vector*/
    radialVel = vel.dot(PVectorNorm);
    
    /*Rotate this vector back*/
    PVectorNorm.rotate(PI/2);
    PVectorNorm.mult(pow(radialVel,2)/cordLen); 
  
    accel.add( PVectorNorm );
   
    vel.add(accel.x/nSteps, accel.y/nSteps, 0);
    pos.add(vel.x/nSteps, vel.y/nSteps, 0);
   } 
 }
 void drawSelf()
 {
   stroke(155,235,11);
   line(pos.x, pos.y, pivot.x, pivot.y);
   fill(0, 155, 235);
   stroke(0);
   rect(pos.x, pos.y, 10, 10);
 }
}

class Spring extends Harmonic
{
 float constant, amp;
 PVector equi;
 boolean equiClicked; // lets you move both the equilibrium
  
 Spring( float equiX, float equiY, float x, float y, float constant, float mass)
 {
   pos = new PVector(x,y);
   equi = new PVector(equiX, equiY);
   vel = new PVector(0,0);
   accel = new PVector(0,0);  
   this.constant = constant;
   this.mass = mass;
   isClicked = false;
   equiClicked = false;
 }
 
 public void move()
 {
   PVector distanceVec;
   for( int i = 0; i < nSteps; i ++ )
   {
      accel.set(0,0);
      /*Get spring acceleration, distance vector from the equi to the bob times -k*/
     distanceVec = pos.get();
      distanceVec.sub(equi);
      distanceVec.mult(-constant*distanceVec.mag());
      accel = distanceVec.get();
      
      /*Get gravitational acceleration*/
      accel.add(getGravitationalField(pos));
    //  print(getGravitationalField(pos).x+"\n");
      vel.add(accel.x/nSteps, accel.y/nSteps, 0);
      pos.add(vel.x/nSteps, vel.y/nSteps, 0); 
   }
 }

  void drawSelf()
 {
   stroke(100,20,244);
   line(pos.x, pos.y, equi.x, equi.y);
   fill(255, 100, 20);
   stroke(0);
   rect(pos.x, pos.y, 10, 10);
 }
}

 void moveAllHarmonics()
 {
  int s = harmonicList.size();
  for( int i = 0; i < s; i ++ )
  {
   ((Harmonic)(harmonicList.get(i))).move();
  } 
 }
 
 void drawAllHarmonics()
 {
  int s = harmonicList.size();
  for( int i = 0; i < s; i ++ )
  {
    ((Harmonic)(harmonicList.get(i))).drawSelf();
  } 
 }

