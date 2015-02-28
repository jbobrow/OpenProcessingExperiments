
int y;
int x;
int directionx;
int directiony;

void setup(){
 size(400,680);
 smooth();
 y = 0; 
 x = 0;
 directionx = 1;
 directiony = 1;
}

void draw(){
 background(113,223,255);

 x += directionx;
 y += directiony;
 
 {
 fill(30,100,27,100);
 ellipse(200,y,100,90);
 
 if(y <300){
   directionx = 3;
   directiony = 1;
    }
   }
 
 {
 fill (50,80,300,80);
 rect(x,y,300,20);
  if(x >= 200){
  directionx = -1;
  directiony = 3;
   }
 }

 fill(219,29,99,100);
 ellipse(x,y,60,60);
 fill (30,150);
 ellipse(100,300,100,100);
  
 
 if(y>=600) {
   directionx = -200;
   directiony = -300;
    }
 if(x <= width){
  directionx = 1;
  directiony = 4;
  
   if(x >=40) {
    directionx = 9;
    directiony = 15;
     }
    }

  if(y >= height) {
   directionx = 3;
   directiony = -1;
    }
 
  if(x <= 100) {
    directiony = 4;
    directionx = 1;
    
   if(y>=30){
   directionx = 4;
   directiony = 5;

   if(x>=20){
     directionx = 1;
     directiony = 1;
      }
     }
   
  if(x <= 160){
    directiony = 5;
    directionx = 1;
    }
  
  if(y>300 && x<300) {
    directiony = 3;
    directionx = 3;
     }
  
   if(y>=240) {
      directionx = 2;
      directiony = -20;
       } 
  
  if(x<=80 && y>=230) {
    directionx = -2;
    directiony = 5;
     }
  
  if (x <= 60 && y>= 500){
    directiony = 1;
    directionx = 30;
    }
    
 if(y >= height) {
  directiony = 1; 
  directionx = 20;
     }
  }
}

