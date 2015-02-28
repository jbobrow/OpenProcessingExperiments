
interface JavaScript {
  void playSound(int num);
}

void bindJavascript(JavaScript js) {
  javascript = js;
}

JavaScript javascript;

ArrayList droplets;
Droplet drip;

boolean[] mouseOvers = {
  false, false, false, false, false, false, false, false, false, false, false, false,
};

int[] pitches = {
  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
};

int pitchCount = 0;

void setup() {
  size(1000, 500);
  droplets = new ArrayList();
}

void draw() {
  background(0);
  for (int i = 0; i < droplets.size(); i++) {
    Droplet d = (Droplet) droplets.get(i);
    //println("This droplet object is at index number: " + i);
    d.collision();
    d.display();
    d.grow();
    mouseOvers[i] = d.mouseOver(mouseX, mouseY);
  }
}

void mousePressed() {
  if (pitchCount > pitches.length - 1) {
    pitchCount = 0;
  }
  for (int i = 0; i < mouseOvers.length; i++) {
    if (mouseOvers[i] == true) {
      break;
    }
    if (i == mouseOvers.length - 1) {
      droplets.add(new Droplet(mouseX, mouseY, 15, 600, .5, 0, 255, 0, pitches[pitchCount]));
      if (droplets.size() > 12) {
        droplets.remove(0);
      }
    }
  }
  pitchCount++;
}

class Droplet {
  float xPos, yPos;
  float startSize, endSize, speed;
  float red, green, blue;
  boolean collision = false;
  boolean over = false;
  int chimeNum;
  boolean playOnce = true;



  Droplet(float _xPos, float _yPos, float _startSize, float _endSize, float _speed, float _red, float _green, float _blue, int _chimeNum) {
    xPos = _xPos; //x position on the screen
    yPos = _yPos; //y position on the screen
    startSize = _startSize; //initial size of the circle
    endSize = _endSize; //final size of the circle (as fade out)
    speed = _speed; //speed (vector) of the expansion/growth
    red = _red; //RED color value
    green = _green; //BLUE color value
    blue = _blue; //GREEN color value
    chimeNum = _chimeNum;
  }

  void display() {
    noFill();
    strokeWeight(2);
    //    stroke(red, green, blue, 255 - (255 * startSize/endSize));
    if (speed < 0) {
      stroke(green, red, blue, 255);
    }
    else {
      stroke(red, green, blue, 255);
    }
    ellipse(xPos, yPos, startSize, startSize);
  }

  void grow() {
    startSize = startSize + speed;
    if (startSize < 15) {
      speed = speed * -1;
      playOnce = true;
    }
  }

  public float getXpos() {
    return xPos;
  }

  public float getYpos() {
    return yPos;
  }

  public float getStartSize() {
    return startSize;
  }

  void reverser() {
    speed = speed * -1;
  }

  public float getSpeed() {
    return speed;
  }

  public boolean mouseOver(int x, int y) {
    float distance = dist(x, y, getXpos(), getYpos());
    if (distance < (this.getStartSize())/2) {
      over = true;
    }
    else {
      over = false;
    }
    return over;
  }


  void sonify() {
    if (playOnce == true) {
      playSound(chimeNum);
      println(chimeNum);
    }
    playOnce = false;
  }

  void collision() {
    for (int i = 0; i < droplets.size(); i++) {
      Droplet d = (Droplet) droplets.get(i);
      if (droplets.get(i) != this) {
        float distance = dist(this.getXpos(), this.getYpos(), d.getXpos(), d.getYpos());
        float sumOfGrowth = (d.getStartSize() + this.getStartSize())/2;
        if (sumOfGrowth > distance) {
          if (this.getStartSize() > d.getStartSize()) { //only sonify the larger of the two colliding circles
            this.sonify();
          }
          reverser(); //reverse this circle's growth . . .
        }
      }
    }
  }
}



