
Brick[] obstacles;    // the bricks move down the screen
  Ship myShip;        // the ship is navigated around the bricks

int no_of_lives;      // use to end the game


// *******************************************************
//                    SETUP
// *******************************************************

void setup(){
  //frameRate(30);
  size(600,600);
  background(255); 
  
  no_of_lives = 3;
  obstacles = new Brick[10];
  
  setupScreen();
  
  myShip = new Ship();
 
}


// *******************************************************
//                    DRAW
// *******************************************************

void draw(){
  
  if(object_collision() == true){
    // pause the game, and display a 'life lost' image
    
    setupScreen();
   
    if(no_of_lives == 0){
      noLoop();    // stop the game
      
      // display the end of game image
      background(0);
      text("GAME OVER", 10,150);
      
    }
    
  }
  
  // continue with the game
  else{
    
    fill(255);
    noStroke();
    rect(0,0,width,height);
    
    
      
    // the moving bricks on the screen
    for(int i=0; i<obstacles.length; i++){
      obstacles[i].display();
      obstacles[i].move();
    }
    
    // the ship on the screen
    myShip.displayShip();

  }
  
    // show lives 
    textSize(50);
    text("Lives: " + no_of_lives, 10, 60);
  
  
}

// *******************************************************
//                    CLASS: BRICK
// *******************************************************

class Brick{
  
 float xPos;
 float yPos;
 float width_of_brick;
 float height_of_brick;
 float speed;

 Brick(){
    xPos = random(width);
    yPos = random(height-200);
    width_of_brick = 30;
    height_of_brick = 30;
    speed = random(4);
    //println(speed);
    // add void brick - show using println to debug
 } 
  
  void display(){
    fill(100);
    noStroke();
    rect(xPos, yPos, width_of_brick, height_of_brick);
    
  }
  
  void move(){
    yPos = yPos + speed;
    if (yPos>height){
      yPos = 0;
      xPos = random(width);
    }
  }
  
  float get_brick_x(){ return xPos; }
  
  float get_brick_y(){ return yPos; }
  
  float get_brick_width(){ return width_of_brick; }
  
  float get_brick_height(){ return height_of_brick;}
}

// *******************************************************
//                    CLASS: SHIP
// *******************************************************

class Ship{
  
  float xPos;
  float yPos;
  int width_of_ship;
  
  Ship(){
    width_of_ship = 40;
    xPos = width/2;
    yPos = height - (width_of_ship) - 10;
    
    //println("created ship");
   
  }
  
  void displayShip(){
    //stroke(255,0,0);
    //strokeWeight(width_of_ship);
    fill(255,0,0);
    xPos = mouseX-(width_of_ship/2);
    rect(xPos, yPos, width_of_ship, width_of_ship);
    //point(mouseX, yPos);
    //println(radius);
  }
    
  float get_ship_x(){ return xPos; }
  
  float get_ship_y(){ return yPos; }
  
  float get_ship_width(){ return width_of_ship; }
}


// *******************************************************
//                    FUNCTIONS
// *******************************************************

// CHECK IF THE BRICKS HIT THE SHIP
boolean object_collision(){
  
  boolean return_value = false;
  
  float brick_bottom;
  float brick_right;
  
  float ship_x = myShip.get_ship_x();
  float ship_y = myShip.get_ship_y();
  float ship_width = myShip.get_ship_width();
  float ship_right = ship_x + ship_width;
    
  for(int i=0; i<obstacles.length; i++){
    float brick_x = obstacles[i].get_brick_x();
    float brick_y = obstacles[i].get_brick_y();
    float brick_width = obstacles[i].get_brick_width();
    float brick_height = obstacles[i].get_brick_height();
    brick_bottom = brick_y + brick_height;
    brick_right = brick_x + brick_width;   
    
    if(brick_bottom >= ship_y && brick_right >= ship_x && brick_right <= ship_right){ 
      return_value = true;
    }
    if(brick_bottom >= ship_y && brick_x <= ship_right && brick_x >= ship_x){
      return_value = true;
    }
  }
  
  if(return_value == true){
    no_of_lives--;
  }
  return return_value;
}


// SETUP THE OBJECTS ON THE SCREEN
// if not used, the brick keeps moving over the ship and loses 3 lives immediately
void setupScreen(){
  for(int i=0; i<obstacles.length; i++){
    obstacles[i] = new Brick();
  }
}



