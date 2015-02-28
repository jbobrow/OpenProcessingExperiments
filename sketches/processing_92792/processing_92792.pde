
Char player;
PImage imgChar;
PImage imgLevel;


void setup() {
  size (500,1000);
  imgChar = loadImage("Char.png");
  imgLevel = loadImage("Level.png");
  player = new Char(20,995,0,0,.3,.3);

}


void draw() {
  imageMode(CORNER);
  image(imgLevel,0,0,width,height);
  player.move();
  player.draw();
  player.keyPressed();
  player.keyReleased(); 
}
 
 
 
class Char {
  float x;
  float y;
  float hspeed;
  float vspeed;
  float gravity;
  float djump;
    
  Char (float X, float Y, float Hspeed, float Vspeed, float Gravity, float Djump) {
    x=X;
    y=Y;
    hspeed=Hspeed;
    vspeed=Vspeed;
    gravity=Gravity;
    djump=Djump;
  }
  void draw() {
    imageMode(CENTER);
    image(imgChar,x,y,100,100);
  }
  void move() {
    if (y > height - 20) {
      vspeed = 0;
      djump = 0;
      y = height - 20;
      gravity = 0;
    }
    if (x > width - 20) {
      hspeed = 0;
      x = width - 20;
    }
    if (x < 10) {
      hspeed = 0;
      x = 10;
    }
    vspeed += gravity;
    x += hspeed;
    y += vspeed;
    
   djump += gravity;
   x += hspeed;
   y += djump;
  }
  void keyPressed() {
    if (keyPressed == true) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          hspeed = -3;
        }
        if (keyCode == RIGHT) {
          hspeed = 3;
        }
        if (y == height - 20) {
          if  (keyCode == UP) {
            vspeed = -8;
            gravity = .3;
          }
        }
          if (y == height - 20) {
          if  (keyCode == CONTROL ) {
            djump = -12;
            gravity = .3;
          }
        }
      }
    }
  }
  void keyReleased() {
    if (keyPressed == false) {
      if (key == CODED) {
        if (keyCode == LEFT || keyCode == RIGHT) {
          hspeed = 0;
        }
      }
    }
  }
}



