
// My moving Squares
 
 
SquaresArray [] button = new SquaresArray [300];
  
  void setup () {
     size (500,500);
    smooth ();
 
     
    //Array of Squares
      
    for (int i=0; i<button.length; i++) {
       
      button[i] = new SquaresArray (200,200,20);
    }
      
  
}
  
  
void draw () {
    
  background (169, 43, 288);  // Purple color
    
 for (int i=0; i<button.length; i++) {
     
    
   button[i].checkCollisions ();
   button[i].drawSquaresArray ();
   button[i].update ();
     
 }
    
}
  
void mousePressed () {
    
  for (int i=0; i<button.length; i++) {
     
    button[i].checkMousePress ();
      
  }
}
  
  
class SquaresArray {
    
  float x;
  float y;
  float xspeed;
  float yspeed;
  float squareSize;
  boolean clicked;
    
    
  SquaresArray (float xpos, float ypos, float sSize) {
      
    x = xpos;
    y = ypos;
    squareSize = sSize;
      
    xspeed = random (-10);
    yspeed = random (-10);
      
    clicked = false;
      
  }
    
  void update () {
      
    x += xspeed;
    y += yspeed;
      
  }
    
  void checkCollisions () {
      
    if ( (x<0) || (x>width-squareSize)) {
       xspeed = -xspeed;
    }
      
     if ( (y<0)  || (y>height-squareSize)) {
       yspeed = -yspeed;
    }
   }
     
   void drawSquaresArray () {
       
     if (clicked) {
         
       fill (133, 133, 221); //Fill square yellow
     }
       
     else {
       
     fill (255, 255, 0); // Fill square light blu
       
     }
       
     rect (x,y,squareSize,squareSize);
   }
     
   void checkMousePress () {
       
     if ((mouseX > x) && (mouseX< x + squareSize) && (mouseY > y) && (mouseY< y + squareSize)) {
         
       clicked = !clicked;
     
     }
   }
}
 
 


                
                                
