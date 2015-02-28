


int x=0;
int y=0;
int a=100;
int b=100;
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
       noStroke();
       fill(139,141,101,20);
       ellipse (x,y,a,b);
       w=255;
       for (int z=60;z>1;z=z-10){
         noStroke();
       fill (w,0,0,20);
       ellipse (x,y,z,z);
       w=w-20;
       }
       x=x+65;
      }
      y=y+65;
      w=w-20;
     }
    
  }

  
  

