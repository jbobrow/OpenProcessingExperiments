
int n=5;
 
 
float x[] = new float[n];
 float y[] = new float[n];
  
 PFont[] letra = new PFont [5];
 float v=0.08;
  
 void setup(){
   size (800,600);
   letra[0]=createFont("BodoniMT",1);
   letra[1]=createFont("Century",1);
   letra[2]=createFont("LucidaBright",1);
   letra[3]=createFont("Serif",1);
   letra[4]=createFont("Tahoma",1);
 
    
 }
    
   void draw(){
      
     background(0);
      
    
     x[0] +=v * (mouseX-x[0]);
     y[0] +=v * (mouseY-y[0]);
      
     for(int i=1; i<n; i++){
       x[i] +=v * (x[i-1] - x[i]);
       y[i] +=v * (y[i-1] - y[i]);
     }
      
     for(int i=0; i < n; i++){
           textFont (letra[i],48);
       text("nietillo",x[i],y[i]);
     }
   }


