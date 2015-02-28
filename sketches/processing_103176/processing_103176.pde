

PFont font;
MainScreen ms;

void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  font = loadFont("KaiTi-48.vlw");
  textFont(font, 14);
  ms = new MainScreen();
}

void draw() {
  background(255);
  ms.display();
}

void keyPressed() {
  ms.kPressed();
}
void keyReleased() {
  ms.kReleased();
}

void mousePressed() {
  ms.mPressed();
}
void mouseReleased() {
  ms.mReleased();
}


class Ball {
  float arrowPower = .15;
  PVector accel = new PVector();
  PVector vel = new PVector();
  PVector pos = new PVector();
  PVector grav = new PVector(0, .06);
  float frictionScalar = -.02;
  PVector friction = new PVector();
  float r = 15;
  PVector rightForce = new PVector(arrowPower, 0);
  PVector leftForce = new PVector(-arrowPower, 0);
  PVector upForce = new PVector(0, -arrowPower);
  PVector downForce = new PVector(0, arrowPower);
  boolean useRight;
  boolean useLeft;
  boolean useUp;
  boolean useDown;
  boolean isMoving;
  boolean isPlaying;
  boolean gridSnap;
  int lives = 10;

  float a = 0;
  float b = 0;
  float c = 0;
  int colorTimer = 50;

  boolean downGrav = false;
  boolean upGrav = false;
  boolean leftGrav = false;
  boolean rightGrav = false;
  boolean spinningGrav = false;
  float t = 0;

  Customize custom;
  Flame flm;
  boolean useFlames;
  boolean usePizza;
  boolean useEye;
  boolean useHoly;

  Ball(float x, float y) {
    pos.x = x;
    pos.y = y;
    custom = new Customize();
    flm = new Flame(r);
  } 

  void display() {
    if (frictionScalar < -.02) {
      frictionScalar += .01;
    } 
    if (frictionScalar > -.02) {
      frictionScalar = -.02;
    }
    friction = PVector.mult(vel, frictionScalar);
    applyForce(friction);
    if (useRight) {
      applyForce(rightForce);
    }
    if (useLeft) {
      applyForce(leftForce);
    }
    if (useUp) {
      applyForce(upForce);
    }
    if (useDown) {
      applyForce(downForce);
    }
    if (spinningGrav) {
      if (isPlaying) {
        t += .01;
      }
      grav.x = cos(t);
      grav.y = sin(t);
      if (t > 1000) {
        t = 0;
      }
      grav.normalize();
      grav.mult(.06);
    }
    applyForce(grav);
    displayGrav();
    if (isPlaying) {
      vel.add(accel);
      vel.limit(10);
      pos.add(vel);
    }
    else if (gridSnap) {
      snapToGrid();
    }
    accel.mult(0);

    if (useFlames) {
      flm.display(pos.x, pos.y, vel);
    }
    else if (usePizza) {
      if (isPlaying) {
        custom.displayPizza(pos.x, pos.y, r, useRight, useLeft);
      }
      else {
        custom.displayPizza(pos.x, pos.y, r, false, false);
      }
    }
    else if (useEye) {
      custom.displayEye(pos.x, pos.y, r);
    }
    else if (useHoly) {
      custom.displayHoly(pos.x, pos.y, r);
    }
    else {
      fill(colorChange());
      stroke(colorChange());
      ellipse(pos.x, pos.y, 2*r, 2*r);
    }

    checkEdges();
    if (isMoving) {
      pos.x = mouseX;
      pos.y = mouseY;
      vel.mult(0);
    }
  }

  void applyForce(PVector force) {
    accel.add(force);
  }

  void startKeyForce() {
    if (keyCode == RIGHT) {
      useRight = true;
    }
    if (keyCode == LEFT) {
      useLeft = true;
    }
    if (keyCode == UP) {
      useUp = true;
    }
    if (keyCode == DOWN) {
      useDown = true;
    }
  }

  void stopKeyForce() {
    if (keyCode == RIGHT) {
      useRight = false;
    }
    if (keyCode == LEFT) {
      useLeft = false;
    }
    if (keyCode == UP) {
      useUp = false;
    }
    if (keyCode == DOWN) {
      useDown = false;
    }
  }

  void checkEdges() {
    if (pos.x-r < 0) {
      pos.x = r;
      vel.x *= -1;
    }
    if (pos.x+r > width) {
      pos.x = width-r;
      vel.x *= -1;
    }
    if (pos.y-r < 0) {
      pos.y = r;
      vel.y *= -1;
    }
    if (pos.y+r > height) {
      pos.y = height-r;
      vel.y *= -1;
    }
  }

  void startMouseControl() {
    if (dist(mouseX, mouseY, pos.x, pos.y) < r && isPlaying == false) {
      isMoving = true;
    }
  }
  void stopMouseControl() {
    if (isMoving) {
      isMoving = false;
    }
  }

  void snapToGrid() {
    if (isMoving == false) {
      if (pos.x % 20 < 10) {
        pos.x -= constrain(pos.x % 20, 0, 10);
      }
      if (pos.x % 20 >= 10) {
        pos.x += constrain(pos.x % 20, 0, 10);
      }
      if (pos.y % 20 < 10) {
        pos.y -= constrain(pos.y % 20, 0, 10);
      }
      if (pos.y % 20 >= 10) {
        pos.y += constrain(pos.y % 20, 0, 10);
      }
    }
  }

  void setVars(float xPos, float yPos, int life, String gravity) {
    pos.x = xPos;
    pos.y = yPos;
    lives = life;
    setGrav(gravity);
  }

  color colorChange() {
    if (colorTimer < 5000) {
      colorTimer++;
    }
    float c1 = map(colorTimer, 0, 50, a, 0);
    float c2 = map(colorTimer, 0, 50, b, 0);
    float c3 = map(colorTimer, 0, 50, c, 0);
    return color(c1, c2, c3);
  }

  void setGrav(String gravity) {
    if (gravity.equals("down")) {
      downGrav = true;
      upGrav = false;
      leftGrav = false;
      rightGrav = false;
      spinningGrav = false;
      grav.x = 0;
      grav.y = 1;
    }
    if (gravity.equals("up")) {
      upGrav = true;
      downGrav = false;
      leftGrav = false;
      rightGrav = false;
      spinningGrav = false;
      grav.x = 0;
      grav.y = -1;
    }
    if (gravity.equals("left")) {
      leftGrav = true;
      downGrav = false;
      upGrav = false;
      rightGrav = false;
      spinningGrav = false;
      grav.x = -1;
      grav.y = 0;
    }
    if (gravity.equals("right")) {
      rightGrav = true;
      downGrav = false;
      upGrav = false;
      leftGrav = false;
      spinningGrav = false;
      grav.x = 1;
      grav.y = 0;
    }
    if (gravity.equals("spinning")) {
      spinningGrav = true;
      downGrav = false;
      upGrav = false;
      leftGrav = false;
      rightGrav = false;
    }
    grav.normalize();
    grav.mult(.06);
  }

  void displayGrav() {
    strokeWeight(3);
    if (lives != 1234) {
      stroke(100, 150);
    }
    else {
      stroke(255);
    }
    noFill();
    ellipse(30, height-30, 50, 50);
    pushMatrix();
    translate(30, height-30);
    PVector gravArrow = new PVector(grav.x, grav.y);
    gravArrow.normalize();
    gravArrow.mult(25);
    line(-gravArrow.x, -gravArrow.y, gravArrow.x, gravArrow.y);
    translate(gravArrow.x, gravArrow.y);
    gravArrow.div(2.5);
    rotate(3*PI/4);
    line(0, 0, gravArrow.x, gravArrow.y);
    rotate(PI/2);
    line(0, 0, gravArrow.x, gravArrow.y);
    popMatrix();
    strokeWeight(1);
  }
}


class BlackBlock {

  Ball b;
  float x;
  float y;
  float w;
  float h;

  float bounceStrength = 1;
  boolean hitEdge;
  boolean hitCorner;

  boolean isMoving;
  float diffX = 0;
  float diffY = 0;
  float endX;
  float endY;
  boolean happenedOnceX = false;
  boolean happenedOnceY = false;

  boolean isChangingWidth = false;
  boolean isChangingHeight = false;
  float endWidth;
  float endHeight;
  boolean happenedOnceW = false;
  boolean happenedOnceH = false;

  boolean hMovement = false;
  boolean vMovement = false;
  float speed;
  float currentSpeed = 2;
  int speedTimer = 0;

  float minX;
  float maxX;
  float minY;
  float maxY;
  boolean changingMinX = false;
  boolean changingMaxX = false;
  boolean changingMinY = false;
  boolean changingMaxY = false;

  boolean isPlaying;
  boolean inEditor;
  boolean gridSnap;

  color c = color(0);

  var bounceSound;
  int soundTimer = 0;
  boolean muted;
  boolean hitHorizontal;
  boolean hitVertical;

  BlackBlock(Ball b, float x_, float y_, float w_, float h_) {
    this.b = b;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    minX = x - 20;
    maxX = x + w + 20;
    minY = y - 20;
    maxY = y + h + 20;
    bounceSound = new Audio("bounceSound.wav");
  }
  BlackBlock(Ball b, float x_, float y_, float w_, float h_, boolean hMove, boolean vMove, float minX, float maxX, float minY, float maxY) {
    this.b = b;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    hMovement = hMove;
    vMovement = vMove;
    this.minX = minX;
    this.maxX = maxX;
    this.minY = minY;
    this.maxY = maxY;
    endX = x;
    endY = y;
    endWidth = w;
    endHeight = h;
    bounceSound = new Audio("bounceSound.wav");
  }

  void display() {

    if (isMoving) {
      x = setX();
      y = setY();
    }
    else {
      if (isPlaying) {
        speed = currentSpeed;
      }
      else {
        speed = 0;
      }
      if (speedTimer < 5000) {
        speedTimer++;
      }
      if (x < minX || x+w > maxX || y < minY || y+h > maxY) {
        speed *= -1;
        if (speedTimer > 7) {
          currentSpeed = speed;
          speedTimer = 0;
        }
      }
      moveHorizontal();
      moveVertical();
    }
    w = setWidth();
    h = setHeight();
    if (gridSnap) {
      snapToGrid();
    }
    changeMovementBounds();
    checkMinMax();
    fill(c);
    stroke(c);
    rect(x, y, w, h);
    if (isPlaying == false && inEditor) {
      drawWHRects();
      drawArrows();
    }

    soundTimer++;
    hitEdge = checkEdgeCollision();
    hitCorner = checkCornerCollision();
  }

  boolean checkEdgeCollision() {
    boolean collision = false;
    //  bottom of ball hits top of block
    if (b.pos.y+b.r > y && b.pos.y+b.r < y+h && b.pos.x > x && b.pos.x < x+w) {
      b.pos.y = y - b.r;
      b.vel.y *= -bounceStrength;
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
      hitHorizontal = true;
      hitVertical = false;
    }
    //  top of ball hits bottom of block
    if (b.pos.y-b.r > y && b.pos.y-b.r < y+h && b.pos.x > x && b.pos.x < x+w) {
      b.pos.y = y + h + b.r;
      b.vel.y *= -bounceStrength;
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
      hitHorizontal = true;
      hitVertical = false;
    }
    //  right side of ball hits left side of block
    if (b.pos.y > y && b.pos.y < y+h && b.pos.x+b.r > x && b.pos.x+b.r < x+w) {
      b.pos.x = x - b.r;
      b.vel.x *= -bounceStrength;
      if (hMovement) {
        b.vel.x += speed;
      }
      collision = true;
      hitHorizontal = false;
      hitVertical = true;
    }
    //  left side of ball hits right side of block
    if (b.pos.y > y && b.pos.y < y+h && b.pos.x-b.r > x && b.pos.x-b.r < x+w) {
      b.pos.x = x + w + b.r;
      b.vel.x *= -bounceStrength;
      if (hMovement) {
        b.vel.x += speed;
      }
      collision = true;
      hitHorizontal = false;
      hitVertical = true;
    }
    if (collision && b.vel.mag() > 1.5 && hitHorizontal && abs(b.vel.y) > 1 && muted == false) {
      if (soundTimer > 2) {
        bounceSound.play();
      }
      soundTimer = 0;
    }
    if (collision && b.vel.mag() > 1.5 && hitVertical && abs(b.vel.x) > 1 && muted == false) {
      if (soundTimer > 2) {
        bounceSound.play();
      }
      soundTimer = 0;
    }
    return collision;
  }

