
PImage aster_ryden_bg;
PImage aster_ryden_fg;
PImage great_emancipator;
PImage shank;
PImage bolt;


//GAME VARs
int GAME_STATE = 0;
int score = 0;
//Ship Vars
int ship_x, ship_y, ship_r_speed, max_speed;
float ship_x_speed, ship_y_speed, ship_rotation, ship_friction, ship_acceleration;
Boolean fireFlame = false;
//Bullet Vars
Boolean isBulletFired;
int bullet_x, bullet_y, bullet_speed;
float bullet_heading;
//Meateor  Stuff
int num_roids = 10;
float[] roid_x = new float[num_roids];
float[] roid_y = new float[num_roids];
float[] roid_speed = new float[num_roids];
float[] roid_heading = new float[num_roids];
float[] roid_size = new float[num_roids];
// key presses, handles multiple key presses
final int keyDownArraySize = 127;
boolean[] keyDown = new boolean[keyDownArraySize];

void setup() {
  size(1548, 831);
  aster_ryden_bg = loadImage("aster_ryden_bg2.png");
  great_emancipator = loadImage("great_emancipator.png");
  shank = loadImage("shank.png");
  bolt = loadImage("bolt.png");
  aster_ryden_fg = loadImage("aster_ryden_fg.png");
  frameRate(60);
  smooth();

  initShip();
  initKeyDownArray();
  initMeateors();

  //init Bullet. When it is fired, more stuff is assigned.
  isBulletFired = false;
  bullet_speed = 12;
} 
void initShip() {
  ship_x = int(width  * .5);
  ship_y = int(height * .5);
  ship_acceleration = .15;
  ship_friction = .99;
  ship_r_speed = 9;
  max_speed = 10;
}
void initKeyDownArray() {
  for (int i=0; i<keyDownArraySize; i++) {
    keyDown[i] = false;
  }
}
void initMeateors() {
  for (int i = 0; i<num_roids; i++) {
    roid_x[i] = random(width);
    roid_y[i] = random(height);
    roid_heading[i] = random(TWO_PI);
    roid_speed[i] = 2 + random(3); // value between 2-5
    roid_size[i] = 20 + random(50);
  }
}
//------------------------------------------------------------------------- DRAW LOOP 
void draw() {
  image(aster_ryden_bg, 0, 0);

  if (GAME_STATE == 0) {//Title Screen
    fill(0);
    textAlign(CENTER);
    text("Mark Ryden's MEATEORS", width/2, height/2);
    text("Arrows to Move, Space to shoot", width/2, height/2 + 25);
    text("S to Start", width/2, height/2 + 45);

    if ( (keyPressed) && (key == 's')) {
      GAME_STATE++;
    }
  } 
  else if (GAME_STATE == 1) {//Main Game Loop
    //background(0);

    updateShip();
    updateRoids();
    if (isBulletFired) {
      updateBullet();
    }
    handleInput();

    fill(0);
    text(score, 20, 20);
  } 
  else { //GAME OVER SCREEN
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    text("Your Score is " + score, width/2, height/2 + 20);
    text("R to Retry", width/2, height/2 + 40);
    if (keyPressed) {
      if (key == 'r') {
        GAME_STATE = 0;
        score = 0;
        initShip();
        initMeateors();
      }
    }
  }
}

