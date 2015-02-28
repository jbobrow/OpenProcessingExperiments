
class Particles{
  PVector pos,dir,vel;
  float x,y;
  float var,f;
  int t, type;
  boolean running;

  Particles(PVector _pos, PVector _dir, int _type){
    pos=_pos;
    x=round(pos.x);
    y=round(pos.y);
    dir=_dir;
    type=_type;
    if(type==0){
      var=random(0.01,0.1);
      f=round(random(20,60));
    }     
    if(type==1){
      var=random(0.1,1);
      f=round(random(0,30));
    }
    if(type==2){
      var=0;
      f=round(random(10,50));
    }  
    vel=new PVector(random(-var,var),random(-var,var));
    running=true;
    t=0;
  }

  void move(){
    if(running){
      x=pos.x;
      y=pos.y;
      if(type==1)vel=new PVector(random(-var,var),random(-var,var));
      dir.add(vel);      
      dir.normalize();
      pos.add(dir);
      t++;
    }
  }

  void display(){
    if(running){
      point(round(x),round(y));
    }
  }

  void hit(){
    if(red(get(round(pos.x),round(pos.y)))<255)running=false;    
  }

  void giveBirth(){
    if(t%f==1){
      if(type==0)p.add(new Particles(new PVector(x+random(-1,1),y+random(-1,1)),new PVector(random(-1,1),random(-1,1)),0));
      if(type==1)p.add(new Particles(new PVector(x+random(-1,1),y+random(-1,1)),new PVector(random(-1,1),random(-1,1)),1));
      if(type==2)p.add(new Particles(new PVector(x+random(-1,1),y+random(-1,1)),new PVector(random(-1,1),random(-1,1)),2));
    }  
  }
}









