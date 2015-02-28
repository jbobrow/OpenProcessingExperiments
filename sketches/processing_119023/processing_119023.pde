
//decalaring variables
int lives = 3;
float speed = 0.5; //speed at which the counter goes up
float score = 0; // Sets Score to 0
boolean foodCollision; //the collision booleans are used to later check if the snake has collided with the food/mines
boolean mineCollision;
float ease = 0.06; //sets the speed at which the snake balls follow the mouse

Food cookie; //declaring the class for the food

Mine[] obstacles; //declares the array of obstacles and also declares the class

ArrayList<Circle> balls = new ArrayList(); //declares the snake class and makes it an ArrayList

//______________________________________________________________________________________________________________________________________
//Screen setup and display
void setup() {
  
  size(600, 600); 
  smooth();
 
  cookie = new Food(); //makes the food
  
//creates the obstacles by creating all the objects within the array
  obstacles = new Mine[18];
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Mine();
  }
 
  balls.add(new Circle(ease, mouseX, mouseY)); //makes the first snake ball appear at the start

}

//______________________________________________________________________________________________________________________________________
//obstical/snake/food functions
void draw() {
  
  background(0);
 
  cookie.display(); //displays the food
 
 //this displays as many snake balls as are in the ArrayList (including ones we add later on, because we're in the draw function)
  for(int i=0; i<balls.size();i++){      
    balls.get(i).display(); 
    foodCollision = cookie.object_collision(mouseX,mouseY);  // checks if any of the snake balls have collided with food
  }
  
  if(foodCollision == true){
    cookieSetupScreen(); // move the food around the screen if touched by the snake
    ease = ease + 0.05;
    balls.add(new Circle(ease, mouseX, mouseY)); //add on a new snake ball to the Array list with a different easing
    foodCollision = false;
    lives ++;
  }
  
//displays the obstacles (the loop ensures the functions are applied to every object)
  for(int i = 0; i < obstacles.length; i++){ 
    obstacles[i].display(); //displays all the obstacles
    mineCollision = obstacles[i].object_collision(mouseX, mouseY); //checks if the obstacles are colliding with the mouse (returns true/false)
    if (mineCollision == true){
      minesSetupScreen(); //move all the obstacles but not the cookie (all obstacles must be moved or you keep losing lives for as long as it's on top of you)
      lives --;
    } 
  }

//initialisation and display of 'lives' and 'score'
 score = (speed ++) / 20; //allows the score to constantly rise all the time
 text("Lives: " + lives, 10, 10);
 int rScore = round(score); //rounds the score to the nearest whole number
 text("Score: " + rScore, 10, 30); 
 
//initialse 'end game'
  if(lives == 0){
    noLoop(); // stop the program
    background(0);
    textSize(80);
    text("GAME OVER!", 10, 150);
    text("SCORE: " + rScore, 10, 350); // displays end game score
   }
 
  }
  
//______________________________________________________________________________________________________________________________________
//creates function to move the cookie to a new location
  void cookieSetupScreen(){ 
    cookie.setX();
    cookie.setY();
  }

//______________________________________________________________________________________________________________________________________
//creates function to move all the mines to a new location
  void minesSetupScreen(){
    for(int i=0; i<obstacles.length; i++){
     obstacles[i] = new Mine(); //replaces all the obstacles in the class with new ones which are set at new random co-ordinates
  }
}

//food class initialisation
class Food{ //creates the block for the class
  float obstacle_x;
  float obstacle_y;
  int obstacle_width;
  int obstacle_height; //declares the class' fields
  
  Food(){ //the constructor
    obstacle_x = random(width); //these initial values will be set when each instance of a class is created
    obstacle_y = random(height);
    obstacle_width = 20;
    obstacle_height = 20;
  }
  
  void display(){ //this method displays the objects
    noStroke();
    fill(222, 143, 16);
    ellipse(obstacle_x, obstacle_y, obstacle_width, obstacle_height); //creates the biscuit
  }
  
  boolean object_collision(float tempX, float tempY){ //creates the method to test for collision between the snake and the food
  
    if ((obstacle_x + obstacle_width) > tempX
    && tempX > (obstacle_x - 18)
    && (obstacle_y + obstacle_height) > tempY
    && tempY > obstacle_y - 18){
        return true; //return true if the x and y co-ordinates of the snake balls collide with the food
    }
    else {
      return false;
    }
  }
  
  //these two functions move the cookie to new random co-ordinates when the functions are called
  void setX() {
    obstacle_x = random(width);
  }
  void setY() {
    obstacle_y = random(height);
  }
}
//obstical class initialisation
class Mine{ //creates the block for the class
  float obstacle_x;
  float speed = random(2); //makes the mines move at a random speed
  float obstacle_y;
  int obstacle_width;
  int obstacle_height; //declares the class' fields
  
  Mine(){ //the constructor
    obstacle_x = random(width); //thes initial values will be set when each instance of a class is created
    obstacle_y = random(height);
    obstacle_width = 40;
    obstacle_height = 50;
  }
  
  void display(){ //this method displays the objects

    strokeWeight(1);
    fill(219, 29, 41);
    rect(obstacle_x, obstacle_y, obstacle_width, obstacle_height); //creates the red part of the mine
    stroke(random(175, 255), random(175, 255), random(175, 255));
    strokeWeight(8);
    rect(obstacle_x + 10, obstacle_y + 12.5, obstacle_width - 20, obstacle_height - 25); //creates the multi-coloured part of the mine
    
    // The next section shows the code for making the obstacles scroll (move)
    obstacle_x += speed;
    
    if (obstacle_x > width){
     obstacle_x = 0; // moving the obstacle to the left side of the screen
    }
  }

  boolean object_collision(float tempX, float tempY){ //creates the method to test for collision between the snake and the mines
  
    if ((obstacle_x + obstacle_width + 8) > tempX
    && tempX > (obstacle_x - 8)
    && (obstacle_y + obstacle_height + 8) > tempY
    && tempY > obstacle_y - 8){
      return true; //return true if the x and y co-ordinates of the snake balls collide with the mine
    }
    else {
      return false;
    }
  }
  
}
//snake class initialisation
class Circle{
  
 float x; //these variables are used to control the size and position of the balls
 float y;
 float w;
 float h;
 float easing; //sets the speed at which the ball follows the mouse
  
 Circle(float e, float xVal, float yVal){ //snake ball constructor
  x = xVal;
  y = yVal;
  w = 20;
  h = 20;
  easing = e;
 }
  
 void display(){
   
   float targetX = mouseX; //these equations make the easing work
   x += (targetX - x) * easing;
   float targetY = mouseY;
   y += (targetY - y) * easing;
   noStroke(); //means there's no stroke on the snake balls
   fill(random(255), random(255), random(255)); //fill balls a random colour (flashing because it's run each time in draw)
   ellipse(x, y, w, h); //draws circle
  }
  
}