  boolean checkCornerCollision() {
    boolean collision = false;
    float temp;
    if (abs(b.vel.x) > abs(b.vel.y)) {
      temp = abs(b.vel.x);
    }
    else {
      temp = abs(b.vel.y);
    }
    //  upper left corner
    if (dist(b.pos.x, b.pos.y, x, y) < b.r && (b.vel.y > 1 || b.vel.x > 1)) {
      b.vel.x = b.pos.x - x;
      b.vel.y = b.pos.y - y;
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    //  upper right corner
    if (dist(b.pos.x, b.pos.y, x + w, y) < b.r && (b.vel.y > 1 || b.vel.x < -1)) {
      b.vel.x = b.pos.x - (x+w);
      b.vel.y = b.pos.y - y;
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    //  lower right corner
    if (dist(b.pos.x, b.pos.y, x + w, y + h) < b.r && (b.vel.y < -1 || b.vel.x < -1)) {
      b.vel.x = b.pos.x - (x+w);
      b.vel.y = b.pos.y - (y+h);
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    //  lower left corner
    if (dist(b.pos.x, b.pos.y, x, y + h) < b.r && (b.vel.y < -1 || b.vel.x > 1)) {
      b.vel.x = b.pos.x - x;
      b.vel.y = b.pos.y - (y+h);
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    if (collision && b.vel.mag() > 1.5 && muted == false) {
      if (soundTimer > 2) {
        bounceSound.play();
      }
      soundTimer = 0;
    }
    return collision;
  }

  float setX() {
    if (happenedOnceX == false) {
      happenedOnceX = true;
      endX = x;
    }
    if (isMoving) {
      x = mouseX - diffX;
      endX = x;
    }
    return x;
  }
  float setY() {
    if (happenedOnceY == false) {
      happenedOnceY = true;
      endY = y;
    }
    if (isMoving) {
      y = mouseY - diffY;
      endY = y;
    }
    return y;
  }
  float setWidth() {
    if (happenedOnceW == false) {
      happenedOnceW = true;
      endWidth = w;
    }
    if (isChangingWidth) {
      w = mouseX + 3.5 - x;
      if (maxX < 10 + x + w) {
        maxX = 10 + x + w;
      }
    }
    if (w < 40) {
      w = 40;
    }
    return w;
  }
  float setHeight() {
    if (happenedOnceH == false) {
      happenedOnceH = true;
      endHeight = h;
    }
    if (isChangingHeight) {
      h = mouseY + 3.5 - y;
      if (maxY < 10 + y + h) {
        maxY = 10 + y + h;
      }
    }
    if (h < 40) {
      h = 40;
    }
    return h;
  }

  void moveBlock() {
    if (mouseX >= x && mouseX <= x+w-7 && mouseY >= y && mouseY <= y+h-7 && isPlaying == false) {
      isMoving = true;
      diffX = mouseX - x;
      diffY = mouseY - y;
    }
  }
  void stopMovingBlock() {
    if (isMoving) {
      isMoving = false;
      endX = x;
      endY = y;
    }
  }
  void changeWidth() {
    if (mouseX > x+w-7 && mouseX < x+w && mouseY > y && mouseY < y+h && isPlaying == false) {
      isChangingWidth = true;
    }
  }
  void stopWidthChange() {
    if (isChangingWidth) {
      isChangingWidth = false;
      endWidth = w;
    }
  }
  void changeHeight() {
    if (mouseX > x && mouseX < x+w-7 && mouseY > y+h-7 && mouseY < y+h && isPlaying == false) {
      isChangingHeight = true;
    }
  }
  void stopHeightChange() {
    if (isChangingHeight) {
      isChangingHeight = false;
      endHeight = h;
    }
  }

  void moveHorizontal() {
    if (hMovement) {
      vMovement = false;
      x += speed;
    }
  }
  void moveVertical() {
    if (vMovement) {
      hMovement = false;
      y += speed;
    }
  }

  void mouseClickedHorizontal() {
    if (mouseX >= x && mouseX <= x+w-7 && mouseY >= y && mouseY <= y+9 && isPlaying == false) {
      if (hMovement) {
        hMovement = false;
      }
      else {
        hMovement = true;
        vMovement = false;
        minX = x-20;
        maxX = x+w+20;
      }
    }
  }
  void mouseClickedVertical() {
    if (mouseX >= x + (w-7)/2 - 3 && mouseX <= x + (w-7)/2 + 3 && mouseY >= y+11 && mouseY <= y+h+13 && isPlaying == false) {
      if (vMovement) {
        vMovement = false;
      }
      else {
        vMovement = true;
        hMovement = false;
        minY = y-20;
        maxY = y+h+20;
      }
    }
  }

  void changeHMoveDist(boolean usingMousePressed) {
    if (usingMousePressed) {
      if (dist(mouseX, mouseY, minX, y+6) < 5) {
        changingMinX = true;
      }
      if (dist(mouseX, mouseY, maxX, y+6) < 5) {
        changingMaxX = true;
      }
    }
    else if (changingMinX || changingMaxX) {
      changingMinX = false;
      changingMaxX = false;
    }
  }
  void changeVMoveDist(boolean usingMousePressed) {
    if (usingMousePressed) {
      if (dist(mouseX, mouseY, x+(w-7)/2, minY) < 5) {
        changingMinY = true;
      }
      if (dist(mouseX, mouseY, x+(w-7)/2, maxY) < 5) {
        changingMaxY = true;
      }
    }
    else if (changingMinY || changingMaxY) {
      changingMinY = false;
      changingMaxY = false;
    }
  }
  void changeMovementBounds() {
    if (changingMinX) {
      minX = mouseX;
    }
    if (changingMaxX) {
      maxX = mouseX;
    }
    if (changingMinY) {
      minY = mouseY;
    }
    if (changingMaxY) {
      maxY = mouseY;
    }
  }

  void drawWHRects() {
    fill(170);
    stroke(170);
    if (mouseX > x+w-7 && mouseX < x+w && mouseY > y && mouseY < y+h) {
      fill(200);
      stroke(200);
    }
    rect(x+w-7, y, 7, h);
    fill(170);
    stroke(170);
    if (mouseX > x && mouseX < x+w && mouseY > y+h-7 && mouseY < y+h) {
      fill(200);
      stroke(200);
    }
    rect(x, y+h-7, w, 7);
  }
  void drawArrows() {
    stroke(255);
    if (hMovement) {
      stroke(0);
      line(minX, y+6, maxX, y+6);
      fill(0);
      ellipse(minX, y+6, 5, 5);
      ellipse(maxX, y+6, 5, 5);
      stroke(0, 255, 0);
    }
    line(x+4, y+6, x+w-11, y+6);
    line(x+4, y+6, x+7, y+3);
    line(x+4, y+6, x+7, y+9);
    line(x+w-11, y+6, x+w-14, y+3);
    line(x+w-11, y+6, x+w-14, y+9);
    stroke(255);
    if (vMovement) {
      stroke(0);
      line(x+(w-7)/2, minY, x+(w-7)/2, maxY);
      fill(0);
      ellipse(x+(w-7)/2, minY, 5, 5);
      ellipse(x+(w-7)/2, maxY, 5, 5);
      stroke(0, 255, 0);
    }
    line(x + (w-7)/2, y+11, x + (w-7)/2, y+h-13);
    line(x + (w-7)/2, y+11, x + (w-7)/2 - 3, y+14);
    line(x + (w-7)/2, y+11, x + (w-7)/2 + 3, y+14);
    line(x + (w-7)/2, y+h-13, x + (w-7)/2 - 3, y+h-16);
    line(x + (w-7)/2, y+h-13, x + (w-7)/2 + 3, y+h-16);
  }

  void snapToGrid() {
    if (isMoving == false) {
      if (x % 20 < 10) {
        x -= constrain(x % 20, 0, 10);
      }
      else {
        x += constrain(x % 20, 0, 10);
      }
      endX = x;
      if (y % 20 < 10) {
        y -= constrain(y % 20, 0, 10);
      }
      else {
        y += constrain(y % 20, 0, 10);
      }
      endY = y;
    }
    if (isChangingWidth == false) {
      if (w % 20 < 10) {
        w -= constrain(w % 20, 0, 10);
      }
      else {
        w += constrain(w % 20, 0, 10);
      }
      endWidth = w;
    }
    if (isChangingHeight == false) {
      if (h % 20 < 10) {
        h -= constrain(h % 20, 0, 10);
      }
      else {
        h += constrain(h % 20, 0, 10);
      }
      endHeight = h;
    }
    if (minX % 20 < 10) {
      minX -= constrain(minX % 20, 0, 10);
    }
    else {
      minX += constrain(minX % 20, 0, 10);
    }
    if (maxX % 20 < 10) {
      maxX -= constrain(maxX % 20, 0, 10);
    }
    else {
      maxX += constrain(maxX % 20, 0, 10);
    }
    if (minY % 20 < 10) {
      minY -= constrain(minY % 20, 0, 10);
    }
    else {
      minY += constrain(minY % 20, 0, 10);
    }
    if (maxY % 20 < 10) {
      maxY -= constrain(maxY % 20, 0, 10);
    }
    else {
      maxY += constrain(maxY % 20, 0, 10);
    }
  }

  void checkMinMax() {
    if (minX > endX-20) {
      minX = endX-20;
    }
    if (maxX < endX+endWidth+20) {
      maxX = endX+endWidth+20;
    }
    if (minY > endY-20) {
      minY = endY-20;
    }
    if (maxY < endY+endHeight+20) {
      maxY = endY+endHeight+20;
    }
  }

  void setEnd() {
    endX = x;
    endY = y;
  }
}


class BuildingMenu {
  int numCategories = 7;
  float spacing = width / (float)numCategories;
  boolean[] isClicked = new boolean[numCategories];
  boolean placeBall;
  boolean placeBlack;
  boolean placeRed;
  boolean placeBlue;
  boolean placeBrown;
  boolean placeCoin;
  boolean placeFinish;

  Ball ball;
  boolean showBall = false;
  ArrayList<BlackBlock> bBlockList;
  ArrayList<RedBlock> rBlockList;
  ArrayList<BlueBlock> blueBlockList;
  ArrayList<BrownBlock> brownBlockList;
  ArrayList<Coin> coinList;
  boolean showFinish = false;
  Finish fin;
  ArrayList<Coin> tempCoin;

  boolean showGrid = false;
  boolean play = false;
  boolean showHelp = false;

  color blueStroke = color(50, 170, 190);
  color regBlueFill = color(90, 210, 230, 170);
  color disabledBlueFill = color(10, 130, 150, 170);
  color highlightedBlueFill = color(50, 170, 190, 170);
  color redColor = color(255, 0, 0, 140);

  boolean muted;

  FancyButton g;

  BuildingMenu() {
    ball = new Ball(-500, -500);
    ball.downGrav = true;
    bBlockList = new ArrayList<BlackBlock>();
    rBlockList = new ArrayList<RedBlock>();
    blueBlockList = new ArrayList<BlueBlock>();
    brownBlockList = new ArrayList<BrownBlock>();
    coinList = new ArrayList<Coin>();
    fin = new Finish(ball, -600, -600);
    tempCoin = new ArrayList<Coin>();
    g = new FancyButton();
  }

  void display() {
    if (showGrid) {
      gridLines();
    }
    displayCategories();
    displayObjects();
    placeObjects();
    if (showHelp) {
      displayHelp();
    }
  }

  void displayObjects() {
    if (showBall == false) {
      ball.pos.x = -500;
      ball.pos.y = -500;
      ball.vel.mult(0);
    }
    else {
      ball.display();
      ball.gridSnap = showGrid;
    }
    if (play == false) {
      ball.isPlaying = false;
    }
    else {
      ball.isPlaying = true;
      showGrid = false;
    }
    for (BlackBlock bBlock : bBlockList) {
      bBlock.display();
      bBlock.isPlaying = play;
      bBlock.muted = muted;
      bBlock.gridSnap = showGrid;
      bBlock.inEditor = true;
    }
    for (RedBlock rBlock : rBlockList) {
      rBlock.display();
      rBlock.subLife();
      rBlock.isPlaying = play;
      rBlock.muted = muted;
      rBlock.gridSnap = showGrid;
      rBlock.inEditor = true;
    }
    for (BlueBlock blueBlock : blueBlockList) {
      blueBlock.display();
      blueBlock.isPlaying = play;
      blueBlock.muted = muted;
      blueBlock.gridSnap = showGrid;
      blueBlock.inEditor = true;
    }
    for (BrownBlock brownBlock : brownBlockList) {
      brownBlock.display();
      brownBlock.isPlaying = play;
      brownBlock.muted = muted;
      brownBlock.gridSnap = showGrid;
      brownBlock.inEditor = true;
    }
    for (int i = 0; i < coinList.size(); i++) {
      Coin coin = coinList.get(i);
      coin.display();
      coin.isPlaying = play;
      coin.muted = muted;
      coin.gridSnap = showGrid;
      if (coin.isCollected() && play) {
        coinList.remove(i);
      }
    }
    if (showFinish) {
      fin.display();
      fin.isPlaying = play;
      fin.gridSnap = showGrid;
      if (fin.isCollected() && coinList.size() == 0 && play) {
        showFinish = false;
      }
    }
  }
  void placeObjects() {
    if (placeBall) {
      ball.pos.x = mouseX;
      ball.pos.y = mouseY;
      ball.vel.mult(0);
    }
    if (placeBlack) {
      BlackBlock bBlock = bBlockList.get(bBlockList.size()-1);
      bBlock.isMoving = true;
      bBlock.diffX = bBlock.w/2;
      bBlock.diffY = bBlock.h/2;
    }
    if (placeRed) {
      RedBlock rBlock = rBlockList.get(rBlockList.size()-1);
      rBlock.isMoving = true;
      rBlock.diffX = rBlock.w/2;
      rBlock.diffY = rBlock.h/2;
    }
    if (placeBlue) {
      BlueBlock blueBlock = blueBlockList.get(blueBlockList.size()-1);
      blueBlock.isMoving = true;
      blueBlock.diffX = blueBlock.w/2;
      blueBlock.diffY = blueBlock.h/2;
    }
    if (placeBrown) {
      BrownBlock brownBlock = brownBlockList.get(brownBlockList.size()-1);
      brownBlock.isMoving = true;
      brownBlock.diffX = brownBlock.w/2;
      brownBlock.diffY = brownBlock.h/2;
    }
    if (placeCoin) {
      Coin coin = coinList.get(coinList.size()-1);
      coin.isMoving = true;
    }
    if (placeFinish) {
      fin.isMoving = true;
    }
  }

  void checkIfClicked() {
    if (play == false) {
      for (float i = 0; i < width; i += spacing) {
        if (mouseY >= 0 && mouseY <= 40 && mouseX >= i && mouseX < i+spacing) {
          int index = int(i / spacing);
          isClicked[index] = true;
        }
      }
      updateBooleans();
      if (placeBall) {
        showBall = true;
      }
      if (placeBlack) {
        bBlockList.add(new BlackBlock(ball, width/2, 0, 100, 60));
      }
      if (placeRed) {
        rBlockList.add(new RedBlock(ball, width/2, 0, 100, 60));
      }
      if (placeBlue) {
        blueBlockList.add(new BlueBlock(ball, width/2, 0, 100, 60));
      }
      if (placeBrown) {
        brownBlockList.add(new BrownBlock(ball, width/2, 0, 100, 60));
      }
      if (placeCoin) {
        coinList.add(new Coin(ball, mouseX, mouseY));
      }
      if (placeFinish) {
        showFinish = true;
      }
      if (mouseX > 40 && mouseX <= 100 && mouseY > 40 && mouseY <= 80) {
        if (showGrid) {
          showGrid = false;
        }
        else {
          showGrid = true;
        }
      }
    }
    if (mouseX >= 100 && mouseX <= 140 && mouseY >= 40 && mouseY <= 80) {
      if (showHelp) {
        showHelp = false;
      }
      else {
        showHelp = true;
        if (play) {
          play = false;
        }
      }
    }
    if (mouseX > 260 && mouseX <= 300 && mouseY > 40 && mouseY <= 80) {
      if (play) {
        play = false;
        coinList.clear();
        for (int i = 0; i < tempCoin.size(); i++) {
          coinList.add(tempCoin.get(i));
        }
        setBlockEnds();
      }
      else {
        play = true;
        tempCoin.clear();
        for (int i = 0; i < coinList.size(); i++) {
          tempCoin.add(coinList.get(i));
        }
        showHelp = false;
      }
    }
    if (mouseX >= 200 && mouseX <= 220 && mouseY >= 40 && mouseY <= 60 && play == false) {
      ball.lives++;
    }
    if (mouseX >= 200 && mouseX <= 220 && mouseY >= 60 && mouseY <= 80 && play == false) {
      ball.lives--;
    }
  }
  void checkIfUnclicked() {
    if (play == false) {
      for (int i = 0; i < numCategories; i++) {
        if (isClicked[i]) {
          isClicked[i] = false;
        }
      }
      updateBooleans();
    }
  }

  void updateBooleans() {
    placeBall = isClicked[0];
    placeBlack = isClicked[1];
    placeRed = isClicked[2];
    placeBlue = isClicked[3];
    placeBrown = isClicked[4];
    placeCoin = isClicked[5];
    placeFinish = isClicked[6];
  }

  void displayCategories() {
    for (float i = 0; i < width; i += spacing) {
      if (play) {
        tint(disabledBlueFill);
      }
      g.iRect(int(i/spacing), int(i), 0, int(spacing), 40, 10, regBlueFill, highlightedBlueFill, "", blueStroke);
      noTint();
      noStroke();

      rectMode(CENTER);
      if (i == 0) {
        fill(0);
        ellipse(i + spacing/2, 20, 20, 20);
      }
      if (i == spacing) {
        fill(0);
        rect(i + spacing/2, 20, 20, 20);
      }
      if (i == 2*spacing) {
        fill(255, 0, 0);
        rect(i + spacing/2, 20, 20, 20);
      }
      if (i == 3*spacing) {
        fill(0, 0, 255);
        rect(i + spacing/2, 20, 20, 20);
      }
      if (i == 4*spacing) {
        fill(190, 170, 60);
        rect(i + spacing/2, 20, 20, 20);
      }
      if (i == 5*spacing) {
        stroke(230, 180, 50);
        fill(240, 230, 0);
        ellipse(i + spacing/2, 20, 7, 7);
      }
      if (i == 6*spacing) {
        stroke(50, 100, 230);
        fill(30, 250, 40);
        ellipse(i + spacing/2, 20, 7, 7);
      }
      rectMode(CORNER);
    }  //  end-for

    if (play) {
      tint(disabledBlueFill);
    }
    g.iRect(50, 0, 41, 40, 40, 10, regBlueFill, highlightedBlueFill, "", blueStroke);
    g.iRect(51, 40, 41, 60, 40, 10, regBlueFill, highlightedBlueFill, "toggle\ngrid", blueStroke);
    g.iRect(54, 200, 41, 20, 20, 10, regBlueFill, highlightedBlueFill, "+", blueStroke);
    g.iRect(55, 200, 61, 20, 20, 10, regBlueFill, highlightedBlueFill, "-", blueStroke);
    noTint();
    if (play) {
      tint(redColor);
    }
    g.iRect(52, 260, 41, 40, 40, 10, regBlueFill, highlightedBlueFill, "play", blueStroke);
    noTint();
    g.iRect(53, 140, 41, 60, 40, 10, regBlueFill, regBlueFill, "", blueStroke);  //  LIFE TEXT
    g.iRect(56, 220, 41, 40, 40, 7.0, regBlueFill, highlightedBlueFill, "back", blueStroke);
    if (showHelp) {
      tint(redColor);
    }
    g.iRect(57, 100, 41, 40, 40, 7.0, regBlueFill, highlightedBlueFill, "help", blueStroke);
    noTint();
    fill(0);
    text("Lives:" + ball.lives, 170, 60);
    
    stroke(blueStroke);
    fill(regBlueFill);
    beginShape();
    vertex(30, 55);
    vertex(10, 55);
    vertex(15, 75);
    vertex(22, 75);
    vertex(23, 55);
    vertex(17, 55);
    vertex(18, 75);
    vertex(25, 75);
    vertex(30, 55);
    endShape();
    beginShape();
    vertex(8, 55);
    vertex(32, 55);
    vertex(30, 50);
    vertex(22, 50);
    vertex(22, 47);
    vertex(18, 47);
    vertex(18, 50);
    vertex(10, 50);
    vertex(8, 55);
    endShape();
  }

  void startKeyActions() {
    ball.startKeyForce();
    if (key == 's') {
      printCode();
    }
  }
  void stopKeyActions() {
    ball.stopKeyForce();
  }
  void startMouseActions() {
    ball.startMouseControl();
    for (BlackBlock bBlock : bBlockList) {
      bBlock.moveBlock();
      bBlock.changeWidth();
      bBlock.changeHeight();
      bBlock.mouseClickedHorizontal();
      bBlock.mouseClickedVertical();
      bBlock.changeHMoveDist(true);
      bBlock.changeVMoveDist(true);
    }
    for (RedBlock rBlock : rBlockList) {
      rBlock.moveBlock();
      rBlock.changeWidth();
      rBlock.changeHeight();
      rBlock.mouseClickedHorizontal();
      rBlock.mouseClickedVertical();
      rBlock.changeHMoveDist(true);
      rBlock.changeVMoveDist(true);
    }
    for (BlueBlock blueBlock : blueBlockList) {
      blueBlock.moveBlock();
      blueBlock.changeWidth();
      blueBlock.changeHeight();
      blueBlock.mouseClickedHorizontal();
      blueBlock.mouseClickedVertical();
      blueBlock.changeHMoveDist(true);
      blueBlock.changeVMoveDist(true);
    }
    for (BrownBlock brownBlock : brownBlockList) {
      brownBlock.moveBlock();
      brownBlock.changeWidth();
      brownBlock.changeHeight();
      brownBlock.mouseClickedHorizontal();
      brownBlock.mouseClickedVertical();
      brownBlock.changeHMoveDist(true);
      brownBlock.changeVMoveDist(true);
    }
    for (Coin coin : coinList) {
      coin.startMouseControl();
    }
    fin.startMouseControl();
  }
  void stopMouseActions() {
    ball.stopMouseControl();
    if (mouseInTrash() && dist(mouseX, mouseY, ball.pos.x, ball.pos.y) < 2) {
      showBall = false;
    }
    for (int i = 0; i < bBlockList.size(); i++) {
      BlackBlock bBlock = bBlockList.get(i);
      if (mouseInTrash() && bBlock.isMoving) {
        bBlockList.remove(i);
      }
      else {
        bBlock.stopMovingBlock();
        bBlock.stopWidthChange();
        bBlock.stopHeightChange();
        bBlock.changeHMoveDist(false);
        bBlock.changeVMoveDist(false);
      }
    }
    for (int i = 0; i < rBlockList.size(); i++) {
      RedBlock rBlock = rBlockList.get(i);
      if (mouseInTrash() && rBlock.isMoving) {
        rBlockList.remove(i);
      }
      else {
        rBlock.stopMovingBlock();
        rBlock.stopWidthChange();
        rBlock.stopHeightChange();
        rBlock.changeHMoveDist(false);
        rBlock.changeVMoveDist(false);
      }
    }
    for (int i = 0; i < blueBlockList.size(); i++) {
      BlueBlock blueBlock = blueBlockList.get(i);
      if (mouseInTrash() && blueBlock.isMoving) {
        blueBlockList.remove(i);
      }
      else {
        blueBlock.stopMovingBlock();
        blueBlock.stopWidthChange();
        blueBlock.stopHeightChange();
        blueBlock.changeHMoveDist(false);
        blueBlock.changeVMoveDist(false);
      }
    }
    for (int i = 0; i < brownBlockList.size(); i++) {
      BrownBlock brownBlock = brownBlockList.get(i);
      if (mouseInTrash() && brownBlock.isMoving) {
        brownBlockList.remove(i);
      }
      else {
        brownBlock.stopMovingBlock();
        brownBlock.stopWidthChange();
        brownBlock.stopHeightChange();
        brownBlock.changeHMoveDist(false);
        brownBlock.changeVMoveDist(false);
      }
    }
    for (int i = 0; i < coinList.size(); i++) {
      Coin coin = coinList.get(i);
      if (mouseInTrash() && coin.isMoving) {
        coinList.remove(i);
      }
      else {
        coin.stopMouseControl();
      }
    }
    fin.stopMouseControl();
    if (mouseInTrash() && dist(mouseX, mouseY, fin.x, fin.y) < 2) {
      showFinish = false;
    }
  }

  boolean mouseInTrash() {
    if (mouseX >= 0 && mouseX <= 40 && mouseY > 40 && mouseY <= 80) {
      return true;
    }
    else {
      return false;
    }
  }

  void gridLines() {
    stroke(0);
    for (int i = 0; i <= width; i += 20) {
      line(i, 40, i, height);
    }
    for (int j = 40; j <= height; j += 20) {
      line(0, j, width, j);
    }
    stroke(255, 0, 0);
    line(width/2, 40, width/2, height);
    line(0, height/2, width, height/2);
    stroke(0, 255, 0);
    line(width/3, 40, width/3, height);
    line(2*width/3, 40, 2*width/3, height);
    line(0, height/3, width, height/3);
    line(0, 2*height/3, width, 2*height/3);
  }

  void setBlockEnds() {
    for (BlackBlock blck : bBlockList) {
      blck.setEnd();
    }
    for (RedBlock rd : rBlockList) {
      rd.setEnd();
    }
    for (BlueBlock blu : blueBlockList) {
      blu.setEnd();
    }
    for (BrownBlock brn : brownBlockList) {
      brn.setEnd();
    }
  }

  void displayHelp() {
    g.iRect(99, int(width/2 - 280), int(height/2 - 200), 560, 420, 10, regBlueFill, regBlueFill, "", blueStroke);
    fill(0);
    textSize(20);
    text("Help", width/2 + 5, 140);
    textSize(14);
    textLeading(17);
    text("Click and drag from one of the top categories to create a new object\nTo delete an object, drag it to the trash can and release it", width/2 + 5, 174);
    text("Black blocks are normal\nRed blocks take away lives\nBlue blocks are extra bouncy\nBrown blocks have no bounce", width/2 + 5, 235);
    text("The yellow dots are coins to collect\nThe green dot is the 'finish' when you collect all coins\nYou can only have 1 green dot", width/2 + 5, 310);
    text("Using Grid Mode helps you be more accurate", width/2 + 5, 355);
    text("Click a block's horizontal arrow or vertical arrow to make it move\nYou can control how far it moves with the black slider", width/2 + 5, 405);
    text("The black ball is your player; use the arrow keys to move it\nYou can also control the number of lives", width/2 + 5, 450);
    text("Hit 'Play' to test out your level", width/2 + 5, 485);
    stroke(0);
    fill(0);
    line(width/2 - 20, 375, width/2 - 80, 375);
    line(width/2 - 20, 375, width/2 - 25, 370);
    line(width/2 - 20, 375, width/2 - 25, 380);
    line(width/2 - 80, 375, width/2 - 75, 370);
    line(width/2 - 80, 375, width/2 - 75, 380);
    line(width/2 + 20, 375, width/2 + 80, 375);
    ellipse(width/2 + 20, 375, 5, 5);
    ellipse(width/2 + 80, 375, 5, 5);
  }
}


class Coin {

  Ball b;
  float x;
  float y;
  float r = 3.5;
  boolean isMoving;
  boolean isPlaying;
  boolean collected;
  boolean gridSnap;
  var coinSound;
  boolean muted;

  Coin(Ball b, float x_, float y_) {
    this.b = b;
    x = x_;
    y = y_;
    coinSound = new Audio("coinSound.wav");
  }

  void display() {
    if (isMoving) {
      x = mouseX;
      y = mouseY;
    }
    if (gridSnap) {
      snapToGrid();
    }
    stroke(230, 180, 50);
    fill(240, 230, 0);
    ellipse(x, y, 2*r, 2*r);
  }

  boolean isCollected() {
    if (dist(b.pos.x, b.pos.y, x, y) < b.r + r) {
      collected = true;
      if (isPlaying) {
        b.colorTimer = 0;
        b.a = 240;
        b.b = 230;
        b.c = 0;
        if (muted == false) {
          coinSound.play();
        }
      }
    } 
    else {
      collected = false;
    }
    return collected;
  }

  void startMouseControl() {
    if (dist(mouseX, mouseY, x, y) < r+5 && isPlaying == false) {
      isMoving = true;
    }
  }
  void stopMouseControl() {
    if (isMoving) {
      isMoving = false;
    }
  }

  void snapToGrid() {
    if (isMoving == false) {
      if (x % 20 < 10) {
        x -= constrain(x % 20, 0, 10);
      }
      if (x % 20 >= 10) {
        x += constrain(x % 20, 0, 10);
      }
      if (y % 20 < 10) {
        y -= constrain(y % 20, 0, 10);
      }
      if (y % 20 >= 10) {
        y += constrain(y % 20, 0, 10);
      }
    }
  }
}


class Customize {

  float angle = 0;
  float blink = 0;
  float blinkSpeed = 10;
  int blinkTimer = 0;

  boolean choseFlames;
  boolean chosePizza;
  boolean choseEye;
  boolean choseHoly;

  var fireSound;
  var pizzaSound;
  var eyeSound;
  var holySound;
  boolean muted;

  Flame flmSmall = new Flame(40);
  Flame flmBig = new Flame(50);

  Customize() {
    fireSound = new Audio("Fire.wav");
    pizzaSound = new Audio("Pizza.wav");
    eyeSound = new Audio("Eye.wav");
    holySound = new Audio("Holy.wav");
  }

  void display(int unlocked) {
    fill(0);
    textSize(25);
    text("Ball Shell", width/2, 85);
    if (choseFlames) {
      flmBig.display(width/2, 250, new PVector(0, 8));
    }
    else if (chosePizza) {
      displayPizza(width/2, 250, 50, true, false);
    }
    else if (choseEye) {
      displayEye(width/2, 250, 50);
    }
    else if (choseHoly) {
      displayHoly(width/2, 250, 50);
    }
    else {
      fill(0);
      noStroke();
      ellipse(width/2, 250, 100, 100);
      fill(255);
      textSize(48);
      text("?", width/2, 250);
    }
    textSize(14);
    if (unlocked > 10) {
      flmSmall.display(width/2 - 180, 400, new PVector(0, 8));
      fill(0);
      text("Flames", width/2 - 180, 484);
    }
    else {
      displayLock((width/2 - 180)/2, 400/2, 10);
    }
    if (unlocked > 20) {
      displayPizza(width/2 - 60, 400, 40, true, false);
      fill(0);
      text("Pizza", width/2 - 60, 484);
    }
    else {
      displayLock((width/2 - 60)/2, 400/2, 20);
    }
    if (unlocked > 30) {
      displayEye(width/2 + 60, 400, 40);
      fill(0);
      text("Eyeball", width/2 + 60, 484);
    }
    else {
      displayLock((width/2 + 60)/2, 400/2, 30);
    }
    if (unlocked > 40) {
      displayHoly(width/2 + 180, 400, 40);
      fill(0);
      text("The Almighty", width/2 + 180, 484);
    }
    else {
      displayLock((width/2 + 180)/2, 400/2, 40);
    }
  }

  void displayLock(float x, float y, int mustPass) {
    rectMode(CENTER);
    noStroke();
    pushMatrix();
    scale(2);
    fill(0);
    ellipse(x, y, 40, 40);
    fill(170);
    rect(x, y + 2, 30, 20);
    beginShape();
    vertex(x-13, y-8);
    bezierVertex(x-5, y-20, x+5, y-20, x+13, y-8);
    vertex(x+11, y-5);
    bezierVertex(x+5, y-17, x-5, y-17, x-11, y-5);
    endShape();
    fill(0);
    rect(x, y+5, 4, 8);
    ellipse(x, y, 6, 6);
    stroke(0);
    line(x-20, y+50, x+20, y+50);
    popMatrix();
    text("Pass", x*2, (y + 44)*2);
    text("Level " + mustPass, x*2, (y+56)*2);
    rectMode(CORNER);
  }

  void displayPizza(float x, float y, float r, boolean right, boolean left) {
    if (right) {
      angle += .03;
    }
    if (left) {
      angle -= .03;
    }
    if (angle >= 10*TWO_PI) {
      angle = 0;
    }
    noStroke();
    fill(190, 170, 60);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    ellipse(0, 0, r*2, r*2);
    fill(240, 240, 70);
    ellipse(0, 0, r*2 - r/3, r*2 - r/3);
    fill(255, 0, 0);
    ellipse(-r/2, 0, r/3, r/3);
    ellipse(-r/3, -r/1.7, r/3, r/3);
    ellipse(r/1.7, r/5, r/3, r/3);
    ellipse(-r/7, r/3, r/3, r/3);
    ellipse(r/1.8, -r/3, r/3, r/3);
    stroke(0, 100);
    line(-r + r/6, 0, r - r/6, 0);
    line(0, -r + r/6, 0, r - r/6);
    rotate(PI/4);
    line(-r + r/6, 0, r - r/6, 0);
    line(0, -r + r/6, 0, r - r/6);
    popMatrix();
  }

  void displayEye(float x, float y, float r) {
    PVector diff = new PVector(mouseX - x, mouseY - y);
    if (diff.mag() > r/2.4) {
      diff.normalize();
      diff.mult(r/2.4);
    }
    noFill();
    stroke(0, 100);
    ellipse(x, y, 2*r, 2*r);
    for (float i = r; i > 0; i--) {
      float trans =  map(i, r, 0, 40, 0);
      stroke(0, trans);
      ellipse(x, y, i*2, i*2);
    }
    pushMatrix();
    translate(x, y);
    for (float t = -PI/4; t > -3*PI/4; t -= .2) {
      stroke(0);
      line(cos(t)*r, sin(t)*r, cos(t)*r*1.2, sin(t)*r*1.2);
    }
    noStroke();
    fill(50, 50, 255, 170);
    ellipse(diff.x, diff.y, r*1.2, r*1.2);
    fill(0, 170);
    ellipse(diff.x, diff.y, r*.8, r*.8);
    popMatrix();
    fill(250, 225, 140);
    beginShape();
    vertex(x + r, y);
    bezierVertex(x + r*.85, y - r*1.35, x - r*.85, y - r*1.35, x - r, y);
    bezierVertex(x - r*.85, y - r*1.35 + blink, x + r*.85, y - r*1.35 + blink, x + r, y);
    endShape();
    if (y - r*1.35 + blink < y - r*1.35) {
      blink = 0;
      blinkTimer = 0;
      blinkSpeed *= -1;
    }
    if (y - r*1.35 + blink > y + r*1.35) {
      blinkSpeed *= -1;
    }
    blinkTimer++;
    if (blinkTimer > 2000) {
      blinkTimer = 0;
    }
    if (blinkTimer > 500) {
      blink += blinkSpeed;
    }
  }

  void displayHoly(float x, float y, float r) {
    noFill();
    for (int i = int(r); i < int(r + r/3); i++) {
      stroke(200, 190, 0, map(i, r, r + r/3, 255, 0));
      ellipse(x, y, 2*i, 2*i);
    }
    stroke(0);
    fill(255);
    ellipse(x, y, 2*r, 2*r);
    stroke(255, 238, 0);
    strokeWeight(5);
    noFill();
    ellipse(x, y-r, 2*r, r);
    strokeWeight(1);
  }

  void mPressed(int unlocked) {
    if (mouseX >= width/2-180-40 && mouseX <= width/2-180+40 && mouseY >= 360 && mouseY <= 440 && unlocked > 10) {
      if (choseFlames == false) {
        setSkin("flames");
        if (muted == false) {
          fireSound.play();
        }
      }
      else {
        setSkin("normal");
      }
    }
    if (mouseX >= width/2-60-40 && mouseX <= width/2-60+40 && mouseY >= 360 && mouseY <= 440 && unlocked > 20) {
      if (chosePizza == false) {
        setSkin("pizza");
        if (muted == false) {
          pizzaSound.play();
        }
      }
      else {
        setSkin("normal");
      }
    }
    if (mouseX >= width/2+60-40 && mouseX <= width/2+60+40 && mouseY >= 360 && mouseY <= 440 && unlocked > 30) {
      if (choseEye == false) {
        setSkin("eye");
        if (muted == false) {
          eyeSound.play();
        }
      }
      else {
        setSkin("normal");
      }
    }
    if (mouseX >= width/2+180-40 && mouseX <= width/2+180+40 && mouseY >= 360 && mouseY <= 440 && unlocked > 40) {
      if (choseHoly == false) {
        setSkin("holy");
        if (muted == false) {
          holySound.play();
        }
      }
      else {
        setSkin("normal");
      }
    }
  }

  void setSkin(String s) {
    if (s.equals("normal")) {
      choseFlames = false;
      chosePizza = false;
      choseEye = false;
      choseHoly = false;
    }
    if (s.equals("flames")) {
      choseFlames = true;
      chosePizza = false;
      choseEye = false;
      choseHoly = false;
    } 
    if (s.equals("pizza")) {
      choseFlames = false;
      chosePizza = true;
      choseEye = false;
      choseHoly = false;
    } 
    if (s.equals("eye")) {
      choseFlames = false;
      chosePizza = false;
      choseEye = true;
      choseHoly = false;
    } 
    if (s.equals("holy")) {
      choseFlames = false;
      chosePizza = false;
      choseEye = false;
      choseHoly = true;
    }
  }
}

class Flame {
  float[] x = new float[50];
  float[] y = new float[50];
  float r;
  color[] flameColor = new color[50];
  float trans;
  float velMag;
  Flame(float r) {
    this.r = r;
    for (int i = 0; i < 50; i++) {
      x[i] = cos(random(TWO_PI))*random(-r, r);
        y[i] = sin(random(TWO_PI))*random(-r, r);
      flameColor[i] = color(255, random(255), 0);
    }
  } 
  void display(float ballX, float ballY, PVector vel) {
    noStroke();
    fill(255, 100, 0);
    ellipse(ballX, ballY, r*2, r*2);
    velMag = vel.mag();
    if (velMag > 10) {
      velMag = 10;
    }
    for (int i = 0; i < 50; i++) {
      y[i] -= 1;
      if (y[i] < -r - velMag*10) {
        x[i] = cos(random(TWO_PI))*random(-r, r);
        y[i] = sin(random(TWO_PI))*random(-r, r);
        flameColor[i] = color(255, random(255), 0);
      }
      trans = map(y[i], r, -r - velMag*10, 255, 50);
      pushMatrix();
      translate(ballX, ballY);
      if (velMag > 1) {
        rotate(vel.heading() - PI/2);
      }
      fill(flameColor[i], trans);
      ellipse(x[i], y[i], r/6, r/6);
      popMatrix();
    }
  }
}


class FancyButton {

  int largeNum = 141;  //  this is how many buttons this class can make
  PImage[] img = new PImage[largeNum];
  PImage[] imgHighlighted = new PImage[largeNum];
  boolean[] needsInit = new boolean[largeNum];

  FancyButton() {
    for (int i = 0; i < largeNum; i++) {
      needsInit[i] = true;
    }
  }

  void iRect(int i, int x, int y, int w, int h, float r, color normal, color highlighted, String s) {
    iRect(i, x, y, w, h, r, normal, highlighted, s, color(255, 0));
  }
  void iRect(int i, int x, int y, int w, int h, float r, color normal, color highlighted, String s, color outline) {
    if (needsInit[i]) {
      needsInit[i] = false;
      img[i] = init(i, x, y, w, h, r, normal, s);
      imgHighlighted[i] = init(i, x, y, w, h, r, highlighted, s);
    }
    noFill();
    stroke(outline);
    rect(x - 1, y - 1, w + 1, h + 1, r);
    if (normal != highlighted) {
      if (mouseIn(x, y, w, h) == false) {
        image(img[i], x, y);
      }
      else {
        image(imgHighlighted[i], x, y);
      }
    }
    else {
      image(img[i], x, y);
    }
  }
}

PImage init(int i, int x, int y, int w, int h, float r, color thisColor, String s) {
  PImage temp = createImage(w, h, ARGB);
  PGraphics pgraph = createGraphics(w, h);
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(x + w/2, y + h/2, w, h, r);
  rectMode(CORNER);
  for (int j = y; j <= y+h; j++) {
    stroke(thisColor, map(j, y, y+h, 130, 255));
    line(x, j, x+w, j);
  }
  fill(255);
  if (brightness(thisColor) > 100) {
    fill(0);
  }
  text(s, x + w/2, y + h/2);
  noStroke();
  fill(255, 30);
  ellipse(x + w/2, y - h/2, 2*w, 2*h);
  temp = get(x, y, w, h);
  pgraph.beginDraw();
  pgraph.noStroke();
  pgraph.smooth();
  pgraph.rect(0, 0, w, h, r);
  pgraph.endDraw();
  PImage convert = createImage(w, h, ARGB);
  convert = pgraph.get();
  temp.mask(convert);

  return temp;
}

boolean mouseIn(float x, float y, float w, float h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    return true;
  }
  else {
    return false;
  }
}


class Finish {

  Ball b;
  float x;
  float y;
  float r = 3.5;
  boolean isMoving;
  boolean isPlaying;
  boolean collected;
  boolean gridSnap;

  Finish(Ball b, float x_, float y_) {
    this.b = b;
    x = x_;
    y = y_;
  }

  void display() {
    if (isMoving) {
      x = mouseX;
      y = mouseY;
    }
    if (gridSnap) {
      snapToGrid();
    }
    stroke(50, 100, 230);
    fill(30, 250, 40);
    ellipse(x, y, 2*r, 2*r);
  }

  boolean isCollected() {
    if (dist(b.pos.x, b.pos.y, x, y) < b.r + r) {
      collected = true;
    } 
    else {
      collected = false;
    }
    return collected;
  }

  void startMouseControl() {
    if (dist(mouseX, mouseY, x, y) < r+5 && isPlaying == false) {
      isMoving = true;
    }
  }
  void stopMouseControl() {
    if (isMoving) {
      isMoving = false;
    }
  }

  void snapToGrid() {
    if (isMoving == false) {
      if (x % 20 < 10) {
        x -= constrain(x % 20, 0, 10);
      }
      if (x % 20 >= 10) {
        x += constrain(x % 20, 0, 10);
      }
      if (y % 20 < 10) {
        y -= constrain(y % 20, 0, 10);
      }
      if (y % 20 >= 10) {
        y += constrain(y % 20, 0, 10);
      }
    }
  }

  void setPos(float xPos, float yPos) {
    x = xPos;
    y = yPos;
  }
}


class Levels {

  Ball ball;
  boolean showBall = false;
  ArrayList<BlackBlock> blckList;
  ArrayList<RedBlock> rdList;
  ArrayList<BlueBlock> bluList;
  ArrayList<BrownBlock> brnList;
  ArrayList<Coin> coinList;
  Finish fin;
  boolean showFinish = false;
  boolean play = true;
  int cTimer = 0;

  boolean showPrompt;

  int col = 10;
  int row = 4;
  boolean showLevels = true;
  boolean aLevel = false;
  boolean editor = false;

  color blueStroke = color(50, 170, 190);
  color regBlueFill = color(90, 210, 230, 170);
  color disabledBlueFill = color(10, 130, 150);
  color highlightedBlueFill = color(50, 170, 190, 170);
  color redColor = color(255, 0, 0);

  BuildingMenu bMenu;

  FancyButton g;

  int currentLev;
  int unlocked = 1;
  String cheat = "";

  var finishSound;
  boolean muted;

  Levels() {
    ball = new Ball(50, 50);
    blckList = new ArrayList<BlackBlock>();
    rdList = new ArrayList<RedBlock>();
    bluList = new ArrayList<BlueBlock>();
    brnList = new ArrayList<BrownBlock>();
    coinList = new ArrayList<Coin>();
    fin = new Finish(ball, 500, 500);
    bMenu = new BuildingMenu();
    finishSound = new Audio("finishSound.wav");
    g = new FancyButton();
  }

  void display() {
    if (showLevels) {
      displayLevels();
    }
    if (aLevel) {
      displayTutorial(currentLev);
      displayObjects();
    }
    if (editor) {
      bMenu.display();
      bMenu.muted = muted;
    }
    if (showPrompt) {
      if (ball.lives > 0) {
        displayPrompt(47);
      }
      else {
        displayPrompt(48);
      }
    }
    if (cheat.equals("wwhwwwh")) {
      unlocked = 100;
    }
    if (cheat.equals("gimmelife")) {
      ball.lives = 100;
    }
  }

  void displayLevels() {
    rectMode(CENTER);
    noStroke();
    for (int i = 1; i <= col; i++) {
      for (int j = 1; j <= row; j++) {
        if (i + (j-1)*10 <= unlocked) {
          g.iRect(int(i + (j-1)*10 - 1), int(i*(width/(col+1)) - 20), int(j*((height-100)/(row+1)) + 30), 40, 40, 12, color(0), color(212, 175, 60), str(i + (j-1)*10));
        }
        else {
          g.iRect(int(i + (j-1)*10 + 99), int(i*(width/(col+1)) - 20), int(j*((height-100)/(row+1)) + 30), 40, 40, 12, color(0), color(0), str(i + (j-1)*10));
          displayLock(i*(width/(col+1)), j*((height-100)/(row+1)) + 50);
        }
      }
    }
    fill(0);
    textSize(25);
    text("Levels", width/2, 60);
    textSize(14);
    g.iRect(99, int(width/2 - 60), int(height - 90), 120, 40, 10, color(0), color(212, 175, 60), "Build Mode");
    rectMode(CORNER);
  }

  void displayObjects() {
    for (BlackBlock blck : blckList) {
      blck.display();
      blck.isPlaying = play;
      blck.muted = muted;
    }
    for (RedBlock rd : rdList) {
      rd.display();
      rd.subLife();
      rd.isPlaying = play;
      rd.muted = muted;
    }
    for (BlueBlock blu : bluList) {
      blu.display();
      blu.isPlaying = play;
      blu.muted = muted;
    }
    for (BrownBlock brn : brnList) {
      brn.display();
      brn.isPlaying = play;
      brn.muted = muted;
    }
    for (int i = 0; i < coinList.size(); i++) {
      Coin coin = coinList.get(i);
      coin.display();
      coin.isPlaying = play;
      coin.muted = muted;
      if ( (currentLev == 33 || currentLev == 37) && dist(ball.pos.x, ball.pos.y, coin.x, coin.y) < ball.r + coin.r + 4 && ball.vel.mag() < 7.3) {
        coin.x = random(50, width - 50);
        coin.y = random(50, height - 50);
      }
      if (currentLev == 17 || currentLev == 19 || currentLev == 30) {
        randomMove(coin, i);
      }
      else if (coin.isCollected()) {
        coinList.remove(i);
      }
    }
    if (showFinish) {
      fin.display();
      fin.isPlaying = play;
      if (fin.isCollected() && coinList.size() == 0) {
        showFinish = false;
        if (muted == false) {
          finishSound.play();
        }
        if (currentLev == unlocked) {
          unlocked++;
        }
        currentLev++;
        initLevel(currentLev);
      }
    }
    g.iRect(98, -10, 0, 90, 30, 10, regBlueFill, regBlueFill, "", blueStroke);
    g.iRect(97, -10, 31, 70, 30, 10, regBlueFill, highlightedBlueFill, "Back", blueStroke);
    g.iRect(96, width-75, 0, 80, 30, 10, regBlueFill, regBlueFill, "", blueStroke);
    fill(0);
    text("Lives: " + int(ball.lives), 40, 15);
    text("Level " + currentLev, width-35, 15);
    if (showBall == false) {
      ball.pos.x = -500;
      ball.pos.y = -500;
      ball.vel.mult(0);
    }
    else {
      ball.display();
      ball.isPlaying = play;
    }
    if (ball.lives == 0) {
      showPrompt = true;
      play = false;
    }
  }

  void randomMove(Coin cn, int i) {
    if (play) {
      cTimer++;
      if (cTimer%50 == 0) {
        cn.x = random(width/3, 2*width/3);
        cn.y = random(height/3, 2*height/3);
      }
    }
    if (cn.isCollected()) {
      coinList.remove(i);
    }
  }

  void displayPrompt(int i) {
    textLeading(20);
    if (i == 47) {
      g.iRect(47, width/2 - 170, height/2 - 100, 340, 200, 7.0, regBlueFill, regBlueFill, "Are you sure you want to go back?\nYou will lose all progress on this level.\n\n\n", blueStroke);
    }
    if (i == 48) {
      g.iRect(48, width/2 - 170, height/2 - 100, 340, 200, 7.0, regBlueFill, regBlueFill, "You're out of lives!\nDo you want to try again?\n\n", blueStroke);
    }
    g.iRect(49, width/2 - 90, height/2 + 10, 60, 40, 7.0, regBlueFill, highlightedBlueFill, "Yes", blueStroke);
    g.iRect(50, width/2 + 30, height/2 + 10, 60, 40, 7.0, regBlueFill, highlightedBlueFill, "No", blueStroke);
  }

  void dialog(int i, int x, int y, String s, int lines) {
    textLeading(17);
    g.iRect(i, int(x - textWidth(s)/2 - 10), int(y - int(lines*(textAscent() + textDescent() + 2) + 15)/2), int(textWidth(s) + 20), int(lines*(textAscent() + textDescent() + 2) + 15), 10, regBlueFill, regBlueFill, s, blueStroke);
  }

  void displayLock(float x, float y) {
    fill(170);
    noStroke();
    rect(x, y + 2, 30, 20);
    beginShape();
    vertex(x-13, y-8);
    bezierVertex(x-5, y-20, x+5, y-20, x+13, y-8);
    vertex(x+11, y-5);
    bezierVertex(x+5, y-17, x-5, y-17, x-11, y-5);
    endShape();
    fill(0);
    rect(x, y+5, 4, 8);
    ellipse(x, y, 6, 6);
  }

  void startKeyActions() {
    bMenu.startKeyActions();
    ball.startKeyForce();
    if (key >= 'a' && key <= 'z') {
      cheat = cheat + key;
    }
    if (key == BACKSPACE) {
      cheat = "";
    }
  }
  void stopKeyActions() {
    bMenu.stopKeyActions();
    ball.stopKeyForce();
  }

  void mousePressedActions() {
    if (showLevels) {
      for (int i = 1; i <= col; i++) {
        for (int j = 1; j <= row; j++) {
          if (mouseX >= i*(width/(col+1))-20 && mouseX <= i*(width/(col+1))+20 && mouseY >= j*((height-100)/(row+1))+30 && mouseY <= j*((height-100)/(row+1))+70 && i+(j-1)*10 <= unlocked) {
            showLevels = false;
            editor = false;
            aLevel = true;
            showBall = true;
            showFinish = true;
            int lev = i + (j-1)*10;
            initLevel(lev);
            currentLev = lev;
            play = true;
          }
        }
      }
      if (mouseX >= width/2 - 60 && mouseX <= width/2 + 60 && mouseY >= height-90 && mouseY <= height-50) {  //  'Level Editor' button
        editor = true;
        aLevel = false;
        showLevels = false;
        showBall = false;
        showFinish = false;
        bMenu.play = false;
      }
    }
    if (mouseX >= 0 && mouseX <= 50 && mouseY >= 30 && mouseY <= 60 && showLevels == false && editor == false && showPrompt == false) {  //  'Back' button for a level
      showPrompt = true;
      play = false;
    }
    if (mouseX >= width/2 - 90 && mouseX <= width/2 - 30 && mouseY >= height/2 + 10 && mouseY <= height/2 + 50 && showPrompt) {  //  'Yes' button in prompt
      showPrompt = false;
      editor = false;
      if (ball.lives > 0) {
        aLevel = false;
        showLevels = true;
      }
      else {
        aLevel = true;
        showLevels = false;
        initLevel(currentLev);
        play = true;
      }
    }
    if (mouseX >= width/2 + 30 && mouseX <= width/2 + 90 && mouseY >= height/2 + 10 && mouseY <= height/2 + 50 && showPrompt) {  //  'No' button in  prompt
      showPrompt = false;
      if (ball.lives > 0) {
        play = true;
      }
      else {
        aLevel = false;
        showLevels = true;
      }
    }
    if (editor) {
      bMenu.checkIfClicked();
      bMenu.startMouseActions();
    }
  }

  void mouseReleasedActions() {
    if (editor) {
      bMenu.checkIfUnclicked();
      bMenu.stopMouseActions();
    }
  }

  void displayTutorial(int thisLevel) {
    if (thisLevel == 1) {
      dialog(51, 425, 265, "This is your player.\nUse the arrow keys to move.", 2);
      dialog(52, 170, 120, "Collect coins and then\nget to the green dot\nto advance.", 3);
    }
    if (thisLevel == 2) {
      dialog(53, int(width/2), 80, "You must collect\nALL coins to advance", 2);
      dialog(54, 180, 490, "The blue stuff is bouncy.\nVery bouncy.", 2);
      dialog(55, 420, 490, "The brown material is sticky.", 1);
    }
    if (thisLevel == 3) {
      dialog(56, 450, 200, "You will lose lives\nif you touch red material.", 2);
    }
    if (thisLevel == 4) {
      dialog(57, int(width/2), 220, "Blocks can also move\nhorizontally and\nvertically.", 3);
    }
    if (thisLevel == 5) {
      dialog(58, 170, 100, "You may have a different\nnumber of lives\nfor each level.", 3);
      dialog(59, 500, 250, "You will unlock\na new feature\nevery 10 levels.", 3);
      dialog(60, 110, 390, "You can also create your\nown levels in\nBuild Mode", 3);
    }
    if (thisLevel == 6) {
      dialog(61, int(width/2), 430, "Ahh yes... One more thing.", 1);
      dialog(62, 100, 500, "Gravity can change.\nThis arrow shows the\ndirection of gravity.", 3);
    }
    if (thisLevel == 17) {
      dialog(63, 150, 450, "No fair?\nI laugh at your pain.", 2);
    }
    if (thisLevel == 18) {
      dialog(64, 500, 540, "How on Earth\nwill you get in there?", 2);
    }
    if (thisLevel == 31) {
      dialog(65, 300, 50, "You're on the home stretch now!", 1);
    }
    if (thisLevel == 32) {
      dialog(66, 100, height/2, "I guess things\nshould get harder now.", 2);
    }
    if (thisLevel == 33) {
      dialog(67, width/2, height - 100, "Catch it before it jumps.\nYou have to be FAST.", 2);
    }
    if (thisLevel == 39) {
      dialog(68, width/2, 50, "That last one was hard, right?\nTake a breather.\nYou'll need it for level 40.", 3);
    }
  }

  void clearArrays() {
    blckList.clear();
    rdList.clear();
    bluList.clear();
    brnList.clear();
    coinList.clear();
  }

  void initLevel(int level) {
    clearArrays();
    ball.vel.mult(0);
    showFinish = true;
    if (level == 1) {
      ball.setVars(300, 260, 10, "down");
      BlackBlock blck0 = new BlackBlock(ball, 140.0, 300.0, 320.0, 100.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      coinList.add(new Coin(ball, 400, 200));
      coinList.add(new Coin(ball, 300, 200));
      coinList.add(new Coin(ball, 200, 200));
      fin.setPos(300, 120);
    }
    if (level == 2) {
      ball.setVars(300, 160, 10, "down");
      BlackBlock blck0 = new BlackBlock(ball, 240.0, 180.0, 120.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlueBlock blu0 = new BlueBlock(ball, 100.0, 420.0, 160.0, 40.0, false, false, 0, 600, 0, 600);
      bluList.add(blu0);
      BlueBlock blu1 = new BlueBlock(ball, 100.0, 260.0, 160.0, 40.0, false, false, 0, 600, 0, 600);
      bluList.add(blu1);
      BlueBlock blu2 = new BlueBlock(ball, 220.0, 300.0, 40.0, 120.0, false, false, 0, 600, 0, 600);
      bluList.add(blu2);
      BrownBlock brn0 = new BrownBlock(ball, 340.0, 420.0, 160.0, 40.0, false, false, 0, 600, 0, 600);
      brnList.add(brn0);
      BrownBlock brn1 = new BrownBlock(ball, 340.0, 260.0, 160.0, 40.0, false, false, 0, 600, 0, 600);
      brnList.add(brn1);
      BrownBlock brn2 = new BrownBlock(ball, 340.0, 300.0, 40.0, 120.0, false, false, 0, 600, 0, 600);
      brnList.add(brn2);
      coinList.add(new Coin(ball, 140, 340));
      coinList.add(new Coin(ball, 180, 340));
      coinList.add(new Coin(ball, 140, 380));
      coinList.add(new Coin(ball, 180, 380));
      coinList.add(new Coin(ball, 420, 340));
      coinList.add(new Coin(ball, 460, 340));
      coinList.add(new Coin(ball, 420, 380));
      coinList.add(new Coin(ball, 460, 380));
      fin.setPos(300, 160);
    }
    if (level == 3) {
      ball.setVars(300, 240, 15, "down");
      BlackBlock blck0 = new BlackBlock(ball, 200.0, 260.0, 200.0, 80.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 200.0, 440.0, 200.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 200.0, 100.0, 200.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      coinList.add(new Coin(ball, 260, 380));
      coinList.add(new Coin(ball, 340, 380));
      coinList.add(new Coin(ball, 260, 560));
      coinList.add(new Coin(ball, 340, 560));
      fin.setPos(300, 200);
    }
    if (level == 4) {
      ball.setVars(300, 280, 10, "down");
      BlackBlock blck0 = new BlackBlock(ball, 240.0, 300.0, 120.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 120.0, 200.0, 60.0, 200.0, false, true, 0, 600, 100, 500);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 420.0, 200.0, 60.0, 200.0, false, true, 0, 600, 100, 500);
      blckList.add(blck2);
      BlueBlock blu0 = new BlueBlock(ball, 220.0, 100.0, 160.0, 60.0, true, false, 40, 560, 0, 600);
      bluList.add(blu0);
      BrownBlock brn0 = new BrownBlock(ball, 220.0, 440.0, 160.0, 60.0, true, false, 180, 420, 0, 600);
      brnList.add(brn0);
      coinList.add(new Coin(ball, 300, 520));
      coinList.add(new Coin(ball, 520, 200));
      coinList.add(new Coin(ball, 520, 300));
      coinList.add(new Coin(ball, 520, 400));
      coinList.add(new Coin(ball, 80, 200));
      coinList.add(new Coin(ball, 80, 300));
      coinList.add(new Coin(ball, 80, 400));
      fin.setPos(300, 80);
    }
    if (level == 5) {
      ball.setVars(40, 120, 6, "down");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 160.0, 460.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 140.0, 300.0, 460.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 0.0, 440.0, 460.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck2);
      RedBlock rd0 = new RedBlock(ball, 280.0, 295.0, 100.0, 50, true, false, 135, 600, 0, 600);
      rdList.add(rd0);
      BlueBlock blu0 = new BlueBlock(ball, 323.0, 510.0, 40.0, 40.0, false, true, 0, 600, 370, 570);
      bluList.add(blu0);
      coinList.add(new Coin(ball, 200, 260));
      coinList.add(new Coin(ball, 260, 260));
      coinList.add(new Coin(ball, 320, 260));
      coinList.add(new Coin(ball, 380, 260));
      fin.setPos(70, 540);
    }
    if (level == 6) {
      ball.setVars(300, 140, 10, "left");
      BlackBlock blck0 = new BlackBlock(ball, 140.0, 200.0, 60.0, 200.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 60.0, 340.0, 80.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 60.0, 200.0, 80.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck2);
      BlackBlock blck3 = new BlackBlock(ball, 400.0, 200.0, 60.0, 200.0, false, false, 0, 600, 0, 600);
      blckList.add(blck3);
      BlackBlock blck4 = new BlackBlock(ball, 460.0, 200.0, 80.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck4);
      BlackBlock blck5 = new BlackBlock(ball, 460.0, 340.0, 80.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck5);
      BlueBlock blu0 = new BlueBlock(ball, 200.0, 280.0, 200.0, 120.0, false, false, 0, 600, 0, 600);
      bluList.add(blu0);
      coinList.add(new Coin(ball, 500, 280));
      coinList.add(new Coin(ball, 500, 320));
      coinList.add(new Coin(ball, 100, 280));
      coinList.add(new Coin(ball, 100, 320));
      fin.setPos(300, 240);
    }
    if (level == 7) {
      ball.setVars(300, 60, 4, "down");
      RedBlock rd0 = new RedBlock(ball, 0.0, 520.0, 540.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      coinList.add(new Coin(ball, 60, 580));
      coinList.add(new Coin(ball, 120, 580));
      coinList.add(new Coin(ball, 180, 580));
      coinList.add(new Coin(ball, 240, 580));
      coinList.add(new Coin(ball, 300, 580));
      fin.setPos(60, 460);
    }
    if (level == 8) {
      ball.setVars(540, 300, 4, "down");
      RedBlock rd0 = new RedBlock(ball, 100.0, 210.0, 400.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 100.0, 350.0, 400.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      coinList.add(new Coin(ball, 360, 300));
      coinList.add(new Coin(ball, 420, 300));
      coinList.add(new Coin(ball, 480, 300));
      coinList.add(new Coin(ball, 240, 300));
      coinList.add(new Coin(ball, 180, 300));
      coinList.add(new Coin(ball, 120, 300));
      fin.setPos(300, 300);
    }
    if (level == 9) {
      ball.setVars(20, 120, 6, "down");
      BlackBlock blck0 = new BlackBlock(ball, -1.0, 140.0, 500.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 100.0, 340.0, 500.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 60.0, 471.0, 40.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      BlueBlock blu0 = new BlueBlock(ball, 100.0, 540.0, 500.0, 60.0, false, false, 0, 600, 0, 600);
      bluList.add(blu0);
      BrownBlock brn0 = new BrownBlock(ball, 199.0, 332.0, 200.0, 40.0, false, false, 0, 600, 0, 600);
      brnList.add(brn0);
      BrownBlock brn1 = new BrownBlock(ball, 200.0, 532.0, 200.0, 40.0, false, false, 0, 600, 0, 600);
      brnList.add(brn1);
      coinList.add(new Coin(ball, 240, 280));
      coinList.add(new Coin(ball, 360, 280));
      coinList.add(new Coin(ball, 240, 480));
      coinList.add(new Coin(ball, 360, 480));
      fin.setPos(40, 420);
    }
    if (level == 10) {
      ball.setVars(80, 20, 2, "down");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 40.0, 159.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, -1.0, 60.0, 160.0, 540.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 275.0, 0.0, 325.0, 540.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      fin.setPos(540, 575);
    }
    if (level == 11) {
      ball.setVars(60, 60, 5, "left");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 80.0, 440.0, 80.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 120.0, 280.0, 480.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 0.0, 420.0, 440.0, 80.0, false, false, 0, 600, 0, 600);
      blckList.add(blck2);
      RedBlock rd0 = new RedBlock(ball, 440.0, 80.0, 40.0, 80.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 440.0, 420.0, 40.0, 80.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 120.0, 240.0, 480.0, 20.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 120.0, 320.0, 480.0, 20.0, false, false, 0, 600, 0, 600);
      rdList.add(rd3);
      coinList.add(new Coin(ball, 520, 120));
      coinList.add(new Coin(ball, 520, 460));
      coinList.add(new Coin(ball, 80, 300));
      fin.setPos(100, 550);
    }
    if (level == 12) {
      ball.setVars(60, 300, 3, "right");
      RedBlock rd0 = new RedBlock(ball, 180.0, 170.0, 60.0, 260.0, false, true, 0, 600, 0, 600);
      rd0.currentSpeed *= -2.5;
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 360.0, 170.0, 60.0, 260.0, false, true, 0, 600, 0, 600);
      rd1.currentSpeed *= 2.5;
      rdList.add(rd1);
      coinList.add(new Coin(ball, 300, 300));
      coinList.add(new Coin(ball, 300, 200));
      coinList.add(new Coin(ball, 300, 400));
      fin.setPos(540, 300);
    }
    if (level == 13) {
      ball.setVars(20, 580, 1, "down");
      RedBlock rd0 = new RedBlock(ball, 0.0, 200.0, 600.0, 220.0, false, true, 0, 600, 180, 580);
      rd0.currentSpeed *= .55;
      rdList.add(rd0);
      coinList.add(new Coin(ball, 480, 580));
      coinList.add(new Coin(ball, 420, 580));
      coinList.add(new Coin(ball, 360, 580));
      coinList.add(new Coin(ball, 300, 580));
      coinList.add(new Coin(ball, 240, 580));
      coinList.add(new Coin(ball, 180, 580));
      coinList.add(new Coin(ball, 120, 580));
      fin.setPos(540, 580);
    }
    if (level == 14) {
      ball.setVars(300, 300, 2, "spinning");
      RedBlock rd0 = new RedBlock(ball, -2.0, 0.0, 40.0, 600.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 0.0, 0.0, 600.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, -1.0, 560.0, 600.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 560.0, -2.0, 40.0, 600.0, false, false, 0, 600, 0, 600);
      rdList.add(rd3);
      coinList.add(new Coin(ball, 140, 300));
      coinList.add(new Coin(ball, 460, 300));
      coinList.add(new Coin(ball, 300, 140));
      coinList.add(new Coin(ball, 300, 460));
      fin.setPos(300, 300);
    }
    if (level == 15) {
      ball.setVars(20, 60, 3, "down");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 80.0, 40.0, 520.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 120.0, 80.0, 380.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 460.0, 120.0, 40.0, 480.0, false, false, 0, 600, 0, 600);
      blckList.add(blck2);
      RedBlock rd0 = new RedBlock(ball, 120.0, 140.0, 340.0, 40.0, false, true, 0, 600, 120, 580);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 120.0, 300.0, 340.0, 40.0, false, true, 0, 600, 120, 580);
      rdList.add(rd1);
      coinList.add(new Coin(ball, 290, 360));
      coinList.add(new Coin(ball, 290, 240));
      coinList.add(new Coin(ball, 290, 480));
      fin.setPos(550, 580);
    }
    if (level == 16) {
      ball.setVars(20, 60, 10, "spinning");
      BlackBlock blck0 = new BlackBlock(ball, -1.0, 80.0, 300.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 340.0, 80.0, 100.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 480.0, 80.0, 80.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck2);
      BlackBlock blck3 = new BlackBlock(ball, 520.0, 120.0, 40.0, 480.0, false, false, 0, 600, 0, 600);
      blckList.add(blck3);
      BlackBlock blck4 = new BlackBlock(ball, 380.0, 120.0, 60.0, 200.0, false, false, 0, 600, 0, 600);
      blckList.add(blck4);
      BlackBlock blck5 = new BlackBlock(ball, 40.0, 160.0, 340.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck5);
      BlackBlock blck6 = new BlackBlock(ball, 260.0, 220.0, 80.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck6);
      BlackBlock blck7 = new BlackBlock(ball, 0.0, 260.0, 220.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck7);
      BlackBlock blck8 = new BlackBlock(ball, 260.0, 320.0, 220.0, 80.0, false, false, 0, 600, 0, 600);
      blckList.add(blck8);
      BlackBlock blck9 = new BlackBlock(ball, 440.0, 160.0, 40.0, 120.0, false, false, 0, 600, 0, 600);
      blckList.add(blck9);
      BlackBlock blck10 = new BlackBlock(ball, 340.0, 440.0, 140.0, 160.0, false, false, 0, 600, 0, 600);
      blckList.add(blck10);
      BlackBlock blck11 = new BlackBlock(ball, 40.0, 320.0, 180.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck11);
      BlackBlock blck12 = new BlackBlock(ball, 160.0, 360.0, 60.0, 200.0, false, false, 0, 600, 0, 600);
      blckList.add(blck12);
      BlackBlock blck13 = new BlackBlock(ball, 40.0, 500.0, 120.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck13);
      BlackBlock blck14 = new BlackBlock(ball, 0.0, 400.0, 120.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck14);
      BlackBlock blck15 = new BlackBlock(ball, 260.0, 400.0, 40.0, 200.0, false, false, 0, 600, 0, 600);
      blckList.add(blck15);
      coinList.add(new Coin(ball, 360, 140));
      coinList.add(new Coin(ball, 240, 240));
      coinList.add(new Coin(ball, 360, 240));
      coinList.add(new Coin(ball, 20, 340));
      coinList.add(new Coin(ball, 240, 580));
      coinList.add(new Coin(ball, 320, 580));
      coinList.add(new Coin(ball, 500, 520));
      coinList.add(new Coin(ball, 460, 300));
      coinList.add(new Coin(ball, 460, 140));
      coinList.add(new Coin(ball, 580, 520));
      fin.setPos(20, 140);
    }
    if (level == 17) {
      ball.setVars(60, 100, 2, "down");
      RedBlock rd0 = new RedBlock(ball, 260.0, 260.0, 80.0, 80.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      coinList.add(new Coin(ball, 81, 335));
      coinList.add(new Coin(ball, 286, 157));
      coinList.add(new Coin(ball, 469, 250));
      coinList.add(new Coin(ball, 447, 222));
      coinList.add(new Coin(ball, 341, 507));
      coinList.add(new Coin(ball, 449, 408));
      coinList.add(new Coin(ball, 145, 534));
      coinList.add(new Coin(ball, 424, 99));
      coinList.add(new Coin(ball, 187, 226));
      coinList.add(new Coin(ball, 193, 398));
      coinList.add(new Coin(ball, 520, 71));
      coinList.add(new Coin(ball, 97, 161));
      fin.setPos(width/2, 100);
    }
    if (level == 18) {
      ball.setVars(20, 120, 10, "down");
      BlackBlock blck0 = new BlackBlock(ball, 120.0, 0.0, 80.0, 500.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 400.0, 0.0, 80.0, 500.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 200.0, 440.0, 200.0, 120.0, false, true, 0, 600, 200, 600);
      blckList.add(blck2);
      BlackBlock blck3 = new BlackBlock(ball, 0.0, 140.0, 60.0, 460.0, false, false, 0, 600, 0, 600);
      blckList.add(blck3);
      BlackBlock blck4 = new BlackBlock(ball, 180.0, 0.0, 220.0, 80.0, true, false, 119, 199, 0, 600);
      blckList.add(blck4);
      coinList.add(new Coin(ball, 300, 260));
      coinList.add(new Coin(ball, 300, 320));
      coinList.add(new Coin(ball, 300, 380));
      coinList.add(new Coin(ball, 300, 200));
      fin.setPos(540, 40);
    }
    if (level == 19) {
      ball.setVars(540, 302, 3, "right");
      RedBlock rd0 = new RedBlock(ball, 120.0, 210.0, 40.0, 160.0, false, true, 0, 600, 120, 480);
      rd0.currentSpeed *= -1;
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 210.0, 120.0, 160.0, 40.0, true, false, 120, 480, 0, 600);
      rd1.currentSpeed *= -1;
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 440.0, 210.0, 40.0, 160.0, false, true, 0, 600, 120, 480);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 210.0, 440.0, 160.0, 40.0, true, false, 120, 480, 0, 600);
      rdList.add(rd3);
      coinList.add(new Coin(ball, 340, 180));
      coinList.add(new Coin(ball, 380, 240));
      coinList.add(new Coin(ball, 280, 260));
      coinList.add(new Coin(ball, 340, 240));
      coinList.add(new Coin(ball, 320, 380));
      coinList.add(new Coin(ball, 220, 340));
      coinList.add(new Coin(ball, 220, 260));
      coinList.add(new Coin(ball, 400, 360));
      coinList.add(new Coin(ball, 260, 380));
      coinList.add(new Coin(ball, 240, 200));
      coinList.add(new Coin(ball, 360, 300));
      fin.setPos(300, 300);
    }
    if (level == 20) {
      ball.setVars(580, 300, 2, "down");
      BlackBlock blck0 = new BlackBlock(ball, 560.0, 320.0, 40.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 60.0, 160.0, 100.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 440.0, 160.0, 100.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 60.0, 400.0, 100.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 440.0, 400.0, 100.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd3);
      BlueBlock blu0 = new BlueBlock(ball, 160.0, 220.0, 280.0, 40.0, false, true, 0, 600, 200, 280);
      bluList.add(blu0);
      BlueBlock blu1 = new BlueBlock(ball, 160.0, 340.0, 280.0, 40.0, false, true, 0, 600, 320, 400);
      bluList.add(blu1);
      coinList.add(new Coin(ball, 300, 300));
      coinList.add(new Coin(ball, 340, 300));
      coinList.add(new Coin(ball, 380, 300));
      coinList.add(new Coin(ball, 260, 300));
      coinList.add(new Coin(ball, 220, 300));
      fin.setPos(20, 300);
    }
    if (level == 21) {
      ball.setVars(120, 560, 2, "down");
      RedBlock rd0 = new RedBlock(ball, 340.0, 120.0, 40.0, 40.0, true, false, 100, 520, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 160.0, 420.0, 100.0, 60.0, false, true, 0, 600, 120, 560);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 440.0, 320.0, 100.0, 40.0, false, true, 0, 600, 60, 420);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 80.0, 40.0, 40.0, 40.0, false, true, 0, 600, 60, 420);
      rdList.add(rd3);
      RedBlock rd4 = new RedBlock(ball, 280, 400, 40, 40, false, true, 0, 600, 360, 560);
      rdList.add(rd4);
      BlueBlock blu0 = new BlueBlock(ball, 80.0, 160.0, 100.0, 60.0, true, false, 40, 560, 0, 600);
      bluList.add(blu0);
      BlueBlock blu1 = new BlueBlock(ball, 260.0, 300.0, 60.0, 60.0, true, false, 60, 420, 0, 600);
      bluList.add(blu1);
      BlueBlock blu2 = new BlueBlock(ball, 420.0, 160.0, 100.0, 80.0, true, false, 240, 580, 0, 600);
      bluList.add(blu2);
      BlueBlock blu3 = new BlueBlock(ball, 440.0, 480.0, 100.0, 60.0, true, false, 280, 560, 0, 600);
      bluList.add(blu3);
      BlueBlock blu4 = new BlueBlock(ball, 60.0, 420.0, 100.0, 60.0, false, true, 0, 600, 400, 500);
      bluList.add(blu4);
      BlueBlock blu5 = new BlueBlock(ball, 400.0, 40.0, 40.0, 40.0, false, true, 0, 600, 400, 500);
      bluList.add(blu5);
      coinList.add(new Coin(ball, 120, 340));
      coinList.add(new Coin(ball, 240, 240));
      coinList.add(new Coin(ball, 400, 440));
      coinList.add(new Coin(ball, 520, 100));
      coinList.add(new Coin(ball, 380, 280));
      coinList.add(new Coin(ball, 140, 120));
      coinList.add(new Coin(ball, 560, 400));
      coinList.add(new Coin(ball, 360, 520));
      fin.setPos(40, 100);
    }
    if (level == 22) {
      ball.setVars(500, 300, 9, "down");
      RedBlock rd0 = new RedBlock(ball, 40.0, 140.0, 40.0, 60.0, false, true, 0, 600, 120, 340);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 120.0, 140.0, 40.0, 60.0, false, true, 0, 600, 120, 340);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 200.0, 140.0, 40.0, 60.0, false, true, 0, 600, 120, 340);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 280.0, 140.0, 40.0, 60.0, false, true, 0, 600, 120, 340);
      rdList.add(rd3);
      RedBlock rd4 = new RedBlock(ball, 0.0, 400.0, 40.0, 60.0, false, true, 0, 600, 260, 480);
      rd4.currentSpeed *= -1;
      rdList.add(rd4);
      RedBlock rd5 = new RedBlock(ball, 80.0, 400.0, 40.0, 60.0, false, true, 0, 600, 260, 480);
      rd5.currentSpeed *= -1;
      rdList.add(rd5);
      RedBlock rd6 = new RedBlock(ball, 160.0, 400.0, 40.0, 60.0, false, true, 0, 600, 260, 480);
      rd6.currentSpeed *= -1;
      rdList.add(rd6);
      RedBlock rd7 = new RedBlock(ball, 240.0, 400.0, 40.0, 60.0, false, true, 0, 600, 260, 480);
      rd7.currentSpeed *= -1;
      rdList.add(rd7);
      RedBlock rd8 = new RedBlock(ball, 0.0, 100.0, 320.0, 40.0, false, false, 0, 600, 260, 480);
      rdList.add(rd8);
      RedBlock rd9 = new RedBlock(ball, 0.0, 460.0, 320.0, 40.0, false, false, 0, 600, 260, 480);
      rdList.add(rd9);
      BlueBlock blu0 = new BlueBlock(ball, 0.0, 560.0, 320.0, 40.0, false, false, 0, 600, 260, 480);
      bluList.add(blu0);
      coinList.add(new Coin(ball, 40, 300));
      coinList.add(new Coin(ball, 100, 300));
      coinList.add(new Coin(ball, 160, 300));
      coinList.add(new Coin(ball, 220, 300));
      coinList.add(new Coin(ball, 280, 300));
      fin.setPos(40, 540);
    }
    if (level == 23) {
      ball.setVars(40, 160, 3, "up");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 80.0, 600.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 0.0, 200.0, 260.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck1);
      BlackBlock blck2 = new BlackBlock(ball, 340.0, 200.0, 260.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck2);
      BlackBlock blck3 = new BlackBlock(ball, 60.0, 320.0, 480.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck3);
      BlackBlock blck4 = new BlackBlock(ball, 0.0, 440.0, 560.0, 80.0, false, false, 0, 600, 0, 600);
      blckList.add(blck4);
      RedBlock rd0 = new RedBlock(ball, 460.0, 460.0, 100.0, 40.0, true, false, 380, 580, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 280.0, 320.0, 40.0, 40.0, false, true, 0, 600, 240, 420);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 100.0, 200.0, 40.0, 40.0, false, true, 0, 600, 180, 300);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 460.0, 200.0, 40.0, 40.0, false, true, 0, 600, 180, 300);
      rdList.add(rd3);
      RedBlock rd4 = new RedBlock(ball, 140.0, 360.0, 40.0, 40.0, false, true, 0, 600, 340, 420);
      rdList.add(rd4);
      coinList.add(new Coin(ball, 560, 169));
      coinList.add(new Coin(ball, 300, 240));
      coinList.add(new Coin(ball, 580, 320));
      coinList.add(new Coin(ball, 20, 320));
      coinList.add(new Coin(ball, 300, 408));
      fin.setPos(480, 560);
    }
    if (level == 24) {
      ball.setVars(20, 580, 2, "down");
      RedBlock rd0 = new RedBlock(ball, 0.0, 480.0, 260.0, 60.0, false, true, 0, 600, 200, 560);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 340.0, 480.0, 260.0, 60.0, false, true, 0, 600, 200, 560);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 0.0, 100.0, 600.0, 60.0, false, false, 0, 600, 200, 560);
      rdList.add(rd2);
      BlueBlock blu0 = new BlueBlock(ball, 260.0, 360.0, 80.0, 60.0, false, true, 0, 600, 200, 560);
      bluList.add(blu0);
      coinList.add(new Coin(ball, 120, 400));
      coinList.add(new Coin(ball, 480, 400));
      coinList.add(new Coin(ball, 480, 300));
      coinList.add(new Coin(ball, 120, 300));
      fin.setPos(419, 572);
    }
    if (level == 25) {
      ball.setVars(240, 580, 2, "down");
      BlackBlock blck0 = new BlackBlock(ball, 260.0, 420.0, 80.0, 80.0, false, true, 0, 600, 200, 600);
      blckList.add(blck0);
      BlackBlock blck1 = new BlackBlock(ball, 0.0, 140.0, 600.0, 60.0, false, false, 0, 600, 200, 600);
      blckList.add(blck1);
      RedBlock rd0 = new RedBlock(ball, 0.0, 440.0, 260.0, 60.0, false, true, 0, 600, 220, 580);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 340.0, 440.0, 260.0, 60.0, false, true, 0, 600, 220, 580);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 400.0, 80.0, 100.0, 60.0, false, false, 0, 600, 200, 580);
      rdList.add(rd2);
      coinList.add(new Coin(ball, 220, 240));
      coinList.add(new Coin(ball, 380, 240));
      fin.setPos(300, 100);
    }
    if (level == 26) {
      ball.setVars(560, 380, 4, "down");
      BlackBlock blck0 = new BlackBlock(ball, 540.0, 400.0, 60.0, 60.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 0.0, 240.0, 100.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 200.0, 240.0, 100.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 400.0, 240.0, 100.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      BlueBlock blu0 = new BlueBlock(ball, 0.0, 400.0, 540.0, 60.0, false, true, 0, 600, 380, 480);
      bluList.add(blu0);
      BrownBlock brn0 = new BrownBlock(ball, 100.0, 240.0, 100.0, 60.0, false, false, 0, 600, 380, 480);
      brnList.add(brn0);
      BrownBlock brn1 = new BrownBlock(ball, 300.0, 240.0, 100.0, 60.0, false, false, 0, 600, 380, 480);
      brnList.add(brn1);
      BrownBlock brn2 = new BrownBlock(ball, 500.0, 240.0, 100.0, 60.0, false, false, 0, 600, 380, 480);
      brnList.add(brn2);
      coinList.add(new Coin(ball, 80, 380));
      coinList.add(new Coin(ball, 140, 380));
      coinList.add(new Coin(ball, 200, 380));
      coinList.add(new Coin(ball, 260, 380));
      coinList.add(new Coin(ball, 320, 380));
      coinList.add(new Coin(ball, 380, 380));
      coinList.add(new Coin(ball, 440, 380));
      coinList.add(new Coin(ball, 500, 380));
      fin.setPos(20, 380);
    }
    if (level == 27) {
      ball.setVars(300, 300, 3, "down");
      RedBlock rd0 = new RedBlock(ball, 0.0, 20.0, 600.0, 40.0, false, true, 0, 600, 0, 260);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 0.0, 540.0, 600.0, 40.0, false, true, 0, 600, 340, 600);
      rd1.currentSpeed *= -1;
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 20.0, 0.0, 40.0, 600.0, true, false, 0, 260, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 540.0, 0.0, 40.0, 600.0, true, false, 340, 600, 0, 600);
      rd3.currentSpeed *= -1;
      rdList.add(rd3);
      coinList.add(new Coin(ball, 180, 260));
      coinList.add(new Coin(ball, 420, 260));
      coinList.add(new Coin(ball, 340, 180));
      coinList.add(new Coin(ball, 260, 420));
      coinList.add(new Coin(ball, 180, 340));
      coinList.add(new Coin(ball, 260, 180));
      coinList.add(new Coin(ball, 420, 340));
      coinList.add(new Coin(ball, 340, 420));
      fin.setPos(300, 300);
    }
    if (level == 28) {
      ball.setVars(17, 305, 5, "down");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 320.0, 40.0, 40.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 0.0, 80.0, 600.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 0.0, 460.0, 600.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      BlueBlock blu0 = new BlueBlock(ball, 100.0, 180.0, 40.0, 220.0, false, true, 0, 600, 140, 460);
      bluList.add(blu0);
      BlueBlock blu1 = new BlueBlock(ball, 240.0, 180.0, 40.0, 220.0, false, true, 0, 600, 140, 460);
      bluList.add(blu1);
      BlueBlock blu2 = new BlueBlock(ball, 380.0, 180.0, 40.0, 220.0, false, true, 0, 600, 140, 460);
      bluList.add(blu2);
      BlueBlock blu3 = new BlueBlock(ball, 520.0, 180.0, 40.0, 220.0, false, true, 0, 600, 140, 460);
      bluList.add(blu3);
      coinList.add(new Coin(ball, 120, 160));
      coinList.add(new Coin(ball, 260, 440));
      coinList.add(new Coin(ball, 400, 160));
      coinList.add(new Coin(ball, 120, 440));
      coinList.add(new Coin(ball, 260, 160));
      coinList.add(new Coin(ball, 400, 440));
      coinList.add(new Coin(ball, 540, 160));
      fin.setPos(540, 440);
    }
    if (level == 29) {
      ball.setVars(300, 580, 2, "down");
      RedBlock rd0 = new RedBlock(ball, 20.0, 0.0, 40.0, 600.0, true, false, 0, 280, 0, 600);
      rd0.currentSpeed *= .7;
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 540.0, 0.0, 40.0, 600.0, true, false, 320, 600, 0, 600);
      rd1.currentSpeed *= -.7;
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 280.0, 280.0, 40.0, 40.0, false, false, 300, 600, 0, 600);
      rdList.add(rd2);
      coinList.add(new Coin(ball, 260, 400));
      coinList.add(new Coin(ball, 340, 400));
      coinList.add(new Coin(ball, 260, 200));
      coinList.add(new Coin(ball, 340, 200));
      coinList.add(new Coin(ball, 300, 140));
      fin.setPos(300, 260);
    }
    if (level == 30) {
      ball.setVars(520, 560, 2, "up");
      RedBlock rd0 = new RedBlock(ball, 140.0, 140.0, 120.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 340.0, 140.0, 120.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 140.0, 180.0, 40.0, 280.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 420.0, 180.0, 40.0, 280.0, false, false, 0, 600, 0, 600);
      rdList.add(rd3);
      RedBlock rd4 = new RedBlock(ball, 180.0, 420.0, 240.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd4);
      BlueBlock blu0 = new BlueBlock(ball, 280.0, 260.0, 40.0, 40.0, false, false, 0, 600, 0, 600);
      bluList.add(blu0);
      BrownBlock brn0 = new BrownBlock(ball, 280.0, 300.0, 40.0, 40.0, false, false, 0, 600, 0, 600);
      brnList.add(brn0);
      coinList.add(new Coin(ball, 240, 240));
      coinList.add(new Coin(ball, 369, 241));
      coinList.add(new Coin(ball, 319, 203));
      coinList.add(new Coin(ball, 369, 323));
      coinList.add(new Coin(ball, 271, 267));
      coinList.add(new Coin(ball, 247, 358));
      coinList.add(new Coin(ball, 379, 407));
      coinList.add(new Coin(ball, 326, 375));
      coinList.add(new Coin(ball, 219, 263));
      coinList.add(new Coin(ball, 242, 325));
      fin.setPos(300, 140);
    }
    if (level == 31) {
      ball.setVars(520, 180, 2, "down");
      BlackBlock blck0 = new BlackBlock(ball, 500.0, 200.0, 60.0, 400.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 0.0, 100.0, 600.0, 60.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      BrownBlock brn0 = new BrownBlock(ball, -1.0, 200.0, 500.0, 60.0, false, true, 0, 600, 180, 600);
      brnList.add(brn0);
      coinList.add(new Coin(ball, 60, 300));
      coinList.add(new Coin(ball, 100, 340));
      coinList.add(new Coin(ball, 140, 380));
      coinList.add(new Coin(ball, 180, 420));
      coinList.add(new Coin(ball, 220, 420));
      coinList.add(new Coin(ball, 260, 380));
      coinList.add(new Coin(ball, 300, 340));
      coinList.add(new Coin(ball, 340, 300));
      fin.setPos(580, 500);
    }
    if (level == 32) {
      ball.setVars(300, 100, 2, "down");
      RedBlock rd0 = new RedBlock(ball, 200.0, 160.0, 40.0, 60.0, true, false, 180, 260, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 360.0, 320.0, 40.0, 60.0, true, false, 340, 420, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 200.0, 480.0, 40.0, 120.0, true, false, 180, 260, 0, 600);
      rdList.add(rd2);
      BlueBlock blu0 = new BlueBlock(ball, 360.0, 0.0, 40.0, 160.0, true, false, 340, 420, 0, 600);
      bluList.add(blu0);
      BlueBlock blu1 = new BlueBlock(ball, 200.0, 0.0, 40.0, 160.0, true, false, 180, 260, 0, 600);
      bluList.add(blu1);
      BlueBlock blu2 = new BlueBlock(ball, 200.0, 220.0, 40.0, 100.0, true, false, 180, 260, 0, 600);
      bluList.add(blu2);
      BlueBlock blu3 = new BlueBlock(ball, 360.0, 220.0, 40.0, 100.0, true, false, 340, 420, 0, 600);
      bluList.add(blu3);
      BlueBlock blu4 = new BlueBlock(ball, 200.0, 380.0, 40.0, 100.0, true, false, 180, 260, 0, 600);
      bluList.add(blu4);
      BlueBlock blu5 = new BlueBlock(ball, 360.0, 380.0, 40.0, 100.0, true, false, 340, 420, 0, 600);
      bluList.add(blu5);
      BrownBlock brn0 = new BrownBlock(ball, 360.0, 160.0, 40.0, 60.0, true, false, 340, 420, 0, 600);
      brnList.add(brn0);
      BrownBlock brn1 = new BrownBlock(ball, 200.0, 320.0, 40.0, 60.0, true, false, 180, 260, 0, 600);
      brnList.add(brn1);
      BrownBlock brn2 = new BrownBlock(ball, 360.0, 480.0, 40.0, 120.0, true, false, 340, 420, 0, 600);
      brnList.add(brn2);
      coinList.add(new Coin(ball, 260, 300));
      coinList.add(new Coin(ball, 340, 440));
      coinList.add(new Coin(ball, 340, 160));
      coinList.add(new Coin(ball, 260, 20));
      fin.setPos(260, 580);
    }
    if (level == 33) {
      ball.setVars(300, 240, 1, "down");
      RedBlock rd0 = new RedBlock(ball, 0.0, 0.0, 40.0, 600.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 40.0, 560.0, 520.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 560.0, 0.0, 40.0, 600.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 40.0, 0.0, 520.0, 40.0, false, false, 0, 600, 0, 600);
      rdList.add(rd3);
      coinList.add(new Coin(ball, 380, 240));
      fin.setPos(300, 360);
    }
    if (level == 34) {
      ball.setVars(20, 540, 1, "down");
      RedBlock rd0 = new RedBlock(ball, -2.0, 20.0, 600.0, 40.0, false, true, 0, 600, -22, 531);
      rdList.add(rd0);
      BlueBlock blu0 = new BlueBlock(ball, 380.0, 560.0, 60.0, 40.0, false, false, 0, 600, -22, 531);
      bluList.add(blu0);
      BrownBlock brn0 = new BrownBlock(ball, 0.0, 560.0, 380.0, 40.0, false, false, 0, 600, -22, 531);
      brnList.add(brn0);
      BrownBlock brn1 = new BrownBlock(ball, 440.0, 560.0, 160.0, 40.0, false, false, 0, 600, -22, 531);
      brnList.add(brn1);
      BrownBlock brn2 = new BrownBlock(ball, 0.0, 480.0, 600.0, 40.0, false, false, 0, 600, -22, 531);
      brnList.add(brn2);
      coinList.add(new Coin(ball, 440, 540));
      coinList.add(new Coin(ball, 320, 540));
      coinList.add(new Coin(ball, 200, 540));
      fin.setPos(560, 540);
    }
    if (level == 35) {
      ball.setVars(300, 60, 1, "down");
      RedBlock rd0 = new RedBlock(ball, 230.0, 0.0, 40.0, 600.0, true, false, 210, 290, 0, 600);
      rd0.currentSpeed *= .3;
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 330.0, 0.0, 40.0, 600.0, true, false, 310, 390, 0, 600);
      rd1.currentSpeed *= .3;
      rdList.add(rd1);
      BlueBlock blu0 = new BlueBlock(ball, 270.0, 540.0, 60.0, 60.0, false, false, 320, 400, 0, 600);
      bluList.add(blu0);
      coinList.add(new Coin(ball, 300, 240));
      coinList.add(new Coin(ball, 300, 180));
      coinList.add(new Coin(ball, 300, 120));
      coinList.add(new Coin(ball, 300, 360));
      coinList.add(new Coin(ball, 300, 420));
      coinList.add(new Coin(ball, 300, 480));
      fin.setPos(300, 300);
    }
    if (level == 36) {
      ball.setVars(300, 580, 1, "down");
      RedBlock rd0 = new RedBlock(ball, 20.0, 0.0, 100.0, 600.0, true, false, 0, 285, 0, 600);
      rd0.currentSpeed *= .15;
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 480.0, 0.0, 100.0, 600.0, true, false, 315, 600, 0, 600);
      rd1.currentSpeed *= -.15;
      rdList.add(rd1);
      coinList.add(new Coin(ball, 220, 360));
      coinList.add(new Coin(ball, 380, 360));
      coinList.add(new Coin(ball, 240, 300));
      coinList.add(new Coin(ball, 360, 300));
      coinList.add(new Coin(ball, 260, 240));
      coinList.add(new Coin(ball, 340, 240));
      coinList.add(new Coin(ball, 360, 180));
      coinList.add(new Coin(ball, 240, 180));
      coinList.add(new Coin(ball, 380, 120));
      coinList.add(new Coin(ball, 220, 120));
      coinList.add(new Coin(ball, 300, 120));
      coinList.add(new Coin(ball, 300, 360));
      fin.setPos(300, 240);
    }
    if (level == 37) {
      ball.setVars(300, 460, 1, "spinning");
      RedBlock rd0 = new RedBlock(ball, 160.0, 240.0, 60.0, 140.0, false, true, 0, 600, 60, 540);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 380.0, 240.0, 60.0, 140.0, false, true, 0, 600, 60, 540);
      rd1.currentSpeed *= -1;
      rdList.add(rd1);
      BlueBlock blu0 = new BlueBlock(ball, 0.0, 0.0, 40.0, 600.0, false, false, 0, 600, 40, 560);
      bluList.add(blu0);
      BlueBlock blu1 = new BlueBlock(ball, 0.0, 560.0, 600.0, 40.0, false, false, 0, 600, 40, 560);
      bluList.add(blu1);
      BlueBlock blu2 = new BlueBlock(ball, 560.0, 0.0, 40.0, 560.0, false, false, 0, 600, 40, 560);
      bluList.add(blu2);
      BlueBlock blu3 = new BlueBlock(ball, 40.0, 0.0, 520.0, 40.0, false, false, 0, 600, 40, 560);
      bluList.add(blu3);
      coinList.add(new Coin(ball, 300, 200));
      coinList.add(new Coin(ball, 300, 400));
      fin.setPos(300, 300);
    }
    if (level == 38) {
      ball.setVars(300, 560, 10, "spinning");
      RedBlock rd0 = new RedBlock(ball, 40.0, 160.0, 40.0, 140.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 140.0, 160.0, 40.0, 140.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      RedBlock rd2 = new RedBlock(ball, 240.0, 160.0, 40.0, 140.0, false, false, 0, 600, 0, 600);
      rdList.add(rd2);
      RedBlock rd3 = new RedBlock(ball, 340.0, 160.0, 40.0, 140.0, false, false, 0, 600, 0, 600);
      rdList.add(rd3);
      RedBlock rd4 = new RedBlock(ball, 440.0, 160.0, 40.0, 140.0, false, false, 0, 600, 0, 600);
      rdList.add(rd4);
      RedBlock rd5 = new RedBlock(ball, 540.0, 160.0, 40.0, 140.0, false, false, 0, 600, 0, 600);
      rdList.add(rd5);
      BlueBlock blu0 = new BlueBlock(ball, 240.0, 380.0, 120.0, 60.0, true, false, 20, 580, 0, 600);
      bluList.add(blu0);
      BrownBlock brn0 = new BrownBlock(ball, 0.0, 100.0, 600.0, 60.0, false, false, 20, 580, 0, 600);
      brnList.add(brn0);
      coinList.add(new Coin(ball, 110, 200));
      coinList.add(new Coin(ball, 210, 200));
      coinList.add(new Coin(ball, 310, 200));
      coinList.add(new Coin(ball, 410, 200));
      coinList.add(new Coin(ball, 510, 200));
      fin.setPos(300, 360);
    }
    if (level == 39) {
      ball.setVars(300, 580, 10, "down");
      for (float i = 60; i <= width - 60; i += 60) {
        for (float j = 140; j <= height - 60; j += 60) {
          coinList.add(new Coin(ball, i, j));
        }
      }
      fin.setPos(300, 560);
    }
    if (level == 40) {
      ball.setVars(20, 300, 1, "spinning");
      BlackBlock blck0 = new BlackBlock(ball, 0.0, 320.0, 40.0, 160.0, false, false, 0, 600, 0, 600);
      blckList.add(blck0);
      RedBlock rd0 = new RedBlock(ball, 40.0, 320.0, 560.0, 160.0, false, false, 0, 600, 0, 600);
      rdList.add(rd0);
      RedBlock rd1 = new RedBlock(ball, 0.0, 110.0, 600.0, 160.0, false, false, 0, 600, 0, 600);
      rdList.add(rd1);
      fin.setPos(580, 300);
    }
    if (level == 41) {
      aLevel = false;
      showLevels = true;
      editor = false;
    }
  }
}


