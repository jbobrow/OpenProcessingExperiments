
//rafiAlam
//creativeComputing

int screen_w = 1000;
int screen_h = 400;

Player One = new Player (30, height/2, 20, 20);

int snow_time;
int snow_reset = 5;
int num_flakes = 1000;
SnowFall[] flakes = new SnowFall[num_flakes];
Ground Floor;

int num_snowball = 10;
float[] snow_x = new float[num_snowball];
float[] snow_y = new float[num_snowball];
float[] snow_speed = new float[num_snowball];
int snow_ammo = 0;

int num_ammo = 10;
Ammo[] Bullets = new Ammo[num_ammo];


int num_enemy = 5;
Enemies[] enemy = new Enemies[num_enemy];

Hud HeadsUp = new Hud();

boolean god_mode = false;

void setup () {
  size(1000, 400);
  smooth();
  noStroke();
  for (int i = 0; i<num_flakes; i++) {//cycle flakes array
    flakes[i] = new SnowFall(random(width), random(0, height));
  }//end for
  for (int i = 0; i<num_enemy; i++) {//cycle enemy array
    enemy[i] = new Enemies();
  }//end for
  Floor = new Ground(0, height-20, width, 100);
  for (int i = 0; i<num_ammo; i++) {//cycle Bullet array
    Bullets[i] = new Ammo(0, 0);
  }//end for
}//end setup

void draw () {
  background(0, 0, 0);
  for (int i = 0; i<num_flakes; i++) {
    flakes[i].display();
    flakes[i].fall();
  }//end for

  //Floor
  Floor.display();



  for (int i = 0; i<num_enemy; i++) {
    //    enemy[i].display();
    enemy[i].x += 10;
    enemy[i].y = 10;
  }//end for

  One.display();
  One.update();


  //snowball
  fill(255, 255, 255);
  for (int i = 0; i < num_snowball; i++) {
    ellipse(snow_x[i], snow_y[i], 10, 10);
    snow_x[i]-= snow_speed[i];
  }//end for

  //Ammo
  Bullets[0].update();
  Bullets[0].display();
  Bullets[0].x = 200;

  HeadsUp.ammo();
}//end draw

class Ground {
  float x;
  float y;
  float w;
  float h;
  Ground(int start_x, int start_y, int start_w, int start_h) {//CS
    x = start_x;
    y = start_y;
    w = start_w;
    h = start_h;
  }//end CS

  void display () {
    fill(255, 255, 255);
    rect(x, y, w, h);
  }//end display
}//end Ground class

class SnowFall {
  float x;
  float y;
  float w;
  float h;
  float speed;
  float GRAVITY = .02;
  SnowFall (float start_x, float start_y) {//CS
    x = start_x;
    y = start_y;
    w = random(1, 5);
    h = w;
    speed = 0;
  }//end CS

  void fall () {

    if (dist(x, y, One.x, One.y)<One.w/2) {//If on character bottom stop
      y = y;
      speed = 0;
    } 
    if (dist(x, y, One.x, One.y-10)<One.w-10) {//If on character mid stop
      y = y;
      speed = 0;
    } 
    if (dist(x, y, One.x, One.y-20)<One.w-15) {//If on character head stop
      y = y;
      speed = 0;
    } 

    if (y>Floor.y) {//if on floor stop and reset
      y = y;
      speed = 0;
      if (snow_reset < millis() - snow_time) { //timed reset
        y = random(-300);
        snow_time = millis();
      }//end if time reset
    }//end if

    else {//continue fall
      y = y + speed;
      speed = speed + GRAVITY;

      if (y>height) {//reset position
        y=random(-300);
        x=random(0, width);
        speed=0;
      }//end if
    }//end else
  }//end fall


  void display() {//snowflake
    fill(255, 255, 255);
    noStroke();
    ellipse(x, y, w, h);
  }//end display
}//end SnowFall class



class Player {
  float x;
  float y;
  float w;
  float h;
  float speed_x;
  float speed_y;
  float accel_x;
  float accel_y;
  float jump_height = -1;
  Boolean isGrounded = false;
  float FRICTION = 1;
  float GRAVITY = .1;
  Player (float startX, float startY, float startW, float startH) {//CS
    x = startX;
    y = startY;
    w = startW;
    h = startH;
    speed_x = 0;
    speed_y = 0;
    accel_x = 2;
    accel_y = 0;
  }//end CS Player

  void display () {//Character
    fill(255);
    ellipse(x, y, w, h);
    ellipse(x, y-10, w-5, h-5); 
    ellipse(x, y-20, w-10, h-10);
    fill(0);
    ellipse(x, y-5, 2, 2);
    ellipse(x, y-10, 2, 2);
    ellipse(x, y-15, 2, 2);
    ellipse(x-2, y-21, 2, 2);
    ellipse(x+2, y-21, 2, 2);
  }//end display

