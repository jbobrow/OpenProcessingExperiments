
class Block {
  PVector v1,v2;
  int index = 0;
  float x, y, x2, y2;
 
 Block(){   

 } 
  
 Block(float xpos, float ypos, float xpos2, float ypos2){
   stroke(255,0,0);
   v1 = new PVector(player.x,player.y);
   line(v1.x,v2.y,x,y);
    x=xpos;
    y=ypos;
    x2=xpos2;
    y2=ypos2;   
  }  
  void initBlock(){
    stroke(0,0,255);
     v2 = new PVector(player.x,player.y);
     line(v2.x,v2.y,x,y);
    x=ceil(v2.x);
    y=ceil(v2.y);
    x2=10;
   y2=10; 
   
    keyPressed();
  }  
  void keyPressed(){
   
   if (key == 'f' | key == 'а') index = 1;
   
   if (index == 1) display();
   
  }

 void display(){
  fill(255);
  rect(x,y,x2,y2);
 }
} 