class MainScreen {

  Levels lvl;
  Customize cust;

  boolean intro;
  float flashX = 30;
  float introY = -100;
  boolean impactHappened = false;
  boolean sliceHappened = false;
  int introTimer = 0;

  boolean menuScreen;
  boolean levelScreen;
  boolean editor;
  boolean customizeScreen;

  var slice;
  var impact;
  boolean muted = false;

  Ball myBall;
  BlackBlock blck1;
  BlackBlock blck2;
  BlackBlock blck3;
  
  FancyButton g;

  MainScreen() {
    lvl = new Levels();
    cust = new Customize();
    slice = new Audio("Slice.wav");
    impact = new Audio("Impact.wav");
    myBall = new Ball(212, 79);
    myBall.isPlaying = true;
    myBall.lives = 1234;
    blck1 = new BlackBlock(myBall, width/2-125, height/2-140, 250, 100, false, false, 0, width, 0, height);
    blck2 = new BlackBlock(myBall, width/2-125, height/2, 250, 100, false, false, 0, width, 0, height);
    blck3 = new BlackBlock(myBall, width/2-125, height/2+140, 250, 100, false, false, 0, width, 0, height);
    blck1.c = color(255, 0);
    blck2.c = color(255, 0);
    blck3.c = color(255, 0);
    g = new FancyButton();
    setScreen("intro");
  }

