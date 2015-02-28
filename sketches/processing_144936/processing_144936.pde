
// ******************* OBSTICALGAP CLASS ***********************

class obsticalgap {
  PVector hitLoc = new PVector(0, 0);
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;

  obsticalgap() {
    this.img = drop;
  }
  obsticalgap(float x, float y) {
    this.img = drop;
    this.pos.x=x;
    this.pos.y=y;
  }
  obsticalgap(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y);
    line(this.pos.x + 10, this.pos.y, this.pos.x + 10, this.pos.y -50);
    line(this.pos.x + 45, this.pos.y, this.pos.x + 45, this.pos.y -50);
    if (this.hit) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (player.pos.x + offset > this.pos.x + 10
      && player.pos.x -offset < this.pos.x + 45
      && player.pos.y -offset < this.pos.y
      && player.pos.y +offset > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
        // boxSnd.load();
        //  boxSnd.play();
        //player.boxCount++;
      }
      this.hit = true;
    }
    //move boxes
    if (this.hit) {
      this.pos.x = 1024 + random(2048);
      if ((this.pos.x < nothere + 200) && (this.pos.x > nothere - 150)) {
        this.pos.x += 512;
      }
      this.hit = false;
      gameover = true;
      if (player.boxCount > highscore) {
        highscore = player.boxCount;
      }
      player.boxCount = 0;
      speed = 0.7;
    }
    if (this.pos.x > -128) {
      this.pos.x-=12*speed;//move at same rate as scroll
      nothere = int(this.pos.x);
    }
    if (this.pos.x<-128) {
      this.pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
      if ((this.pos.x < nothere + 200) && (this.pos.x > nothere - 150)) {
        this.pos.x += 512;
      }
      this.pos.y=370;
      this.hit=false;
    }
  }
}

