
// Current level
int level;

// How many points have we got
int score;

// Object moves as time passes
float time;

// Time speed. Time goes faster as you progress, 
// so it becomes more difficult. Time will increase this much
// each time draw() is called.
float tspeed;

// The game can shows messages when the level increases
// and when the game is over
String message = "";

// This indicates for how many animation frames should
// we display the message. If it's 0, no message is displayed.
int message_time = 0;

// This list indicates which circles have been eaten and which not.
// It contains boolean values. false means not eaten, so display
// this circle. true means eaten, so don't display this circle anymore.
boolean[] eaten = {};

void setup() {
  size(500, 400);
  background(0);
  colorMode(HSB, 100);
  noFill();
  strokeWeight(2);
  textAlign(CENTER);
  game_start();
}

// Initialize variables
void game_start() {
  tspeed = 0.004;
  time = 0;
  score = 0;
  level = 1;
  eaten = new boolean[1];
  eaten[0] = false;
}

// This function gets called every time we eat all the green circles
void next_level() {
  
  // Increase the time speed to make it a bit more difficult
  // all objects will move faster.
  tspeed += 0.0002;
  
  // Increase the level
  level++;
  
  // Increase the size of the eaten array
  eaten = (boolean[]) append(eaten, false);
  
  // Reset the eaten array. Make all elements false.
  for (int i=0; i< level; i++) {
    eaten[i] = false;
  }
  
  // Show this message
  message = "Get ready for level " + level + "!";
  
  // Show the message for this many frames
  message_time = 110;
}

// You were touched by a an enemy circle
void game_over() {
  
  // Show this message
  message = "Game over!\nScore: " + score;
  
  // Show the message for this many frames
  message_time = 230;
  
  // Reset all game variables to play again
  game_start();
}

// This function tests if all green circles have been eaten.
// When that happens we can go to the next level.
boolean all_eaten() {
  
  // The number of circles is equal to the current level
  // Run through all circles
  for (int i=0; i< level; i++) {
    // If we find one that is not yet eaten, the we return
    // false, because not all circles were eaten. No reason
    // to continue checking the rest of the items in the array.
    if(!eaten[i]) {
      return false;
    }
  }
  // If we didn't return before it means that all items are true.
  // That means all circles were eaten and we can go to the next level.
  return true;
}

// This function sets the line color. A sine function call is used
// to make the circles turn dark, then bright, then dark, etc.
void set_stroke(int h, float speed) {
  // We receive the desired hue as a parameter.
  // We also receive a speed parameter. If it's close to 0, the 
  // brightness will cycle slowly. If it's higher, it will blink
  // faster.
  // The frameCount variable is defined by Processing and it
  // indicates how many times draw() has been called.
  float b = map(sin(speed * float(frameCount)), -1, 1, 20, 100);
  stroke(h, 100, b);
}

// Main game loop. Draw and move things around.
void draw() {
  // Make the screen black erasing everything.
  background(0);

  // Is there a message to display?
  if(message_time > 0) {
    // If there is, show it in the middle of the screen.
    text(message, width/2, height/2);
    // Reduce the counter. Eventually we will reach 0 and then
    // the message will not be shown any more.
    message_time--;
    // Exit the draw function. If we are displaying a message
    // then we shouldn't draw players, move them or anything else.
    return;
  }
  
  // Set main player color
  set_stroke(0, 0.1);
  // Draw main player wherever the mouse is
  ellipse(mouseX, mouseY, 100, 100);

  // We now draw elements to capture and enemies.
  // The amount of both is equal to the current level.
  // So in level 1, one enemy, one item to capture
  int i = 0;
  while(i < level) {
    // Calculate enemy position. We use noise() to calculate the
    // position. We use time as one of the parameters, so the
    // position changes over time. We use the enemy number (i) as well,
    // so each enemy is on a different position. Finally we use two
    // random values (200 and 100) so x and y are not identical.
    float x = map(noise(time, i, 200), 0, 1, 0, width);
    float y = map(noise(time, i, 100), 0, 1, 0, height);
    // Set enemy color. 0.1 + 0.1 * i gives numbers like 0.1, 0.2, 0.3, 0.4 so
    // each enemy blinks at a different rate
    set_stroke(80, 0.1 + 0.1 * i);
    // Draw enemy
    ellipse(x, y, 60, 60);
    // If the distance between you and this enemy is too small,
    // you are touching each other. 80 is 100 / 2 + 60 / 2
    if(dist(x,y,mouseX,mouseY) < 80) {
      // In that case, call the game_over function
      game_over();
      // And get out of the draw() function. We don't want to draw any
      // further enemies or items.
      return;
    }

    // If this item has not been eaten yet we will draw it.
    if(!eaten[i]) {
      // Calculate item position. We use noise() to calculate the
      // position. We use time as one of the parameters, so the
      // position changes over time. We use the item number (i) as well,
      // so each item is on a different position. Finally we use two
      // random values (300 and 400) so x and y are not identical.
      x = map(noise(i, time, 300), 0, 1, 0, width);
      y = map(noise(i, time, 400), 0, 1, 0, height);
      // Set item color. 0.15 + 0.1 * i gives numbers like
      // 0.15, 0.25, 0.35, 0.45 so each item blinks at a different rate
      set_stroke(30, 0.15 + 0.1 * i);
      // Draw our future victim
      ellipse(x, y, 30, 30);
      // If we are touching this item (65 = 30 / 2 + 100 / 2)...
      if(dist(x,y,mouseX,mouseY) < 65) {
        // Then this item is considered eaten
        eaten[i] = true;
        // Increase the score. For each eaten item we get as many points as
        // the current level. So in level 1, items give us 1 point, in level
        // 5 items give us 5 points.
        score += level;
        // Are all items eaten?
        if (all_eaten()) {
          // In that case call the next_level function.
          next_level();
          // And get out of the draw() function:
          // We are done and don't need to draw any further items.
          return;
        }
      }
    }
    
    // Increase the i variable to go through all items and enemies.
    i++;
  }

  // Write the score on the screen
  text("Score: " + score, 40, 20);

  // Increase the time variable. The rate at which the time variable increases
  // also increases on each level. So time goes faster in each level, and
  // enemies and items move faster.
  time += tspeed;
}