  void display() {
    if (intro) {
      displayIntro();
    }
    setBallSkin();
    if (menuScreen) {
      displayMenu();
    }
    if (levelScreen) {
      lvl.display();
      if (lvl.showLevels) {
        backButton();
      }
    }
    if (editor) {
      lvl.editor = true;
      lvl.aLevel = false;
      lvl.showLevels = false;
      lvl.display();
    }
    if (customizeScreen) {
      cust.display(lvl.unlocked);
      backButton();
    }
    muteButton();
  }

  void displayIntro() {
    noStroke();
    introTimer++;
    fill(255);
    rect(0, 0, width, height);
    if (introY < height/2) {
      introY += 10;
      introTimer = 0;
    }
    if (introY >= height/2) {
      if (impactHappened == false) {
        impactHappened = true;
        if (muted == false) {
          impact.play();
        }
      }
      if (introTimer > 50) {
        flashX += 30;
        if (sliceHappened == false) {
          sliceHappened = true;
          if (muted == false) {
            slice.play();
          }
        }
      }
    }
    fill(0);
    textSize(20);
    text("a game by", width/2 - textWidth("a game by"), introY - 27);
    textSize(48);
    fill(50, 160, 230);
    text("Trevor Phillips", width/2, introY);
    textSize(14);
    fill(255, 100);
    beginShape();
    vertex(flashX, height/2+13);
    vertex(flashX + 20, height/2+13);
    vertex(flashX + 50, height/2+13 - 48);
    vertex(flashX + 30, height/2+13 - 48);
    endShape();
    beginShape();
    vertex(flashX-20, height/2+13);
    vertex(flashX - 10, height/2+13);
    vertex(flashX + 20, height/2+13 - 48);
    vertex(flashX + 10, height/2+13 - 48);
    endShape();

    if (introTimer > 130) {
      float trans = map(introTimer, 130, 230, 0, 255);
      fill(255, trans);
      rect(0, 0, width, height);
    }

    if (introTimer > 240) {
      setScreen("menuScreen");
    }
  }

