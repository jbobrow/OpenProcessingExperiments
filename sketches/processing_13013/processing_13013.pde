
class band{
  int startX, startY, curX, curY;
  boolean isDone;
  
  band(){
    startX = world.getX();
    startY = world.getY();
    isDone = false;
  }
  
  void draw(){
    if(!this.isDone){
      this.curX = world.getX();
      this.curY = world.getY();
    }
    line(startX, startY, curX, curY);
  }
  
  void finish(){
    this.isDone = true;
  }
  
  

}


