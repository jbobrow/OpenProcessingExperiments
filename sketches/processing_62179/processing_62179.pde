
int space = 20;

void setup() {

  size(200, 200);
}

void draw() {
  background(255); 
  /*for(float x = space; x<= width-space; x=x+10){
   line(x, 20, x, 180);
   }
   saveFrame("loop01.png");
   
   for(float x = space; x<= width-space; x=x+10){
   line(20, x, 180, x);
   }
   saveFrame("loop02.png");
   
   for(float x = space; x<= width-space-40; x=x+10){
   line(x+40, 20, x, 180);
   }
   saveFrame("loop03.png");
   
   for(float x = space; x<= width-space-40; x=x+10){
   line(20, x+40, 180, x);
   }  
   saveFrame("loop04.png");*/

  /*for(float x = space; x<= width-space; x=x*1.5){
   line(x, 20, x, 180);
   }
   saveFrame("loop05.png");
   
   for(float x = space; x<= width/2; x=x+10){
   line(x, 20, x, 120);
   }
   
   for(float x = space; x<= width/2; x=x+10){
   line(x+90, 80, x+90, 180);
   }*/


  for (float x = space; x<= width-space; x=x+20) {
    line(20, x, width/2, x);
  }    

  for (float x = space; x<= width-space-10; x=x+20) {
    line(width/2, x+10, width-space, x+10);
  }

}


