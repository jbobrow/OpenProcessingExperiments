

int number=100; //domino's elements
float[]dx=new float[number];    //int[]arr;
float[]dy=new float[number];
float[]da=new float[number];

float constY=200;
float x=10;
float l=100;
float speed=0.01;

void setup() {
  background(255);
  size(600,400);
  
  for(int i=0; i<number; i++) {     
  dx[i]=x*i*2;
  dy[i]=constY;
  da[i]=PI/2;
  
  }
 
}

void draw() {
  background(255);
  
  da[0]-=speed*da[0]*da[0];
   for(int i=1; i<number; i++) {  
     if(dx[i-1] + cos(da[i-1])*l>dx[i]){
          da[i]-=speed*da[i]*da[i];
     }
   }
  
  for(int i=0; i<number; i++) {  
    if(da[i]<=0){
      da[i]=0;
    }
    
  }
  
  
  for(int i=0; i<number; i++) {      
  //dx[i]=x*i;
 // dy[i]=constY;
 // da[i]=PI/2;
 
  line( dx[i],  dy[i], dx[i] +cos(da[i])*l, dy[i]+sin(da[i])*l);
  
  }  

}

