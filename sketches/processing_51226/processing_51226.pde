
float x_direction =10;
float y_direction =5;
float xpos = 80;
float ypos = 80;

void setup(){
  
 size(400,400);

  
}
  void draw (){
    background (2);
    fill(225);
    rect(0,0,width,height);
    fill(0,0,225);
    ellipse (xpos,ypos,30,30);
    
    // && -AND
    // ||-OR 
    
    xpos = xpos + x_direction;
    ypos = ypos + y_direction;
   
   if (xpos>width-15){
    x_direction = x_direction *-1;
   }
   
   if (xpos<15){
     x_direction = x_direction *-1;
   }
   if (ypos>height-15) {
     y_direction = y_direction *-1;
   }
   if (ypos<=15){
     y_direction = y_direction *-1;
   }


   
  } 

                
                
