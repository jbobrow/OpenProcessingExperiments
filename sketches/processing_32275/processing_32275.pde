


int x=0;
int y=0;
int a=40;
int b=40;
int w=190;



void setup(){
  size (500,500);
  background (0);
  smooth();
}
  
  
  void draw (){
    
 


    for(int i=0;i<10;i++){
      x=0;
       for(int j=0;j<12;j=j+1){
       stroke (0);
       fill(139,141,101);
       ellipse (x,y,a,b);
       w=180;
       for (int z=75;z>1;z=z-10){
         noStroke();
       fill (w,0,0,70);
       ellipse (x,y,z,z);
       w=w-20;
       }
       x=x+60;
      }
      y=y+60;
      w=w-20;
     }
    
  }

  
  

