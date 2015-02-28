
/*
 Basics: You control a green dot with you mouse and you will die if you collide with certain dots (enemies). You score on the upper-left will increase whenever you kill an enemy. Hold a mouse button down to shoot. The catch is that you can only shoot down. Press 'r' to restart, 'p' to pause and unpause, and 'm' to switch between using the arrowkeys and the mouse to control your dot. To turn auro-fire on move your mouse out of the arena while holding the mouse button down, let go of the mouse button, and then move it back in. To turn auto-fire off press a mouse button.
 
 Enemies: Red, yellow, and teal, and blue dots are deadly! White and black dots will not hurt you, but will change color after 2.5 seconds and become harmful. White dots turn to red and always follow you. Black dots change to yellow and always go straight, but bounce (as if they are light particles and the sides of the arena are mirrors) off the sides of the arena only. Magenta dots circle around you and rapidly drop the stationary teal dots that can't be destroyed. Gray dots will turn harmful and blue in 2.5 seconds. It moves faster than you and escapes you while you are moving, otherwise it willAfollow you a bit faster than its escaping speed. Every 5 seconds it will switch when to escape and when to follow, but it still goes faster while folowing. It can't go outside the arena. Some enemies award more score but might take more shots to kill. Enemies appear faster over time.
 
 Challenges: You will be notified whenever you complete a challenge. Press 'c' to make all current notifications disappear. These are the current challenges:
     Close Shaves: Get 1 pixel away from touching a red enemy that is dangerous and a yellow enemy that is dangerous (does not have to be at the same instant) and then survive 1 or more seconds after the last close shave. This challenge is impossible to achieve after death untill you press 'r'.
     Bltzkrieg: Get 50 or higher score before the first magenta dot appears.
     Can't See You: Keep the magenta dot outside the arena for 2.5 seconds while there is only one existng. The 2.5-second-timer will restart if you press 's' or 'r' and will be be disabled after you die untill you press 's' or 'r'. Note that this challenge should be played on a fast computer to experience its full difficulty because the time that the magenta dot needs to ouside the arena is the same whether the dot is moving slower because of lag or not.
 */

Player p;
ArrayList enemiesA;
ArrayList enemiesB;
ArrayList enemiesC;
ArrayList enemiesD;
ArrayList mines;
PFont font = createFont("Arial", 32);
boolean restart;
boolean pause;
boolean closeShavesOn;
boolean closeShavesShow = false;
boolean closeShaveWithRed;
boolean closeShaveWithYellow;
boolean blitzkriegOn;
boolean blitzkriegShow = false;
boolean cantSeeYouOn;
boolean cantSeeYouShow = false;
boolean keysOn = false;
boolean[] keys = new boolean[4];
int pauseTime;
int pauseStart;
int tigerReflexes;
int closeShaveTime;
int cantSeeYouStart;
int eACreate;
int eBCreate;
int eCCreate;
int eDCreate;
float eACreateModifier;
float eBCreateModifier;
float eCCreateModifier;
float eDCreateModifier;
int score;

void setup()
{
  size(550, 550);
  smooth();
  restart = false;
  pause = false;
  score = 0;
  closeShavesOn = true;
  closeShaveWithRed = false;
  closeShaveWithYellow = false;
  blitzkriegOn = true;
  cantSeeYouOn = true;
  cantSeeYouStart = 0;
  enemiesA = new ArrayList();
  enemiesB = new ArrayList();
  enemiesC = new ArrayList();
  enemiesD = new ArrayList();
  mines = new ArrayList();
  p = new Player(width / 2, height / 2, width / 2, height / 2, 15, millis() - pauseTime);
  enemiesA.add(new EnemyA(random(width), random(height), random(width), random(height), 10, millis() - pauseTime, 2, 3, false));
  enemiesB.add(new EnemyB(random(width), random(height), random(width), random(height), 10, millis() - pauseTime, int(random(8)), 1, 4, false));
  pauseTime = 0;
  pauseStart = 0;
  eACreate = millis();
  eBCreate = millis();
  eCCreate = millis();
  eDCreate = millis();
  eACreateModifier = 1;
  eBCreateModifier = 1;
  eCCreateModifier = 1;
  eDCreateModifier = 1;
  textFont(font);
}

