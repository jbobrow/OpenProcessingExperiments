
int counter;
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;

int diameter = 20;
int radius = diameter/2;
int diameter2 = 20;
int dr = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  println ("Press 'x' to move right/left, 'c' to move up/down");
}

void draw() {

   if (x > (250-radius)) {
      dx = -dx;
   }
   
   else if (x < radius) {
      dx = -dx;
   }
   
   else if (y > (250-radius)) {
      dy = -dy;
   }   

   else if (y < radius) {
      dy = -dy;
   }
   
   else {
      background(255,255,255);
      ellipse(x,y,diameter,diameter2);
   
      if(keyPressed) {
         fill(0,255,0);
         if (key == 'x') {
   
            if (dx == 1) {
              dx = -dx;
            }           
            else if (dx == -1) {
              dx = -dx;
            }      
            else if (dx == 0) {
              dx = 1;
            }
        
         }
         else if (key == 'c') {
            if (dy == 1) {
              dy = -dy;
            }   
            else if (dy == -1) {
              dy = -dy;
            }              
            else if (dy == 0) {
              dy = 1;
            }
         }
         else if (key == 'p') {
            
            
            diameter = diameter + 1;
         }
         else if (key == 'o') {
            diameter = diameter - 1;
         }
         else if (key == 's') {
            dx = 0;
            dy = 0;
         }        

      }
      else {
         fill(255,0,0);
      }
      
   }
      radius = diameter/2;
      diameter2 = diameter;
      x = x + dx;
      y = y + dy;

}
