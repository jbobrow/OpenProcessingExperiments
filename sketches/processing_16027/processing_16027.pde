
class ClimbDown extends State{
  StateMachine sm;
  int dir;
  Cube cube;
  int cycle = 0;
  
  ClimbDown(StateMachine stateMach, int d){
    sm = stateMach;
    cube = sm.cube;
    dir = d;
  }
  
  void enter(){
    cycle = 0;
    cube.occupyAdjPosWhileMoving(0,0,0);
    cube.occupyAdjPosWhileMoving(0,0,-1);
    //East
    if (dir==1){
      cube.setSpeeds(0,-1,0);
      cube.setOffsets(1,0,-1);
      cube.occupyAdjPosWhileMoving(-1,0,0);
      cube.occupyAdjPosWhileMoving(-1,0,-1);
    }
    //West
    else if (dir==2){
      cube.setSpeeds(0,1,0);
      cube.setOffsets(-1,0,-1);
      cube.occupyAdjPosWhileMoving(1,0,0);
      cube.occupyAdjPosWhileMoving(1,0,-1);
    }
    //North
    else if (dir==3){
      cube.setSpeeds(-1,0,0);
      cube.setOffsets(0,1,-1);
      cube.occupyAdjPosWhileMoving(0,-1,0);
      cube.occupyAdjPosWhileMoving(0,-1,-1);
    }
    //South
    else if (dir==4){
      cube.setSpeeds(1,0,0);
      cube.setOffsets(0,-1,-1);
      cube.occupyAdjPosWhileMoving(0,1,0);
      cube.occupyAdjPosWhileMoving(0,1,-1);
    }
  }
  
  void update(){
    if (cycle==(90/cube.speed)){
      sm.changeState(0);
    }
    else{
    cycle++;
    }
  }
  
  void exit(){
    cycle = 0;
    //East
    if (dir==1){
      cube.disOccupyAdjPos(-1,0,0);
      cube.disOccupyAdjPos(-1,0,-1);
    }
    //West
    else if (dir==2){
      cube.disOccupyAdjPos(1,0,0);
      cube.disOccupyAdjPos(1,0,-1);
    }
    //North
    else if (dir==3){
      cube.disOccupyAdjPos(0,-1,0);
      cube.disOccupyAdjPos(0,-1,-1);
    }
    //South
    else if (dir==4){
      cube.disOccupyAdjPos(0,1,0);
      cube.disOccupyAdjPos(0,1,-1);
    }
    cube.disOccupyAdjPos(0,0,0);
    cube.restAtAdjPos(0,0,-1);
  }
}

