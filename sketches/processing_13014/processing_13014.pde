
class Sand {
  int x,y,prevX,prevY;
  int dx,dy;
  int index,timeout;
  boolean finished;
  Sand(int aX, int aY, int aDy,int ind){
    x = aX;
    y = aY;
    dy = aDy;
    index = ind;
    prevX = -1;
    prevY = -1;
    timeout = 0;
  }
  
  void draw(){
    this.x += this.dx;
    this.y += this.dy;
    this.check();
    point(this.x,this.y);
  }
  
  void check(){
    if(!finished){
      if(this.y > height-100){
        this.y = height-100;
        this.dx = 0;
        this.dy = 0;
        this.finished = true;
      }
      for(int i=0;i<sand.length;i++){
        if(sand[i].y == this.y && sand[i].x ==  this.x && this.index != i){
          //check to see if it can slide either way
          boolean hasLeft = false, hasRight = false;
          for(int j=0;j<sand.length;j++){
            if(sand[j].y == this.y && sand[j].x == this.x-1){
              hasLeft = true;
            }
            if(sand[j].y == this.y && sand[j].x == this.x+1){
              hasRight = true;
            }
          }
          if(hasLeft && hasRight){
            //were blocked in, go up one
            this.y -= 1;
          }
          else if(hasLeft) {
            //we have crap to the left, go right
            this.x += 1;
          }
          else if(hasRight) {
            //we have crap to the right, go left
            this.x -= 1;
          }
          else {
            this.x -= 1;
          }
        }
      }
      if(this.x == this.prevX && this.y == this.prevY){
        timeout +=1;
      }
      this.prevX = this.x;
      this.prevY = this.y;
      if(timeout>10){
        finished = true;
        this.dx = 0;
        this.dy = 0;
        //println("pixel timed out");
      }
    }
  }

}

