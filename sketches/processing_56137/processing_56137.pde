
class Entity
{
  PVector mPosition;
  PVector mVelocity;
  PVector mAcceleration;
  
  float mSize;
  float mSpeed;
  float mMaxForce;
  
  GridCase mLastCase; // dernière case dans laquelle le boid est enregistré (ou null si aucune)
 
  public boolean isLeader;
  
  ArrayList[] mCaseList;
  ArrayList[] mObstacleCase;
  
  //----------------------
  
  public Entity(PVector pPosition)
  {
    mCaseList = new ArrayList[9];
    mObstacleCase = new ArrayList[2];
    
    mPosition = pPosition;
    mVelocity = new PVector(random(2.0f) - 1, random(2.0f) - 1);
  
    mAcceleration = new PVector(0, 0);
    
    mSize = 1;
    mSpeed = 2;
    mMaxForce = 0.08;
    
    isLeader = false;
    
    mLastCase = null;
    
    registerInGrid();
  }
  
  //---------------------------------------------------------------------------------
  
  
  public void retrieveNextCase()
  {
    int idxX = min((int)mPosition.x / (int)terrain.getSizeX(), terrain.getNbX() - 1);
    int idxY = min((int)mPosition.y / (int)terrain.getSizeY(), terrain.getNbY() - 1);
    
    //*****
    
    int idxXMinus = idxX - 1;
    if(idxXMinus < 0)
      idxXMinus = terrain.getNbX() - 1;
      
    int idxXPlus = idxX + 1;
    if(idxXPlus > terrain.getNbX() - 1)
      idxXPlus = 0;
      
    int idxYMinus = idxY - 1;
    if(idxYMinus < 0)
      idxYMinus = terrain.getNbY() - 1;
      
    int idxYPlus = idxY + 1;
    if(idxYPlus > terrain.getNbY() - 1)
      idxYPlus = 0;
      
    //*****
    
    mCaseList[0] = terrain.getCase(idxX, idxY).getEntities();
    mCaseList[1] = terrain.getCase(idxXMinus, idxY).getEntities();
    mCaseList[2] = terrain.getCase(idxX, idxYPlus).getEntities();
    mCaseList[3] = terrain.getCase(idxXPlus, idxY).getEntities();
    mCaseList[4] = terrain.getCase(idxX, idxYMinus).getEntities();
    mCaseList[5] = terrain.getCase(idxXMinus, idxYMinus).getEntities();
    mCaseList[6] = terrain.getCase(idxXMinus, idxYPlus).getEntities();
    mCaseList[7] = terrain.getCase(idxXPlus, idxYMinus).getEntities();
    mCaseList[8] = terrain.getCase(idxXPlus, idxYPlus).getEntities();
    
    mObstacleCase[0] = terrain.getCase(idxX, idxY).getObstacle();
    
    PVector lNextPos = PVector.add(mPosition, PVector.mult(mVelocity, 50));
    int idxXNext = min((int)lNextPos.x / (int)terrain.getSizeX(), terrain.getNbX() - 1);
    int idxYNext = min((int)lNextPos.y / (int)terrain.getSizeY(), terrain.getNbY() - 1);
    
    if(idxXNext < 0)
      idxXNext = terrain.getNbX() - 1;
    else if(idxXNext > terrain.getNbX() - 1)
      idxXNext = 0;
      
    if(idxYNext < 0)
      idxYNext = terrain.getNbY() - 1;
    else if(idxYNext > terrain.getNbY() - 1)
      idxYNext = 0;
    
    mObstacleCase[1] = terrain.getCase(idxXNext, idxYNext).getObstacle();
  }
  
  
  //---------------------------------------------------------------------------------
  
  public void flockingUpdate(ArrayList pEntityGroup)
  {
    mSpeed = gSpeed;
    
    retrieveNextCase();
    
    PVector lSeparation = separation(pEntityGroup);
    PVector lObstacle = obstacleAvoiding();
    PVector lAlignement = alignement(pEntityGroup);
    PVector lCohesion = cohesion(pEntityGroup);
    
    if(isLeader)
    {
      PVector lToMouse = PVector.sub(new PVector(mouseX, mouseY), mPosition);
      lToMouse.normalize();
      
      mAcceleration.add(PVector.mult(lToMouse, 0.1f));
    }

    mAcceleration.add(PVector.mult(lSeparation, 2)); // la separation a plus de poid que le reste (survie)
    mAcceleration.add(PVector.mult(lObstacle, 1.4));
    mAcceleration.add(lAlignement);
    mAcceleration.add(lCohesion);
    
  }
  
  public void update(ArrayList pEntityGroup)
  {
    flockingUpdate(pEntityGroup);
    
    mVelocity.add(mAcceleration);
    mVelocity.limit(mSpeed);
    
    mPosition.add(mVelocity);
    
    if(mPosition.x < 0)
      mPosition.x = width + mPosition.x;
    else if(mPosition.x > width)
      mPosition.x = width - mPosition.x;
      
    if(mPosition.y < 0)
      mPosition.y = height + mPosition.y;
    if(mPosition.y > height)
      mPosition.y = height - mPosition.y;
    
    mAcceleration.mult(0);
    
    registerInGrid();
  }
  
