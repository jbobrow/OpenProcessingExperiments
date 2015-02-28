
class Seahorse {   
  
  float xpos;
  float ypos;
  float xspeed; 
 
  Seahorse(float tempx, float tempy, float tempspeed) { 
   
   println("a seahorse has been created");
   
   xpos = tempx;  
   ypos = tempy;
   xspeed = tempspeed;
  }

  void display() {
   PImage seahorse;
   seahorse = loadImage("seahorse.gif");
   image(seahorse, xpos, ypos);   
  }

  void swim() {             
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
  
  void swimfast() {             
    xpos = xpos + 10*xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
  
  void killerfish() {
   PImage killerfish;
   killerfish = loadImage("killerfish.gif");
   imageMode(CENTER);
   image(killerfish, mouseX, mouseY);   
   
   if ((xpos < mouseX + 70) && (xpos > mouseX - 70)) {
     if ((ypos < mouseY + 70) && (ypos > mouseY - 70)) {
       xpos+=70;
       ypos+=70;
       
       if ((xpos > 600) && (ypos > 600)) {
         xpos=random(0,300);
         ypos = random(0,300);
       }
       
     }
   }
  }
   
}




