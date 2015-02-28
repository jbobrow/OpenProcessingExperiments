
int x = 0;
int bounce =5;


void setup () {
  size (800,600);
  background (0);
  ;
}

  void draw (){
    noStroke();
    
background (0);
    
   
    ellipse ( x, x, random(x), random(x) );
    ellipse ( x, x, random(bounce), random(x) );
     

   x = x + bounce ;
   
   if ( x >= width){
     fill (random(255), random(255), random (255));
     bounce = bounce * -1;
 
   }
   
   if (x <= -1){
     bounce = bounce * -1;
     
   }
  }


