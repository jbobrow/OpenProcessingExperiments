
int star1x = 10;
int star1y = 10;
int star2x = 14;
int star2y = 92;
int star3x = 490;
int star3y = 55;
int star4x = 75;
int star4y = 490;
int star5x = 250;
int star5y = 400;
int star6x = 75;
int star6y = 75;
int star7x = 400;
int star7y = 290;
int star8x = 390;
int star8y = 100;
int star9x = 250;
int star9y = 400;
int star10x = 300;
int star10y = 30;
int star11x = 225;
int star11y = 225;
int star12x = 118;
int star12y = 69;
int star13x = 96;
int star13y = 196;
int star14x = 490;
int star14y = 490;
int star15x = 169;
int star15y = 369;




int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
ArrayList enemies = new ArrayList();
ArrayList bullets = new ArrayList();
int direction = 1;
boolean incy = false;

void setup() {
  
  size(500, 500);
  background(0);
  fill(0,255,0);
  
  player = new Player();
  createEnemies();
}

void draw() {
  background(0);
  
rect(star1x, star1y, 2, 2);
rect(star2x, star2y, 6, 6);
rect(star3x, star3y, 4, 4);
rect(star4x, star4y, 2, 2);
rect(star5x, star5y, 2, 2);
rect(star6x, star6y, 4, 4);
rect(star7x, star7y, 4, 4);
rect(star8x, star8y, 2, 2);
rect(star9x, star9y, 6, 6);
rect(star10x, star10y, 4, 4);
rect(star11x, star11y, 4, 4);
rect(star12x, star12y, 4, 4);
rect(star13x, star13y, 2, 2);
rect(star14x, star14y, 6, 6);
rect(star15x, star15y, 4, 4);
//these vary the speed of each stars descent 

star1y = star1y+1;
star2y = star2y+2;
star3y = star3y+1;
star4y = star4y+3;
star5y = star5y+1;
star6y = star6y+2;  
star7y = star7y+1;
star8y = star8y+3;
star9y = star9y+1;
star10y = star10y+2;
star11y = star11y+2;  
star12y = star12y+1;
star13y = star13y+3;
star14y = star14y+1;
star15y = star15y+2;
  
  if (star1y>height) {
  star1y=0;
}
if (star2y>height) {
  star2y=0;
}
if (star3y>height) {
  star3y=0;
}
if (star4y>height) {
  star4y=0;
}
if (star5y>height) {
  star5y=0;
}
if (star6y>height) {
  star6y=0;
}
if (star7y>height) {
  star7y=0;
}
if (star8y>height) {
  star8y=0;
}
if (star9y>height) {
  star9y=0;
}
if (star10y>height) {
  star10y=0;
}
if (star11y>height) {
  star11y=0;
}
if (star12y>height) {
  star12y=0;
}
if (star13y>height) {
  star13y=0;
}
if (star14y>height) {
  star14y=0;
}
if (star15y>height) {
  star15y=0;
}
  
  
  player.draw();

  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.draw();
  }

  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (enemy.outside() == true) {
      direction *= (-1);
      incy = true;
      break;
    }
  }

  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (!enemy.alive()) {
      enemies.remove(i);
    } 
    else {
      enemy.draw();
    }
  }

  incy = false;
}

void createEnemies() {
  for (int i = 0; i < width/gridsize/2; i++) {
    for (int j = 0; j <= 5; j++) {
      enemies.add(new Enemy(i*gridsize, j*gridsize));
    }
  }
}

class SpaceShip {
  int x, y;
  String sprite[];

  void draw() {
    updateObj();
    drawSprite(x, y);
  }

  void drawSprite(int xpos, int ypos) {
    for (int i = 0; i < sprite.length; i++) {
      String row = (String) sprite[i];

      for (int j = 0; j < row.length(); j++) {
        if (row.charAt(j) == '1')
          rect(xpos+(j * pixelsize), ypos+(i * pixelsize), pixelsize, pixelsize);
      }
    }
  }

  void updateObj() {
  }
}

class Player extends SpaceShip {
  boolean canShoot = true;
  int shootdelay = 0;
  Player() {
    x = width/gridsize/2;
    y = height - (10 * pixelsize);
    sprite    = new String[5];
    sprite[0] = "0010100";
    sprite[1] = "0110110";
    sprite[2] = "1111111";
    sprite[3] = "1111111";
    sprite[4] = "0111110";
  }

  void updateObj() {
    if (keyPressed && keyCode == LEFT) x -= 5;
    if (keyPressed && keyCode == RIGHT) x += 5;
    if (keyPressed && keyCode == CONTROL && canShoot) {
      bullets.add(new Bullet(x, y));
      canShoot = false;
      shootdelay = 0;
    }

    shootdelay++;
    if (shootdelay >= 20) {
      canShoot = true;
    }
  }
}

class Enemy extends SpaceShip {
  Enemy(int xpos, int ypos) {
    x = xpos;
    y = ypos;
    sprite    = new String[5];
    sprite[0] = "1011101";
    sprite[1] = "0101010";
    sprite[2] = "1111111";
    sprite[3] = "0101010";
    sprite[4] = "1000001";
  }

  void updateObj() {
    if (frameCount0 == 0) x += direction * gridsize;
    if (incy == true) y += gridsize / 2;
  }

  boolean alive() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      if (bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        bullets.remove(i);
        return false;
      }
    }

    return true;
  }

  boolean outside() {
    if (x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Bullet {
  int x, y;

  Bullet(int xpos, int ypos) {
    x = xpos + gridsize/2 - 4;
    y = ypos;
  }

  void draw() {
    rect(x, y, pixelsize, pixelsize);
    y -= pixelsize;
  }
}
