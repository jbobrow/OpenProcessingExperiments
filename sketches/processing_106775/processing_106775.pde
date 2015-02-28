
int highScore;
snake test;
food food1;
//------------------//
void setup(){
  size(1000, 580);
  frameRate(18);
  test = new snake();
  food1 = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  highScore = 0; 
}

//------------------//
void draw(){
 background(0, 0, 0);
 drawscoreboard();
 //------------------//
 test.move();
 test.display();
 food1.display();
 
 //------------------//
                                                               
 if( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < test.sideLen ){
   food1.reset();
   test.addLink();
 }
 if(test.len > highScore){
   highScore = test.len;
 }
}
//------------------//
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

void drawscoreboard(){
  // put all code for scoreboard here
  fill(0, 0, 250);
  textSize(250);
  text("SNAKE!", width/2, 300);
  rect(57, 23, 300, 70);
  fill(250,0,0);
  textSize(30);
  text("SCORE: " + test.len,100, 23);
  fill(0, 0, 250);
  textSize(50);
  text("by Brian Quinlivan", width/2, 550);
  rect(1230, 30, 850, 70);
  fill(250,0,0);
  textSize(30);
  text("HIGH:" + highScore, 900, 26);
  
  
  
  
  
  
  
  
  
  
}

class food{
  
  // define variables
  float xpos, ypos;
  
  // malke constructor
  food(){
   xpos = random(width);
   ypos = random(height); 
  }
  
  // make fuction
  void display(){
    fill(250, 0, 0);
    rect(xpos, ypos, 21, 21);
  }    
    
  void reset(){
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
}
  
  
  
  
  
  
  class snake{ 

  
  // variables
  int len;
  float sideLen;
  String dir;
  ArrayList <Float> xpos, ypos;
  
  //constructor
  snake(){
    len = 1;
    sideLen = 21;
    dir = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( random(width));
    ypos.add( random(height));
    
    
  }
  
  // function 
  
  void move(){
    for( int i= len - 1; i > 0; i = i-1){
      xpos.set(i, xpos.get(i - 1));
      ypos.set(i, ypos.get(i - 1));  
    }
    if(dir == "left"){
      xpos.set(0, xpos.get(0) - sideLen); 
    }
    if( dir == "up"){
     ypos.set(0, ypos.get(0) - sideLen); 
    }
    if( dir == "right"){
      xpos.set(0, xpos.get(0) + sideLen); 
    }
    if( dir == "down"){
      ypos.set(0, ypos.get(0) + sideLen); 
    }
    xpos.set(0, (xpos.get(0) + width) % width);
    ypos.set(0, (ypos.get(0)+ height) % height);
  
  // check if has hit itself and if so cut off tail
  if( checkhit() == true ){
   len = 1;
   float xtemp = xpos.get(0);
   float ytemp = ypos.get(0);
   xpos.clear();
   ypos.clear();
   ypos.add(ytemp);
   xpos.add(xtemp);
  }
}
  
  boolean checkhit(){
    
    for( int i = 1; i < len; i++){
      if( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sideLen ){
        return true;
      }
    }  
    return false;
  }


  void display(){
    for(int i = 0; i < len; i++){
      fill(250,0,0, map(i-1, 0, len-1, 250, 0));
      rect(xpos.get(i), ypos.get(i), sideLen, sideLen);
    } 
  }
  
   void addLink(){
     xpos.add(xpos.get(len-1) + sideLen );
     ypos.add(ypos.get(len-1) + sideLen );
     len++;
   } 
}
