
class Game_shape {
   int shape_type; //1 is a circle, 2 is a square
   int shape_color; //1 is red, 2 is blue, 3 is yellow, 4 is purple, 5 is orange, 6 is green;
   float x_pos;
   float y_pos;
   float diamtr;
   float velocity;
   
   Game_shape(int t, int c, float x, float y, float d, float v) {
     shape_type = t;
     shape_color = c;
     x_pos = x;
     y_pos = y;
     diamtr = d;
     velocity = v;
   }
   
   Game_shape() {
   }
   
   void setShape(int t) {
     shape_type = t; 
   }
   
   void setColor(int c) {
     shape_color = c; 
   }
   
   void setDiamtr(float d) {
     diamtr = d; 
   }
   
   void setVelocity(float v) {
     velocity = v; 
   }
   
   void setX(float x) {
     x_pos = x;
   }
     
   void setY(float y) {
     y_pos = y;
   }
   
   float returnVelocity() {
     return velocity; 
   }
   
   float returnY() {
     return y_pos; 
   }
   
   float returnX() {
     return x_pos; 
   }
   
   float returnDiameter() {
     return diamtr; 
   }
   
   int returnShape() {
     return shape_type;
   }
   
   int returnColor() {
     return shape_color;
   }
   
   void motion(int s) {    //1 for player, 2 for enemy
      if (s == 1){
        y_pos -= velocity;
      }
      else if (s == 2) {
        y_pos += velocity;
      }
      else {
        println("Not a valid option.");
        exit();
      }
   }
   
   void display() {
     switch(shape_color){
       case 1:  //red
         fill(196, 0, 7);
         break;
       case 2:  //blue
         fill(0, 46, 160);
         break;
       case 3:  //yellow
         fill(245, 231, 0);
         break;
       case 4:  //purple
         fill(102, 45, 145);
         break;
       case 5:  //orange
         fill(242, 101, 34);
         break;
       case 6:  //green
         fill(0, 114, 55);
         break;
       default:
         println("Not a valid color code.");
         exit();
     }
     if (shape_type == 1) //circle
       ellipse(x_pos, y_pos, diamtr, diamtr);
     else if (shape_type == 2) //rectangle
       rect(x_pos, y_pos, diamtr, diamtr);
     else //error
     {
        println("Not a valid shape identifier");
        exit(); 
     }
   }
  
}

