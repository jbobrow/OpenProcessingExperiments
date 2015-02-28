
ArrayList<Drop> waterdrop;
Structure grid = new Structure();
float time = 0;
int dropFreq = 100;

void setup() {
  size(400, 500);
  //size(window.innerWidth, window.innerHeight);
  smooth();
  
  waterdrop = new ArrayList<Drop>();
}

void draw() {
  background(255);

  pushStyle();
  textSize(12);
  fill(0, 102, 153, 204);
  int freq = 1000/dropFreq;
  text("Drop freq: "+freq+"Hz", width - 155, 20);
  freq = 1000/grid.timeOff;
  text("Flash frequency: "+(int)freq+"Hz", width - 155, 40);
  popStyle();

  long currentTime = millis();

  grid.draw();

  if (currentTime - time > dropFreq) {
    time = currentTime;

    waterdrop.add(new Drop(125));
    waterdrop.add(new Drop(175));
    waterdrop.add(new Drop(225));
    waterdrop.add(new Drop(275));
  }

  grid.update(currentTime);
  grid.draw();

  for (int i = 0; i < waterdrop.size(); i++) {
    waterdrop.get(i).update();
    waterdrop.get(i).draw();

    if (!waterdrop.get(i).alive)
      waterdrop.remove(i);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      grid.timeOff++;
    } 
    else if (keyCode == DOWN) {
      grid.timeOff--;
    }
  }
}

class Structure {

  int quadSize = 50;
  boolean flash = false;

  long lastTime = 0;
  int timeOff = 79;
  int timeOn = 1;

  Structure() {
  }

  void update(long currentTime) {
    if ((currentTime - lastTime > timeOff) && (flash == false)) {
      lastTime = currentTime;
      flash = true;
    }
    else if ((currentTime - lastTime > timeOn) && (flash == true)) {
      lastTime = currentTime;
      flash = false;
    }
  }

  void draw() {
    for (int i = 0; i < 28; i++) {
      pushMatrix();
      pushStyle();
      int z = i/4;

      translate(width/2 - (2*quadSize) + quadSize*(i%4), (height/2 - (3*quadSize)) + (quadSize*(i/4)));
      stroke(153);
      if (flash) {
        fill(102, 0, 102);
      }
      rect(0, 0, quadSize, quadSize);

      //ellipse(quadSize/2, quadSize/2, 10, 10);
      popStyle();
      popMatrix();
    }
  }
}

class Drop {
  PVector pos;
  PVector speed = new PVector(0, 20);
  boolean alive = true;

  Drop(int x) {
    pos = new PVector(x, 0);
  }

  void update() {
    pos.add(speed);

    if (pos.y > height) {
      alive = false;
    }
  }

  void draw() {
    pushMatrix();
    pushStyle();
    fill(255, 255, 255, 123);
    stroke(123, 123, 123);
    translate(pos.x, pos.y);
    ellipse(0, 0, 10, 10);
    popStyle();
    popMatrix();
  }
}
