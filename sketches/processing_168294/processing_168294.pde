
void setup(){
  size(500,500);
   
}
  
void draw(){
  if(frameCount==1){
    for(int i=0;i<1000;i++){
       renderOnce(); 
    }
  }else{
    renderOnce();
  }  
}


void renderOnce(){
   float r=random(100);
  float r2=random(300);
  float r3=random(500);
 
  noFill();
 
  stroke(100,200,20);
 
  rect(r3,r3,r2,r2);
   
  stroke(238,240,30);
   
  rect(r,r2,r3,r3);
 
}
