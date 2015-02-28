
Invader [] invader;
Missile_inv [] missile_inv;
Timer timer;
Ship ship;
Ship [] ship_vidas;
Missile missile;
Lifebar lifebar;
Scorebar scorebar;
PImage background;

//Timer vars
int timer_dur = 1000; // invader firing interval in millis

//Invader vars
int numInvaders = 27;
int invadersLeft = numInvaders;
int x = 40; // first invader x position
int y = 100; // first invader y position
int dir = -1; // Direction. 1 if going right -1 if left
PImage pim1, pim2;
boolean img_state = false;

//Missile_inv vars
int missile_inv_i = 0;
int missile_inv_max = 1000;

//Missile vars
int missile_size = 8;
int missile_speed = 3;

//Ship vars
int shipsize = 30;
int shipspeed = 3;
int lives = 3;

int hit = 0;

//Key vars
boolean k_up = false;
boolean k_left = false;
boolean k_right = false;

//score vars
int score = 0;
PImage endGame;

void setup() {
  size(500, 500);
  smooth();
  invader = new Invader[numInvaders];
  for (int i = 0; i < numInvaders; i++) {
    invader[i] = new Invader(7, x, y, 7);
    x += 50;
    if (x > 450) {
      y += 50;
      x = 40;
    }
  }

  ship_vidas = new Ship[lives];
  for (int i = 0; i < lives; i++) {
    ship_vidas[i] = new Ship(20, 0, 40 + 25*i, height - 20);
  }

  missile_inv = new Missile_inv[missile_inv_max];
  ship = new Ship(shipsize, shipspeed, width/2, int(height*0.90));
  missile = new Missile(ship.xpos + shipsize/2, ship.ypos, missile_size, missile_speed);
  scorebar = new Scorebar();
  pim1 = loadImage("Pim1.gif");
  pim2 = loadImage("Pim2.gif");
  background = loadImage("background.jpg");
  endGame = loadImage("endGame.jpg");

  timer = new Timer(timer_dur);
  timer.start();

  lifebar = new Lifebar(lives, endGame);
}

void draw() {
  image(background, 0, 0);

  // Missile draw

  if (ship.show == true) {
    actions();
    missile.update();
    if (missile.m_ypos <= 0 - missile.m_size) {
      missile.destroy();
    }
    missile.display();
  }

  //ship_vidas draw;

  for (int i = 0; i < lives; i++) {
    ship_vidas[i].display();
  }

  //Invader draw
  for (int i = 0; i < numInvaders; i++) {    
    if (changeState()) {
      invader[i].move();
    }
    invader[i].display();
  }

  if (changeState()) {
    img_state = !img_state;
    if (invader[numInvaders-1].touch()) {
      dir *= -1;
    }
    if (invader[0].touch()) {
      dir *= -1;
      for (int i = 0; i < numInvaders; i++) {
        invader[i].down();
      }
    }
  }

  for (int i = 0; i <numInvaders; i++) {
    if (invader[i].collision(missile)) {
      invadersLeft --;
      invader[i].destroy();
      missile.destroy();
      score += int(random(20, 30));
    }
    if ((invader[i].ty + invader[i].size*4) >= (height - 80)) lifebar.endGame();
  }



  stroke(255);

  //Missile_inv draw

  if (timer.update()) {
    int x = int(random(numInvaders));

    if (invader[x].exist) {
      missile_inv[missile_inv_i] = new Missile_inv((invader[x].tx + invader[x].size*4/2), invader[x].ty, missile_size, missile_speed);
      missile_inv_i ++;
      if (missile_inv_i >= missile_inv_max) {
        missile_inv_i = 0;
      }
      timer.start();
    }
  }
  for (int i = 0; i <= missile_inv_i-1; i++) {
    missile_inv[i].display();
    missile_inv[i].update();
  }

  //Scorebar & Lifebar draw

  lifebar.update(lives);
  scorebar.display(score);

  //Ship draw

  ship.display();
  ship.move();
  for (int i = 0; i <= missile_inv_i-1; i++) {
    if (ship.collision(missile_inv[i])) {
      lives --;
      missile_inv[i].destroy();
      if (lives <= 0) {
        ship.destroy();
      }
    }
  }

  if (invadersLeft <= 0) lifebar.winGame();
}

void keyPressed() {    
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:         
      k_left = true;
      break;
    case RIGHT:
      k_right = true;
      break;
    case UP:
      k_up = true;
      break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:         
      k_left = false;
      break;
    case RIGHT:
      k_right = false;
      break;
    case UP:
      k_up = false;
      break;
    }
  }
}

void actions() {
  if (k_up == true) {
    missile.launch(ship);
  }
}

boolean changeState() {

  if (frameCount % 30 == 0) { 
    return true;
  } 
  else {
    return false;
  }
}

class Missile_inv {
  int m_size, m_speed;
  float m_xpos, m_ypos;

