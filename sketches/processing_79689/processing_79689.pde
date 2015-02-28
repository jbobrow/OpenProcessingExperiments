
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
  fill(0, 255, 0);

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

  if (star1y>500) {
    star1y=0;
  }
  if (star2y>500) {
    star2y=0;
  }
  if (star3y>500) {
    star3y=0;
  }
  if (star4y>500) {
    star4y=0;
  }
  if (star5y>500) {
    star5y=0;
  }
  if (star6y>500) {
    star6y=0;
  }
  if (star7y>500) {
    star7y=0;
  }
  if (star8y>500) {
    star8y=0;
  }
  if (star9y>500) {
    star9y=0;
  }
  if (star10y>500) {
    star10y=0;
  }
  if (star11y>500) {
    star11y=0;
  }
  if (star12y>500) {
    star12y=0;
  }
  if (star13y>500) {
    star13y=0;
  }
  if (star14y>500) {
    star14y=0;
  }
  if (star15y>500) {
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
  for (int i = 0; i < 500/gridsize/2; i++) {
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
    x = 500/gridsize/2;
    y = 500 - (10 * pixelsize);
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
    if (shootdelay >= 15) {
      canShoot = true;
    }
  }
}

class Enemy extends SpaceShip {

  Enemy(int xpos, int ypos) {
   
    x = xpos;
    y = ypos;
    sprite    = new String[5];
    sprite[0] = "0011100";
    sprite[1] = "1101011";
    sprite[2] = "0110110";
    sprite[3] = "1001001";
    sprite[4] = "0100010";

    if (y <= 100) {
      sprite[0] = "1011101";
      sprite[1] = "0101010";
      sprite[2] = "1110111";
      sprite[3] = "0101010";
      sprite[4] = "1000001";
    }
     if (y <= 50) {
      
      sprite[0] = "1110111";
      sprite[1] = "0100010";
      sprite[2] = "1110111";
      sprite[3] = "0101010";
      sprite[4] = "0011100";
    }   

    /* sprite  = new String[5];
     sprite[0] = "101001100101001000011000110111";
     sprite[1] = "101010010101001000100101000100";
     sprite[2] = "010010010101001000100100100110";
     sprite[3] = "010010010101001000100100010100";
     sprite[4] = "010001100111001110011001100111";
     
     
     */
  }

  void updateObj() {
    if (frameCount%8 == 0) x += direction * gridsize;
    if (incy == true) y += gridsize / 2;
    /*if (y >=500)  sprite  = new String[5];
     sprite[0] = "101001100101001000011000110111";
     sprite[1] = "101010010101001000100101000100";
     sprite[2] = "010010010101001000100100100110";
     sprite[3] = "010010010101001000100100010100";
     sprite[4] = "010001100111001110011001100111";*/
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
    if (x + (direction*gridsize) < 0 || x + (direction*gridsize) > 500 - gridsize) {
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