  public void draw()
  {
    gBuffer.pushMatrix();
    
    gBuffer.translate(mPosition.x, mPosition.y);
    gBuffer.rotate(mVelocity.heading2D() - PI/2);
    
    if(isLeader)
      gBuffer.fill(255, 0, 0);
    else
      gBuffer.fill(255, 255, 255);
      
    gBuffer.stroke(0);
    gBuffer.triangle(0, 10, - 3, -5, 3, -5);
    
    gBuffer.popMatrix(); 
  }
  
  //--------------------------------------------------
  
  public void registerInGrid()
  {
    if(mLastCase != null)
    {
      mLastCase.unregisterEntity(this);
    }
    
    mLastCase = terrain.getCaseFromPos(mPosition.x, mPosition.y);
    mLastCase.registerEntity(this);
  }
  
  //--------------------------------------------------
  
  // Calcul la separation de l'entité par rapport a ses voisines.
  private PVector separation(ArrayList pEntityGroup)
  {
    float lSep = 20;
    float count = 0;
    
    PVector lSteer = new PVector(0,0,0);
    
    for(int k = 0; k < 9; k++)
    {
       for (int i = 0 ; i < mCaseList[k].size(); i++) 
       {
         Entity other = (Entity)mCaseList[k].get(i);
         float lDist = PVector.dist(mPosition, other.mPosition);
         
         if( lDist > 0 && lDist < lSep)
         {
           //si trop proche d'une entité on ajoute a son vecteur de "pilotage" le vecteur qui s'eloigne de cette entité.
           PVector diff = PVector.sub(mPosition,other.mPosition);
           diff.normalize();
           diff.div(lDist);       
           lSteer.add(diff);
           count++;            
         }
       }
    }
     
     if(count > 0)
     {
       lSteer.div(count);
     }
     
      if (lSteer.mag() > 0) 
      {
        lSteer.normalize();
        lSteer.mult(mSpeed);
        lSteer.sub(mVelocity);
        lSteer.limit(0.05f);
    }
    
    return lSteer;
  }
  
  //************
  
  private PVector obstacleAvoiding()
  {
    boolean intersected = false;
    PVector lSteer = new PVector(0,0);
    float count = 0;
    
    PVector[] lRef = new PVector[1];
    
    for(int k = 0; k < 2; k++)
    {
      for(int i = 0; i < mObstacleCase[k].size(); i++)
      {
        Obstacle obs = (Obstacle)mObstacleCase[k].get(i);
        
        if(obs.intersecting(mPosition, PVector.mult(mVelocity, 50), lRef))
        {
          lSteer.add(lRef[0]);
          count++;
        }
      }
    }
    
    if(count > 0)
    {
      lSteer.div(count);
    }
    
    return lSteer;
  }
  
  //********
  
  private PVector alignement(ArrayList pEntityGroup)
  {
    float lCloseDist = 25.0;
    PVector lSteer = new PVector(0,0,0);
    int count = 0;
    
    for(int k = 0; k < 9; k++)
    {
      for (int i = 0 ; i < mCaseList[k].size(); i++) 
      {
        Entity other = (Entity) mCaseList[k].get(i);
        
        float lDist = PVector.dist(mPosition,other.mPosition);
        
        if (lDist > 0 && lDist < lCloseDist) 
        {
          //Toute entité assez proche "donne" son vecteur velocité a celle ci. Propageant de proche en proche une direction général
          lSteer.add(other.mVelocity);
          count++;
        }
      }
    }
    
    
    if (count > 0) 
    {
      lSteer.div((float)count);
    }

    if (lSteer.mag() > 0) 
    {
      lSteer.normalize();
      lSteer.mult(mSpeed);
      lSteer.sub(mVelocity);
      lSteer.limit(mMaxForce);
    }
    
    return lSteer;
  }
  
  //**********************
  
  //Calcul la cohesion du groupe. Force les entité trop loin a se rapprocher du groupe d'entité les plus proches.
  private PVector cohesion(ArrayList pEntityGroup)
  {
    float lCloseDist = 25.0;
    PVector sum = new PVector(0,0);
    int count = 0;
    
    for(int k = 0; k < 9; k++)
    {
      for (int i = 0 ; i < mCaseList[k].size(); i++) 
      {
        Entity other = (Entity) mCaseList[k].get(i);
        
        float lDist = mPosition.dist(other.mPosition);
        if ((lDist > 0) && (lDist < lCloseDist)) 
        {
          sum.add(other.mPosition); // Add location
          count++;
        }
      }
    }
    
    if (count > 0) 
    {
      sum.div((float)count);
      return steer(sum,false);  //"Pilote" vers la direction (pour ne pas avoir un changement de direction instantané
    }
    
    return sum;
  }
  
  //************************************
  
  // Methode qui calcule le vecteur de pilotage vers une cible (empruntéa l'exemple "flocking" de processing)
  PVector steer(PVector target, boolean slowdown) 
  {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target,mPosition);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) 
    {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(mSpeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(mSpeed);
      // Steering = Desired minus Velocity
      steer = target.sub(desired,mVelocity);
      steer.limit(mMaxForce);  // Limit to maximum steering force
    } 
    else 
    {
      steer = new PVector(0,0);
    }
    return steer;
  }

}

