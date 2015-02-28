
class BranchingWalker {

  float posX;
  float posY;
  float direction;
  float speed=0.5; 
  int lifeTime;
  int life;
  int index=0;
  int recLevel;
  boolean alive;
  
  //int Length;
  BranchingWalker[] branchingSystem;


  BranchingWalker(float pX, float pY,float pDirection, int pLifetime,int pRecLevel, BranchingWalker[] pBranchingSystem){
    posX=pX;
    posY=pY;
    direction=pDirection;
    lifeTime=pLifetime;
    life=0;
    branchingSystem=pBranchingSystem;
    alive=true;
    recLevel=pRecLevel;
  }

  void display(){
    if(alive){
      stroke(0,16);
      strokeWeight(1.25);
      point(posX,posY);
    }
  }

  void update(BranchingWalker[] pBranchingSystem, int pIndex){
    if(alive){
      direction=direction+random(-HALF_PI/9,HALF_PI/9);
      index=pIndex;
      posX=posX+(cos(direction)*speed);
      posY=posY+(sin(direction)*speed);
      life++;

      if(life>=lifeTime){
        alive=false;
         }
    }
  }

}






