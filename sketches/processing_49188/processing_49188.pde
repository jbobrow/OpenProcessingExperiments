
Squares [] button = new Squares [30];
 
void setup () {
     
    size (400,400);
    smooth ();
    stroke (155,130,100);
     
    for (int i=0; i<button.length; i++) {
      
      button[i] = new Squares (200,200,random (30,70));
    }
     
}
 void draw () {
   
  background (75,75,53);
   
 for (int i=0; i<button.length; i++) {
    
   button[i].checkCollisions ();
    
   button[i].drawSquares ();
    
   button[i].update ();
    
 }
   
   
}
 
void mousePressed () {
   
  for (int i=0; i<button.length; i++) {
    
    button[i].checkMousePress ();
     
  }
}
 
 
class Squares {
   
  float x;
  float y;
   
  float xspeed;
  float yspeed;
   
  float buttonSize;
   
  boolean clicked;
   
   
  Squares (float xpos, float ypos, float bSize) {
     
    x = xpos;
    y = ypos;
    buttonSize = bSize;
     
     
    xspeed = random (-5,-2);
    yspeed = random (-5,9);
     
    clicked = false;
     
  }
   
  void update () {
     
    x += xspeed;
    y += yspeed;
     
  }
   
  void checkCollisions () {
     
    if ( (x<0) || (x>width-buttonSize)) {
       xspeed = -xspeed;
    }
     
     if ( (y<0)  || (y>height-buttonSize)) {
       yspeed = -yspeed;
    }
   }
    
   void drawSquares () {
      
     if (clicked) {
        
       fill (40,10,40);
     }
      
     else {
      
     fill (250,50,30);
      
     }
      
     rect (x,y,buttonSize,buttonSize);
   }
    
   void checkMousePress () {
      
     if ((mouseX > x) && (mouseX< x + buttonSize)) {
        
       clicked = !clicked;
     }
      
     else if ((mouseY > y) && (mouseY< y + buttonSize)) {
       clicked = !clicked;
     }
   }
     
}