void draw()
{
  if (!restart)
  {
    if (!pause)
    {
      fill(127, 20);
      rect(0, 0, width, height);
      p.show();
    }
    else
      pauseTime = millis() - pauseStart;
    if (millis() - eACreate - pauseTime >= 1500 * eACreateModifier && !pause)
    {
      eACreate = millis();
      eACreateModifier *= .975;
      enemiesA.add(new EnemyA(random(width), random(height), random(width), random(height), 10, millis() - pauseTime, 2, 3, false));
    }
    for (int i = 0; i <= enemiesA.size() - 1; i ++)
    {
      if (!pause)
      {
        EnemyA e = (EnemyA) enemiesA.get(i);
        e.show();
      }
    }
    if (millis() - eBCreate - pauseTime >= 1000 * eBCreateModifier && !pause)
    {
      eBCreate = millis();
      eBCreateModifier *= .975;
      enemiesB.add(new EnemyB(random(width), random(height), random(width), random(height), 10, millis() - pauseTime, int(random(8)), 1, 4, false));
    }
    for (int i = 0; i <= enemiesB.size() - 1; i ++)
    {
      if (!pause)
      {
        EnemyB e = (EnemyB) enemiesB.get(i);
        e.show();
      }
    }
    if (millis() - eCCreate - pauseTime >= 15000 * eCCreateModifier && !pause)
    {
      eCCreate = millis();
      eCCreateModifier *= .975;
      enemiesC.add(new EnemyC(random(-width * 8, width * 9), random(-height * 8, height * 9), p.loc2.x, p.loc2.y, 8, millis() - pauseTime, 3, 8));
      EnemyC e = (EnemyC) enemiesC.get(enemiesC.size() - 1);
      while (dist (e.loc1.x, e.loc1.y, p.loc2.x, p.loc2.y) < 125)
        e.loc1.set(random(-width * 8, width * 9), random(-height * 8, height * 9), 0);
    }
    for (int i = 0; i <= enemiesC.size() - 1; i ++)
    {
      if (!pause)
      {
        EnemyC e = (EnemyC) enemiesC.get(i);
        e.show();
      }
    }
    if (millis() - eDCreate - pauseTime >= 27500 * eDCreateModifier && !pause)
    {
      eDCreate = millis();
      eDCreateModifier *= .975;
      enemiesD.add(new EnemyD(random(width), random(height), random(width), p.loc2.y - 50, 10, millis() - pauseTime, millis(), 5, 15, false, false));
    }
    for (int i = 0; i <= enemiesD.size() - 1; i ++)
    {
      if (!pause)
      {
        EnemyD e = (EnemyD) enemiesD.get(i);
        e.show();
      }
    }
    if (mousePressed && millis() - p.shootTime - pauseTime >= 250)
    {
      p.shootTime = millis() - pauseTime;
      mines.add(new Mine(0, height * 2, p.loc2.x, p.loc2.y, 5, int(random(8)), true));
    }
    for (int i = 0; i <= mines.size() - 1; i ++)
    {
      if (!pause)
      {
        Mine m = (Mine) mines.get(i);
        if (m.loc2.x >= width + m.mSize || m.loc2.x <= -m.mSize || m.loc2.y >= height + m.mSize || m.loc2.y <= -m.mSize)
          mines.remove(i);
        m.show();
      }
    }
    for (int i = 0; i <= mines.size() - 1; i ++)
    {
      Mine m = (Mine) mines.get(i);
      if (m.madeByPlayer)
      {
        for (int i2 = 0; i2 <= enemiesA.size() - 1; i2 ++)
        {
          EnemyA e = (EnemyA) enemiesA.get(i2);
          if (dist(e.loc2.x, e.loc2.y, m.loc2.x, m.loc2.y) <= e.eSize / 2 + m.mSize / 2 && e.fatal)
          {
            mines.remove(i);
            e.HP --;
          }
          if (e.HP <= 0)
          {
            enemiesA.remove(i2);
            score += e.value;
          }
        }
        for (int i2 = 0; i2 <= enemiesB.size() - 1; i2 ++)
        {
          EnemyB e = (EnemyB) enemiesB.get(i2);
          if (dist(e.loc2.x, e.loc2.y, m.loc2.x, m.loc2.y) <= e.eSize / 2 + m.mSize / 2 && e.fatal)
          {
            mines.remove(i);
            e.HP --;
          }
          if (e.HP <= 0)
          {
            enemiesB.remove(i2);
            score += e.value;
          }
        }
        for (int i2 = 0; i2 <= enemiesC.size() - 1; i2 ++)
        {
          EnemyC e = (EnemyC) enemiesC.get(i2);
          if (dist(e.loc2.x, e.loc2.y, m.loc2.x, m.loc2.y) <= e.eSize / 2 + m.mSize / 2)
          {
            mines.remove(i);
            e.HP --;
          }
          if (e.HP <= 0)
          {
            enemiesC.remove(i2);
            score += e.value;
          }
        }
        for (int i2 = 0; i2 <= enemiesD.size() - 1; i2 ++)
        {
          EnemyD e = (EnemyD) enemiesD.get(i2);
          if (dist(e.loc2.x, e.loc2.y, m.loc2.x, m.loc2.y) <= e.eSize / 2 + m.mSize / 2 && e.fatal)
          {
            mines.remove(i);
            e.HP --;
          }
          if (e.HP <= 0)
          {
            enemiesD.remove(i2);
            score += e.value;
          }
        }
      }
    }
    if (blitzkriegOn && millis() - pauseTime >= 1500)
    {
      blitzkriegOn = false;
      if (score >= 50)
      blitzkriegShow = true;
    }
    if (closeShavesShow)
    {
      fill(255);
      text("Challenges completed:", 0, 55);
      text("Close Shaves", 0, 85);
    }
    if (enemiesC.size() == 2 && millis() - cantSeeYouStart - pauseTime >= 2500)
      cantSeeYouShow = true;
    if (blitzkriegShow)
    {
      fill(255);
      text("Challenges completed:", 0, 55);
      text("Blitzkrieg", 0, 115);
    }
    if (cantSeeYouShow)
    {
      cantSeeYouOn = false;
      fill(255);
      text("Challenges completed:", 0, 55);
      text("Can't See You", 0, 145);
    }
    if (!restart)
    {
      if (!pause)
      {
        fill(0);
        if (closeShaveWithRed && closeShaveWithYellow && millis() - closeShaveTime >= 1000 && closeShavesOn)
          closeShavesShow = true;
      }
    }
    else
      fill(255);
    text(score, 0, 25);
  }
}

