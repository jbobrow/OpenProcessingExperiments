
Heart myHeart;

boolean hit = false;
float maxFondness = 0;
float maxTime = 0;

void setup() {
  size(800, 800);
  myHeart = new Heart(new PVector(100, 100), 1);
}

void draw() {
  background (#000000);
  if (myHeart.getFondness() > maxFondness) {
    maxFondness = myHeart.getFondness();
  }
  if (myHeart.getTime() > maxTime) {
    maxTime = myHeart.getTime();
  }
  text ("\n" + "Your best fondness is... " + round(maxFondness) + "!!", 2, 0);
  text ("\n" + "Your current fondness is..." + round(myHeart.getFondness()) + "!!", 2, 15);
  text ("\n" + "You survived love for... " + (myHeart.getTime()/1000) + "seconds !!", 2, 30);
  text ("\n" + "Your best survival time is... " + (maxTime/1000) + "!!", 2, 45);
  myHeart.display();
  if (absent(myHeart)) {
    hit = false;
    myHeart.growFonder(new PVector(mouseX, mouseY));
    if (round(myHeart.getFondness()) > round(myHeart.getFMax())) {
      myHeart.fMax = myHeart.getFondness();
    }
  }
  else {

    hit = true;
    myHeart.growColder(new PVector(mouseX, mouseY));
    text ("\n" + "Your best fondness is... " + round(myHeart.getFMax()) + "!!", 0, 0);
    text ("\n" + "You survived love for... " + (myHeart.getTime()/1000) + "seconds !!", 0, 25);
    myHeart.resetTimer();
  }
}

boolean absent(Heart toCheck) {
  if (!toCheck.containsPoint(new PVector(mouseX, mouseY))) {
    return true;
  }
  else {
    return false;
  }
}

class Heart {
  PVector center;
  float fondness;
  float fMax = 0;
  float time = 0;
  float loveInterestTime = 0;

  public Heart() {
    this.center = new PVector(0, 0);
    this.fondness = 1;
  }

  public Heart(PVector newCenter, int newFondness) {
    this.center = newCenter;
    this.fondness = newFondness;
  }

  PVector getCenter() {
    return this.center;
  }

  float getFMax() {
    return this.fMax;
  }

  float getTime() {
    return this.loveInterestTime;
  }

  float getFondness() {
    return this.fondness;
  }

  void runTimer() {
    this.loveInterestTime = millis() - this.time;
  }

  void resetTimer() {
    this.time = millis();
  }

  boolean containsPoint(PVector toCheck) {
    //Triangle
    //println("toCheck" + toCheck);
    //println("getCenter" + this.getCenter());
    //println("Hello World");
    float x = abs(this.getCenter().x - toCheck.x);
    float y = toCheck.y - this.getCenter().y;
    //print("y = " + y + "! x = " + x);
    if (x >= 0 && x <= 10*this.getFondness() && y >= 0 && y <= -1.5*x+15*this.getFondness()) {
      return true;
    }

    //Arc 1

    if (y<=0 && pow(x-5*getFondness(), 2)+y*y<=(5*this.getFondness())*(5*this.getFondness())) {
      return true;
    }


    return false;
  }



  void growFonder(PVector location) {
    this.fondness = this.fondness + .1;
    float diffX = .05 * (location.x - this.getCenter().x);
    float diffY = .05 * (location.y - this.getCenter().y);
    this.center.x += diffX;
    this.center.y += diffY;
    this.runTimer();
  }

  void growColder(PVector location) {
    this.fondness = this.fondness - .1;
    if (this.getFondness() >= 2) {
      this.fondness = 2;
    }
  }



  void display() {
    pushMatrix();
    translate(this.getCenter().x, this.getCenter().y);
    fill(#FF0099);
    noStroke();
    arc(0-(5*this.fondness), 0, 10*this.getFondness(), 10*this.getFondness(), PI, 2*PI, OPEN);
    arc(5*this.getFondness(), 0, 10*this.getFondness(), 10*this.getFondness(), PI, 2*PI, OPEN);
    triangle(0-(10*this.getFondness()), 0, 10*this.getFondness(), 0, 0, 15*this.getFondness());
    popMatrix();
  }
}