  void displayMenu() {
    myBall.display();
    blck1.display();
    blck2.display();
    blck3.display();
    fill(0);
    textSize(48);
    text("Gravity Ball", width/2, 84);
    textSize(30);
    createButton(0, width/2-125, height/2-140, 250, 100, 7, "Play", color(0), color(212, 175, 55));
    createButton(1, width/2-125, height/2, 250, 100, 7, "Build Mode", color(0), color(212, 175, 55));
    createButton(2, width/2-125, height/2+140, 250, 100, 7, "Customize", color(0), color(212, 175, 55));
    textSize(14);
    fill(0);
    text("TrevPhil", 50, height-20);
  }

  void backButton() {
    createButton(3, 40, 40, 60, 30, 6, "Back", color(0), color(212, 175, 55));
  }

  void setScreen(String s) {
    if (s.equals("intro")) {
      intro = true; 
      menuScreen = false;
      levelScreen = false;
      editor = false;
      customizeScreen = false;
      myBall.isPlaying = false;
    }
    if (s.equals("menuScreen")) {
      intro = false; 
      menuScreen = true;
      levelScreen = false;
      editor = false;
      customizeScreen = false;
      myBall.isPlaying = true;
    }
    if (s.equals("levelScreen")) {
      intro = false; 
      menuScreen = false;
      levelScreen = true;
      editor = false;
      customizeScreen = false;
      myBall.isPlaying = false;
    }
    if (s.equals("editor")) {
      intro = false; 
      menuScreen = false;
      levelScreen = false;
      editor = true;
      customizeScreen = false;
      myBall.isPlaying = false;
    }
    if (s.equals("customizeScreen")) {
      intro = false; 
      menuScreen = false;
      levelScreen = false;
      editor = false;
      customizeScreen = true;
      myBall.isPlaying = false;
    }
  }

