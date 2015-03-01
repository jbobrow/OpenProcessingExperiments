
int direction;
PVector[] snake;
int sideSize = 15;
int snakeLength = 33;

//automode
boolean auto = false;
int[] directions = {UP, DOWN, LEFT, RIGHT};

int height = 500; 
int width = floor(height * (16/9));

void setup() {  //setup function called initially, only once
  size(width, height);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  rectMode(CORNER);
  direction = 0;
  snake = new PVector[snakeLength];
  
  for(int i=0; i < snakeLength; i++){
   snake[i] = new PVector(width/2, (i*sideSize), 0);
  }
}

void draw() {  //draw function loops 
  PVector newHead;
  
  background(255);
  stroke(0,255,255,255);
  fill(random(255),100,255,50);
  
  if(auto){
      keyPressed = true;
      key = CODED;
      keyCode = directions[ceil(random(4)) % 4];
  }
  
  if(keyPressed == true && key == CODED) {
      direction = keyCode;  
      
      // Set the new head to the last element
      // and then set its values to the first
      newHead = snake[snakeLength-1];
      newHead.set(snake[0].x, snake[0].y, 0);
      
      // Remove the last segment and splice in the
      // new head.
      shorten(snake);
      snake = splice(snake, newHead, 0);      
  }
  
  switch(direction){
      case UP:
          snake[0].add(0,-sideSize,0);
          break;
      case DOWN:
          snake[0].add(0,sideSize,0);
          break;
      case RIGHT:
          snake[0].add(sideSize,0,0);
          break;
      case LEFT:
          snake[0].add(-sideSize,0,0);
          break;
  }
  
  // Make it wrap around when it reaches the borders
  snake[0].set(((snake[0].x % width) + width) % width, ((snake[0].y % height) + height) % height, 0);
  
  for(int i=0; i < snakeLength; i++){
    rect(snake[i].x, snake[i].y, sideSize, sideSize); 
  }
  
  direction = 0; 
}

void keyPressed(){
    if( key == 'a'){
        auto = auto ? false : true;
    }
}
