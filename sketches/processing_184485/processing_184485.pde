
Hero myHero;

void setup() {

  size(displayWidth/2, displayHeight/2);
  myHero = new Hero(0, height*0.9);
  stroke(255);
}

void draw() {

  background(0);
  myHero.collision();
  myHero.update();
  myHero.display();

  line(0, height*0.9, width, height*0.9);
}

void keyPressed() {
  myHero.move();  
  myHero.jump();
}
void keyReleased() {
  myHero.moveReleased();
}
class Hero {
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float maxSpeed = 3;
  int stop = 0;
  float acc = 0.45;
  float gravity = 0.5;
  float oldGravity = gravity;
  int jumped = 0;
  float jump = -10;
  int wait = 2;
  Hero(float x, float y) {
    xpos = x;
    ypos = y;
  } 
  void collision() {
    if ( xpos > width || xpos < 0 ) {
      xspeed = -xspeed;
    }
    if ( ypos > height || ypos < 0 ) {
      yspeed = -yspeed;
    }
  }
  void update() {
    xpos += xspeed;

    if ( jumped == 1 ) {
      
        ypos += jump;
        ypos += gravity;
        gravity += 0.5;
        
      }
    

    if ( ypos >= height*0.9 ) {
      ypos = height*0.9;
      gravity = oldGravity;
      jumped = 0;
      
    }
  }

  void move() {
    if ( key == 'd' ) {
      if ( xspeed < maxSpeed ) {
        
        xspeed = maxSpeed;
      }
    }
    if ( key == 'a' ) {
      if ( xspeed > -maxSpeed ) {
        
        xspeed = -maxSpeed;
      }
    }
  }

  void moveReleased() {
    if ( key == 'd' ) {
      xspeed = 0;
    }
    if ( key == 'a' ) {
      xspeed = 0;
    }
  }
  void jump() {
    if ( key == ' ') {
      jumped = 1;
    }
  }

  void display() {
    println(ypos, gravity);
    fill(255);
    rect(xpos+5, ypos-40, 10, -10);
    rect(xpos, ypos, 20, -40);
  }
}
