
final int WIDTH = 800;
final int HEIGHT = 500;
final int HALF_WIDTH = WIDTH / 2;
final int HALF_HEIGHT = HEIGHT / 2;
final int BALL_RADIUS = 20;
final int PAD_WIDTH = 10;
final int PAD_HEIGHT = 100;
final int HALF_PAD_WIDTH = PAD_WIDTH / 2;
final int HALF_PAD_HEIGHT = PAD_HEIGHT / 2;
final float PAD_VEL_HUM = 5;
final float PAD_VEL_CPU = 4.5;
final float BALL_ACC_X = 1.08;
final float BALL_ACC_Y = 1.04;
final int MODE_IMG = 0;
final int MODE_SELECT = 1;
final int MODE_PLAY = 2;

PFont fontCaption, fontButton, fontNote, fontScore;
color colorBackground, buttonColor, buttonHColor;
PImage [] images;

int mode;
int time, num;
Button[] buttons;
Ball ball;
Paddle paddle1, paddle2;
int score1, score2;
boolean soundOn;

class Button
{
  String label;
  int x, y, w, h;
  
  Button(String label_, int x_, int y_, int w_, int h_)
  {
    label = label_;
    x = x_; y = y_; w = w_; h = h_;
  }
  
  boolean isMouseOver()
  {
    return mouseX >= x && mouseX <= x + w && 
           mouseY >= y && mouseY <= y + h;
  }
  
  void drawIt()
  {
    fill(isMouseOver() ? buttonHColor : buttonColor);
    rect(x, y, w, h, 20);
    fill(64);
    text(label, x + w / 2, y + h / 2);
  }
}

class Ball
{
  float posx, posy;
  float velx, vely;
  
  Ball()
  {
    posx = HALF_WIDTH;
    posy = HALF_HEIGHT;
    velx = 0;
    vely = 0;
  }
  
  void init(boolean left)
  {
    posx = HALF_WIDTH;
    posy = HALF_HEIGHT;
    velx = random(120, 240) / 60;
    vely = random(60, 180) / 60;
    if (left) velx = -velx;
    if (random(2) == 0) vely = -vely;
  }
  
  void reflect()
  {
    velx = -velx * BALL_ACC_X;
    vely = vely * BALL_ACC_Y;
  }
  
  void updatePos()
  {
    posx += velx;
    posy += vely;
    if (posy <= BALL_RADIUS) {
      posy = BALL_RADIUS;
      vely = -vely;
    }
    if (posy >= HEIGHT - BALL_RADIUS) {
      posy = HEIGHT - BALL_RADIUS;
      vely = -vely;
    }
  }
  
  void drawIt()
  {
    noStroke();
    fill(255);
    ellipse(posx, posy, 2 * BALL_RADIUS, 2 * BALL_RADIUS);
  }
}

class Paddle
{
  float posx, posy;
  float vel;
  boolean isHuman;
  
  Paddle(float posx_)
  {
    posx = posx_;
    reset(true);
  }
  
  void reset(boolean isHuman_)
  {
    posy = HALF_HEIGHT;
    vel = 0;
    isHuman = isHuman_;
  }
  
  boolean isHit(Ball ball)
  {
    if (ball.posy >= posy - HALF_PAD_HEIGHT && ball.posy <= posy + HALF_PAD_HEIGHT) {
      ball.reflect();
      return true;
    }
    return false;
  }
  
  void setVel(float vel_)
  {
    if (isHuman) vel = vel_;
  }
  
  void cpu(Ball ball)
  {
    if (!isHuman) {
      float pos = HALF_HEIGHT;
      float direct = (posx - ball.posx > 0) ? 1 : -1;
      if ((direct > 0 && ball.velx > 0) || (direct < 0 && ball.velx < 0)) {
        float h = HEIGHT - 2 * BALL_RADIUS;
        float dist = abs(posx - ball.posx) - BALL_RADIUS - HALF_PAD_WIDTH;
        float approx = abs(ball.posy - BALL_RADIUS + direct * dist * ball.vely / ball.velx);
        pos = int(approx) % h;
        if (int(approx / h) % 2 == 1) {
          pos = h - pos;
        }
        pos += BALL_RADIUS;
      }
      vel = getAdjustedVel(posy, pos, HALF_PAD_HEIGHT / 2, PAD_VEL_CPU);
    }
  }

  float getAdjustedVel(float cur, float dest, float adj, float vel)
  {
    if (cur <= dest - adj) return vel;
    else if (cur >= dest + adj) return -vel;
    else return 0;
  }

  void updatePos()
  {
    posy += vel;
    if (posy < HALF_PAD_HEIGHT) posy = HALF_PAD_HEIGHT;
    if (posy > HEIGHT - HALF_PAD_HEIGHT) posy = HEIGHT - HALF_PAD_HEIGHT;
  }

  void drawIt()
  {
    strokeWeight(PAD_WIDTH);
    stroke(255, 255, 128);
    line(posx, posy - HALF_PAD_HEIGHT, posx, posy + HALF_PAD_HEIGHT);
  }
}

PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i = 0; i < numImages; ++i) {
    PImage img = loadImage(stub + i + extension);
    if (img != null) {
      images = (PImage [])append(images,img);
    }
    else break;
  }
  return images;
}

