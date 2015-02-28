
/** Dodgeball
 * A simple game to test your coordination 
 * by Steven Kay
 */

float WID=512.0;
float HGT=512.0;
float px,py;
ArrayList balls; // moving balls
ArrayList powers; // powerup powers in effect
ArrayList powerups; // powerups on screen
int BALLS=8;
int score=0;
int hiscore=0;
PFont font;
int fc=0; 
boolean showsplash=true;
boolean gameover=false;
boolean isInvincible=false;
int playerfill=255;

/**
 * Powerup class
 * a powerup is a stationary ball which appears for a limited time
 * spawned at random, and more than one may be in place (and picked up) at a time
 *
 */
 
class powerup {
  public float x,y;
  public float radius;
  public boolean collision;
  public int type;
  public int ticks=300;
  
  private color[] cols=new color[]{
    color(255),
    color(255,0,0),
    color(0,0,255),
    color(0,255,255),
    color(255,255,0)
  };
  
  public powerup() {
    x=random(0,WID);
    y=random(0,HGT);
    radius=40.0;
    collision=false;
    this.type=(int)random(0,5);
    this.ticks=255; // last 3 secs
  }
    
  public void onFrame() {
    if (ticks>0) ticks-=1;
  }
  
  public void draw() {
    if (mag(x-px,y-py)<radius) collision=true;
    if (ticks>0) {
      ellipseMode(CENTER);
      fill(cols[type]);
      ellipse(x,y,radius,radius);
      fill(0);
      ellipse(x,y,radius-20,radius-20);
    }
  }
 
}
 
 
/**
 * Class template for powerup effects
 * subclassed to implement various effects of powerups
 *
 */
 
class power{
  public int ticks=300; // frames left till deactivation, default 3 secs
  public int type=999;
  public power() {
    activate();
  }
  public void activate() {;}; // called when powerup starts
  public void onFrame() {;}; // called each frame while in place
  public void deactivate() {;}; // called when powerup times out
}

/**
 * Invincible power
 * 5 seconds invincible. Player turns grey.
 */
class invincible extends power {
  public int type;
  public void activate() {
    super.ticks=500;
    print("Invincible on\n");
    playerfill=127;
    isInvincible=true;
  }
  public void deactivate() {
    isInvincible=false;
    print("Invincible off\n");
    playerfill=255;
  }
}

/**
 * Small ball power
 * 5 seconds the balls are half size
 */
class smallball extends power {
  
  public void activate() {
    super.ticks=500;
    super.type=1;
    print("Small ball on\n");
    for (int i=0;i<balls.size();i++) {
      ball b=(ball)balls.get(i);
      b.radius=20.0;
    }
  }
  public void deactivate() {
    for (int i=0;i<balls.size();i++) {
      ball b=(ball)balls.get(i);
      b.radius=40.0;
    }
    print("Small ball off\n");
  }
}

/**
 * Big ball power
 * 5 seconds the balls are double size
 */
class largeball extends power {
  
  public void activate() {
    super.ticks=500;
    super.type=2;
    print("Large ball on\n");
    for (int i=0;i<balls.size();i++) {
      ball b=(ball)balls.get(i);
      b.radius=80.0;
    }
  }
  public void onFrame() {
    score++; // doubles score accumulation!
  }

  public void deactivate() {
    for (int i=0;i<balls.size();i++) {
      ball b=(ball)balls.get(i);
      b.radius=40.0;
    }
    print("Large ball off\n");
  }
}

/**
 * Go fast
 * 5 seconds the balls are double speed, but also doubles speed at
 * which you accumulate points;
 */
class fastball extends power {

  public void activate() {
    super.ticks=500;
    super.type=3;
    print("Fast ball on\n");
    for (int i=0;i<balls.size();i++) {
      ball b=(ball)balls.get(i);
      b.dx*=2.0;
      b.dy*=2.0;
    }
  }
  public void onFrame() {
    score+=3; // quadruples score accumulation!
  }
  
  public void deactivate() {
    for (int i=0;i<balls.size();i++) {
      ball b=(ball)balls.get(i);
      b.dx/=2.0;
      b.dy/=2.0;
    }
    print("Fast ball off\n");
  }
}

/**
 * Fastscore
 * for 5 seconds this doubles the speed at
 * which you accumulate points;
 */
class fastscore extends power {

  public void activate() {
    super.ticks=500;
    super.type=4;
    print("Fast speed on\n");
  }
  public void onFrame() {
    score++; // doubles score accumulation!
  }
  
  public void deactivate() {
    print("Fast speed off\n");
  }
}


/**
 * represents a ball - avoid colliding with these!
 */
class ball {
  
  public float x,y;
  private float dx,dy;
  public float radius;
  public boolean collision;
  
  public ball() {
    x=random(0,WID);
    y=random(0,HGT);
    dx=random(-6,6);
    dy=random(-6,6);
    radius=40.0;
    collision=false;
  }
  
  public void move() {
    x+=dx;
    y+=dy;
    if (x>WID || x<0) dx=-dx;
    if (y>HGT || y<0) dy=-dy;
  }
  
  public void draw() {
    ellipseMode(CENTER);
    if (mag(x-px,y-py)<radius) {
      collision=true;
      fill(205,255,56);
    } else {
      collision=false;
      fill(205,0,56);
    }
    ellipse(x,y,radius,radius);
  }
  
}

