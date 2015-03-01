

void setup(){
  size (400,400);
  background(108,215,36);
frameRate ( 20);
}
void draw(){

int s;
int t;

for( s=50; s<350; s=s+50){
   
    for(t=50; t<350; t=t+50 ){

    
   fill(255,255,36); 
    rect(s,t,30,50);
   if(mousePressed== true){ 
     fill(255);
     rect(s,t,20,20);
  }
 
  }
}
}
