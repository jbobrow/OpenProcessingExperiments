
void setup(){
      size (600,400);
      background (140,100,180);
      smooth (5);
      frameRate(7);
        
}
      int f = 100;
      int dir = 1;
      
      
      
void draw(){
 
    int r = (int) random (3);
    background (140,100,180);
    
    fill(f,random(255),random(255));
    
     if (f==0||f==512)
      {
      dir = dir * - 1;
      }  
      f = f+dir; 
    
   
  
    if (r==1){
        rect(mouseX, mouseY, 100,200);
    }else if (r==2){
        ellipse(mouseX, mouseY, 100,100);
    }else{
        rect (mouseX,mouseY,100,100);
    }
   
}
