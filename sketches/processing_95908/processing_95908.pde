
Player p;
ArrayList plats;
boolean aPressed, dPressed;
boolean gameOver;

void setup() {
  size(320, 480);
  frameRate(60);
  startUp();
}

void draw() {
  background(204);
  for(int i=0; i<plats.size(); i++) {
    p.hitTest((Platform)plats.get(i));
    ((Platform)plats.get(i)).display();
    ((Platform)plats.get(i)).move();
  }
  p.display(); 
  p.move();

  moveCamera();
  removePlats();
  createNewPlats();
  if(platsBelow() == 0) gameOver = true;
}

void startUp() {
  gameOver = false;
  p = new Player(width/2, height/2);
  plats = new ArrayList();
  plats.add(new HorizontalMovingPlatform(20, 80, 70, 8));
  plats.add(new Platform(100, 420, 100, 8));
  plats.add(new Platform((int)random(40, 180), 320, 100, 8));
  plats.add(new Platform((int)random(40, 180), 220, 100, 8));
  plats.add(new Platform((int)random(40, 180), 120, 100, 8));
  plats.add(new Platform((int)random(40, 180), 20, 100, 8));
}

void moveCamera() {
  float overHeight = height * 0.5 - p.y;
  if(overHeight > 0)
  {
    p.y += overHeight;
    for(int i=0; i<plats.size(); i++) {
      ((Platform)plats.get(i)).y += overHeight;
    }
  }
  float underHeight = p.y - (height-p.h-4);
  if(underHeight > 0) {
    p.y -= underHeight;
    for(int i=0; i<plats.size(); i++) {
      ((Platform)plats.get(i)).y -= underHeight;
    }
  }
}

void removePlats() {
  for(int i=plats.size()-1; i>=0; i--) {
    if(((Platform)plats.get(i)).y > height) {
      plats.remove(i);
    }
  }
}

void createNewPlats() {
  if(plats.size() < 7) {
    if(random(0, 10) < 2) plats.add(new HorizontalMovingPlatform((int)random(10, width-80), -10, 70, 8));
    else plats.add(new Platform((int)random(20, 200), -10, 70, 8));
  }
}

int platsBelow() {
  int count = 0;
  for(int i=0; i<plats.size(); i++) {
    if(((Platform)plats.get(i)).y >= p.y) count++;
  }
  return count;
}

void keyPressed()
{
  if(key == 'a') aPressed = true;
  if(key == 'd') dPressed = true;
}

void keyReleased()
{
  if(key == 'a') aPressed = false;
  if(key == 'd') dPressed = false;
}

class Platform {
  float x, y, w, h;
  float xvel, yvel;

  Platform(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    fill(127);
    rect(x, y, w, h);
  }

  void move() {
    x += xvel;
    y += yvel;
  }
}

class HorizontalMovingPlatform extends Platform {
  static final float speed = 0.9;

  HorizontalMovingPlatform(int x, int y, int w, int h) {
    super(x, y, w, h);
    this.xvel = speed;
  }

  void move() {
    super.move();
    if ((x+w > width - 10) || (x < 10)) {
      xvel *= -1;
    }
  }
}

class Player {
  static final float gravity = 0.14, bounceVel = 6.1, maxYVel = 12, maxXVel = 2;

  float x, y, xVel, yVel;
  int w, h;
  
  Player(int x, int y) {
    this.x = x;
    this.y = y;
    w = 20;
    h = 20;
  }

  void display() {
    fill(240, 20, 75);
    rect(x, y, w, h);
  }

  void move() {
    x += xVel;
    y += yVel;

    if (x > width-w) {
      x = 0;
    }
    if (x < 0) {
      x = width-w;
    }
    
    if (!gameOver) {
      if (aPressed) {
        xVel -= 0.05;
      }
      else if (dPressed) {
        xVel += 0.05;
      }
      else {
        if (xVel > 0) {
          xVel -= 0.03;
        }
        else {
          xVel += 0.03;
        }
      }
    }
    if (abs(xVel) < 0.01) {
      xVel = 0;
    }
    
    xVel = min(maxXVel, xVel);
    xVel = max(-maxXVel, xVel);

    yVel += gravity;
    yVel = min(maxYVel, yVel);
    yVel = max(-maxYVel, yVel);
  }

  void hitTest(Platform p) {
    if (x < p.x + p.w && x + w > p.x && y+h/2+h/4 < p.y + p.h && y + h > p.y) {
      if ((int)random(4) == 1) {
        yVel += 0.5;
        float start = System.currentTimeMillis();
        if ((float)System.currentTimeMillis() - start > 1000) {
          yVel -=0.5;
        }
      }
      else {
        if (yVel > 0) {
          yVel = -bounceVel;
        }
      }
    }
  }
}



