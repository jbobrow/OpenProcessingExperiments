
import de.voidplus.leapmotion.*;

LeapMotion leap;
GameEngine game;
Bullet[] bullets;
Michelle michelle;
int numBullets = 500;
int bullet = 0;

void setup() {
  size (600, 450);
  leap = new LeapMotion(this).withGestures("key_tap");
  game = new GameEngine();
  bullets = new Bullet[numBullets];
  michelle = new Michelle(5);
  
  game.init();
}
 
void draw() {
  game.showCharacters();
  game.determineHit();
  game.evaluateScore();
}
 
 // TODO: move this out of the main client
void leapOnKeyTapGesture(KeyTapGesture g){
  int       id               = g.getId();
  Finger    finger           = g.getFinger();
  PVector   position         = g.getPosition();
  PVector   direction        = g.getDirection();
  long      duration         = g.getDuration();
  float     duration_seconds = g.getDurationInSeconds();
  
  bullets[bullet] = new Bullet (michelle.x, michelle.y);
  bullet++;
}


class Angela {
  PImage img;
  float x;
  float y;
  float xmoveRads = 1;
  float speed;
  int life;
  
  Angela (int x, int y, int life) {
    this.x = x;
    this.y = y;
    this.life = life;
    img = loadImage("angela.png");
  }
   
  void xmove() {
    speed = sin(radians(xmoveRads));
    x += speed;
    xmoveRads++;
  }
  
  void ymove() {
    y += 1;
  }
  
  void draw() {
    if (life !=0 ) {
      imageMode(CENTER);
      image(img, x, y);
    }
  }
}

class Bullet {
  int x;
  int y;
  int speed = 5;
  int life = 1;

  Bullet (int x, int y) {
    this.x = x;
    this.y = y;
  }
   
  void fly() {
    y -= speed;
  }
  
  void draw() {
    if (life != 0) {
      noStroke();
      fill (255, 0, 0);
      ellipseMode(CENTER);
      ellipse(x, y, 15, 20);
    }
  }
}

class GameEngine {

  int numAngelas = 50;
  Angela[] angelas = new Angela[numAngelas];
  int timer = 0;

  void init() {
    for (int i=0; i < numBullets; i++)
      bullets[i] = new Bullet (width/2, 0); 
  
    for (int i=0; i < numAngelas; i++) {
      angelas[i] = new Angela ((i% 10) * 50 + 25, i / 10 * 50 + 30, 1);
    }
  }
  
  void showCharacters() { 
    background (0);
    
    // show all of the Angelas
    for (int i=0; i < numAngelas; i++) {
      angelas[i].draw();
    }
    
    // animate the Angelas 
    for (int i=0; i < numAngelas; i++) {
      angelas[i].xmove();
      if ((timer % 100) < 15) { 
        angelas[i].ymove();
      }
    }
    timer++;
     
    // show Michelle wherever the Leap senses your hand to be
    michelle.draw();
      for (Hand hand : leap.getHands()) {
        //hand.draw();
        michelle.x = (int)hand.getPosition().x;
      }

    // animate the bullets flying
    for (int i=0; i < numBullets; i++) {
      bullets[i].fly();
      bullets[i].draw();
    }
  }  
  
  void evaluateScore() {    
    // if no life left in the angelas, you win.
    int sum = 0;
    for (int i = 0; i < numAngelas; i++) {
      sum += angelas[i].life;
    } 
    if (sum == 0) win(); 
    
    // if any of the Angelas stay alive long enough to reach Michelle, you lose.
    for (int i=0; i < numAngelas; i++) {
      if (angelas[i].life != 0 && angelas[i].y > height-10) game.gameover();
    }  
  
  }
  
  void determineHit() {
    // if bullet hits angela, angela and bullet are both destroyed
    for (int i = 0; i < numAngelas; i++) {
      for (int j = 0; j < numBullets; j++) {
        if (bullets[j].x > angelas[i].x - 25 && bullets[j].x < angelas[i].x + 25 
        &&  bullets[j].y > angelas[i].y - 20 && bullets[j].y < angelas[i].y + 20 
        &&  bullets[j].life != 0 && angelas[i].life != 0) {
          angelas[i].life -= 1;
          bullets[j].life -= 1;
        }
      }
    }
  }
  
  void gameover() {
    fill (255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text ("Angela has conquered your planet!", width/2, height/2);
  }
  
  void win() {
    fill (0, 0, 255);
    textSize(30);
    textAlign(CENTER);
    text ("Hooray! You destroyed Angela!", width/2, height/2+50);
  }
}


class Michelle {
  PImage img;
  int x = width / 2;
  int y = height - 30;
  int speed;
   
  Michelle (int speed) {
    this.speed = speed;
    img = loadImage("me_guitar.png");
  }
   
  void draw() {
    imageMode(CENTER);
    image(img, x, y);   
  }
}


