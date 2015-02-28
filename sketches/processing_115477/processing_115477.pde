
int xPos;
int yPos;
Block[] blocks;


Snake mySnake;

boolean collision=false;


void setup() {

  size(600, 600);
  mySnake = new Snake();
  blocks = new Block[20];
  for(int i=0; i<blocks.length; i++)
  {
    blocks[i] = new Block();
  }
  


  
  
}




void draw() {

  background(255);
  

  mySnake.displaySnake();

for(int i=0; i<blocks.length; i++)
  {
    blocks[i].displayBlock();
  }
  
 collision = objectCollision();
 if (collision==true){whichSide();}
//println(collision);
}



class Snake {

  int xPos;
  int yPos;
  int width_of_snake;

  Snake() {
    width_of_snake = 40;
    xPos = width/2 - 20;
    yPos = height/2 - 20;
  }


  void displaySnake() {
    fill(255, 0, 0);
    if (keyPressed) {
      if (keyCode == LEFT && collision == false) {
        xPos = xPos - 1;
        curr = xPos;
      }
      if (keyCode == RIGHT && collision == false) {
        xPos = xPos + 5;
      }
      if (keyCode == UP && collision == false) {
        yPos = yPos - 5;
      }
      if (keyCode == DOWN && collision == false) {
        yPos = yPos + 5;
      }
      println(mySnake.xPos);
    }
    rect(xPos, yPos, width_of_snake, width_of_snake);
  }

  float get_snake_x() { 
    return xPos;
  }
  float get_snake_y() { 
    return yPos;
  }
  float get_snake_width() { 
    return width_of_snake;
  }
  
  void test(){if (collision==true){background(0,0,255);}
    xPos = 0;
  }

}



class Block {  
  float xPos;
  float yPos;
  float width_of_block = 30;
  float height_of_block = 30;

  Block() {
    xPos = random(width);
    yPos = random(height);
    width_of_block = 50;
    height_of_block = 50;
  }

  void displayBlock() {
    fill(100);
    noStroke();
    rect(xPos, yPos, width_of_block, height_of_block);
  }

  float get_block_x() { 
    return xPos;
  }
  float get_block_y() { 
    return yPos;
  }
  float get_block_width() { 
    return width_of_block;
  }
  float get_block_height() { 
    return height_of_block;
  }
}

boolean objectCollision(){

 boolean return_value = false;
   
  float snake_x= mySnake.get_snake_x();
  float snake_y = mySnake.get_snake_y();
  float snake_width = 40;
  float snake_height = 40;
     
  for(int i=0; i<blocks.length; i++){
    float block_x = blocks[i].get_block_x();
    float block_y = blocks[i].get_block_y();
    float block_width = blocks[i].get_block_width();
    float block_height = blocks[i].get_block_height();
    

    
    if(snake_y+snake_height >= block_y && 
        snake_y <= block_y + block_height && 
        snake_x <= (block_x + block_width) && 
        (snake_x + snake_width) >= block_x)
    {
      return_value = true;
      return return_value;
      //background(0,255,0);
    }

   
  }
  return return_value; 
 
  

  
}

int curr = 0;
String whichSide(){
  String side = "";
   
  float snake_x= mySnake.get_snake_x();
  float snake_y = mySnake.get_snake_y();
  float snake_width = 40;
  float snake_height = 40;
  
  for(int i=0; i<blocks.length; i++){
    float block_x = blocks[i].get_block_x();
    float block_y = blocks[i].get_block_y();
    float block_width = blocks[i].get_block_width();
    float block_height = blocks[i].get_block_height();
    
    if(snake_x < block_x+block_width)
    {
      side="right";
      mySnake.xPos = curr + 5;
    }

  }
  return side;
}
