
void setup (){
  size (1000,1000);
  background(0,0,255);
 
  
}
 
void draw(){
  fill(255,0,0);
  
for (int y = 0;y <= height; y = y+15){
  for(int x =0;x <= width; x = x+15){
    
    rect (x,y,10,10);
    
}


 }
}
