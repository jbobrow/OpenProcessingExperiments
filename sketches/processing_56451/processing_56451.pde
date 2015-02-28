
//  Title: Bounce
//  Description: Demonstrates the use of a KMeans Clustering algorithm to form groups which then follow 
//  a simple flocking algorithm. A user clicks and drags to give an elliptical particles position and
//  velocity. After there are sufficient particles to form groups they flock and move about the scene.
//  Randomly a group with the minimum number of particles will attempt to steal from neighbors.
//
//  Warning: the algorithm grows with complexty O(N^2) with the number of points.
//
//  Date Started: 2012 Mar 17
//  Last Modified: 2012 Mar 18
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.
//
// Author: Robert Gilliland


float dragx = 0;
float dragy = 0;
float lastx = 0;
float lasty = 0;
float vlimitx = 0;
float vlimity = 0;
float flockSep = 5.0;
float stealStrength = 8.0;

ArrayList balls;
ArrayList kmClusters;

class Ball
{
   float cx, cy, vx, vy, rx, ry;
   int idxCluster;

   Ball(float _cx, float _cy, float _vx, float _vy)
   {
      cx = _cx;
      cy = _cy;
      vx = _vx;
      vy = _vy;
      rx = 5;
      ry = 5;
      idxCluster = -1;
   }
   
   void update()
   {
      cx += vx;
      cy += vy;
      
      // position bounds check
      if (cx < rx)
      {
         cx = rx;
         vx *= -1.0;
      }
      else if(cx > width-rx)
      {
        cx = width-rx;
        vx *= -1.0;
      }
      
      if (cy < ry)
      {
        cy = ry;
        vy *= -1.0;
      }
      else if(cy > height-ry)
      {
        cy = height - ry;
        vy *= -1.0;
      }
   }
   
  // Flocking algorithm Separation - avoid crowding neighbors (short range repulsion)
  void updateFlockSep()
  {
    // repell with reverse proportionality to distance to neighbor
    float vmag = mag(vx, vy);
    vmag = max(vmag, flockSep);
    for(int i=0; i<balls.size(); i++)
    { 
      Ball ball = (Ball) balls.get(i);
 
      if (cx!=ball.cx)
      {
        float dx = (cx - ball.cx);
        vx += vmag/(dx*abs(dx));
      }
     
      if (cy!=ball.cy)
      {
        float dy = (cy - ball.cy);
        vy += vmag/(dy*abs(dy));
      }
    }

    // renormalized to same magnitude (sudo energy conservation)
    float v2mag = mag(vx, vy);
    v2mag = max(v2mag, flockSep);
    vx = vmag * (vx/v2mag);
    vy = vmag * (vy/v2mag);
  }

  // Flocking algorithm Alignment - steer towards average heading of neighbors (velocity)
  void updateFlockAln()
  {
    if (idxCluster<0)
    {
      return;
    }
    
    KMCluster kmCluster = (KMCluster) kmClusters.get(idxCluster);
    float vx2 = vx + kmCluster.vx;
    float vy2 = vy + kmCluster.vy;
    float v2mag = mag(vx2, vy2);
   
    if (v2mag>1.0)
    {
      vx2 /= v2mag;
      vy2 /= v2mag;
      
      float vmag = mag(vx, vy);
      vx = vmag * vx2;
      vy = vmag * vy2;
    }  
  }

  // Flocking algorithm Cohesion - steer towards average position of neighbors (long range attraction)
  void updateFlockCoh()
  {
    if (idxCluster<0)
    {
      return;
    }
    
    KMCluster kmCluster = (KMCluster) kmClusters.get(idxCluster);
    float dx = kmCluster.cx - cx;
    float dy = kmCluster.cy - cy;
    
    float magD = mag(dx, dy);
    if (magD > 2.0)
    {
      dx /= magD;
      dy /= magD;
      
      cx += dx;
      cy += dy;
    }
  }
}

class KMCluster
{
  // center, velocity
  float cx, cy, vx, vy;
  int icount;
  int clr[] = new int[3];
  
  KMCluster(float _cx, float _cy, float _vx, float _vy, int r, int g, int b)
  {
    cx = _cx;
    cy = _cy;
    vx = _vx;
    vy = _vy;
    clr[0] = r;
    clr[1] = g;
    clr[2] = b;
    icount = 0;
  }
  
