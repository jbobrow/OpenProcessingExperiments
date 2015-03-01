
//Dani Licata 
//original author: Su Hyun Nam
// 2/24/15


void setup(){
  size(640,480);
  background(255);
}
void draw(){
  for (int j= 0; j< height; j= j+20){
  for (int  i=0; i< width; i= i+20){
    
  ellipse(i,0,50, 50);
  ellipse(i, j+10, 50,50);
  fill (200,15,184);
  
  }
  }
  
}
  