  void createButton(int i, int x, int y, int w, int h, int r, String s, color normal, color highlighted) {
    noStroke();
    g.iRect(i, x, y, w, h, r, normal, highlighted, s);
  }

  void setBallSkin() {
    myBall.useFlames = cust.choseFlames;
    myBall.usePizza = cust.chosePizza;
    myBall.useEye = cust.choseEye;
    myBall.useHoly = cust.choseHoly;
    lvl.ball.useFlames = cust.choseFlames;
    lvl.ball.usePizza = cust.chosePizza;
    lvl.ball.useEye = cust.choseEye;
    lvl.ball.useHoly = cust.choseHoly;
    lvl.bMenu.ball.useFlames = cust.choseFlames;
    lvl.bMenu.ball.usePizza = cust.chosePizza;
    lvl.bMenu.ball.useEye = cust.choseEye;
    lvl.bMenu.ball.useHoly = cust.choseHoly;
  }

  void muteButton() {
    lvl.muted = muted;
    cust.muted = muted;
    blck1.muted = muted;
    blck2.muted = muted;
    blck3.muted = muted;
    noStroke();
    fill(90, 210, 230, 170);
    beginShape();
    vertex(width-30, height-30);
    vertex(width-30, height-20);
    vertex(width-20, height-20);
    vertex(width-12, height-10);
    vertex(width-12, height-40);
    vertex(width-20, height-30);
    endShape();
    if (muted) {
      stroke(255, 0, 0);
      line(width-30, height-35, width-10, height-15);
      line(width-30, height-15, width-10, height-35);
    }
  }

