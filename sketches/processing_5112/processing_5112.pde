
class Cell{
  float x,y;
  boolean sp;
  float pw;
  boolean moving=true;
  boolean same=true;
  int direction;
  int xd,yd;
  Cell(float xpos, float ypos, boolean standpoint, float power){
    x=xpos;
    y=ypos;
    sp=standpoint;
    pw=power;
    direction=floor(random(4));
  }

  void turn(){
    if(direction==0){
      xd=1;
      yd=0;
    }
    else if(direction==1){
      xd=0;
      yd=1;   
    }
    else if(direction==2){
      xd=-1;
      yd=0;  
    }
    else{
      xd=0;
      yd=-1; 
    }        
  }

  void move(){
    if(moving){
      x+=xd*10;
      y+=yd*10;
    }
  }

  void checkdist(Cell a){
    float d=dist(x,y,a.x,a.y);
    if(moving&d<50&frameCount%25==0){
      moving=false;
      if(sp==a.sp){
        same=true;
      }
      else{
        same=false;
      }
    }
  }


  void encounter(){
    if(!moving){
      if(same){
        pw+=2.55;
      }
      else{
        pw-=2.55;
      }  
      if(frameCount%20==0){
        direction=floor(random(4));
        moving=true;
      }
    }
  }

  void boundary(){
    if(x<0){
      x=width;
    }
    if(x>width){
      x=0;
    }
    if(y<0){
      y=height;
    }
    if(y>height){
      y=0;
    }
  }

  void display(){
    if(sp){
      stroke(pw,0,0);  
    }
    else{
      stroke(0,pw,0);
    }
    if(pw>0){
      pushMatrix();
      translate(x,y);
      rotate(direction*PI/2);
      Walker w1=new Walker(0,0,50,5);//xpos, ypos, scalar, speed 
      if(moving){
        w1.walk();
      }
      else{
        w1.stop();
      }
      popMatrix();
    }
  }
}  






