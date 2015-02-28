
// Alex French
// 3D frogger

int mode;
PFont title_font, instructions_font;
vehicle_lane road[] = new vehicle_lane[10];
platform_lane water[] = new platform_lane[10];
lilies pads = new lilies();
frog player;

void setup()
{
  mode = 0;
  size(500, 500, P3D);
  //hint(ENABLE_DEPTH_SORT);
  rectMode(CENTER);
  
  // processing has trouble with rendering
  // line borders at proper depths in 3d
  // contexts, so let's turn them off
  noStroke();
  
  // create random vehicle and platform lanes
  init_vehicle_lanes();
  init_platform_lanes();
  player = new frog();
  resetMatrix();
  translate(0, 0, 100);
  camera();
  /* Display welcome screen with instructions */
  background(0);
  fill(0, 255, 0);
  textFont(loadFont("FreeSansBold-48.vlw"), 48.0);
  textAlign(CENTER);
  text("FROGGER", width/2, 48);
  textFont(loadFont("FreeSansBold-48.vlw"), 24.0);
  text("Use the arrow keys to move your frog from\n" +
       "the bottom of the screen to the top.\n" +
       "\n" +
       "Avoid cars and ride the logs!\n" +
       "\n" +
       "Press RETURN to start", width/2, 86);
  resetMatrix();
}

void draw()
{
  if (mode == 0) {
    if (key == 10) { mode = 3; }
  } else if (mode == 1) {
    resetMatrix();
    translate(0, 0, 100);
    camera();
    background(0);
    fill(0, 0, 255);
    textFont(loadFont("FreeSansBold-48.vlw"), 48.0);
    textAlign(CENTER);
    text("FROGGER", width/2, 48);
    textFont(loadFont("FreeSansBold-48.vlw"), 24.0);
    text("Congratulations, you won!", width/2, 86);
    if (key == 10) { mode = 2; }
    resetMatrix();
  } else if (mode == 2) {
    resetMatrix();
    translate(0, 0, 100);
    camera();
    background(0);
    fill(255, 0, 0);
    textFont(loadFont("FreeSansBold-48.vlw"), 48.0);
    textAlign(CENTER);
    text("FROGGER", width/2, 48);
    textFont(loadFont("FreeSansBold-48.vlw"), 24.0);
    text("You lose, loser!", width/2, 86);
    if (key == 10) { setup(); }
    resetMatrix();
  } else if (mode == 3) {
    // camera follows player
    camera(map(player.get_x(), -208, 208, -100, 100), map(player.get_y(), -208, 208, 0, 400), 250,
           map(player.get_x(), -208, 208, -100, 100), map(player.get_y(), -208, 208, -150, 200), 0, 0, 1, 0);
           
    // initialize default for each frame
    lights();
    
    // simple black background
    background(0);
    
    // side walls (6 steps to either side)
    pushMatrix();
    fill(0, 100, 120);
    rotateY(HALF_PI);
    translate(-100, 0, -208); // 90 degree rotation along Y makes X Y Z => Z Y X
    rect(0, 0, 200, 1400);
    fill(0, 100, 120);
    translate(0, 0, 416);
    rect(0, 0, 200, 1400);
    popMatrix();
    
    // show player
    player.display();
    
    // test for collisions
  
    if (test_vehicle_lane_collision(player.get_x(), player.get_y())) {
      player.collided();
    }
    if (!player.ride_log()) {
      player.collided();
    }
    
    player.update();
    update_platform_lanes();
    update_vehicle_lanes();
    pads.display();
    
    // show scoreboard at start
    if (player.get_y() == 640 && player.get_x() == 0 ) {
      pushMatrix();
      translate(0, 590, 100);
      rotateX(PI+HALF_PI);
      fill(0, 0, 255);
      rect(0, -8, 225, 40);
      fill(255, 255, 255);
      translate(0, 0, 1);
      text("LIVES: " + player.get_lives() + " SCORE: " + player.get_score(), 0, 0);
      popMatrix();
    }
  }
}

void win()
{
  mode = 1;
}

void keyPressed()
{
  switch (keyCode) {
    case UP:
       player.moveup();
      break;
    case DOWN:
      player.movedown();
      break;
    case LEFT:
      player.moveleft();
      break;
    case RIGHT:
      player.moveright();
      break;
  }
}

