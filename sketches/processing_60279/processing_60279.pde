
//used some code from here http://www.openprocessing.org/sketch/50562

//player/projectiles 
Ball[] balls = new Ball[1];
//enimies 
Ship[] ships = new Ship[5];

float gravity = 1.0;
int score;
int mode = 0;
int code = 1;

//images

//fireballs 
PImage dude;
//player
PImage cat;
//enimies
PImage ship;
 
void setup() {
    
size(700, 900);  
smooth();
dude = loadImage("dude.png");
ship = loadImage("ship.png");
cat = loadImage("cat.png"); 
fill(255);
balls[0] = new Ball(250, 6);
for (int i = 0; i < ships.length; i++){
  ships[i] = new Ship(200,200);
  }
}
  
void draw() {
background(20);
if(mode == 0){
  text("Welcome!",310,height/2);
  text("Press 'shift' to shoot",310,467);
  text("use the 'mouse' to move",310,484);
  text("click to begin",310,510);
}
else if(mode == 2){
  text("Game Over",310,height/2);
  text("Your Score:",310,467);
  text(score,390,467);
  text("click to restart",310,500);
}
else if(mode == 1){
  text(score,670,880);
  //collision fuction
  collideShipBall(ships,balls);
  println(score);
  // update the display all ball
  for(int i = 0; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move(i);
    balls[i].display(i);
    stroke(255);
  }
  // update the display all ships
for(int i = 0 ; i < ships.length; i++) {
    ships[i].move();
    ships[i].display(i);
    stroke(255);
  }
 }
}

//got a bit of help on this
void collideShipBall(Ship[] s,Ball[] b){
  for(int i = 0; i < s.length; i++){
     for(int j = 0; j < b.length; j++){
       if(dist(s[i].x,s[i].y,b[j].x,b[j].y) < 50){
         s[i].collideBall(b[j]);
         b[j].collideShip(s[i]);
         }
       }
     }
   }

void mouseClicked() {
  if(mode == 0){
    mode = 1;
  }
  if(mode == 2){
    mode = 1;
    score = 0;
    reset();
  }

}

void reset(){
  fill(255);
  balls[0] = new Ball(250, 6);
  for (int i = 0; i < ships.length; i++){
  ships[i] = new Ship(200,200);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      // A new ball object
      //appending code from open processing
  float cr = mouseX*1;
  float cg = mouseY*1;
  float cb = dist(0, 0, mouseX, mouseY);
  float change = dist(0, 0, mouseX/30, mouseY/30);
  Ball b = new Ball(balls[0].x, balls[0].y); // 1) make new object at the mouse location
   
  // Append the array
  balls = (Ball[]) append (balls, b); 
    }
  } 
}

class Ship {
  float x;
  float y;
  float speed;
  float w;
  color c;
  
Ship(float xpos, float ypos) {
  x = xpos;
  y = ypos;
  speed = 0;
  xpos = -5;
  xpos = -5;
 }


void move(){
  y = y + speed;
  speed = speed + gravity/1000;
  
    for(int i = 0; i < ships.length; i++){
     if(ships[i].y > 900){
       ships[i].x = random(50,850);
       ships[i].y = -10;
       mode = 2;
     }
  }
}
   
void display(int myI){
  image(ship,x,y);
}
  
void collideBall(Ball b){
  x = random(50,650);
  y = -70;
  score++;
  }
}

class Ball {
  float x;
  float y;
  float speed;
  float w;
  color c;
  
Ball(float xpos, float ypos) {
   x = xpos;
   y = ypos;
   speed = 0;
}
  
void collideShip(Ship S){
x = 900;
  }
  
 void gravity() {
      
 // add gravity to speed
 speed = speed - gravity/10;
 balls[0].y = height-100;
 balls[0].x = mouseX; 
 }
   
 void move(int myI) {
 //add speed to y location
 if(myI > 1){
   y = y + speed;
   }
 }
   
  void display(int myI) {
    noStroke();
     //display lazzerz
    if(myI > 1){
      image(dude,x,y);
    }
    // display player
    if(myI < 1){
      image(cat,x-10,y);
    } 
  }
}
  



