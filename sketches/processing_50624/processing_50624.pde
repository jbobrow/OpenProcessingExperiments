
//Sara Humel
//copyright 2012

/* Press any key for bars to appear on the screen.
   
   The y coordinate of the rectangles is determined by the number
   of frame counts in between keyPressed and keyReleased. 
   
   click the mouse to change the background from black to white and then back.
  
   **More fun if you tap to music. Multiple keys can be pressed at the same. 
*/


float r1 = 400, r2 = 400, r3 = 400, r4 = 400, r5 = 400, r6 = 400, r7 = 400, r8 = 400;
float a = 0, b = 0 ,c = 1;

void setup(){
  size(400,400);
  
}

void draw(){
  fill(0,0,0,50);
  if(c % 2 == 0){
  fill(255,255,255,50);
  }
  if(frameCount % 2 == 0){
  rect(0,0,width,height);
  }
  
  stroke(255,255,255);
  if (frameCount==200){
  saveFrame("thumbnail.jpg");
}
}



//move right
void keyPressed(){
  r1 = 400;
   r2 = 400;
   r3 = 400;
   r4 = 400;
   r5 = 400;
   r6 = 400;
   r7 = 400;
   r8 = 400;
 
  
  a = frameCount;
  }
  
  void keyReleased(){
   b = frameCount; 
   fill(random(255),random(255),random(255));
   if(c % 2 == 0){
     fill(random(255),random(255),random(255));
   }
  
   
   
   
   r1 = r1-(random(1,20)*(b-a));
   r2 = r1-(random(1,20)*(b-a));
   r3 = r1-(random(1,20)*(b-a));
   r4 = r1-(random(1,20)*(b-a));
   r5 = r1-(random(1,20)*(b-a));
   r6 = r1-(random(1,20)*(b-a));
   r7 = r1-(random(1,20)*(b-a));
   r8 = r1-(random(1,20)*(b-a));
   rect(0,r1,50,10);
   rect(50,r2,50,10);
   rect(100,r3,50,10);
   rect(150,r4,50,10);
   rect(200,r5,50,10);
   rect(250,r6,50,10);
   rect(300,r7,50,10);
   rect(350,r8,50,10); 
   
  }
  
  void mouseClicked(){
    c++;
  }

                
                
