
void setup(){
  size(1000,400);
  colorMode(HSB,360,100,100,100);
  smooth();
  background(0,0,0);
}
 
void draw(){
  for(int x = 0;x < width; x+=10){
      for(int y = 0;y < height; y+=10){
        if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
         fill(mouseY,300,mouseX);
        } else{
         noFill();
        }
        ellipse(x,y,10,10);
       
        if(x%40 == 0 && y%40 ==0){
        ellipse(x,y,300,300);
      }
 
      }
    }
    
    
 

  
}
 
void mouseReleased(){
  background(0,0,0);
}


