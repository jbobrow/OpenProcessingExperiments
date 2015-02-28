
int NUM=40;
float []x = new float[NUM];
float []y = new float[NUM];
float []vx = new float[NUM];
float []vy = new float[NUM];
float []c1 = new float[NUM];
float []c2 = new float[NUM];
float []c3 = new float[NUM];
float []gravity = new float[NUM];
boolean []bottom= new boolean[NUM];
int diameter=15;
int i,j,k;


void setup(){
  size(500,500);
  background(0);
  noStroke();
  //frameRate(5);
  
  for(i=0;i<NUM;i++){
   x[i]=random(diameter/2,width-diameter/2);
   y[i]=random(diameter/2,height-diameter/2);
   vx[i]=random(1,3);
   vy[i]=random(1,3);
   c1[i]=random(0,255);
   c2[i]=random(0,255);
   c3[i]=random(0,255);
   bottom[i]=false;
   gravity[i]=0.1;
  }
}

void draw(){
  background(0);

  
  for(i=0;i<NUM;i++){
    fill(c1[i],c2[i],c3[i]);
    ellipse(x[i],y[i],diameter,diameter);
    x[i]=x[i]+vx[i];
    y[i]=y[i]+vy[i];
    
    //generate gravity for balls
    vy[i]=vy[i]+gravity[i];
    
    //hit walls --x[i]>=width-diameter/2 || 
    if(x[i]>=width-diameter/2 || x[i]<=diameter/2){
      vx[i]*=-1;
    }
    if(y[i]<=diameter/2){
      vy[i]*=-1;
    }  
    
    //balls collide;
    for(j=0;j<NUM;j++){
      for(k=j+1;k<NUM;k++){
        if(dist(x[j],y[j],x[k],y[k])<=diameter){
          vx[j]*=-1;
          vy[j]*=-1;
          vx[k]*=-1;
          vy[k]*=-1;
        }
      }
    }
  
    //hit bottom
    if(y[i]>=height-diameter/2){
      //println("ball "+i+" hits bottom");
      y[i]=height-diameter/2;
      vy[i]=vy[i]*-0.45;
    }
 
    //finally stop the balls
    if(y[i]>height-diameter/2-4 && vy[i]<0.5 && vy[i]>-0.5){
      vx[i]=0;
      vy[i]=0;
      gravity[i]=0;
      y[i]=height-diameter/2;
      //println("ball "+i+" stop here");
      //println("ball "+i+" is at x:"+x[i]+" y:"+y[i]+ " speed x:"+vx[i]+" y:"+vy[i]);
    }
    
    //DEBUG
    //println("ball "+i+" x-axis speed:"+vx[i]);
    //println("ball "+i+" y-axis speed:"+vy[i]);
    
    
    
  }// end of for

  


}