  void kPressed() {
    myBall.startKeyForce();
    lvl.startKeyActions();
  }
  void kReleased() {
    myBall.stopKeyForce();
    lvl.stopKeyActions();
  }

  void mPressed() {
    if (levelScreen || editor) {
      lvl.mousePressedActions();
      if (lvl.showLevels && mouseX >= 40 && mouseX <= 100 && mouseY >= 40 && mouseY <= 70) {
        setScreen("menuScreen");
      }
    }
    if (customizeScreen && mouseX >= 40 && mouseX <= 100 && mouseY >= 40 && mouseY <= 70) {
      setScreen("menuScreen");
    }
    if (menuScreen && mouseX >= width/2-125 && mouseX <= width/2+125 && mouseY >= height/2-140 && mouseY <= height/2-40) {
      lvl.showLevels = true;
      lvl.aLevel = false;
      lvl.editor = false;
      setScreen("levelScreen");
    }
    if (menuScreen && mouseX >= width/2-125 && mouseX <= width/2+125 && mouseY >= height/2 && mouseY <= height/2+100) {
      setScreen("editor");
    }
    if (mouseX >= 220 && mouseX <= 260 && mouseY >= 40 && mouseY <= 80 && lvl.editor) {
      setScreen("menuScreen");
    }
    if (menuScreen && mouseX >= width/2-125 && mouseX <= width/2+125 && mouseY >= height/2+140 && mouseY <= height/2+240) {
      setScreen("customizeScreen");
    }
    if (customizeScreen) {
      cust.mPressed(lvl.unlocked);
    }
    if (mouseX >= width-30 && mouseX <= width-10 && mouseY >= height-40 && mouseY <= height-10) {
      if (muted) {
        muted = false;
      }
      else {
        muted = true;
      }
    }
  }
  void mReleased() {
    if (levelScreen || editor) {
      lvl.mouseReleasedActions();
    }
  }
}


