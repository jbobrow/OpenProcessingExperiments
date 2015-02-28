
class Block {
  float x,y;
  float w = 15;
  float h = 15;
  color col;
  int index=0, blockset=0;
  Block[] others; 
  Block() {
  }  
  
  void initBlock() {   
   blockSet();
   
    if (index==1 & blockset==0) {         
      capture();      
    }  
    if (index==0){      
      display();      
    }  
   }   
   void collide() {                 
     if ((x <= player.x+player.w & x >= player.x) & 
     (y >= player.y-player.h & y <= player.y)){    
        player.x -= 1;
        player.y += 1;
     }
      if ((x <= player.x+player.w & x >= player.x) & 
      (y <= player.y+player.h & y >= player.y)){
        player.x -= 1;
        player.y -= 1;
      }
      if ((x >= player.x-player.w & x <= player.x) & 
      (y <= player.y+player.h & y >= player.y)){ 
        player.x += 1;
        player.y -= 1;
      } 
      if ((x >= player.x-player.w & x <= player.x) &  
      (y >= player.y-player.h & y <= player.y)){
        player.x += 1;
        player.y += 1;
      }
    }  
    void blockSet() {
       col = color(100,200);
      if (player.index2 == 1){
        x=player.x;
        y=player.y+player.h+2;        
      }
      if (player.index2 == 2){
        x=player.x;
        y=player.y-player.h-2;
      }  
      if (player.index2 == 3){
        x=player.x+player.w+2;
        y=player.y; 
      }
      if (player.index2 == 4){
        x=player.x-player.w-2;
        y=player.y;
      }  

      for (int i = 0; i< blockCount; i++){       
        if (player.index3==5) {
          index=1; blockset=0;
        }
        if (player.index3!=5) index=0;       
      } 
   }   
   
    void capture() {      
      blockset=1;           
      col = color(255);      
      index=0;
      blockIndex++;
    }  
   
    void display() {      
      fill(col);
      rectMode(CENTER);    
       collide();     
      rect(x,y,w,h);
      noStroke();

    }    
}
 

