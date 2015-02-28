
int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
ArrayList enemies = new ArrayList();
ArrayList bullets = new ArrayList();
int direction = 1;
boolean incy = false;

void setup() {
    background(0);
    noStroke();
    fill(255);
    size(500, 400);
    player = new Player();
    createEnemies();
}

void draw() {
    background(0);

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
        if (frameCount%30 == 0) x += direction * gridsize;
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