void updateShip() {
  //move ship
  moveShip();
  checkScreenBounds();

  //draw ship    
  drawShip();
}
void moveShip() { //moves ship
  constrain(ship_x_speed, -max_speed, max_speed);
  constrain(ship_y_speed, -max_speed, max_speed);
  ship_x += ship_x_speed;
  ship_y += ship_y_speed;

  //add friction
  ship_x_speed *= ship_friction;
  ship_y_speed *= ship_friction;

  if (abs(ship_x_speed) < .05) ship_x_speed = 0;
  if (abs(ship_y_speed) < .05) ship_y_speed = 0;
}
void drawShip() {
  noFill();
  stroke(0);
  strokeWeight(1);

  pushMatrix();
  translate(ship_x, ship_y);
  rotate(radians(ship_rotation));
  image(great_emancipator, -81, -81);

  //beginShape();
  //vertex(15, 0);
  //vertex(-3, 6);
  //vertex(-1, 0);
  //vertex(-3, -6);
  //endShape(CLOSE);

  if (fireFlame) {
    //      beginShape();
    //        vertex(-8, 0);
    //        vertex(-2, 2);
    //        vertex(-1, 0);
    //        vertex(-2, -2);
    //      endShape(CLOSE);
    fireFlame = false;
  }

  popMatrix();

}
void checkScreenBounds() {
  //wrap left and right of screen
  if (ship_x > width) {
    ship_x = 0;
  } 
  else if (ship_x < 0) {
    ship_x = width;
  }
  //wrap top and bottom of screen
  if (ship_y > height) {
    ship_y = 0;
  } 
  else if (ship_y < 0) {
    ship_y = height;
  }
}
//------------------------------------------------------------------------- BULLET CONTROLS
void updateBullet() {
  checkBulletEdge();

  bullet_x += bullet_speed * cos(radians(bullet_heading));
  bullet_y += bullet_speed * sin(radians(bullet_heading));

  stroke(0);
  strokeWeight(frameCount%4 + 6);
  //image(bolt, bullet_x, bullet_y);
  point(bullet_x, bullet_y);
  //line(bullet_x, bullet_y, bullet_x+100, bullet_y+100);
}
void checkBulletEdge() {
  if ( (bullet_x > width) || (bullet_x < 0) || (bullet_y < 0) || (bullet_y > height) ) {
    isBulletFired = false;
  }
}
//------------------------------------------------------------------------- MEATEOR CONTROLS
void updateRoids() {
  for (int i = 0; i<num_roids; i++) {
    roid_x[i] += roid_speed[i] * cos(roid_heading[i]);
    roid_y[i] += roid_speed[i] * sin(roid_heading[i]);

    if (roid_x[i] > width) {
      roid_x[i] = 0;
    } 
    else if (roid_x[i] < 0) {
      roid_x[i] = width;
    }
    if (roid_y[i] < 0) {
      roid_y[i] = height;
    } 
    else if (roid_y[i] > height) {
      roid_y[i] = 0;
    }
    fill(0);
    image(shank, roid_x[i], roid_y[i], roid_size[i]*2, roid_size[i]*2);
    //ellipse(roid_x[i], roid_y[i], roid_size[i], roid_size[i]);

    //hit test bullet
    if (isBulletFired) {
      if ( isHit(bullet_x, bullet_y, roid_x[i], roid_y[i], roid_size[i]) ) {
        roid_x[i] = random(width);
        roid_y[i] = random(height);
        roid_heading[i] = random(TWO_PI);
        //roid_speed[i] = 2 + random(3); // value between 2-5
        roid_speed[i] = 2; // value between 2-5        
        roid_size[i] = 20 + random(50);
        score++;
        //score += 1;
        //score = score + 1;
      }

    }

    //hitTest ship
    if ( isHit(ship_x, ship_y, roid_x[i], roid_y[i], roid_size[i]) ) {
      GAME_STATE++;
    }
  }
}
Boolean isHit(float bul_x, float bul_y, float ast_x, float ast_y, float ast_s) {
  /*Boolean value_to_return;
   float distance = dist(bul_x, bul_y, ast_x, ast_y);
   if (distance < ast_s/2) {
   //inside;
   value_to_return = true;
   } else {
   value_to_return = false;
   //outside
   //do nothing
   }
   return value_to_return;
   */
  return (dist(bul_x, bul_y, ast_x, ast_y) < ast_s);
}
//------------------------------------------------------------------------- KEYBOARD CONTROLS
void handleInput() {
  if (keyDown[RIGHT]) {
    ship_rotation += ship_r_speed;
  }
  if (keyDown[LEFT]) {
    ship_rotation -= ship_r_speed;
  }
  if (keyDown[UP]) {
    fireFlame = true;
    ship_x_speed += ship_acceleration * cos(radians(ship_rotation));
    ship_y_speed += ship_acceleration * sin(radians(ship_rotation));
  }
  if (keyDown[DOWN]) {
    ship_x_speed -= ship_acceleration * cos(radians(ship_rotation));
    ship_y_speed -= ship_acceleration * sin(radians(ship_rotation));
  }
  if (keyDown[32]) {//32 == space
    if (isBulletFired == false) {
      //same as !isBulletFired
      isBulletFired = true;
      bullet_x = ship_x;
      bullet_y = ship_y;
      bullet_heading = ship_rotation;
    }
  }
//println(ship_rotation);
            image(aster_ryden_fg, 0, 0);

}

void keyPressed() {
  // println(keyCode);
  if (keyCode < keyDownArraySize) {
    keyDown[keyCode] = true;
  }
}
void keyReleased() {
  if (keyCode < keyDownArraySize) {
    keyDown[keyCode] = false;
  }
}