void setup()
{
  //size(WIDTH, HEIGHT);
  size(800, 500);  // for javascript mode
  colorBackground = color(0, 128, 64);
  background(colorBackground);
  textAlign(CENTER, CENTER);
  rectMode(CORNER);
  imageMode(CENTER);

  mode = MODE_IMG;
  time = 0; num = 0;
  images = loadImages("kittens", ".jpg", 11);

  fontButton = createFont("Arial", 28, true);
  fontNote = createFont("Arial", 22, true);
  fontScore = createFont("Arial", 64, true);
  buttonColor = color(196, 128, 0);
  buttonHColor = color(255, 164, 0);

  int w = 500, h = 50;
  int x = HALF_WIDTH - w / 2;
  int y = HEIGHT / 8;
  buttons = new Button[] {
    new Button("human vs human", x, 2 * y, w, h),
    new Button("human vs cpu",   x, 3 * y, w, h),
    new Button("cpu vs human",   x, 4 * y, w, h),
    new Button("cpu vs cpu",     x, 5 * y, w, h),
    new Button("sound: off",      x, 6 * y, w, h)
  };
  soundOn = false;
  
  ball = new Ball();
  paddle1 = new Paddle(HALF_PAD_WIDTH);
  paddle2 = new Paddle(WIDTH - HALF_PAD_WIDTH);
  score1 = 0;
  score2 = 0;
}

void process_ball()
{
  if (ball.posx - BALL_RADIUS <= PAD_WIDTH) {
    if (!paddle1.isHit(ball)) {
      ++score2;
      ball.init(false);
    }
    else {
      ball.posx = PAD_WIDTH + BALL_RADIUS;
      time = 0;
    }
  }

  if (ball.posx + BALL_RADIUS >= WIDTH - PAD_WIDTH) {
    
    if (!paddle2.isHit(ball)) {
      ++score1;
      ball.init(true);
    }
    else {
      ball.posx = WIDTH - PAD_WIDTH - BALL_RADIUS;
      time = 0;
    }
  }
}
      
void draw()
{
  noStroke();
  fill(colorBackground, 80);
  rect(0, 0, width, height);
  
  switch (mode)
  {
    case MODE_IMG:
      image(images[num], HALF_WIDTH, HALF_HEIGHT);
      time = (time + 1) % 5;
      if (time == 0) num = (num + 1) % 11;
      textFont(fontButton);
      fill(64);
      text("click to play", HALF_WIDTH, HEIGHT - 40);
      break;
    
    case MODE_SELECT:
      fill(196, 128, 0);
      textFont(fontScore);
      text("Ping-Pong", HALF_WIDTH, 50);
      textFont(fontButton);
      strokeWeight(2);
      stroke(64);
      for (int i = 0; i < buttons.length; ++i) {
        buttons[i].drawIt();
      }
      textFont(fontNote);
      text("player1 constrols: W S, player2 controls: Up Down, Space - exit", HALF_WIDTH, HEIGHT - 40);
      break;
      
    case MODE_PLAY:
      time = (time + 1) % 10;
  
      ball.updatePos();
      paddle1.updatePos();
      paddle2.updatePos();
      process_ball();
      if (time == 0) {
        paddle1.cpu(ball);
        paddle2.cpu(ball);
      }

      strokeWeight(2);
      stroke(164);
      line(HALF_WIDTH, 0, HALF_WIDTH, HEIGHT);
      line(PAD_WIDTH, 0, PAD_WIDTH, HEIGHT);
      line(WIDTH - PAD_WIDTH, 0, WIDTH - PAD_WIDTH, HEIGHT);
      fill(164);
      textFont(fontScore);
      text(score1, width / 4, height / 4);
      text(score2, 3 * width / 4, height / 4);
      textFont(fontNote);
      text(paddle1.isHuman ? "player1: W S" : "cpu", width / 4, height - 50);
      text(paddle2.isHuman ? "player2: Up Down" : "cpu", 3 * width / 4, height - 50);
      ball.drawIt();
      paddle1.drawIt();
      paddle2.drawIt();
      break;
  }
}

void mousePressed() {
  switch(mode) {
    case MODE_SELECT:
      int k;
      for (k = 0; k < buttons.length; ++k) {
        if (buttons[k].isMouseOver()) break;
      }
      boolean player1, player2;
      switch (k) {
        case 0: player1 = true; player2 = true; break;
        case 1: player1 = true; player2 = false; break;
        case 2: player1 = false; player2 = true; break;
        case 3: player1 = false; player2 = false; break;
        case 4: soundOn = !soundOn; buttons[k].label = "sound: " + (soundOn ? "broken" : "off"); return;
        default: return;
      }
      paddle1.reset(player1);
      paddle2.reset(player2);
      ball.init(random(2) == 0);
      score1 = 0;
      score2 = 0;
      mode = MODE_PLAY;
      break;
   case MODE_IMG:
    case MODE_PLAY:
      mode = MODE_SELECT;
      break;
  }
}

void keyPressed()
{
  if (mode == MODE_PLAY) {
    if (key == 'W' || key == 'w') paddle1.setVel(-PAD_VEL_HUM);
    else if (key == 'S' || key == 's') paddle1.setVel(PAD_VEL_HUM);
    else if (keyCode == UP) paddle2.setVel(-PAD_VEL_HUM);
    else if (keyCode == DOWN) paddle2.setVel(PAD_VEL_HUM);
  }
}
 
void keyReleased()
{
  if (mode == MODE_PLAY) {
    if (key == 'W' || key == 'w' || key == 'S' || key == 's') paddle1.setVel(0);
    else if (keyCode == UP || keyCode == DOWN) paddle2.setVel(0);
    else if (key == ' ') mode = MODE_SELECT;
  }
}



