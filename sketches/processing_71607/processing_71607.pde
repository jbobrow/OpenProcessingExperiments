
int n=6;
 
 
float x[] = new float[n];
 float y[] = new float[n];
  
 PFont[] letra = new PFont [6];
 float v=0.08;
  
 void setup(){
   size (800,600);
   letra[0]=createFont("Arial",2);
   letra[1]=createFont("Arial-Black",1);
   letra[2]=createFont("FranklinGothic-Medium",2);
   letra[3]=createFont("Serif",1);
   letra[4]=createFont("Georgia-Bold",3);
   letra[5]=createFont("Calibri",4);
   
 
    
 }
    
   void draw(){
      
     background(102);
      
    
     x[0] +=v * (mouseX-x[0]);
     y[0] +=v * (mouseY-y[0]);
      
     for(int i=1; i<n; i++){
       x[i] +=v * (x[i-1] - x[i]);
       y[i] +=v * (y[i-1] - y[i]);
     }
      
     for(int i=0; i < n; i++){
           textFont (letra[i],48);
       text("gonz",x[i],y[i]);
     }
   }


