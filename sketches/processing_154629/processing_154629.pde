
float [] x,y;
float [] vx,vy;
float [] px,py;
float gapx;
float gapy;

int gridnum;
int num;
void setup(){
  size(500,500);
  gridnum=40;
  num=2;
   
  
  
  x=new float [num];
  y=new float [num];
  vx=new float [num];
  vy=new float [num];


  for (int i=0;i<num;i++){
    x[i]=random(width);
    y[i]=random(height);
    vx[i]=random(-5,5);
    vy[i]=random(-5,5);

    
  }

  
  background(255);
}

void draw(){
  background(255);
  
  
  for (int i=0;i<num;i++){
  
  x[i]=x[i]+vx[i];
  y[i]=y[i]+vy[i];

      
      if(x[i]<0 ||x[i]>width){
        vx[i]=-1*vx[i];
      }
      if(y[i]<0 ||y[i]>width){
        vy[i]=-1*vy[i];
      }
  }
  
  for (int i=0;i<num;i++){
      for (int j=0;j<gridnum;j++){
          for (int k=0;k<gridnum;k++){
            for (int m=0;m<num;m++){
        
            float gapx=height/(gridnum+1);
            float gapy=width/(gridnum+1); 
            stroke(0);
            rect(j*gapx,k*gapy,1,1);
     
        float d=dist(x[i],y[i],j*gapx,k*gapy);
        float d2=dist(x[i],y[i],x[m],y[m]);
          
          if(d<40){
            stroke(0);
            strokeWeight(.1);
           line(x[i],y[i],j*gapx,k*gapy);
            stroke(255,0,0);
            strokeWeight(1);
            rect(j*gapx,k*gapy,2,2);
            
          }
          if(d2<100){
            
            strokeWeight(.1);
            stroke(255,0,0, 10);
            line(x[i],y[i],x[m],y[m]);
          }
         }
        }
      }
     }
 }


void keyReleased() {
  if (key=='a') {
    num=num-1;
  } else {
    num=num;
  }  
if (key=='s') {
    num=num+1;
  } else {
    num=num;
  }  
}


