

class Mickey{
  
  // Mickey's variables
  
   int x_position;
   int y_position;
   int speed = 1;
   int x_direction;
   int y_direction;
 
 
 Mickey (int x, int y) {
 
      x_position = x;
      y_position = y;
      x_direction = 1;
      y_direction = 1;
  }
 
 
 
 void move (){
   
      //move mickey left and right
      x_position = x_position+speed * x_direction;
      //move mickey up and down
      y_position = y_position+speed * y_direction;
      
      //bounce sides
      if ( x_position + 80 >= width){
        x_direction= -x_direction;
      }
      if ( x_position - 45 <= 0){
        x_direction= -x_direction;
      }
      //bounce at top and bottom
      if ( y_position + 60 >= height){
        y_direction= -y_direction;
      }
      if ( y_position - 55 <= 0){
        y_direction= -y_direction;
      }
      
      println(x_direction);
 }    
 
  

// Draws a little sweet Mickey Mouse

 void show() {
  
    //eyes
    fill (0);
    ellipse (x_position + 20, y_position +5, 50,70);

    fill (255);
    ellipse (x_position+10, y_position+10, 20, 70);
    ellipse (x_position+30, y_position+10, 20, 70);


    fill (153, 50, 204);
    ellipse (x_position+10, y_position+10, 10, 30);
    ellipse (x_position+30, y_position+10, 10, 30);


     //Schnauze
    fill (253, 245, 230);
    ellipse (x_position +20, y_position+30, 80, 50);
  
  
    //nose
    fill (0);
    ellipse (x_position+20, y_position+20, 30, 10);

    //ears
    ellipse (x_position-25, y_position-30, 60, 60);
    ellipse (x_position+65, y_position-30, 60, 60);
    
    //mouth
    fill(255);
    triangle ( x_position+35, y_position+45, x_position , y_position+35, x_position, y_position+30);
    }

}

