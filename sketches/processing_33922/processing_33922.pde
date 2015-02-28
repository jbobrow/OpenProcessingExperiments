



int num=60;
float gravity =0.1;


float[] x = new float[num];

float[] y = new float[num];

float[] vel1= new float[num];

float[] vel2= new float[num];



void setup(){
   size(500, 500);
   noFill();
   stroke(0);
   smooth();
   background(255);
  
   
   
   for(int i=0; i<num; i++){
     x[i]=random(width);
     y[i]=random(height);
     vel1[i]=random(5);
     vel2[i]=random(5);
   }
   
 
   
}
void draw(){
  background(255);
  
  
  
  
  for (int i=0; i<=second(); i++){
    
   
    vel2[i]=vel2[i]+gravity;
    
    x[i]=x[i]+vel1[i];
    y[i]=y[i]+vel2[i];
    
  
  fill(255,0,0);  
   ellipse(x[i], y[i], second(), second());
    
  
  
  
  if((x[i]<0)||(x[i]>width)){
    vel1[i]=vel1[i]*-1;
  }
  
  if((y[i]<0)||(y[i]>height)){
    vel2[i]=vel2[i]*-.95;
  }
  
}
}


  