void keyPressed()
{
  if (key == 'r')
    setup();
  if (key == 'p')
  {
    pause = !pause;
    pauseStart = millis() - pauseTime;
  }
  if (key == 'm')
    keysOn = !keysOn;
  if (key == 'c')
  {
    closeShavesShow = false;
    blitzkriegShow = false;
    cantSeeYouShow = false;
  }
  if (keyCode == LEFT)
    keys[0] = true;
  if (keyCode == RIGHT)
    keys[1] = true;
  if (keyCode == UP)
    keys[2] = true;
  if (keyCode == DOWN)
    keys[3] = true;
}

void keyReleased()
{
  if (keyCode == LEFT)
    keys[0] = false;
  if (keyCode == RIGHT)
    keys[1] = false;
  if (keyCode == UP)
    keys[2] = false;
  if (keyCode == DOWN)
    keys[3] = false;
}

class Mine
{
  PVector loc1 = new PVector();
  PVector loc2 = new PVector();
  int mSize, r;
  boolean madeByPlayer;

  Mine(float loc1X, float loc1Y, float loc2X, float loc2Y, int mSize, int r, boolean madeByPlayer)
  {
    loc1.x = loc1X;
    loc1.y = loc1Y;
    loc2.x = loc2X;
    loc2.y = loc2Y;
    this.mSize = mSize;
    this.r = r;
    this.madeByPlayer = madeByPlayer;
  }

