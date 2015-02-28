

void setup(){
  size(500,500);
  background(0);
  smooth();
}

void draw(){
 background(0);
 fill(0,255,232);
 for(int x=50; x<500; x=x+50){
   for(int y=50; y<500; y=y+50){
     fill(0,255,232,255-y/2);
     ellipse(x,y, x/12, x/12);
   }
 }
}
                
