

void setup(){
  size (400,400);
  background(158,115,136);
frameRate ( 10);
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
    rect(50,50,30,300);
    rect(150,50,30,300);
  rect(250,50,30,300);
 if( mousePressed == true){
   fill(0);
   rect(t,s,50,30);
  }
 
  }
}
}
}