  void show()
  {
    if (madeByPlayer)
    {
      fill(0, 255, 0);
      ellipse(loc2.x, loc2.y, mSize, mSize);
      loc1.limit(3.5);
      loc2.add(0, loc1.y, 0);
    }
    else
    {
      fill(0, 255, 255);
      ellipse(loc2.x, loc2.y, mSize, mSize);
      if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= p.pSize / 2 + mSize / 2)
        restart = true;
      else
      {
        loc1.limit(3.5);
        if (r == 0)
          loc2.add(loc1.x, loc1.y, 0);
        else if (r == 1)
          loc2.add(-loc1.x, loc1.y, 0);
        else if (r == 2)
          loc2.add(loc1.x, -loc1.y, 0);
        else if (r == 3)
          loc2.add(-loc1.x, -loc1.y, 0);
        else if (r == 4)
          loc2.sub(loc1.x, loc1.y, 0);
        else if (r == 5)
          loc2.sub(-loc1.x, loc1.y, 0);
        else if (r == 6)
          loc2.sub(loc1.x, -loc1.y, 0);
        else
          loc2.sub(-loc1.x, -loc1.y, 0);
        fill(0, 255, 255);
        ellipse(loc2.x, loc2.y, mSize, mSize);
        if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= p.pSize / 2 + mSize / 2)
          restart = true;
      }
    }
  }
}

class EnemyA
{
  PVector loc1 = new PVector();
  PVector loc2 = new PVector();
  int eSize, turnFatalTime, HP, value;
  boolean fatal;

  EnemyA(float loc1X, float loc1Y, float loc2X, float loc2Y, int eSize, int turnFatalTime, int HP, int value, boolean fatal)
  {
    loc1.x = loc1X;
    loc1.y = loc1Y;
    loc2.x = loc2X;
    loc2.y = loc2Y;
    this.eSize = eSize;
    this.turnFatalTime = turnFatalTime;
    this.HP = HP;
    this.value = value;
    this.fatal = fatal;
  }

  void show()
  {
    loc1.x = dist(loc2.x, 0, p.loc2.x, 0);
    loc1.y = dist(0, loc2.y, 0, p.loc2.y);
    loc1.limit(.9);
    if (loc2.x - p.loc2.x > 0)
      loc2.x -= loc1.x;
    else
      loc2.x += loc1.x;
    if (loc2.y - p.loc2.y > 0)
      loc2.y -= loc1.y;
    else
      loc2.y += loc1.y;
    if (millis() - turnFatalTime - pauseTime >= 2500 && !pause)
    {
      fatal = true;
      fill(255, 0, 0);
    }
    else
      fill(255);
    ellipse(loc2.x, loc2.y, eSize, eSize);
    if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= p.pSize / 2 + eSize / 2 && fatal)
      restart = true;
    if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= 1 + p.pSize / 2 + eSize / 2 && fatal)
      closeShaveWithRed = true;
  }
}

class EnemyB
{
  PVector loc1 = new PVector();
  PVector loc2 = new PVector();
  int eSize, turnFatalTime, r, HP, value;
  boolean fatal;

  EnemyB(float loc1X, float loc1Y, float loc2X, float loc2Y, int eSize, int turnFatalTime, int r, int HP, int value, boolean fatal)
  {
    loc1.x = loc1X;
    loc1.y = loc1Y;
    loc2.x = loc2X;
    loc2.y = loc2Y;
    this.eSize = eSize;
    this.turnFatalTime = turnFatalTime;
    this.r = r;
    this.HP = HP;
    this.value = value;
    this.fatal = fatal;
  }

  void show()
  {
    loc1.limit(1.5);
    if (r == 0)
      loc2.add(loc1.x, loc1.y, 0);
    else if (r == 1)
      loc2.add(-loc1.x, loc1.y, 0);
    else if (r == 2)
      loc2.add(loc1.x, -loc1.y, 0);
    else if (r == 3)
      loc2.add(-loc1.x, -loc1.y, 0);
    else if (r == 4)
      loc2.sub(loc1.x, loc1.y, 0);
    else if (r == 5)
      loc2.sub(-loc1.x, loc1.y, 0);
    else if (r == 6)
      loc2.sub(loc1.x, -loc1.y, 0);
    else
      loc2.sub(-loc1.x, -loc1.y, 0);
    if (loc2.x >= width || loc2.x <= 0 || loc2.y >= height || loc2.y <= 0)
    {
      float m = loc1.mag();
      float a = loc1.heading2D();
      a += .5;
      loc1.x = m * cos(a);
      loc1.y = m * sin(a);
    }
    if (millis() - turnFatalTime - pauseTime >= 2500)
    {
      fatal = true;
      fill(255, 255, 0);
    }
    else
      fill(0);
    ellipse(loc2.x, loc2.y, eSize, eSize);
    if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= p.pSize / 2 + eSize / 2 && fatal)
      restart = true;
    if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= 1 + p.pSize / 2 + eSize / 2 && fatal)
      closeShaveWithYellow = true;
  }
}

