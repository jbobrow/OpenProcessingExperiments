
Circles [] button = new Circles [8];
 
 
  void setup () {
     
    size (500,500);
    smooth ();
    stroke (0);
    frameRate(120);
     
    for (int i=0; i<button.length; i++) {
      
      button[i] = new Circles (30,210,random(100,200));
    }
     
 
}
 
 
void draw () {
   
  background (20,230,200);
   
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
 
 
class Circles {
   
  float x;
  float y;
   
  float xspeed;
  float yspeed;
   
  float buttonSize;
   
  boolean clicked;
   
   
  Circles (float xpos, float ypos, float bSize) {
     
    x = xpos;
    y = ypos;
    buttonSize = bSize;
     
     
    xspeed = random (-5,5);
    yspeed = random (-5,5);
     
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
        
       fill (255);
     }
      
     else {
      
     fill (random (250), random (250), random (250));
      
     }
      
     ellipse (x,y,buttonSize+5,buttonSize+10);//face
     fill(255);
     ellipse (x+10,y-5,mouseX/10,mouseY/10);//right eye
     ellipse (x-10,y-5,mouseX/10,mouseY/10);//left eye
     fill(0);
     ellipse (x+10,y-5,5,5);//right eye
     ellipse (x-10,y-5,5,5);//left eye
     
     ellipse(x+5,y+30,50,random(20));//mouth
   }
    
   void checkMousePress () {
      
     if ((mouseX > x) && (mouseX< x + buttonSize)) {
        
       clicked = !clicked;
     }
      
     else if ((mouseY > y +1) && (mouseY< y + buttonSize)) {
       clicked = !clicked;
     }
   }
     
}



