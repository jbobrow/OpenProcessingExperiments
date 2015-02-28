


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
    
 


    for(int i=0;i<10;i++){
      x=0;
       for(int j=0;j<12;j=j+1){
         
       noStroke();
       fill(139,141,101);
       ellipse (x,y,a,b);
       w=160;
       for (int z=80;z>1;z=z-10){//number of rings, 
         noStroke();
       fill (w,0,0,50);
       ellipse (x,y,z,z);
       w=w-20;
       }
       x=x+70;
      }
      y=y+70;
      w=w-20;
     }
    
  }

  
  