class RedBlock extends BlackBlock {
  int lifeTimer = 0;
  var minusLife;

  RedBlock(Ball b, float x_, float y_, float w_, float h_) {
    super(b, x_, y_, w_, h_);
    c = color(255, 0, 0);
    minusLife = new Audio("minusLife.wav");
  }
  RedBlock(Ball b, float x_, float y_, float w_, float h_, boolean hMove, boolean vMove, float minX, float maxX, float minY, float maxY) {
    super(b, x_, y_, w_, h_, hMove, vMove, minX, maxX, minY, maxY);
    c = color(255, 0, 0);
    minusLife = new Audio("minusLife.wav");
  }

  void subLife() {
    if (lifeTimer < 5000) {
      lifeTimer++;
    }
    if (lifeTimer > 50 && (hitEdge || hitCorner) && isPlaying) {
      b.lives -= 1;
      if (muted == false) {
        minusLife.play();
      }
      lifeTimer = 0;
      b.colorTimer = 0;
      b.a = 255;
      b.b = 0;
      b.c = 0;
    }
    if (b.lives < 0) {
      b.lives = 0;
    }
  }
}

class BlueBlock extends BlackBlock {
  BlueBlock(Ball b, float x_, float y_, float w_, float h_) {
    super(b, x_, y_, w_, h_);
    c = color(0, 0, 255);
    bounceStrength = 3;
    bounceSound = new Audio("blueSound.wav");
  }
  BlueBlock(Ball b, float x_, float y_, float w_, float h_, boolean hMove, boolean vMove, float minX, float maxX, float minY, float maxY) {
    super(b, x_, y_, w_, h_, hMove, vMove, minX, maxX, minY, maxY);
    c = color(0, 0, 255);
    bounceStrength = 3;
    bounceSound = new Audio("blueSound.wav");
  }
}

class BrownBlock extends BlackBlock {
  BrownBlock(Ball b, float x_, float y_, float w_, float h_) {
    super(b, x_, y_, w_, h_);
    c =  color(190, 170, 60);
    bounceStrength = 0;
    bounceSound = new Audio("brownSound.wav");
  }
  BrownBlock(Ball b, float x_, float y_, float w_, float h_, boolean hMove, boolean vMove, float minX, float maxX, float minY, float maxY) {
    super(b, x_, y_, w_, h_, hMove, vMove, minX, maxX, minY, maxY);
    c = color(190, 170, 60);
    bounceStrength = 0;
    bounceSound = new Audio("brownSound.wav");
  }

  boolean checkEdgeCollision() {
    boolean collision = false;
    float velX = b.vel.x;
    float velY = b.vel.y;
    //  bottom of ball hits top of block
    if (b.pos.y+b.r > y && b.pos.y+b.r < y+h && b.pos.x > x && b.pos.x < x+w) {
      b.pos.y = y - b.r;
      b.vel.y *= -bounceStrength;
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
      hitHorizontal = true;
      hitVertical = false;
    }
    //  top of ball hits bottom of block
    if (b.pos.y-b.r > y && b.pos.y-b.r < y+h && b.pos.x > x && b.pos.x < x+w) {
      b.pos.y = y + h + b.r;
      b.vel.y *= -bounceStrength;
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
      hitHorizontal = true;
      hitVertical = false;
    }
    //  right side of ball hits left side of block
    if (b.pos.y > y && b.pos.y < y+h && b.pos.x+b.r > x && b.pos.x+b.r < x+w) {
      b.pos.x = x - b.r;
      b.vel.x *= -bounceStrength;
      if (hMovement) {
        b.vel.x += speed;
      }
      collision = true;
      hitHorizontal = false;
      hitVertical = true;
    }
    //  left side of ball hits right side of block
    if (b.pos.y > y && b.pos.y < y+h && b.pos.x-b.r > x && b.pos.x-b.r < x+w) {
      b.pos.x = x + w + b.r;
      b.vel.x *= -bounceStrength;
      if (hMovement) {
        b.vel.x += speed;
      }
      collision = true;
      hitHorizontal = false;
      hitVertical = true;
    }
    if (collision && hitHorizontal && abs(velY) > 1 && muted == false) {
      if (soundTimer > 2) {
        bounceSound.play();
      }
      soundTimer = 0;
    }
    if (collision && hitVertical && abs(velX) > 1 && muted == false) {
      if (soundTimer > 2) {
        bounceSound.play();
      }
      soundTimer = 0;
    }
    if (collision) {
      b.frictionScalar = -.2;
    }
    return collision;
  }

  boolean checkCornerCollision() {
    boolean collision = false;
    float temp;
    float velX = b.vel.x;
    float velY = b.vel.y;
    if (abs(b.vel.x) > abs(b.vel.y)) {
      temp = abs(b.vel.x);
    }
    else {
      temp = abs(b.vel.y);
    }
    //  upper left corner
    if (dist(b.pos.x, b.pos.y, x, y) < b.r && (b.vel.y > 1 || b.vel.x > 1)) {
      b.vel.x = b.pos.x - x;
      b.vel.y = b.pos.y - y;
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    //  upper right corner
    if (dist(b.pos.x, b.pos.y, x + w, y) < b.r && (b.vel.y > 1 || b.vel.x < -1)) {
      b.vel.x = b.pos.x - (x+w);
      b.vel.y = b.pos.y - y;
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    //  lower right corner
    if (dist(b.pos.x, b.pos.y, x + w, y + h) < b.r && (b.vel.y < -1 || b.vel.x < -1)) {
      b.vel.x = b.pos.x - (x+w);
      b.vel.y = b.pos.y - (y+h);
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    //  lower left corner
    if (dist(b.pos.x, b.pos.y, x, y + h) < b.r && (b.vel.y < -1 || b.vel.x > 1)) {
      b.vel.x = b.pos.x - x;
      b.vel.y = b.pos.y - (y+h);
      b.vel.normalize();
      b.vel.mult(temp*bounceStrength);
      if (vMovement) {
        b.vel.y += speed;
      }
      collision = true;
    }
    if (collision && sqrt(velX*velX + velY*velY) > 1.5 && muted == false) {
      if (soundTimer > 2) {
        bounceSound.play();
      }
      soundTimer = 0;
    }
    if (collision) {
      b.frictionScalar = -.2;
    }
    return collision;
  }
}