  void zero()
  {
    cx = 0;
    cy = 0;
    vx = 0;
    vy = 0;
    icount = 0;
  }
  
  void plus(float _cx, float _cy, float _vx, float _vy)
  {
    cx += _cx;
    cy += _cy;
    vx += _vx;
    vy += _vy;
    icount++;
  }
  
  void plus(Ball ball)
  {
    this.plus(ball.cx, ball.cy, ball.vx, ball.vy); 
  }
  
  void divall()
  {
    if (icount>0)
    {
      cx /= icount;
      cy /= icount;
      vx /= icount;
      vy /= icount;
    }
    else
    {
      // reinitialize to random
      int edge = 10;
      cx = random(edge, width-edge);
      cy = random(edge, height-edge);
    }
  }
}

void kmIterate()
{
  // partition the balls into clusters and calculate the new mean
  int len = balls.size();
  if (len < 5)
  {
    return; 
  }
  
  int clusters = kmClusters.size();
  float dist2temp;
  float dist2;
  float dist2max = 1e20; // not reachable
  
  for(int i=0; i<len; i++)
  {
    Ball ball = (Ball) balls.get(i);
    dist2 = dist2max;
    ball.idxCluster = -1;
    for(int j=0; j<kmClusters.size(); j++)
    {
      KMCluster kmCluster = (KMCluster) kmClusters.get(j);
      float dx = ball.cx - kmCluster.cx;
      float dy = ball.cy - kmCluster.cy;
      dist2temp = dx*dx + dy*dy;
      if (dist2>dist2temp)
      {
        dist2 = dist2temp;
        ball.idxCluster = j;
      }
    }
  }
  
  // finally recalculate the new cluster centroid
  for(int j=0; j<kmClusters.size(); j++)
  {
    KMCluster kmCluster = (KMCluster) kmClusters.get(j);
    kmCluster.zero();
  }
  
  for(int i=0; i<len; i++)
  {
     Ball ball = (Ball) balls.get(i);
     if (ball.idxCluster<0)
     {
       continue; 
     }
     KMCluster kmCluster = (KMCluster) kmClusters.get(ball.idxCluster);
     
     kmCluster.plus(ball);
  }
  
  for(int j=0; j<kmClusters.size(); j++)
  {
    KMCluster kmCluster = (KMCluster) kmClusters.get(j);
    kmCluster.divall();
  }
}

// Find the cluster with the least members 
int kmFindLeastPop()
{
   KMCluster kmClusterMin = (KMCluster) kmClusters.get(0);
   int idxMin = 0;
   for(int i=1; i<kmClusters.size(); i++)
   {
     KMCluster kmCluster = (KMCluster) kmClusters.get(i);
     if (kmCluster.icount < kmClusterMin.icount)
     {
       kmClusterMin = kmCluster;
       idxMin = i;
     }
   }
   return idxMin;
}

// Find closest ball to cluster and pull on it.
// return index to that ball
int kmFindClosestBall(int idxCluster)
{
  if (idxCluster<0)
  {
    return -1; 
  }
  KMCluster kmCluster = (KMCluster)kmClusters.get(idxCluster);
  
  //--- find closest target not of your cluster ---
  int targetIdx = -1;
  float targetDist2 = 1e20;
  float targetDist2Temp;
  for(int i=0; i<balls.size(); i++)
  { 
    Ball ball = (Ball) balls.get(i);
    if (ball.idxCluster==idxCluster)
    {
      continue;
    }
 
    float dx = ball.cx - kmCluster.cx;
    float dy = ball.cy - kmCluster.cy;
 
    targetDist2Temp = dx*dx + dy*dy;
    if (targetDist2>targetDist2Temp)
    {
      targetIdx = i;
      targetDist2 = targetDist2Temp;
    }
  }  
       
  // pull target ball by changing its velocity
  if (targetIdx>0)
  {
     Ball ball = (Ball) balls.get(targetIdx);
     
     float dx = kmCluster.cx - ball.cx;
     float dy = kmCluster.cy - ball.cy;
     float magD = mag(dx, dy);
     magD = max(magD, 1.0)*stealStrength ;
     ball.vx += dx/magD;
     ball.vy += dx/magD;
   }
   return targetIdx;
}

