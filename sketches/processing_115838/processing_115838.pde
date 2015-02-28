
int X,Y;
int side = 600;
int dir ;
int xpos = side/2;
int ypos = side/2;
int snakeLength = 15;
int currentSnakeLength = 0;
int[][] snake = new int[snakeLength][2];

void setup() {
  size(600,600);
  background(0,0,0);
  frameRate(5);
}
 
// creating the square and positioning the square
 
void draw() {
  fill(255,255,255);
  rect(xpos,ypos,10,10);
  
  // Is the snake full length already?
  if(currentSnakeLength >= snakeLength) {
    fill(0,0,0);
    // Delete the last square
    rect(snake[0][0],snake[0][1],10,10);
    // Shift the squares positions in the array
    for(int i = 0; i  < (snakeLength - 1); i++) {
      snake[i][0] = snake[i+1][0];
      snake[i][1] = snake[i+1][1];
    }
    // Add the current square position to the end of array
    snake[currentSnakeLength - 1][0] = xpos;
    snake[currentSnakeLength - 1][1] = ypos;
    } else {
    // No - do the initial array filling
    snake[currentSnakeLength][0] = xpos;
    snake[currentSnakeLength][1] = ypos;
    currentSnakeLength++;
    print("\n Snake length is" + currentSnakeLength + "\n");
  }
  if (dir == 1){
    ypos = ypos - 10;
  }
  else if (dir == 2){
    xpos = xpos + 10;
  }
  else if (dir == 3){
    ypos = ypos + 10;
  }
  else if (dir == 4){
    xpos = xpos - 10;
  }
  else {
    xpos = xpos + 10;
  }
   
}
 
// Keyboard input to change the direction of the snake
 
void keyPressed() {
  if (key == CODED){
    if(keyCode == UP){
      dir = 1;
      Y-- ;
      print("Up key pressed X is " + X + " and Y is " + Y + "\n" );
      print("Xpos is" + xpos + " and Ypos is " + ypos + "\n" );
    } else if(keyCode == RIGHT){
      dir = 2;
      X++;
      print("Right key pressed X is " + X + " and Y is " + Y + "\n" );
    } else if(keyCode == DOWN){
      dir = 3;
      Y++;
      print("Down key pressed X is " + X + " and Y is " + Y + "\n" );
    } else if(keyCode == LEFT){
      dir = 4;
      X--;
      print("Left key pressed X is " + X + " and Y is " + Y + "\n" );
    } else {
      dir = 0;
    }
       
  }
}

