
// a framework for a very basic game, 
// with arrays of objects like bullets and targets,  
// recycled objects, and gameOver state.  

int score; 
//is set to true when we've finished playing :
boolean gameOver; 
// is used to store the current frame when we start playing
// and we can use it to measure how many frames have been in 
// game so far
int startFrame; 

// array for the bullets, and spares for recycling
Bullet[] bullets = new Bullet[0]; 
Bullet[] spareBullets = new Bullet[0];
// same with the target ducks
Target[] duckies = new Target[0]; 
Target[] spareDuckies = new Target[0]; 


void setup() { 
  size(600, 400); 
  smooth();
  startGame();
}

void draw() { 

  background(0); 

  // if we're still playing
  if (!gameOver) {
    // update stuff and check for bullet 
    // collisions with targets
    updateDucks(); 
    updateBullets(); 
    checkCollisions();
    // if we've been playing for 600 frames (roughly
    // 10 seconds) then finish the game. You could alternatively  
    // keep track of the number of missed targets and use that 
    // to trigger gameOver.
    if (frameCount-startFrame>600) gameOver = true;
  } 
  else { 
    // if it's game over then show a nice message. 
    fill(255); 
    textAlign(CENTER); 
    text("GAME OVER", width/2, height/2);
    text("Press any key to play again", width/2, height/2 + 50);
  } 

  // display the score in the top left corner
  fill(255); 
  text(score, 20, 20);
}

// startGame destroys all the bullets, targets,  
// resets everything and starts the game playing again. 
void startGame() { 

  // reset the score
  score = 0; 
  // destroy all the targets
  for (int i =0;i<duckies.length; i++) {
    destroyDuck(duckies[i]);
  } 
  // destroy all the bullets
  for (int i =0;i<bullets.length; i++) {
    destroyBullet(bullets[i]);
  } 

  // set the startFrame to now (the current frame)
  startFrame = frameCount; 
  // and start the game playing
  gameOver = false;
}


void updateDucks() { 

  // every 20 frames make a new target
  if (frameCount%20 == 0) makeDuck(); 

  // iterate through the targets
  for (int i =0; i<duckies.length; i++) {   
    // set a local variable to point at the 
    // duck at index i
    Target duck = duckies[i];  
    // if it's disabled then skip this one
    // and carry on through the for loop.    
    if (!duck.enabled) continue; 
    // otherwise update it
    duck.update();
    // if it's gone off the right of the screen, 
    // get rid of it
    if (duck.x > width) destroyDuck(duck);
  }
}


void updateBullets() {

  // iterate through the bullets array
  for (int i=0; i<bullets.length; i++) {
    // set a local variable to point at the 
    // bullet at index i
    Bullet bullet = bullets[i]; 
    // if it's enabled, then update it
    if (bullet.enabled) {
      bullet.update(); 
      // and if it's off the top of the screen, 
      // get rid of it
      if (bullet.y<0) destroyBullet(bullet);
    }
  }
}

// check all the bullets against all the targets
void checkCollisions() { 

  // the outer loop goes through all the targets
  for (int i =duckies.length-1; i>=0; i--) {       

    Target duck = duckies[i]; 
    // if it's disabled skip this one and continue to the 
    // next target
    if (!duck.enabled) continue; 

    // the inner loop goes through each bullet. 
    for (int j = 0; j<bullets.length; j++) { 

      Bullet bullet = bullets[j];
      // if it's enabled and it's inside the target we're checking
      // (from the outer loop)... 
      if ((bullet.enabled) && (duck.hitTest(round(bullet.x), round(bullet.y)))) { 

        // destroy the target and destroy the bullet
        destroyDuck(duck); 
        destroyBullet(bullet);
        score++; 
        // and break out of the inner loop so we 
        // don't check any of the other bullets 
        // against this target. 
        break;
      }
    }
  }
}

void mousePressed() { 
  // if we're not in gameOver state, fire a bullet
  if (!gameOver) { 
    fireBullet();
  }
}
void keyPressed() { 
  // if it is currently in gameOver state... 
  if (gameOver) { 
    // restart game
    startGame();
  }
}

void makeDuck() { 

  Target duck; 
  // if we have a spare duck... 
  if (spareDuckies.length>0) { 
    // set a local variable 'duck' to point
    // at the first in the spareDuckies array
    duck = spareDuckies[0]; 
    // remove it from the spares
    spareDuckies = (Target[]) subset(spareDuckies, 1); 
    // and re-enable it
    duck.enabled = true;
  } 
  else {
    // otherwise make a new duck and add it to the ducks array
    duck = new Target(0, 200, 4, 0); 
    duckies = (Target[]) append(duckies, duck);
  }

  // either way, we need to reset its position
  duck.x = 0; 
  duck.y = random(0, height*0.6);
}

void destroyDuck(Target duck) { 
  // disable the duck
  duck.enabled = false;
  // and add it to the spares.  
  spareDuckies = (Target[]) append(spareDuckies, duck);
}

void fireBullet() {

  Bullet bullet; 
  // if we have a spare... 
  if (spareBullets.length>0) { 
    // pull it out of the spareBullets array
    bullet = spareBullets[0]; 
    spareBullets = (Bullet[]) subset(spareBullets, 1); 
    // and reset it
    bullet.reset();
  } 
  else {
    // otherwise, make a new one
    bullet = new Bullet(); 
    bullets = (Bullet[]) append(bullets, bullet);
  }
}

// 
void destroyBullet(Bullet bullet) { 
  bullet.enabled = false; 
  spareBullets = (Bullet[]) append(spareBullets, bullet);
}


