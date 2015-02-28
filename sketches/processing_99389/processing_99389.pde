
Scoreboard score;
FallingObject[] objects;
SafetyBin bin;
int level = 0;
int numObjects;
boolean holding = false;

void setup() {
  size(1000,700);
  frameRate(30);
  score = new Scoreboard(new String[] {"Kendall", "Ben"});
  bin = new SafetyBin();
  newLevel();
}

void draw() {
  background(46,208,255);
  score.display();
  if(!score.getLost()) {
    bin.display();

    if(score.getObjectCount() != 0) {
      System.out.println(score.getObjectCount());
      for(int i = 0; i < objects.length; i++) {
        objects[i].display();
      }
    } else {
      newLevel();
    }
  }
}
void mouseDragged() {
  for(int i = 0; i < objects.length && !holding; i++) {
    if(objects[i].beingHeld()) {
      holding = true;
    }
  }
}

void mouseReleased() {
  holding = false;
  for(int i = 0; i < objects.length; i++) {
    objects[i].undrag();
  }
}

public void newLevel() {
  level++;
  objects = new FallingObject[level*3];
  score.setLevel(level);
  for(int i = 0; i < objects.length; i++) {
    objects[i] = new FallingObject("EASY", false, bin, score);
  }
}