  void update() {
    //left bounds
    if (x<w/2) {
      x+=10;
    }//end if
    
    //right bounds
    if (x>width) {
      x+=10;
      fill(255);
      textSize(100);
      textAlign(CENTER);
      text("Frosty Flakes:",width/2,height/2);
      fill(255,0,0);
      textSize(50);
      text("Dr. Icicle's Revenge",width/2, height/2+50);
    }//end if




    if (isGrounded == true) {
      speed_y = 0;
      if (keyPressed == false) {
        //if there are no keys being pressed slow down
        if (speed_x > 0) {
          speed_x -= accel_x*.5;
        } // end if
        else if (speed_x < 0) {
          speed_x += accel_x*.5;
        }//end if
      }//end if key pressed

      if (abs(speed_x) < .001) {
        //this is to prevent rounding errors that happen sometimes with floats.
        speed_x = 0;
      }
    } 
    else {
      speed_y = speed_y + accel_y;
      y = y + speed_y;
      accel_y += GRAVITY;

      //check for floor
      if (y>Floor.y-h/3) {
        isGrounded = true;
        speed_y = 0;
        accel_y = 0;
        //reset the y to be right on top of the floor
        y = Floor.y - h/3;
      }//end if
    }//end else

    //move on the x axis if grounded or not
    x = x + speed_x;
    //set a max speed
    //    speed_x = min(speed_x, 5);
    if (speed_x > 5) {
      speed_x -= accel_x*.5;
    } // end if
    else if (speed_x < -5) {
      speed_x += accel_x*.5;
    }//end if
  }//end update

  void right() {
    speed_x = speed_x + accel_x;
  }//end right

  void left () {
    speed_x = speed_x - accel_x;
  }//end left

  void jump () {
    if (isGrounded == true) {
      accel_y = jump_height;
      isGrounded = false;
    }//end if
  }//end jump
}//end Player class


class Enemies {
  float x;
  float y;
  float w;
  float h;

  Enemies () {//CS
    x = 0;
    y = 0;
    w = width;
    h = height;
  }//end CS

  void display () {
    fill(255, 0, 0);
    ellipse(0, 0, 20, 20);
  }//end display
}//end class Enemies

class Ammo {
  float x;
  float y;
  float w;
  float h;
  float speed;
  float GRAVITY;
  boolean isTaken;

  Ammo (float start_x, float start_y) {//CS
    x = start_x;
    y = start_y;
    w = 10;
    h = 10;
    speed = 0;
    GRAVITY = .02;
    isTaken = false;
  }//end CS

  void display() {
    if (isTaken == false) {
      strokeWeight(2);
      stroke(255, 0, 0);
      noFill();
      ellipse(x, y, w+7, h+7);
      fill(255);
      noStroke();
      ellipse(x, y, w, h);
    }//end if
  }//end display

  void update () {
    //bounce
    if (y<Floor.y-h/3) {
      y = y + speed;
      speed = speed + GRAVITY;
    }//end if
    else if (y>Floor.y-h/3) {
      speed = 0;
      y -= 20;
    }//end else 
    if (isTaken == false) {
      if (dist(One.x, One.y, x, y) < w+10) {
        snow_ammo = snow_ammo + 3;
        isTaken = true;
      }//end if
      else {
      }
    }//end if
  }//end update
}//end class Ammo

class Hud {
  float x;
  float y;
  float w;
  float h;
  Hud () {//CS
    x = 0;
    y = 0;
    w = width;
    h = height;
  }//end HUD CS
  void ammo () {
    if (snow_ammo>0) {
      fill(0);
      strokeWeight(3);
      stroke(255, 0, 0);
      ellipse(25, 25, 200, 200);
      noStroke();
      fill(255);
      ellipse(25, 25, 90, 90);
      textSize(20);
      text(snow_ammo, 70, 60);
    }//end if
  }//end ammo
}//end class HUD


//cheats
void mousePressed() {
  if (god_mode == true) {
    if (mousePressed) {
      One.x = mouseX;
      One.y = mouseY;
    }//end if
  }//end god_mode
}//end mousePressed

//controls
void keyPressed() {

  if (key == ' ') {//shoot
    if (snow_ammo > 0) {
      snow_x[snow_ammo] = One.x;
      snow_y[snow_ammo] = One.y-10;
      snow_speed[snow_ammo]=-+10;
      snow_ammo--;
    }
    if (snow_ammo<0) {
      snow_ammo = 0;
    }//end if
  }//end jump
  if ((key == 'd') | (key == 'D')) {//right
    One.right();
  }//end right
  if ((key == 'w') | (key == 'W')) {//jump
    One.jump();
  }//end jump
  if ((key == 'a') | (key == 'A')) {//left
    One.left();
  }//end left



   if (key == CODED) {
   if ((keyCode == RIGHT)) {
   One.right();
   }//end right
   if (keyCode == LEFT) {
   One.left();
   }//end left
   if (keyCode == UP) {
   One.jump();
   }//end left
   }//end if
   


  //cheat keys
  if ((key == 'g') | (key == 'G')) {
    god_mode = true;
  }//end if g
}//end keyPressed

