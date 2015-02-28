
class Snake {
  color c;
  int[] tailX;
  int[] tailY;
  int xpos;
  int ypos;
  final int speed = pX;
  int sLength = 10;
  int sSize = 10;
  int followChance;
   
  Snake(int tempxpos, int tempypos) {

    xpos = tempxpos - (tempxpos%10); //ensures that the starting mouse click position is on a grid
    ypos = tempypos - (tempypos%10);
    
    followChance = (int) random(1, 5); //changes the likihood that the snake will go in the direction of the mouse, lower = more chance

    c = color(random(30,250),random(30,250),random(30,250), 100); //the colour of the snake
     
    tailX = new int[sLength]; // This should initialize the array to the length specified
    tailY = new int[sLength];
     
    // Fills the array with the inital position
    for (int i = 0; i < tailX.length; i++) {
     tailX[i] = xpos;
     tailY[i] = ypos;
    }
  }
   
  /*=======The method which displays and moves the snake=========*/ 
  void display () {
     
    // Shifts the array values for a new value
    for (int i = 0; i < tailX.length - 1; i++) {
     tailX[i] = tailX[i + 1];
     tailY[i] = tailY[i + 1];
    }
     
    // Add the new location to the end as the end is the last one drawn which is the head
    tailX[tailX.length - 1] = xpos;
    tailY[tailY.length - 1] = ypos;
     
    noStroke();
    
    //drawing the snake
    for(int i = 0; i < tailX.length; i++){
      fill(c);
      rect(tailX[i], tailY[i], sSize, sSize);
    }
    
    //checking the snake isn't out of bounds on the x axis, sending it back in if it is
    if(xpos < 0){
      xpos += sSize;
    } else 
        if(xpos > width){
          xpos -= sSize;
    } else {//if it makes it this far then the snake is currently in bounds so move it
        
        int chance = (int) random(1,11); //the chance which decides which direction it moves in
        
        if(mouseX > xpos){ //if the mouse is to the right of the snake then there's a greater chance it will move to the right
          if(chance <= followChance){
            xpos -= sSize;
          } else{
            xpos += sSize;
          }
        }
        
        if(mouseX < xpos){  //if the mouse is to the left of the snake then there's a greater chance it will move to the left
          if(chance <= followChance){
            xpos += sSize;
          } else{
            xpos -= sSize;
          }
        }
        
    }
    
    //checking the snake isn't out of bounds on the y axis
    if(ypos < 0){
      ypos = ypos + sSize;
    } else 
        if(ypos > width){
          ypos = ypos - sSize;
    } else {
      
        int chance = (int) random(1,11); //the chance which decides which direction it moves in
        
        if(mouseY > ypos){ //if the mouse is to the right of the snake then there's a greater chance it will move to the right
          if(chance <= 3){
            ypos -= sSize;
          } else{
            ypos += sSize;
          }
        }
        
        if(mouseY < ypos){  //if the mouse is to the left of the snake then there's a greater chance it will move to the left
          if(chance <= 3){
            ypos += sSize;
          } else{
            ypos -= sSize;
          }
        }
    }
   }
}

