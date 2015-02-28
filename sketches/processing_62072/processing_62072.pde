
PVector position, acc, vel;  
int radius = 5;  
int score = 0;
Brick[] bricks;
boolean startGame = false;
boolean gameOver = false;

void mouseClicked() {
  if ( startGame == false) {
    startGame = true;
  }
}

void gameOver() {
  fill(255);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  text("SCORE: " + score, width/2, height/2+50);
}


void setup() {  
  frameRate(60); //call draw this many times per sec  
  size(600, 500);  
  smooth(); 

  float x = 0; 
  float y = 18;
  bricks = new Brick[56];

  for (int i = 0; i < 56; i++) {
    bricks[i] = new Brick(x+25, y, 255);
    x += 70;
    if (x > 500) {
      y+=32;
      x = 0;
    }
  }

  //circle's position at all times  
  position = new PVector((int)(.5*width), 250);  
  //position.x is the x coordinate, position.y is y coordinate  
  //starting velocity is 4px/frame in the +x direction  
  //and zero in the y direction  
  vel = new PVector(5, 5);  
  //accleration is 0 in x direction and .2px/frame^2 in +y dir (down)  
  acc = new PVector(0, 0);
} 
void draw() {  
  if (startGame != true) {

    background(0);  
    smooth();
    noStroke(); 

    // start game
    fill(255);
    textAlign(CENTER);
    text("Click to START", width/2, height/2);
    text("Be prepared for the ball!", width/2, height/2+50);
  } 
  else if (gameOver == true) {
    gameOver();
  }
  else {

    fill(255); //white
    //draw circle @ current location  
    ellipseMode(CENTER); //placement of ellipse based on center pt  
    ellipse(position.x, position.y, 2*radius, 2*radius);  
    //update the velocity by increasing v_x and v_y by   
    //a_x and a_y, respectively  
    vel.add(acc);  
    //use this increased velocity to update the position for the  
    //next time we draw the circle  
    position.add(vel);  

    //if position hits paddle  
      if ( position.y + radius + 5 >= height - 15 && position.x >= mouseX 
      && position.x <= mouseX +50 && position.y + radius+5 <= height-15  ) {  
      vel.y = -vel.y;
    }  

    for (int h = 0; h < bricks.length ; h++ ) {
      if ( bricks[h].hit() ) {
        bricks[h].hide();
        vel.y = -vel.y;
        score +=10;
      }
      if ( score == 560) {
        fill(255);
        textAlign(CENTER);
        text("YOU CLEARED ALL THE BRICKS!", width/2, height/2);
        text("YOU WIN!", width/2, height/2+50);
      }
    }
    
    //if position hits top
    if ( position.y + radius <= 1 ) {  
      vel.y = -vel.y;
    }  
    //if hit right wall
    if ( position.x + radius >= width ) {  
      vel.x = -vel.x;
    }  
    //if hit left wall
    if ( position.x - radius <= 0 ) {  
      vel.x = -vel.x;
    } 

    // the paddle
    fill(255);
    rect(mouseX, height -20, 50, 8);

    //print score
    text("Score:" + score, 35, 15);

    fill(0, 30);
    rect(0, 0, width, height);
    for (int a = 0; a < bricks.length; a++) {
      if ( !bricks[a].getHidden() ) { 
        bricks[a].display();
      }

      if (position.y > 500) {
        gameOver = true;
      }
    }
  }
}

class Brick {
  float x, y;
  color c;
  boolean hidden = false;
  Brick(float nx, float ny, color nc) {
    x = nx;
    y = ny;
  }
  void display() {
    fill(255, 0, 0);
    noStroke();
    rect(x, y, 60, 30);
  }
  boolean getHidden() {
    return hidden;
  }
  void hide() {
    hidden = true;
  }

  boolean hit() {
    if ( hidden )
      return false;
    boolean result = position.y - radius <= y+30 && position.y + radius >= y  && position.x >= x && position.x <= x+60;
    //System.out.println(this + ", " + result);
    return result;
  }
}


