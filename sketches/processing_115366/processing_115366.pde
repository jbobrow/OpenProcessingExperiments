
float x; //declaring variables
float y;
float px;
float py;
float easing = 0.02; //declaring the speed of the easing
Mine[] obstacles; //declares the array and stating the data type, which is the class

boolean collision = false;

void setup(){
  size (600, 600);
  smooth();
  stroke(random(175, 255), random(175, 255), random(175, 255));
  strokeWeight(16);
  background(0);
  
  obstacles = new Mine[16]; //create the objects within the array
  for(int i = 0; i < obstacles.length; i++){
    obstacles[i] = new Mine();
  }
}

void draw(){
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing; //makes the easing work
  line(x, y, px, py); //draws the snake
  py = y;
  px = x;
 
 
 for(int i=0; i<obstacles.length; i++){ //the loop ensures that the function (method) is applied to every element within the array
      obstacles[i].display(); //displays all the instances of the class using the array
      
      collision = obstacles[i].object_collision(x, y);
  
      if (collision == true){ //collision detection
        background(0);
    }
      
  }

  
  
}

//***************

class Mine{ //creates the block for the class
  float obstacle_x;
  float obstacle_y;
  int obstacle_width;
  int obstacle_height; //declares the class' fields
  
  Mine(){ //the constructor
    obstacle_x = random(width); //thes initial values will be set when each instance of a class is created
    obstacle_y = random(height);
    obstacle_width = 40;
    obstacle_height = 50;
    fill(219, 29, 41);
  }
  
  void display(){ //this method displays the objects
    strokeWeight(1);
    rect(obstacle_x, obstacle_y, obstacle_width, obstacle_height); //creates the red part of the mine
    stroke(random(175, 255), random(175, 255), random(175, 255));
    strokeWeight(8);
    rect(obstacle_x + 10, obstacle_y + 12.5, obstacle_width - 20, obstacle_height - 25); //creates the multi-coloured part of the mine
    strokeWeight(16); //return the strokeWeight to what's required for drawing the snake
  }
  
  boolean object_collision(float tempX, float tempY){ //creates the method to test for collision between the snake and the mines
  
    if ((obstacle_x + obstacle_width) > tempX && tempX > obstacle_x && (obstacle_y + obstacle_height) > tempY && tempY > obstacle_y){
      return true; //return true if the x and y co-ordinates of the head of the snake collide with the mine
    }else {
      return false;
    }
  }
}


