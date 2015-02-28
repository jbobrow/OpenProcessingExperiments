
// josefina rovira
// 9/01/14
// the keyboard is different from american keyboard
/*
Bouncing Balls by Xiaofeng Lin
Multiple balls going back and forth in different speeds
*/
 
 
int xPos;
int yPos;
 
int xPos2;
int yPos2;
 
int xPos3;
int yPos3;
 
//speeds of balls
int velocity;
int velocity2;
int velocity3;
 
void setup(){
   size(400,400);
   xPos = width/2;
   yPos = height/2;
  
   xPos2 = width/3;
   yPos2 = height/3;
    
   xPos3 = width/4;
   yPos3 = height*2/3;
    
   velocity = 3;
   velocity2 = 6;
   velocity3 = 9;
}
 
void draw(){
   background(230);
   fill(0,255,0);
    
   //middle ball
   xPos += velocity;
    
   if(xPos >= width-25 || xPos <= 25) {
   velocity = -velocity;
    
   }
  
   noStroke();
   fill(255-velocity*10,255-velocity2*10,255-velocity3*10);
   ellipse(xPos,yPos,50,50);
 
 
   //upper ball
   xPos2 += velocity2;
   
   if(xPos2 >= width-25 || xPos2 <= 25) {
   velocity2 = -velocity2;
    
   }
   fill(255-velocity*10,255-velocity2*10,255-velocity3*10);
   ellipse(xPos2,yPos2,50,50);
    
    
   //vertical ball
   yPos3 += velocity3;
   
   if(yPos3 >= height-25 || yPos3 <= 25) {
   velocity3 = -velocity3;
    
   }
   fill(255-velocity*10,255-velocity2*10,255-velocity3*10);
   ellipse(xPos3,yPos3,50,50);
 
 
}

    

