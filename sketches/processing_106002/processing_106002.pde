
int numballs = 200;
int r = 10;
int l = 500;
int []x = new int[numballs];
int []y = new int[numballs];

int [] vx = new int[numballs];
int [] vy = new int[numballs];



void setup(){
  size (l,l);
  
  //ball's start status
  for (int i = 0; i<numballs; i++){
  x[i] = int(random(r,l-r));
  y[i] = int(random(r,l-r));
    
  vx[i] = int(random(-10,10));
  vy[i] = int(random(-10,10));
  
  //if vx or vy=0
  if(vx[i]==0){
     vx[i]=1;
  }
  if(vy[i]==0){
     vy[i]=1;
  }  
  
  }
}

void draw(){
  background (255);


  //bouncing action  
  for (int i = 0; i < numballs; i++){
    if (x[i]>(l-r)||x[i]<r){
      vx[i]=-vx[i];
    } 
  
    if (y[i]>(l-r)||y[i]<r){
      vy[i]=-vy[i];
    }
  }
  
  
  //draw the ball
  for(int i = 0; i < numballs; i++){
    fill (0);
    ellipse (x[i],y[i],r*2,r*2);
    x[i]=x[i]+vx[i];
    y[i]=y[i]+vy[i];
  }
  
}


