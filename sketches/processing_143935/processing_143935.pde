
int pScore;
  
ball ball1; // main character
food food1;
bad bad1;
bad bad2;
bad bad3;
bad bad4;
bad bad5;
// don't touch em!
  
  
int gameState; //0= pre game 1= in game 2= game over
//setting up perimeter to contain ball character
int width = 600;
int height = 600;
     
void setup() {
  size(width,height);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
 
 
  gameState = 0;
  food1 = new food ();
  bad1 = new bad();
  bad2 = new bad();
  bad3 = new bad();
  bad4 = new bad();
  bad5 = new bad();
  ball1 = new ball (300,575,50);
  pScore = 0;
}
     
void draw(){
  background(200);
    
  if(gameState==0){
    fill(255,255,255,70);
    rect(-10, 30, 370, 70, 7);
    fill(255,255,255,70);
    rect(-10, 120, 330, 50, 7);
      
    fill(255);
    textSize(60);
    text("Ball Game", 30,85);
    textSize(30);
    text("Press B to Start and any Key to Pause", 30,157);
    if(keyPressed && key == 'b'){
      gameState = 1;
    }
  }
    
  if (gameState == 2){
    keyCode = 0;
    fill(255,255,255,70);
    rect(-10, 30, 370, 70, 7);
      
    fill(255,255,255,70);
    rect(-10, 120, 250, 50, 7);
    fill(255,255,255,70);
    rect(-10, 190, 330, 50, 7);
      
    fill(255);
    textSize(50);
    text("Final Score:",20, 85);
    text(pScore, 290, 85);
    textSize(30);
    text("Play Again?", 30, 157);
    textSize(30);
    text("Press R to Restart", 30, 225);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
      gameState = 1;
    }
  }
    
  if (gameState == 1){
    fill(200);
    textSize(50);
    text(pScore, 280, 85);
    if (ball1.intersect(food1)){
      pScore++;
      ball1.change();
      food1.reset();
    }
    if ( ball1.collides(bad1) ){
      gameState = 2;
    }
    if ( ball1.collides(bad2) ){
      gameState = 2;
    }
    if ( ball1.collides(bad3) ){
      gameState = 2;
    }
     if ( ball1.collides(bad4) ){
      gameState = 2;}
     if ( ball1.collides(bad5) ){
      gameState = 2;}
  }
    
  
   
  food1.display();
  bad1.move();
  bad2.move();
  bad3.move();
  bad4.move();
  bad5.move();
  bad1.display();
  bad2.display();
  bad3.display();
  bad4.display();
  bad5.display();
  ball1.display();
  ball1.keyPressed();
}
   
   
   
class food {
  float x, y; // variables
  float r;
     
  food (){
    x = random(100, width - 100);
    y = random(100, height - 100);
    r = 20;
  }
   
   
   void display(){
    fill(255);
    noStroke();
    ellipse(x,y,r,r);
  }
       
  void reset(){
    x = random(100, width - 100);
    y = random(100, height - 100);
  }
}
  
class bad {
  float x, y; // variables
  float r;
  float xspeed;
     
  bad (){
    x = random(400, width - 600);
    y = random(500, height - 600);
    r = 20;
    xspeed = 7;
      
  }
    void move(){
    x += xspeed;
    if (x > width -5 || x < 5){
      xspeed *= -1;
  }
    }
     
  void display(){
    fill(255,0,0);
    noStroke();
    rect(x,y,r,r);
  }
}
       
    
     
     
class ball {
     
  float x;
  float y;
  float speed;
  float r; //radius
  color c = color(255,20,245);
     
       
  ball(float tempX, float tempY, float tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
    speed = 0;
    
  }
    void change(){
    c = color(0, random(100,220),random(100,245));
    r += 5;
      
  }
       
  void display(){
    fill (c);
    noStroke();
    ellipse(x,y,r,r);
         
  }
 //key commands
//ball flies off page in response to key command
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-5;
        //perimeter created with if statements under each keycode
                        if(y <= 25){
        y = 25;
                }
      }
          
      else if (keyCode == DOWN) {
        y = y + 5;
                if(y >= height-25){
        y = height-25;
                }
      }
    }if (keyCode == RIGHT) {
      x = x+5;
                            if(x >= width - 25){
        x = width - 25;
                    
                }
    } else if (keyCode == LEFT) {
      x = x-5;
                            if(x <= 25){
        x = 25;
                }
    
    }
  }
    
  boolean intersect(food f) {
    float distance = dist(x,y,f.x,f.y); // Calculate distance
       
    // Compare distance to sum of radii
    if (distance < r - f.r) {
      return true;
    } else {
      return false;
    }
  }
    
  boolean collides(bad b) {
    float distance = dist(x,y,b.x,b.y); // Calculate distance
       
    // Compare distance to sum of radii
    if (distance < r - b.r - 5) {
      b.xspeed = 0;
      return true;
  
    } else {
      return false;
    }
  }
  
 }

