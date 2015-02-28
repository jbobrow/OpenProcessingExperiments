
void setup(){
  smooth();
  size(2000,1200);
  
  background(255,0,0);
}
 void draw(){
   
 for(int i=0; i<20000; i+=10){
   
 noFill();
 stroke(map(i,0,2000,0,255));
 strokeWeight(1);
 ellipse(width/2,height/2,i,i);
 }
 
}