class EnemyC
{
  PVector loc1 = new PVector();
  PVector loc2 = new PVector();
  int eSize, shootTime, HP, value;

  EnemyC(float loc1X, float loc1Y, float loc2X, float loc2Y, int eSize, int shootTime, int HP, int value)
  {
    loc1.x = loc1X;
    loc1.y = loc1Y;
    loc2.x = loc2X;
    loc2.y = loc2Y;
    this.eSize = eSize;
    this.shootTime = shootTime;
    this.HP = HP;
    this.value = value;
  }

  void show()
  {
    loc1.limit(125);
    float m = loc1.mag();
    float a = loc1.heading2D();
    a += .03;
    loc1.x = m * cos(a);
    loc1.y = m * sin(a);
    loc2.x = p.loc2.x;
    loc2.y = p.loc2.y;
    loc2.add(loc1.x, loc1.y, 0);
    fill(255, 0, 255);
    ellipse(loc2.x, loc2.y, 15, 15);
    if (millis() - shootTime - pauseTime >= 250 && !pause)
    {
      shootTime = millis() - pauseTime;
      mines.add(new Mine(0, 0, loc2.x, loc2.y, 5, int(random(8)), false));
    }
    if (cantSeeYouOn)
    {
      if (!(loc2.x >= width + eSize / 2 || loc2.x <= -eSize / 2 || loc2.y >= height + eSize / 2 || loc2.y <= -eSize / 2))
        cantSeeYouStart = millis();
    }
  }
}

class EnemyD
{
  PVector loc1 = new PVector();
  PVector loc2 = new PVector();
  int eSize, turnFatalTime, switchTime, HP, value;
  boolean fatal, followWhileStill;

  EnemyD(float loc1X, float loc1Y, float loc2X, float loc2Y, int eSize, int turnFatalTime, int switchTime, int HP, int value, boolean fatal, boolean followWhileStill)
  {
    loc1.x = loc1X;
    loc1.y = loc1Y;
    loc2.x = loc2X;
    loc2.y = loc2Y;
    this.eSize = eSize;
    this.turnFatalTime = turnFatalTime;
    this.switchTime = switchTime;
    this.HP = HP;
    this.value = value;
    this.fatal = fatal;
    this.followWhileStill = followWhileStill;
  }

