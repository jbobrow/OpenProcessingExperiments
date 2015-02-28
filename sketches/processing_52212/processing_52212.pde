
import javax.swing.*;

color r = color(255, 0, 0);
color g = color(0, 255, 0);
color b = color(0, 0, 255);
color w = color(255, 255, 255);
ArrayList<Drawable> drawableList;

int redScore = 0;
int bluScore = 0;
PFont font;

boolean paused = false;

void setup() {
  size(600,600);
  frameRate(60);
  smooth();
  noCursor();
  drawableList = new ArrayList<Drawable>();

  boolean incorrectInput = false;
  int numOfP = 0;
  do {
    String desNum = JOptionPane.showInputDialog(null, "How many players per team?\nMultiples of 5 up to 25 are recommended.\n0 will quit out.");
    incorrectInput = false;
    try {
      numOfP = Integer.parseInt(desNum);
    }
    catch(Exception e) {
      incorrectInput = true;
    }
  }
  while (incorrectInput);


  font = createFont("tf2build.ttf",20,true);
  textFont(font);
  
  if(numOfP == 0) {
    exit();
  }

  for (int i = 0; i < numOfP; i++) {
    if (i % 5 == 0) {
      Medic m = new Medic((int)random(0, width), (int)random(0, height), r);
      drawableList.add(m);
    }
    else {
      Player t = new Player((int)random(0, width), (int)random(0, height), r);
      drawableList.add(t);
    }
  }
  for (int i = 0; i < numOfP; i++) {
    if (i % 5 == 0) {
      Medic m = new Medic((int)random(0, width), (int)random(0, height), b);
      drawableList.add(m);
    }
    else {
      Player t = new Player((int)random(0, width), (int)random(0, height), b);
      drawableList.add(t);
    }
  }
  /*
  
   Player d1 = new Player(width/2 + 80,height/2 + 80,r);
   drawableList.add(d1);
   Player d2 = new Player(width/2 - 80,height/2 + 80,r);
   drawableList.add(d2);
   Player d3 = new Player(width/2 + 80,height/2 - 80,b);
   drawableList.add(d3);
   Player d4 = new Player(width/2 - 80,height/2 - 80,b);
   drawableList.add(d4);
   */
}

void draw() {
  if (!paused) {
    background(50);
    noStroke();
    fill(255, 20);
    ellipse(width/2, height/2, 10, 10);
    handle();
    for (int i = 0; i < drawableList.size(); i++) {
      Drawable temp= drawableList.get(i);
      temp.move();
      temp.draw();
    }
    textSize(width/30);
    fill(255);
    textAlign(LEFT);
    text("Blu: " + bluScore, 0, height-5);
    textAlign(RIGHT);
    text("Red: " + redScore, width, height-5);
  }
  else {
    textAlign(CENTER, CENTER);
    fill(255, 2);
    text("PAUSED", width/2, height/2);
  }
  textSize(width/30);
  textAlign(LEFT,TOP);
  text("Quit: Escape\nPause: P",0,5);
}

void handle() {
  for (int b = 0; b < drawableList.size(); b++) {
    if (drawableList.get(b) instanceof Bullet) {
      Bullet tempB = (Bullet)drawableList.get(b);
      if ((tempB.getLocation().x < 0 || tempB.getLocation().x > width || tempB.getLocation().y < 0 || tempB.getLocation().y > height) && drawableList.get(b) instanceof Bullet) {
        drawableList.remove(b);
        b--;
      }
      for (int p = 0; p < drawableList.size(); p++) {
        if (drawableList.get(p) instanceof Player && tempB.getColor() != drawableList.get(p).getColor()) {
          Player tempP = (Player)drawableList.get(p);
          float dX = tempB.getLocation().x - tempP.getLocation().x;
          float dY = tempB.getLocation().y - tempP.getLocation().y;
          float sizes = tempB.getSize() + tempP.getSize();
          if (dX <= sizes && dY <= sizes) {
            float dTotal = sqrt(dX*dX + dY*dY);
            if (dTotal <= sizes) {
              tempP.addHealth(-1*tempB.getDamage());
              if (tempP.getHealth() <= 0) {
                tempP.respawn();
                if (tempP.getColor() == color(255, 0, 0)) {
                  bluScore++;
                }
                if (tempP.getColor() == color(0, 0, 255)) {
                  redScore++;
                }
              }
              if (drawableList.get(b) instanceof Bullet) {
                drawableList.remove(b);
                b--;
              }
            }
          }
        }
      }
    }
  }
}

void keyReleased() {
  if (keyCode == 'p' || keyCode == 'P') {
    paused = !paused;
  }
}


