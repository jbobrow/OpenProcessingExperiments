
//************************
// SETUP Class Bullet
//************************

class bullet{
  boolean bulletActive;             // holds whether the bullet is active
  float bulletXpos;                 // holds bullet's current X position
  float bulletYpos;                 // holds bullet's current Y position
  float bulletXspeed;               // holds bullet's X speed
  float bulletYspeed;               // holds bullet's Y speed
  float bulletXsize;
  float bulletYsize;

bullet(float tempXbullet, float tempYbullet) {
  bulletActive = true;
  bulletXpos = tempXbullet;
  bulletYpos = tempYbullet;
  bulletXspeed = 0;
  bulletYspeed = 7;
  bulletXsize = 4;
  bulletYsize = 8;  
}

void moveBullet() {
  if (bulletYpos > -10 && bulletActive) {
    bulletYpos = bulletYpos - 16;
  } else {
    bulletActive = false;
  }
  }

void displayBullet() {
//  if (bulletActive) {
    color(0);
    fill(0);
    noStroke();
    triangle(bulletXpos, bulletYpos, bulletXpos+bulletXsize, bulletYpos, bulletXpos+(bulletXsize/2), bulletYpos - bulletYsize);
//  }
}

void bulletDisappear(boolean disappearStatus) {
  if (disappearStatus) {
    bulletActive = false;
    bulletXpos = width*2;
    bulletYpos = height*2;
  } else {
    bulletActive = true;
  }
}


boolean bulletStatus() {
  return bulletActive;
}

int getBulletXpos () {
  return int(bulletXpos);
}

int getBulletYpos () {
  return int(bulletYpos);
}

int getBulletXposLong () {
  return int(bulletXsize);
}

int getBulletYposLong () {
  return int(bulletYsize);
}

}





