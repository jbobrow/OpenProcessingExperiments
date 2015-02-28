
int highScore;
snake test;
food food1;

void setup(){
  size(800, 700);
  frameRate(23);
  test = new snake();
  food1 = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  highScore = 0;
}



void draw(){
  background(0);
  drawScoreboard();
  
  test.move();
  test.display();
  food1.display();
  
  if( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < test.sideLen ){
    food1.reset();
    test.addLink();
  }
  
  if(test.len > highScore){
    highScore = test.len;
  }
}



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
  // all of code for drawing the title and score
  
  // draw title
  fill(50,70,250);
  textSize(120);
  text("SNAKE!", width/2, 80);
  
  // draw sub title
  fill(90,120,130,200);
  textSize(30);
  text("By Adam Smith", width/2, 160);
  
  // draw scoreboard
  stroke(250,250,250,200);
  fill(102,200,240, 125);
  rect(165,height - 140,270,130);
  fill(30,10,20,200);
  textSize(18);
  text("curr",115, height-165);
  text("best",215, height-165);
  fill(205,120,210,230);
  textSize(26);
  text(test.len,115, height-135);
  text(highScore,215, height-135);
}

class snake{
  
  // define variables
  int len;
  float sideLen;
  String dir;
  ArrayList <Float> xpos, ypos;
  
  
  // constructor
  snake(){
    len = 1;
    sideLen = 22;
    dir = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( random(width)  );
    ypos.add( random(height) );
  }
  
  
  // functions
  
  void move(){
    for(int i = len - 1; i > 0; i = i - 1){
      xpos.set(i, xpos.get(i-1));
      ypos.set(i, ypos.get(i-1));
    }
    if(dir == "left"){
      xpos.set(0, xpos.get(0) - sideLen);
    }
    if(dir == "right"){
      xpos.set(0, xpos.get(0) + sideLen);
    }
    if(dir == "up"){
      ypos.set(0, ypos.get(0) - sideLen);
    }
    if(dir == "down"){
      ypos.set(0, ypos.get(0) + sideLen);
    }
    xpos.set(0, (xpos.get(0) + width) % width);
    ypos.set(0, (ypos.get(0) + height) % height);
    
    // check if has hit itself, if so, cut off tail
    if( checkHit() == true ){
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
      stroke(250);
      fill(250,0,0, map(i-1, 0, len-1, 250, 0));
      rect(xpos.get(i), ypos.get(i), sideLen, sideLen);
    }
  }
  
  
  void addLink(){
    xpos.add( xpos.get(len-1) + sideLen );
    ypos.add( ypos.get(len-1) + sideLen );
    len++;
  }
  
  boolean checkHit(){
    for(int i = 1; i < len; i++){
      if( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sideLen){
        return true;
      }
    }
    return false;
  }
}

class food{
  
  // define variables
  float xpos, ypos;
  
  // make contructor
  food(){
    reset();
  }
  
  // make functions
  void display(){
    fill(40,200,200);
    rect(xpos,ypos,22,22);
  }
  
  void reset(){
    xpos = random(100, width-100);
    ypos = random(100, height-100);
  }
}
