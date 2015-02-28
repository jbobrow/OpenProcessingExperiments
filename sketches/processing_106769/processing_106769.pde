
snake test;
food one;
int highScore;

void setup(){
  size(1000, 500);
  frameRate(20);
  test = new snake();
  one = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  highScore = 0;
}
  
void draw(){
  // draws background
  background(250);
  // draws scoreboard
  drawScoreboard();
  // runs the functions .move and .display for varible "test" of class "snake:
  test.move();
  test.display();
  // runs the function .display for variable "one" of class "food"
  one.display();
  // adds length to snake and resets food when the snake gets close enought to the food
  if( dist(one.xpos, one.ypos, test.xpos.get(0), test.ypos.get(0)) < test.sideLen){
    one.reset();
    test.addLink();
  }
  if(test.len > highScore){
    highScore = test.len;
  }
}
// makes it so snakes directions are controlled by keys
void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      test.dir = "left";
    }
    if(keyCode == RIGHT){
      test.dir = "right";
    }
    if(keyCode == UP){
      test.dir = "up";
    }
    if(keyCode == DOWN){
      test.dir = "down";
    
  }
  }
}


void drawScoreboard(){
  // makes title
  fill(0, 0, 250);
  textSize(50);
  text("Snake", 500, 450);
  // makes scoreboard
  fill(247, 129, 2);
  rect(50, 50, 300, 90);
  stroke(0);
  textSize(20);
  fill(0);
  // score is based on number of blocks snake is - the head
  text(test.len, 50, 50);
  text(highScore, 50, 70);
  text("Scoreboard", 60, 30);
} 

class food{
  //variables
  float xpos;
  float ypos;
  //constructor
  food(){
    xpos = random(50, width - 50);
    ypos = random(50, height - 50);
  }
  //functions
  void display(){
    fill(0, 250, 0);
    rect(xpos, ypos, 20, 20);
  }
  void reset(){
    xpos = random(50, width - 50);
    ypos = random(50, height - 50);
  }
}

class snake{
  // variables
  // len = length of whole snake(numbers of body segments)
  int len;
  // sideLen = length of one body segment
  float sideLen;
  // make list for xpos and ypos
  ArrayList <Float> xpos, ypos;
  // dir = direction
  String dir;
  // constructor
  snake(){
  len = 1;
  sideLen = 20;
  dir = "right";
  xpos = new ArrayList();
  ypos = new ArrayList();
  xpos.add( random(width) );
  ypos.add( random(height) );
  }
  //methods
  void move(){
    for(int i = len - 1; i > 0; i = i - 1){
      xpos.set(i, xpos.get(i - 1));
      ypos.set(i, ypos.get(i - 1));
    }
    if (dir == "left"){
      xpos.set(0, xpos.get(0) - sideLen);
    }
    if (dir == "right"){
      xpos.set(0, xpos.get(0) + sideLen);
    }
    if (dir == "up"){
      ypos.set(0, ypos.get(0) - sideLen);
    }
    if (dir == "down"){
      ypos.set(0, ypos.get(0) + sideLen);
    }
    xpos.set(0, (xpos.get(0) + width) % width);
    ypos.set(0, (ypos.get(0) + height) % height);
    // check if it has hit itself and if so, cut off tail
    if(checkHit() == true){
      len = 1;
      float xtemp = xpos.get(0);
      float ytemp = ypos.get(0);
      xpos.clear();
      ypos.clear();
      xpos.add(xtemp);
      ypos.add(ytemp);
    }
  }
  void display(){
    for(int i = 0; i < len; i++){
    fill(250, 0, 0, map(i - 1, 0, len - 1, 250, 50));
    noStroke();
    rect(xpos.get(i), ypos.get(i), sideLen, sideLen);
    }
  }
  // adds on to snake when called
  void addLink(){
    xpos.add(xpos.get(len - 1) + sideLen);
    ypos.add(ypos.get(len - 1) + sideLen);
    len++;
  }
  boolean checkHit(){
    for(int i = 1; i < len; i++){
      if (dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sideLen){
        return true;
      }
    }
    return false;
  }
}
