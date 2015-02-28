




int x=0;
int y=0;
int a=40;
int b=40;
int w=190;



void setup(){
  size (500,500);

  background (115,84,53);
  smooth();
}
  
  
  void draw (){
    
 


    for(int i=0;i<15;i++){
      x=0;
       for(int j=0;j<15;j=j+1){
         
       noStroke();
       fill(139,141,101);
       ellipse (x,y,a,b);
       w=190;
       for (int z=30;z>1;z=z-10){//number of rings, 
         noStroke();
       fill (w,0,0,90);
       ellipse (x,y,z,z);
       w=w-20;
       }
       x=x+50;
      }
      y=y+50;
      w=w-20;
     }
   
  }

  
  

