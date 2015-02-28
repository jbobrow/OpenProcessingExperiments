
Bird b = new Bird(0, 0, 5, 36);

class Bird {
  int birdX, birdY, birdspeed, birdsize;
  int left = 'a'; //bird controls
  int down = 's';
  int up = 'w';
  int right = 'd';
  Bird (int x, int y, int sp, int si) {
    birdX=x;
    birdY=y;
    birdspeed=sp;
    birdsize=si;
  }
  void update() {
    fill(0);
    image(birdanimation, birdX, birdY, (int)birdsize, (int)birdsize);
    //image(bird, birdX, birdY, birdsize, birdsize); //rectangle as bird
    if (akey == true) {
      birdX = birdX - birdspeed;
    }
    if (dkey==true) {
      birdX=birdX+birdspeed;
    }
    if (skey==true) {
      birdY=birdY+birdspeed;
    }
    if (wkey==true) {
      birdY=birdY-birdspeed;
    }
  }
}


