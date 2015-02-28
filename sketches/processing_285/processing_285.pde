
class Attractor 
{ 
  Vec pos = new Vec(0,0,0); // current point position of attractor NOT A VECTOR
  Vec dir; // movement vector for attractor
  int atrType; // national or foreigner attractor type
  int xdirection = 2;  // Left or Right
  int ydirection = 2;  // Up or Down
  int numPart = 0; // number of particles engaged to static, incremented in particle class
  int snapCounter=0; // counts time while particle outside of moving aoe for snapping to particle and changing vector, incremented in particle class
  int snapCount=0; // number of snaps a static attractor has caused, helps determine moving atr deflection
  int totalSnapCount=0; // total number of snaps moving atr has experienced, helps determine when a pairing leaves the sketch and is "reborn" 
  int rebornCounter=0; // counts how long a pair has moved off screen before resetting it to start conditions

  boolean particle2moving = true; // swaps attraction between particle and moving attractor
  boolean moving; // true = moving, false = static
  float aoeAtr; // max distance for child particle to move in before moving particle changes vector
  float vel; // velocity of movement

  float [] staticSnapCount = new float[NUM_STATIC]; // each moving atr stores an array associated to number of static atr


  color c; // attractor color
  color c1, c2; // lerping colors

  Attractor(float X, float Y, Vec startDir, int moveType, float _vel)  
  { 
    pos.x = X; 
    pos.y = Y;
    dir = startDir;
    atrType = moveType;
    vel=_vel;

    switch(atrType)
    {
    case 0: // national
      aoeAtr=350; // distance after which moving atr (adult) follows particle (child)
      c = color(255,0,0); // red
      moving=true;
      c1= color(200,0,0); // dark red
      c2= color(255,255,25); //yellow
      break;
    case 1: // foreign
      aoeAtr=160; // distance after which moving atr (adult) follows particle (child)
      c = color(0,255,0); // green
      moving=true;
      c1= color(160,0,160); // dark purple
      c2= color(0,255,255); //aquamarine
      break;
    case 2: // static
      aoeAtr=0; // static, no such aoe variable
      c = color(0); 
      moving=false;
      break;
    }

    for(int j=0; j<staticSnapCount.length;j++) // give staticAttracted array null values
    {
      staticSnapCount[j] = 0; 
    }  
  } 

  ///////////////////////////// draw attractor (desired color, moving or not)
  void drawAtr()
  { 
    if(visualSwitch==false)
    {
      stroke(c);
      line(pos.x-4, pos.y, pos.x+4, pos.y); 
      line(pos.x, pos.y-4, pos.x, pos.y+4);
    }
    if(moving==false)
    {
      noFill();
      stroke(0,numPart*20);
      rectMode(CENTER);
      rect(pos.x, pos.y,8+numPart*5,8+numPart*5); 
    }

    if(moving==true && visualSwitch==false)
    {
      if(atrType==0)
      {
        noFill();
        stroke(c,66);
        ellipse(pos.x, pos.y, aoeAtr, aoeAtr);
      }
      else if(atrType==1)
      {
        noFill();
        stroke(c,66);
        ellipse(pos.x, pos.y, aoeAtr, aoeAtr);
      }
    }
  } 

  ///////////////////////////// moving attractor on vector, bounce off edges, and deflect off statics
  void stepAtr()
  {
    for(int i=0;i<staticAtr.length;i++)
    {
      float d1=pos.distance(staticAtr[i].pos);
      if(d1<aoeAtr/2 && staticSnapCount[i]>0)
      {
        dir.normalize(); // normalize movement vector, just a direction now
        float ny= (pos.y-staticAtr[i].pos.y)/d1; // normalize vector to static atr
        float nx= (pos.x-staticAtr[i].pos.x)/d1; // ^^

        float a1=atan2(nx,ny); // calculate angle to static atr
        float a2=atan2(dir.x, dir.y); // calculate angle of movement
        //println(a2);
        float newA=a1-a2; // difference between two angles

        if(newA>=0)
        {
          a2 += radians(staticSnapCount[i]*1);
        }
        else if(newA<0)
        {
          a2 -= radians(staticSnapCount[i]*1);
        }
        dir.rotateVec(a2);
      }
    }
    pos.x += dir.x*vel;
    pos.y += dir.y*vel;

    if (pos.x > width || pos.x < 0)
    {
      if(totalSnapCount<3) dir.x *= -1;
      else rebornCounter++; 
    }
    if (pos.y > height || pos.y < 0)
    {
      if(totalSnapCount<3) dir.y *= -1;
      else rebornCounter++; 
    }

  }

  ///////////////////////////// when snap occurs and moving atr follows particle
  void attractAtr(Particle pW)
  {
    float d2=pos.distance(pW.pos); // always calculate associated child particle distance
    float tempX = pW.pos.x;
    float tempY = pW.pos.y;
    pos.x += 1.8 * (tempX-pos.x) / d2; // smaller divider number stronger force of attraction
    pos.y += 1.8 * (tempY-pos.y) / d2; 

    if(visualSwitch==false)
    {
      stroke(255,255,0);
      line(pos.x, pos.y, pW.pos.x, pW.pos.y); 
    }
  }

  void drawSnap(int i)
  {
    for(int k=0; k<10; k++)
    {
      stroke(0, (k+1)*10);
      strokeWeight(totalSnapCount+1);
      fill(255,66);
      ellipse(pos.x, pos.y, aoeAtr/2-(k*(aoeAtr/20)), aoeAtr/2-(k*(aoeAtr/20)));  
      strokeWeight(1);
    }
    stroke(255);
    strokeWeight(2);
    line(pos.x, pos.y, p[i].pos.x, p[i].pos.y);
    strokeWeight(1);
  }

  ///////////////////////////// increments values for which static atr have caused snaps
  void updateStaticSnap(int [] update, float amount)
  {
    for(int i=0; i<update.length; i++)
    {
      if(update[i]>=0) staticSnapCount[update[i]] += amount;
    }
    //println(staticSnapCount);
  }

} 

