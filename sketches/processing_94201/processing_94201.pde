
//Who knew that a simple snake game is sooo complicated
//With help from processing reference, and someone named Charles Carr for help with arrarys which I counld not understand and some variable i left out.

int phase; // is the varible that tells me what phase I am in

int snakeSize; //size of snake

int snakeHead;//snakehead variabe
int snakeSpd;// speed of the snake

//could not wrap my head around this 
//keeps the bodie's x and y values and the head's x and y into arrays
int[] snakeX = new int [600];
int[] snakeY = new int [600];

//snakes moving rate
int[] xrate = new int[2];
int[] yrate = new int[2];

//x and y values of food
int foodx = 0;
int foody = 0;



//happens only once
void setup() {
  size(600, 600);
  rectMode(CENTER);
  snakeX[0] = 300;//snake is on screen
  snakeY[0] = 300;
  xrate[0] = 0;//since x and y rates are 0 x and y positions do not move
  yrate[0] = 0;
  foodx = (floor(random(60)))*10;// makes food appear randomly
  foody = (floor(random(60)))*10;
  frameRate(40);
}

//Repeats over and over
void draw() {
  // Play phase
  if (phase == 0) {
    background(255);

    
    //Draw the snake from tail to head
    for ( int tail = snakeSize; tail >= 0; tail--) { //tail grows longer
      fill(125);

      //if tail is > than 0 head isn't drawn
      if (tail > 0) {
        snakeX[tail] = snakeX[tail - 1];//this will shift the snake body pixel
        snakeY[tail] = snakeY[tail - 1];

        rect(snakeX[tail], snakeY[tail], 10, 10);//THIS IS WHAT I COUNLDN"T FIGURE OUT
      }
      else {//draw the head
        fill(0);
        //Increasing the x and y position by the coresponding rate
        snakeX[tail] += xrate [tail];
        snakeY[tail] += yrate [tail];
        //Draw the head in new position
        rect(snakeX[tail] + 1, snakeY[tail], 10 + snakeHead, 10 + snakeHead);
        //check to see if head bites body
        for ( int body= 1; body<= snakeSize; ++body) {
          if (snakeX[tail] ==snakeX[body] && snakeY[tail] == snakeY[body]) {
            phase = 1; //gameover
          }
        }
      }  
      //If snake passes the edge of the screen
      if (snakeX[0] >= 600 || snakeX[0] <= 0 || snakeY[0] >= 600 || snakeY[0]<=0) {
        
          phase = 1;}
        

        // eat the food
        if (snakeX[0] == foodx && snakeY[0] == foody) {
          snakeSize++;//bigger snake
          
          //new food location
          foodx = (floor(random(60)))*10;
          foody = (floor(random(60)))*10;
        tail=0;
    
   
      }
    } fill(0, 0, 255);
    rect(foodx, foody, 10, 10);
    
    
  }
}









// movin the snake
void keyPressed() {
  if (keyCode == UP) {
    xrate[0] = 0;
    yrate[0] = -10;
  }
  if (keyCode == DOWN) {
    xrate[0] = 0;
    yrate[0] = 10;
  }
  if (keyCode == LEFT) {
    xrate[0] = -10;
    yrate[0] = 0;
  }
  if (keyCode == RIGHT) {
    xrate[0] =10;
    yrate[0] = 0;
  }
  if (keyCode == ENTER) {//I did not know you can use setup to reset 
    setup();
    phase= 0;
  }
}






















