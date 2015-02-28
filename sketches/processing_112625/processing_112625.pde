
int counter;

void setup(){
  size(600,600);
  smooth();
}

void draw(){
 background(30,0,0);

 for(int i=0; 1<20; ++i){
   for(int j=0; 1<15; ++j){
 
 ellipse(i*20,200,j*10,20); 
 
   }
 }
 
}
