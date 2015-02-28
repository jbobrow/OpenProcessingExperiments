
int num = 12;
PVector [] pc = new PVector [num];

int w = 255;
int h = 255;
boolean flip = true;

void setup(){
  size(w,h,P2D);
  //smooth(); 
  a=createImage(w,h,ARGB);
  pc[0]= new PVector (0,0);
  direct [0]=-1;
  pc[1]= new PVector (w,h);
    direct [1]=1;
  for (int i = 2;i<num;i++){
   pc[i]=new PVector (random(w),random(h)); 
  }
}

void draw(){
  background(-1);
  move();
  point(pc[0].x,pc[0].y);
  ellipse(pc[1].x,pc[1].y,10,10);

}
PImage a;
void moveall(PVector [] A){
  
}
void move(){


  if(!flip){

    direct[1]=1;
   if(direct[1]==1){
    pc[1].x+=1;

    pc[1].y+=1;
   }
   else    {
    pc[1].x-=1;

    pc[1].y-=1;
     
   }
    direct[0]=-1;
    if(direct[0]==-1){
    pc[0].x-=1;

    pc[0].y-=1;
    }
    else
    {
    pc[0].x+=1;

   pc[0].y+=1;
      
     
   }
    
  }
  else
  {
    direct[1]=-1;
   if (direct[1]==-1){
    pc[1].x-=1;

    pc[1].y-=1;
   }
   else
    {
    pc[1].x+=1;

    pc[1].y+=1;
     
    }
    direct[0]=1;
    if (direct[0]==1){
    pc[0].x+=1;

    pc[0].y+=1;
    }
    else
    {
//      
    pc[0].x-=1;
//
    pc[0].y-=1;
//      
//      
    }


  }



  if( dist(pc[0].x,pc[0].y,pc[1].x,pc[1].y)<2 )flip = !flip;
  //if(pc[0]==pc[1])flip=!flip;
if( pc[0].x<-1 || pc[0].x>w+1 || pc[1].x<-1 || pc[0].y >h+1)flip = !flip;


}

int [] direct = new int [num];
