


int x=0;
int y=0;
int a=40;
int b=40;
int w=190;



void setup(){
  size (500,500);
  background (255);
  smooth();
}
  
  
  void draw (){
    
 


    for(int i=0;i<10;i++){
      x=0;
       for(int j=0;j<12;j=j+1){
         
       noStroke();
       fill(139,141,101,25);
       ellipse (x,y,a,b);
       w=160;
       for (int z=115;z>1;z=z-10){//number of rings, 
         noStroke();
       fill (w,0,0,40);//color of center sphere
       ellipse (x,y,z,z);
       w=w-20;
       }
       x=x+75;//separation de x
      }
      y=y+75;//separation of y
      w=w-20;
     }
    
  }

  
  

