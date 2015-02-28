
class Donut {
  float x = 50;
  float y = 300;
  float w;
  float h;
  float donX = 0;
  float donY = 0;
  float increase = 0.0;
  
  //constructor
  Donut ( float donX, float donY){
    x = donX;
    y = donY;
  } //end constructor
  
  void display(){
    smooth();
    image(pinkDonut, x, y);
    
  }//end display
  
  void action() { 
    if ( (mousePressed == true) && (y > 0) ) { 
      donY = -4.5 * easing; 
      increase = 1 * easing; 
    } 
    x = x + donX; 
    x = constrain (x, 0, 640); 
    y = y + donY; 
    y = constrain (y, 0, 350); 
    float easing = 0.10; 
    donY = donY + increase * easing; 
  }//end action 
  
 
 void hit(){ //on page 2, if donut gets near any of the hands, page 2 turns to page 3
   if (page==2){

   
 if ( dist(x+w,y+h, btm1.x, btm1.y)< 50||
 dist(x+w,y+h, btm2.x, btm2.y)< 50||
 dist(x+w,y+h, btm3.x, btm3.y)< 50||
dist(x+w,y+h, btm4.x, btm4.y)< 50||
 dist(x+w,y+h, tp1.x, tp1.y)< 200|| 
 dist(x+w,y+h, tp2.x, tp2.y)< 200|| 
 dist(x+w,y+h, tp3.x, tp3.y)< 200|| 
dist(x+w,y+h, tp4.x, tp4.y) < 200){
   page=3;}

   }//end if

 
}//end hit



void win(){
     if (page==2){   // on page 2, if donut successfully avoids all hands, page 2 turns to page 4
 if ( millis()>240000 && dist(x+w,y+h, btm1.x, btm1.y)> 50&&
 dist(x+w,y+h, btm2.x, btm2.y)> 50&&
 dist(x+w,y+h, btm3.x, btm3.y)> 50&&
dist(x+w,y+h, btm4.x, btm4.y)> 50&&
 dist(x+w,y+h, tp1.x, tp1.y)>200&& 
 dist(x+w,y+h, tp2.x, tp2.y)>200&&
 dist(x+w,y+h, tp3.x, tp3.y)> 200&& 
dist(x+w,y+h, tp4.x, tp4.y)>200){
   page=4;}
     }//end if
}//end win

void reset(){ //reset values if game restarted
  x = 60;
  y = 100;
  donX = 0;
  donY = 0;
  increase = 0;
}//end reset
  

}//end class
////////////////////////////////////

class Bottom{
  float x, y, w, h, move;
  PImage seeBottom;
  //hand constructor
  Bottom (float visX, float visY, float goMove, String Bottom){
    x = visX;
    y = visY;
    move = goMove;
    seeBottom = loadImage(Bottom);
    w = seeBottom.width;
    h = seeBottom.height;
  }//end constructor
  
  void display(){
    image(seeBottom,x,y);
  }//end display
  
  void action(){
    x = x - move;
    if (x< -w){
      x = width+400;
      move = move + .10;
    }
  }//end action
  
    void reset(float visX, float visY){ //reset values if game restarted
    x = visX;
    y = visY;
  } // end reset bottom
  
}//end class Bottom


///////////////////////////////////////

class Top{
  float x;
  float y;
  float w;
  float h;
  float move;
  PImage seeTop;
  
  Top (float visX, float visY, float goMove, String Top){
    x = visX;
    y = visY; 
    move = goMove; 
    seeTop = loadImage (Top);
    w = seeTop.width;
    h = seeTop.height; 
  } //end constructor 
    
  void display(){
    image(seeTop,x,y);
  }//end display
  
  void action(){
    x = x - move;
    if (x < -w){
      x =width+400;
      move = move + .10;
    }
  }//end action 
  
    void reset(float visX, float visY){ //reset values if game restarted
    x = visX;
    y = visY;
  }//end reset top
  
}//end class Top
  
  
//////////////////////////////////////


  
  
  void mousePressed(){
    // if mouse pressed w/in this box, page 1 turns to page 2 or start to playing
    if (page == 1){
      if ( (mouseX>=300)&&(mouseX<=410)&&(mouseY>=410)&&(mouseY<=480) && (mousePressed == true)){
        page = 2; }
    }//end if
    
    //if mouse pressed w/in this box, page 3 turns to page 1 or gameover to restart
    if (page == 3) {
      if ( (mouseX>=320)&&(mouseX<=470)&&(mouseY>=410)&&(mouseY<=480) && (mousePressed == true)){
        page = 1; }      
    }//end if
    
    //if mouse pressed w/in this box, page 4 turns to page 1 or winning to restart
   if (page == 4) {
     if ( (mouseX>=320)&&(mouseX<=470)&&(mouseY>=410)&&(mouseY<=480) && (mousePressed == true)){
       page = 1; }      
    }//end if
      
}//end keyPressed 


    