void setup()
{
  //setup the sketch parameters
  size(400, 400);
  frameRate(24);
  smooth();
  balls = new ArrayList();  // Create an empty ArrayList
  kmClusters = new ArrayList();
  
  vlimitx = width/3;
  vlimity = height/3;
  
  // set initial clusers
  kmClusters.add( new KMCluster(width/3, height/3, 0, 0, 255, 0, 0));
  kmClusters.add( new KMCluster(2*width/3, height/3, 0, 0, 0, 255, 0));
  kmClusters.add( new KMCluster(width/2, 2*height/3, 0, 0, 0, 0, 255));
}

int lenBallsLast = 0;
void draw() 
{
  background(0);
  
  //--- first update the data structures all at once ---
  int len = balls.size();
  for(int i=0; i<len; i++)
  { 
    // An ArrayList doesn't know what it is storing so we have 
    // to cast the object coming out
    Ball ball = (Ball) balls.get(i);
    
    ball.updateFlockAln();
    ball.updateFlockCoh();
    ball.updateFlockSep();
    
    ball.update();
  }
  
  //--- velocity limit remove balls ---
  int j=0;
  while(j<len)
  { 
    Ball ball = (Ball) balls.get(j);
    
    // velocity bounds check, eliminate
    if (abs(ball.vx) > vlimitx || abs(ball.vy) > vlimity)
    {
      balls.remove(j);
      len--;
    }
    else
    {
      j++;
    }
  }
  
  kmIterate();
  
  //--- debug print number of balls ---
  if (lenBallsLast!=len)
  {
    lenBallsLast=len;
    println("len balls: " + len);  
  }
  
  //--- draw drag and drop velocity line ---
  if (dragx!=lastx || dragy!=dragy)
  {
    stroke(200, 0, 155);
    int last = balls.size()-1;
    
    if (last>=0)
    {
      Ball ball = (Ball) balls.get(last);
      line(ball.cx, ball.cy, dragx, dragy);
    }
  }
  
  //--- draw balls ---
  stroke(225, 0, 0);
  fill(0, 0, 0);

  for(int i=0; i<len; i++)
  { 
    Ball ball = (Ball) balls.get(i);

    if (ball.idxCluster>=0)
    {
      KMCluster kmCluster = (KMCluster) kmClusters.get(ball.idxCluster);
      stroke(kmCluster.clr[0], kmCluster.clr[1], kmCluster.clr[2]); 
    }
    ellipse(ball.cx, ball.cy, ball.rx, ball.ry);
  }
  
  //--- display k-means clusters ---
  if (len>=5)
  {
    stroke(255, 255, 255);
    for(int i=0; i<kmClusters.size(); i++)
    {
      KMCluster kmCluster = (KMCluster) kmClusters.get(i);
      fill(kmCluster.clr[0], kmCluster.clr[1], kmCluster.clr[2]);
      ellipse(kmCluster.cx, kmCluster.cy, 10, 10);
    }
    
    // a potential target belonging to another cluster to steal ;)
    if (random(15)<1)
    {
      int idxClusterMin = kmFindLeastPop();
      int idxBallTarget = kmFindClosestBall(idxClusterMin);
      
      if (idxBallTarget>=0)
      {
        KMCluster kmCluster = (KMCluster) kmClusters.get(idxClusterMin);
        Ball ball = (Ball) balls.get(idxBallTarget);
        stroke(kmCluster.clr[0], kmCluster.clr[1], kmCluster.clr[2]);
        line(kmCluster.cx, kmCluster.cy, ball.cx, ball.cy);
      }
    }
  } // end kmeans > 5
  
  delay(100);
}

void mousePressed()
{
  lastx = mouseX;
  lasty = mouseY;
  dragx = mouseX;
  dragy = dragy;
  balls.add(new Ball(mouseX, mouseY, 0, 0));
}

void mouseDragged() 
{
  dragx = mouseX;
  dragy = mouseY;
}

void mouseReleased()
{
  lastx = dragx;
  lasty = dragy;
  int last = balls.size()-1;
  if (last>=0)
  {
    Ball ball = (Ball) balls.get(last);
    ball.vx = (ball.cx - mouseX) / 4.0;
    ball.vy = (ball.cy - mouseY) / 4.0; 
  }
}

