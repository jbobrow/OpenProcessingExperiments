
class Agent{
  PVector pos, vel;
  color c;
  int searchDist; 

  Agent(int _x, int _y){
    pos=new PVector(_x,_y);  
    vel=new PVector(random(-1,1),random(-1,1));
    searchDist=2;//how much an agent knows about its surroundings
  }

  void move(){
    for(int x=(int)pos.x-searchDist;x<=(int)pos.x+searchDist;x++){
      for(int y=(int)pos.y-searchDist;y<=(int)pos.y+searchDist;y++){
        if(x!=(int)pos.x&&y!=(int)pos.y){
          if(brightness(get(x,y))<0.5){
            vel.mult(-1);
          }
        }
      }
    } 
    vel.limit(1);  
    pos.add(vel);  
  }
  void display(){
    if(pos.x>0&&pos.x<width-1&&pos.y>0&&pos.y<height-1){
      ca.cell[round(pos.x)][round(pos.y)][1]=1;
    }
  }
}






