
void setup(){
 size(500,500);
 background(234,246,255);
 smooth(); 
}  

void draw(){
  noStroke();
  for(int i=width;i>0;i-=200){
    fill(255,198,225);
    ellipse(width/2,height/2,i,i);
    fill(234,246,255);
    ellipse(width/2,height/2,i-100,i-100);
    
  }  
}