  void show()
  {
    if (loc2.y < eSize / 2)
      loc2.set(loc2.x, eSize / 2, 0);
    loc1.x = dist(loc2.x, 0, p.loc2.x, 0);
    loc1.y = dist(0, loc2.y, 0, p.loc2.y);
    if (millis() - switchTime - pauseTime >= 5000)
    {
      switchTime = millis();
      followWhileStill = !followWhileStill;
    }
    if (!keysOn)
    {
      if (!followWhileStill)
      {
        if (loc2.x < width - eSize / 2 && loc2.x > eSize / 2 && loc2.y < height - eSize / 2 && loc2.y > eSize / 2 && (mouseX != p.loc2.x || mouseY != p.loc2.y))
        {
          loc1.limit(5.5);
          if (loc2.x - p.loc2.x > 0)
            loc2.x += loc1.x;
          else
            loc2.x -= loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y += loc1.y;
          else
            loc2.y -= loc1.y;
        }
        else if (mouseX == p.loc2.x && mouseY == p.loc2.y)
        {
          loc1.limit(5.6);
          if (loc2.x - p.loc2.x > 0)
            loc2.x -= loc1.x;
          else
            loc2.x += loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y -= loc1.y;
          else
            loc2.y += loc1.y;
        }
      }
      else
      {
        if (loc2.x < width - eSize / 2 && loc2.x > eSize / 2 && loc2.y < height - eSize / 2 && loc2.y > eSize / 2 && mouseX == p.loc2.x && mouseY == p.loc2.y)
        {
          loc1.limit(5.5);
          if (loc2.x - p.loc2.x > 0)
            loc2.x += loc1.x;
          else
            loc2.x -= loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y += loc1.y;
          else
            loc2.y -= loc1.y;
        }
        else if (mouseX != p.loc2.x || mouseY != p.loc2.y)
        {
          loc1.limit(5.6);
          if (loc2.x - p.loc2.x > 0)
            loc2.x -= loc1.x;
          else
            loc2.x += loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y -= loc1.y;
          else
            loc2.y += loc1.y;
        }
      }
    }
    else
    {
      if (!followWhileStill)
      {
        if (loc2.x < width - eSize / 2 && loc2.x > eSize / 2 && loc2.y < height - eSize / 2 && loc2.y > eSize / 2 && (keys[0] || keys[1] || keys[2] || keys[3]))
        {
          loc1.limit(5.5);
          if (loc2.x - p.loc2.x > 0)
            loc2.x += loc1.x;
          else
            loc2.x -= loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y += loc1.y;
          else
            loc2.y -= loc1.y;
        }
        else if (!keys[0] && !keys[1] && !keys[2] && !keys[3])
        {
          loc1.limit(5.6);
          if (loc2.x - p.loc2.x > 0)
            loc2.x -= loc1.x;
          else
            loc2.x += loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y -= loc1.y;
          else
            loc2.y += loc1.y;
        }
      }
      else
      {
        if (loc2.x < width - eSize / 2 && loc2.x > eSize / 2 && loc2.y < height - eSize / 2 && loc2.y > eSize / 2 && !keys[0] && !keys[1] && !keys[2] && !keys[3])
        {
          loc1.limit(5.5);
          if (loc2.x - p.loc2.x > 0)
            loc2.x += loc1.x;
          else
            loc2.x -= loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y += loc1.y;
          else
            loc2.y -= loc1.y;
        }
        else if (keys[0] || keys[1] || keys[2] || keys[3])
        {
          loc1.limit(5.6);
          if (loc2.x - p.loc2.x > 0)
            loc2.x -= loc1.x;
          else
            loc2.x += loc1.x;
          if (loc2.y - p.loc2.y > 0)
            loc2.y -= loc1.y;
          else
            loc2.y += loc1.y;
        }
      }
    }
    if (millis() - turnFatalTime - pauseTime >= 2500)
    {
      fatal = true;
      fill(0, 0, 255);
    }
    else
      fill(191.25);
    ellipse(loc2.x, loc2.y, eSize, eSize);
    if (dist(p.loc2.x, p.loc2.y, loc2.x, loc2.y) <= p.pSize / 2 + eSize / 2 && fatal)
      restart = true;
  }
}

class Player
{
  PVector loc1 = new PVector();
  PVector loc2 = new PVector();
  int pSize, shootTime;

  Player(float loc1X, float loc1Y, float loc2X, float loc2Y, int pSize, int shootTime)
  {
    loc1.x = loc1X;
    loc1.y = loc1Y;
    loc2.x = loc2X;
    loc2.y = loc2Y;
    this.pSize = pSize;
    this.shootTime = shootTime;
  }

  void show()
  {
    if (!keysOn)
    {
      loc1.x = dist(mouseX, 0, loc2.x, 0);
      loc1.y = dist(0, mouseY, 0, loc2.y);
      loc1.limit(4);
      if (loc2.x - mouseX > 0)
        loc2.x -= loc1.x;
      else
        loc2.x += loc1.x;
      if (loc2.y - mouseY > 0)
        loc2.y -= loc1.y;
      else
        loc2.y += loc1.y;
    }
    else
    {
      if (keys[0] && loc2.x >= 0)
      {
        loc1.x -= 100;
        loc1.limit(4);
        loc2.add(loc1.x, loc1.y, 0);
      }
      if (keys[1] && loc2.x <= height)
      {
        loc1.x += 100;
        loc1.limit(4);
        loc2.add(loc1.x, loc1.y, 0);
      }
      if (keys[2] && loc2.y >= 0)
      {
        loc1.y -= 100;
        loc1.limit(4);
        loc2.add(loc1.x, loc1.y, 0);
      }
      if (keys[3] && loc2.y <= height)
      {
        loc1.y += 100;
        loc1.limit(4);
        loc2.add(loc1.x, loc1.y, 0);
      }
    }
    fill(0, 255, 0);
    ellipse(loc2.x, loc2.y, pSize, pSize);
  }
}
