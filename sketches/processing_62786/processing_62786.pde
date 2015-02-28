
class Block {
  float x,y,w,h;
  int index=0, blockset=0;
  Block[] others; 
  Block() {
  }  
  
  void initBlock() {
    keyReleased();
    collide();
    if (index==1 & blockset==0)
      capture();
    if (index==0)
      display();
   }

   void collide() {
     if ((x <= player.x+player.w & x >= player.x) & (y >= player.y-player.h & y <= player.y)){     
        player.x -= 1;
        player.y += 1;
     }
      if ((x <= player.x+player.w & x >= player.x) & (y <= player.y+player.h & y >= player.y)){
        player.x -= 1;
        player.y -= 1;
      } 
      if ((x >= player.x-player.w & x <= player.x) & (y <= player.y+player.h & y >= player.y)){  
        player.x += 1;
        player.y -= 1;
      }  
      if ((x >= player.x-player.w & x <= player.x) &  (y >= player.y-player.h & y <= player.y)){
        player.x += 1;
        player.y += 1;
      }
    }  

    void keyReleased() {
      for (int i = 0; i< blockCount; i++){
      if (key=='f' | key=='а'){
        index=1; blockset=0;
      }
      if (keyPressed==false)
        index=0;
      } 
      }  

    void capture() {
      if (player.index2 == 1){//W
        x=player.x;
        y=player.y-player.h-2;
      }
      if (player.index2 == 2){//A
        x=player.x-player.w-2;
        y=player.y;
      }  
      if (player.index2 == 3){//S
        x=player.x;
        y=player.y+player.h+2; 
      }
      if (player.index2 == 4){//D
        x=player.x+player.w+2;
        y=player.y;
      }  
      w=10;
      h=10;
      blockset=1;
      index=0;
    }  
    void display() {
      stroke(0,0,255);
      fill(255);
      rect(x,y,w,h); 
   }  
}
 