  Missile_inv (float m_xpos_, float m_ypos_, int m_size_, int m_speed_) {
    m_xpos = m_xpos_;
    m_ypos = m_ypos_;
    m_size = m_size_;    
    m_speed = m_speed_;
  }

  void display() {
    noStroke();
    fill(0, 0, 255);
    rect(m_xpos, m_ypos, 2, m_size);
  }

  void update() {
    m_ypos += m_speed;
  }

  void destroy() {
    m_xpos = -200;
    m_ypos = -200;
  }
}


class Invader {
  int size;
  float tx, ty;
  float speedx, speedy;
  boolean exist;

  Invader (int size_, float tx_, float ty_, float speed) {
    size = size_;
    tx = tx_;
    ty = ty_;
    speedx = speedy = speed;
    exist = true;
  } 

  void display() {
    if (exist) {
      pushMatrix();
      translate(tx, ty);
      if (img_state) {
        image(pim1, 0, 0);
      } 
      else {
        image(pim2, 0, 0);
      }
      popMatrix();
    }
  }
  void move() {
    tx += speedx*dir;
  }

  boolean touch() {
    if (tx >= width-size*4-20 || tx <= 20) {
      return true;
    } 
    else {
      return false;
    }
  }

  void down() {
    ty += speedy + 8;
  }

  boolean collision(Missile m) {
    if (exist) {
      if (m.m_xpos >= tx && m.m_xpos <= tx + size*4 && m.m_ypos <= ty + size*4 && m.m_ypos >= ty) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
  void destroy() {
    exist = false;
  }
}

class Lifebar {
  int size;
  PImage gameOver;

  Lifebar(int size_, PImage gameOver_) {
    size = size_;
    gameOver = gameOver_;
  }

  void update(int size_) {
    size = size_;
    if (size <= 0) {
      endGame();
    }
  }


  void endGame() {
    imageMode(CENTER);
    image(gameOver, width/2, width/2, 300, 100);  
    imageMode(CORNER);
  }

  void winGame() {
    if (size > 0) {
      rectMode(CENTER);
      fill(255);
      stroke(0);
      rect(width/2, height/2, 300, 100);
      textSize(10);
      fill(45, 65, 130);
      textSize(25);
      text("HOH! ENCONTRASTE", width/2-120, height/2-10);
      text("A CRICKA!!", width/2-70, height/2+25);
    }
  }
}

class Missile {
  int m_size, m_xpos, m_ypos, m_speed;
  boolean shot;

  Missile (int m_xpos_, int m_ypos_, int m_size_, int m_speed_) {
    m_xpos = m_xpos_;
    m_ypos = m_ypos_;
    m_size = m_size_;    
    m_speed = m_speed_;
    shot = false;
  }

  void display() {
    if (shot == true) {
      noStroke();
      fill(0, 0, 255);
      rect(m_xpos, m_ypos, 2, m_size);
    }
  }

  void launch(Ship s) {
    if (shot == false) {
      shot = true;
      m_xpos = s.xpos + s.size/2;
      m_ypos = s.ypos;
    }
  }

  void update() {
    if (shot == true) {
      m_ypos -= m_speed;
    }
  }

  void destroy() {
    if (shot == true) {
      shot = false;
    }
  }
}

class Scorebar {
  int score;

  Scorebar () {
    score = 0;
  }

  void display(int s) {
    fill(45, 65, 130);
    String t = "Cerelac: " + s;
    String l = "Bidas: ";
    textSize(11);
    text(t, width - 70, height - 10);
    text(l, 4, height - 10);
  }
}

class Ship {
  int size, speed, xpos, ypos;
  boolean show;

  Ship(int size_, int speed_, int xpos_, int ypos_) {
    size = size_;
    speed = speed_;
    xpos = xpos_;
    ypos = ypos_;
    show = true;
  }

  void display() {
    if (show) {
      rectMode(CORNER);
      pushMatrix();
      fill(196, 196, 255);
      stroke(45, 65, 130);
      translate(xpos, ypos);
      rect( 0, 0, size, size*0.66);
      line(size/2, 0, size/2, - 8);
      popMatrix();
    }
  }

  boolean collision(Missile_inv a) {
    if (a.m_xpos >= xpos && a.m_xpos+2 <= xpos+size && a.m_ypos+a.m_size >= ypos && a.m_ypos <= ypos + size*0.66) {
      return true;
    }
    else {
      return false;
    }
  }

  void move() {
    if (k_left == true) {
      xpos -= speed;
      if (xpos < 0) xpos = 0;
    }
    if (k_right == true) {
      xpos += speed;
      if (xpos > width-size) xpos = width-size;
    }
  }

  void destroy() {
    show = false;
  }
}

class Timer {
  int init_time;
  int time_passed;
  int duration;

  Timer (int duration_) {
    duration = duration_;
  } 

  void start() {
    init_time = millis();
  }

  boolean update() {
    time_passed =  millis() - init_time; 
    if (time_passed >= duration) {
      return true;
    }    
    else {
      return false;
    }
  }
}



