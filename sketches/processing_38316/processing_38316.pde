

void setup(){
 size(500, 500); 
 background(0);
 smooth();
}

void draw(){
 stroke(0,255,232);
 for(int i=50; i<500; i=i+50){
   line(i,0, width,i); 
 }
}
