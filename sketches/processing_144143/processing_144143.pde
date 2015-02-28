
void setup(){
size(500,500);
strokeWeight(2);
}

void draw(){
  background(255);
  smooth();
  for(int y = 0; y<500; y +=20){
    line(0,y, mouseX, mouseY);
  }
    
  for(int x = 0; x<500; x +=20){
    line(x, 0, mouseX, mouseY);
    
  for(int n = 500; n>0; n -=20){
    line(500,n, mouseX, mouseY);
  }
    
  for(int m = 500; m>0; m -=20){
    line(m, 500, mouseX, mouseY);
   
  }  
  
}
}
