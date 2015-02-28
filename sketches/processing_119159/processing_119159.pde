

int cols = 10;
int rows = 10;
Square [][] sq = new Square[cols][rows];
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean upPresses = false;
boolean downPresses = false;
boolean leftPresses = false;
boolean rightPresses = false;
boolean dead = false;
boolean dead2 = false;
boolean splashScreen = true;
PImage player1Wins;
PImage player2Wins;
PImage startScreen;
Player players1;
Player2 players2;





void setup(){
  startScreen = loadImage("startScreen.png");
  player1Wins = loadImage("player1Wins.png");
  player2Wins = loadImage("player2Wins.png");

  int x = 0;
  int y = 0;
  size(300, 300);
  background(255);
   colorMode(RGB); 
   

  players1 = new Player(50, 50);
  players2 = new Player2(250, 250);
 
for (int i = 0; i < cols; i++){  
  for (int j = 0; j < rows; j++){
sq[i][j] = new Square(x, y, players1, players2);
x = x + 50;

  }
  y = y+50;
  x = 0;

 }

 
     
}

void draw(){
   if(splashScreen == true){
    splash(); 
   }
   

   else if(splashScreen == false){
 for (int i = 0; i < sq[0].length; i++){
   for(int j = 0; j < sq[0].length;j++){
  
 sq[i][j].display();
     }  
 }  
   
   if(dead == false){
 players1.update();
   }
   if(dead2 == false){
 players2.update();
   }

  
if (keyPressed) {
    if (key == 'w') {
      upPresses = true;
    }
    else if (key == 's') {
      downPresses = true;
    }
    else if (key == 'a') {
      leftPresses = true;
    }
    else if (key == 'd') {
      rightPresses = true;
    }
  }  
   }
   
   if(dead == true){
     player2Win();
   }
   else if(dead2 == true){
     player1Win();
   }
}

void splash(){
 image(startScreen, 0, 0);
}
void player1Win(){
  image(player1Wins, 0, 0);
}
void player2Win(){
  image(player2Wins, 0, 0);
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = true;
    }
    else if (keyCode == DOWN) {
      downPressed = true;
    }
    else if (keyCode == LEFT) {
      leftPressed = true;
    }
    else if (keyCode == RIGHT) {
      rightPressed = true;
    }
  }
  
  
}

void keyReleased() {

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    }
    else if (keyCode == DOWN) {
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    }
    else if (keyCode == RIGHT) {
      rightPressed = false;
    }
  }



    if (key == 'w') {
      upPresses = false;
    }
    else if (key == 's') {
      downPresses = false;
    }
    else if (key == 'a') {
      leftPresses = false;
    }
    else if (key == 'd') {
      rightPresses = false;
    }
}

void mousePressed(){
  if(splashScreen == true){
  splashScreen = false;
 }
}

class Player {
  int x;
  int y;
  float speed = 4;

  Player(int x1, int y1) {
    x = x1;
    y = y1;
    
  }
  
  

  void update() {
    isDead();
    constrainP();
  
    if (leftPressed) x-=speed;
    else if (rightPressed) x+=speed;  

    if (upPressed) y-=speed;
    else if (downPressed) y+=speed;  

  
  

}

void isDead(){
  
  if (dead2 == false) {
      
      fill(111, 116, 28);
      ellipse(x, y, 10, 10);
    }
    
  
}

void constrainP(){
  if(x > 300){
    x = 300;
  }
  if(x<0){
    x = 0;
  }
  
  if(y > 300){
    y = 300;
  }
  if(y<0){
    y = 0;
  }
}
}

class Square{
  int rectX, rectY;
  int rectSize = 50;  
  float r = 1;
  float g = 255;
  float b = 1; 
  boolean rectOver = false;
  boolean rectOver2 = false;
  
  Player p1;
  Player2 p2;
 
  Square(int x1, int y1, Player play1, Player2 play2){
    rectX = x1;
    rectY = y1;
    p1 = play1;
    p2 = play2;
  }
  
  void display(){
   
   
    if(r < 255 && b == 1 && rectOver2 == true || rectOver == true && r < 255 && b == 1){
      r = r+1;
      
      println(r);
     
    }
    else if(r == 255 && g > 0 &&  rectOver == true || rectOver2 == true && r == 255 && g > 0){
      g = g-5;
      b--;
      
    }
    else if(g == 0 && b < 0 && r > 0  && rectOver == true || rectOver2 == true && g == 0 && b < 0 && r > 0){
      r = r - 255;    

    }
   
      stroke(74, 56, 250, 50);
      fill(r, g, b);
      rect(rectX, rectY, rectSize, rectSize);
 
   update(p1.x, p1.y);
   update(p2.x, p2.y);
}

void update(int x, int y){
  
  
 if(overRect(rectX, rectY, rectSize, rectSize)){
  rectOver = true; 
   
 }
 else if(overRect2(rectX, rectY, rectSize, rectSize)){
   rectOver2 = true;
 }
 
 else if (rectOver == true && r == 0){
  dead = true; 
 } 
 
else if(rectOver2 == true && r == 0){
   dead2 = true;
 }
 
 else{
   rectOver = false;
   rectOver2 = false;
 }
}



boolean overRect(int x, int y, int width, int height){
 if (p1.x >= x-2 && p1.x <= x+width-2 && 
      p1.y >= y-2 && p1.y <= y+height-2) {
    return true;
      }
    
       
  
  else {
    return false;
  } 
}

boolean overRect2(int x, int y, int width, int height){
  if(p2.x >= x-2 && p2.x <= x+width-2 && 
      p2.y >= y-2 && p2.y <= y+height-2){
       return true;
      }
      
      else{
        return false;
      }
}
}

class Player2 {
  int x;
  int y;
  float speed = 4;

  Player2(int x1, int y1) {
    x = x1;
    y = y1;
    
  }

  void update() {
    isDead();
    constrainP();

    if (leftPresses) x-=speed;
    else if (rightPresses) x+=speed;  

    if (upPresses) y-=speed;
    else if (downPresses) y+=speed;  

  }
  
void constrainP(){    
   
  if(x > 300){
    x = 300;
  }
  if(x<0){
    x = 0;
  }
  
  if(y > 300){
    y = 300;
  }
  if(y<0){
    y = 0;
  }
}

void isDead(){
  if (dead == false) {
      fill(28, 116, 111);
      ellipse(x, y, 10, 10);
    }
    
    
}
}

//int i = 0;
//  if(i < 6){
// myText.drawText();
// myText2.drawText();
// i++;
//  }
//  else{
//  }


