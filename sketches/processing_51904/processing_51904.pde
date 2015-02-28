

PFont font;
PImage img;
float targetX;
float targetY;
float distX;
float distY;
Boolean hasMouse = false;
Boolean lastHasMouse = false;

Letter h = new Letter(width/2-50, 100, 100, 100, "h", random(0.02, 0.07));
Letter u = new Letter(width/2, 100, 100, 150, "u", random(0.02, 0.07));
Letter g = new Letter(width/2+50, 100, 200, 200, "g", random(0.02, 0.07));

void setup() {
  img = loadImage("hugOwar.jpg");
  font = loadFont("BrosseDemonstrator-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  size(500, 505);
  smooth();
}


void draw() {

  background(img);
  fill(255, 175);
  rect(0, 0, img.width, img.height);
  
  if (0 < mouseX && mouseX < width && 0 < mouseY && mouseY < height) {
    hasMouse = true;
    if (dist(h.xPos, h.yPos, mouseX, mouseY) > 25) {
      h.setTargetToMouse();
    }
    if (dist(u.xPos, u.yPos, mouseX, mouseY) > 25) {
      u.setTargetToMouse();
    }
    if (dist(g.xPos, g.yPos, mouseX, mouseY) > 25) {
      g.setTargetToMouse();
    }
  }
  else {
    hasMouse = false;
    if (lastHasMouse == true) {
      float newX = random(10, width);
      float newY = random(10, height);
      h.setTarget(newX, newY);
      u.setTarget(newX, newY);
      g.setTarget(newX, newY);
    }    
  }

  h.update();
  u.update();
  g.update();
  
  lastHasMouse = hasMouse;
}


class Letter {
  float xPos, yPos;
  float targetX, targetY;
  String s;
  float easing;
  Letter(float x, float y, float tX, float tY, String stg, float e) {
    xPos = x;
    yPos = y;
    targetX = tX;
    targetY = tY;
    s = stg;
    easing = e;
  }
  
  void newTarget() {
    println("New target!");
    targetX = xPos + random(-25, 25);
    targetY = yPos + random(-25, 25);
  }
  
  void setTargetToMouse() {
    targetX = mouseX;
    targetY = mouseY;
  }
  
  void setTarget(float newX, float newY) {
    targetX = newX;
    targetY = newY;
  }
  
  void update() {
    fill(0);
    if (dist(xPos, yPos, targetX, targetY) > 25) {
      println("Easing!");
      float distX = targetX - xPos;
      xPos += distX * easing;
      float distY = targetY - yPos;
      yPos += distY * easing;
    } else {
      newTarget();
    }
    text(s, xPos, yPos);
  }
}


