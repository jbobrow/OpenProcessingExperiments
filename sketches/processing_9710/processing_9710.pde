
class Agent{
  PVector pos, vel, dr;
  color c;
  int searchDist;
  float maxVal=255;

  Agent(int _x, int _y){
    pos=new PVector(_x,_y);  
    vel=new PVector(0,0);
    c=color(random(255),random(255),random(255));
    searchDist=2;//how much an agent knows about its surroundings
  }


  void move(){
    PVector dir = PVector.sub(brightPt(),pos);
    vel.add(dir);
    //PVector jump= new PVector(random(-0.1,0.1),random(-0.1,0.1));//jump a little to get out of local minima   
    // vel.add(jump);
    vel.mult(0.9);
    vel.limit(1);  
    pos.add(vel);  
  }

  void display(){
    set((int)pos.x,(int)pos.y,c);
  }

  PVector brightPt(){//search for darkest pixel around within 'searchDist' distance    
    PVector bPt=new PVector(pos.x,pos.y);
    for(int x=(int)pos.x-searchDist;x<=(int)pos.x+searchDist;x++){
      for(int y=(int)pos.y-searchDist;y<=(int)pos.y+searchDist;y++){
        float currVal=brightness(env.get(x,y));
        if(currVal<maxVal){
          maxVal=currVal;
          bPt=new PVector(x,y);       
        }
      }     
    }
    return bPt;
  }
}