void reset() {
  balls=new ArrayList();
  powers=new ArrayList();
  powerups=new ArrayList();
  for (int i=0;i<BALLS;i++) balls.add(new ball());
  mouseX=(int)(WID/2.0);
  mouseY=(int)(HGT/2.0);
  score=0;
  fc=0;
  gameover=false;
  boolean isInvincible=false;
  int playerfill=255;
  // player made invincible for first few seconds (free powerup)
  powers.add(new invincible());
}

void appendPower(int powertype) {
  // if got an existing power of this type which is not expired,
  // then add the amount to its ticks value. this extends the timer
  // of an existing powerup. If none exist ofthat type, then add a new power.
  // This means that if you pick up an invincible power just before the
  // current invincible power runs out, you extend the lifetime of the
  // current invincible power. 
  boolean found=false;
  for (int i=0;i<powers.size();i++) {
    power p=(power)powers.get(i);
    if (p.type==powertype && p.ticks>0) {
      p.ticks+=500;
      found=true;
      print ("Extended to "+p.ticks+"\n");
      return;
    }
  }
  if (!found) {
      switch (powertype) {
          case 0:
            powers.add(new invincible());
            break;
           case 1:
            powers.add(new smallball());
            break;
           case 2:
            powers.add(new largeball());
            break;
           case 3:
            powers.add(new fastball());
            break;
           case 4:
            powers.add(new fastscore());
            break;
          default:
            break;
        }
  }
}

void setup() {
  size((int)WID,(int)HGT,P3D);
  reset();
  font=loadFont("2006-48.vlw");
  textFont(font,32.0);
  frameRate(100);
}

void draw() {
  if (showsplash) {
    drawHelp();
  }
  else if (!gameover) {
    drawRunning();
  } else {
    drawGameOver();
  }
}

void drawRunning() {
  // called when running
  background(0);
  
  // cycle through powerup effects list
  // this code handles what to do while a powerup is in effect,
  // and uses deactivate() to return gameplay to normal once the effect
  // has expired
  
  for (int i=0;i<powers.size();i++) {  
    power p=(power)(powers.get(i));
    if (p.ticks>0) {
      // still active, so count down
      p.onFrame();
      p.ticks-=1;
      if (p.ticks==0) p.deactivate(); // expired
    }
  }
  
  // display any powerups
  // and handle collisions
  
  for (int i=0;i<powerups.size();i++) {  
    powerup p=(powerup)(powerups.get(i));
    if (p.ticks>0) {
      p.onFrame();
      p.draw();
      if (p.collision) {
        // picked up a powerup
        p.ticks=0;
        appendPower(p.type);
      }
    }
  }
  
  // random spawning of powerups
  if (random(0,1000)>998) spawnPowerup();
  
  // now draw player
  score++;
  fc++;
  px=mouseX;
  py=mouseY;
  ellipseMode(CENTER);
  fill(playerfill);
  ellipse(px,py,40,40);
  
  // now draw and move balls
  for (int i=0;i<BALLS;i++) {
      ball b=(ball)balls.get(i);
      if (fc%2==0) b.move();
      if (b.collision==true && !isInvincible) gameover=true;
      //if (b.collision==true && false) gameover=true;
      b.draw();
  }
  
  // show score (shown brighter if a new high score
  if (score>hiscore) {
    fill(0,255,0);
  } else {
    fill(0,180,0);
  }
  text(score+"",10,20);
 
}

void mousePressed() {
  if (showsplash) {
    showsplash=false;
    return;
  }
  if (gameover) reset();
}

void spawnPowerup() {
  powerups.add(new powerup());
}

void drawHelp() {
  background(0);
  textFont(font,62.0);
  fill(0,255,0);
  text("DODGEBALL",20,110); 
  textFont(font,28.0);
  text("a game by Steven Kay",20,140); 
  text("Use the mouse to move the white ball.",20,180); 
  text("Avoid the red balls bouncing around.",20,200); 
  text("Collect powerups that appear...",20,240); 
  text("White: Invincible for 5 secs",20,260); 
  text("Red: Makes balls smaller for 5 secs",20,280); 
  text("Blue: Makes balls larger 2 times score",20,300); 
  text("Cyan: Balls move faster 4 times score",20,320); 
  text("Yellow: 2 times score",20,340); 
  text("You are invincible for the first few seconds",20,380); 
  text("to give you a chance to get in place!",20,400); 
  fill(255);
  text("Click to begin!",20,450); 
}

void drawGameOver() {
  // called when game over
  background(0);
  fc++;
  ellipseMode(CENTER);
  fill(250);
  ellipse(px,py,40,40);
  for (int i=0;i<BALLS;i++) {
      ball b=(ball)balls.get(i);
      b.draw();
  }
  fill(0,255,0);
  text(score+"",10,20);
  fill(0,0,0,120);
  rect(0,0,WID,HGT);
  textFont(font,62.0);
  fill(0,255,0);
  text("GAME OVER!",70,150); 
  textFont(font,32.0);
  text("SCORE : "+score,70,170); 
  if (score>hiscore) hiscore=score;
  text("HI : "+hiscore,70,190); 
  text("Click to play again",70,230); 
}



