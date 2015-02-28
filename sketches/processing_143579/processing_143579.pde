
PFont myFont;

int pScore;

ball ball1; // main character
food food1;
bad bad1;
bad bad2;
bad bad3;
power power1;

// don't touch em!


int gameState; //0= pre game 1= in game 2= game over
//setting up perimeter to contain ball character
int width = 800;
int height = 800;
   
void setup() {
  size(width,height);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  myFont = loadFont("MyHelvetica.vlw");
  textFont(myFont);
  gameState = 0;
  food1 = new food ();
  bad1 = new bad();
  bad2 = new bad();
  bad3 = new bad();
  ball1 = new ball (300,575,50);
  pScore = 0;
  power1 = new power ();
}
   
void draw(){
  background(255);
  
  if(gameState==0){
   
    fill(0);
    textSize(70);
    text("Ball Game", 30,85);
    textSize(40);
    text("Press B to Begin", 30,157);
    if(keyPressed && key == 'b'){
      gameState = 1;
    }
  }
//game state when YOU LOSE//  
  if (gameState == 2){
    keyCode = 0;
    fill(255,255,255,70);
    rect(-10, 30, 370, 70, 7);
    
    fill(255,255,255,70);
    rect(-10, 120, 250, 50, 7);
    fill(255,255,255,70);
    rect(-10, 190, 330, 50, 7);
    
    fill(255,40,30)
    ellipse(150,110,400,400)
    fill(0);
    textSize(50);
    text("Final Score:",20, 85);
    text(pScore, 290, 85);
    textSize(30);
    text("Play Again?", 20, 157);
    textSize(30);
    text("Press R to Restart", 20, 225);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
      gameState = 1;
    }
  }
  
  if (gameState == 1){
    fill(200);
    textSize(50);
    text(pScore, 40, 60);
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
  }
  
 

 
  food1.display();  
  bad1.move();
  bad2.move();
  bad3.move();
  bad1.display();
  bad2.display();
  bad3.display();
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
    fill(100);
    noStroke();
    ellipse(x,y,r,r);
  }
     
  void reset(){
    x = random(100, width - 100);
    y = random(100, height - 100);
  }
}

class power {
float x,y; 
float r;

power (){
  x = random(100, width - 100);
  y = random(100,height - 100);
  r = 30;
  }
  
  void display() {
  fill(200);
  noStroke();
  ellipse(x,y,r,r);
  }
  }

class bad {
  float x, y; // variables
  float r;
  float xspeed;
   
  bad (){
    x = random(30, width - 100);
    y = random(30, height - 100);
    r = 20;
    xspeed = 5;
    
  }
    void move(){
    x += xspeed;
    if (x > width -10 || x < 10){
      xspeed *= -1;
  }
    }
   
  void display(){
    fill(130,250,255);
    noStroke();
    rect(x,y,r,r);
  }
}
     
  
   class ball {
  float xVel;
  float yVel;  
  
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

    
  }
     
  void display(){
    fill (c);
    noStroke();
    ellipse(x,y,r,r);
    fill (255,255,255,130);
    ellipse(x+xVel,y+yVel,r-15,r-15);
       
  }
 //key commands
//ball flies off page in response to key command
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-5;
        yVel = -5;
        xVel = 0;
        
        //perimeter created with if statements under each keycode
                        if(y <= 25){
        y = 25;
                }
      }
        
      else if (keyCode == DOWN) {
        y = y + 5;
        yVel = 5;
        xVel = 0;
                if(y >= height-25){
        y = height-25;
                }
      }
    }if (keyCode == RIGHT) {
      x = x+5;
      xVel = 5;
      yVel = 0;
                            if(x >= width - 25){
        x = width - 25;
                  
                }
    } else if (keyCode == LEFT) {
      x = x-5;
      xVel = -5;
      yVel = 0;
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
