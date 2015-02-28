
class Sounddot {
  PFont font = loadFont("HelveticaNeue-CondensedBold-24.vlw");
  float posx = 0;
  float posy = 0;
  float diam = 100;
  color fg_clr = color(51, 153, 255, 255);
  color hl_clr = color(255, 153, 0, 255);
  boolean is_touched = false;
  boolean is_locked = true;
  int soundid = 0;
  int mode = 0; // 0 = circle, 1 = square

  public Sounddot(float x, float y, float d, int m) {
    this.posx = x;
    this.posy = y;
    this.diam = d;
    this.mode = m;
  }

  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    if (is_locked) {
      noStroke();
    }
    else {
      stroke(255);
      strokeWeight(2);
      noFill();
      if (mode == 1) {
        rect(posx, posy, diam+11, diam+11);
      }
      else { 
        ellipse(posx, posy, diam+11, diam+11);
      }
    }
    if (is_touched) {
      stroke(hl_clr);
      strokeWeight(4);
      is_touched = false;
    }
    else {
      noStroke();
    }

    fill(fg_clr);
    if (mode == 1) {
      rect(posx, posy, diam, diam);
    }
    else {
      ellipse(posx, posy, diam, diam);
    }
    if (!is_locked) {
      textFont(font);
      textAlign(CENTER, CENTER);
      fill(0);
      text(nf(soundid, 2, 0), posx, posy-3);
    }
  }

  // move the obstacle if unlocked
  void update() {
    if (!is_locked) {
      float xp = mouseX;
      float yp = mouseY;      
      posx = xp;
      posy = yp;
    }
  }

  // lock or unlock the obstacle if clicked
  void click(float x, float y) {
    if (over(x, y)) {
      is_locked = !is_locked;
    }
    else {
      is_locked = true;
    }
  }

  // set foreground color
  void setFgColor(color clr) {
    this.fg_clr = clr;
  }

  // set a sound ID
  void setSoundId(int id) {
    this.soundid = id;
  }

  // get sound ID
  public int getSoundId() {
    return soundid;
  }

  // get mode rect or circle
  public int getMode() {
    return mode;
  }

  // mouse over ?
  private boolean over(float x, float y) {
    if ((x > (posx-(diam/2))) && (x < (posx+(diam/2))) && (y > (posy-(diam/2))) && (y < (posy+(diam/2)))) {
      return true;
    }
    else {
      return false;
    }
  }
}


