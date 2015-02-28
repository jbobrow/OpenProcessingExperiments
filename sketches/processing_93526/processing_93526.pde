
import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PFont;

public class PongDefenderV2 extends PApplet {
  double meteorSpeed = 1;
  int counter = 0;
  int slowDownTimer = 0;
  int speedUpTimer = 0;
  double speedMult = 1;
  boolean needToSlow = false;
  boolean needToSpeedUp = false;
  final int width = 300;
  final int height = 300;
  // final int[][] playerVert = {{-5, -5}, {-10, 0}, {-5, 5}, {6, 10}, {8, 8},
  // {3, 0}, {8, -8}, {6, -10}};
  final int[][] homeVert = { 
    { 
      0, -50
    }
    , { 
      35, -35
    }
    , { 
      50, 0
    }
    , { 
      35, 35
    }
    , 
    { 
      0, 50
    }
    , { 
      -35, 35
    }
    , { 
      -50, 0
    }
    , { 
      -35, -35
    }
  };
  final int[][] horzEdgeVert = { 
    { 
      -width / 2, -5
    }
    , { 
      width / 2, -5
    }
    , 
    { 
      width / 2, 5
    }
    , { 
      -width / 2, 5
    }
  };
  final int[][] vertEdgeVert = { 
    { 
      5, -height / 2
    }
    , { 
      5, height / 2
    }
    , 
    { 
      -5, height / 2
    }
    , { 
      -5, -height / 2
    }
  };
  final int[][] horzPaddleVert = { 
    { 
      -10, -1
    }
    , { 
      10, -1
    }
    , { 
      10, 1
    }
    , 
    { 
      -10, 1
    }
  };
  final int[][] vertPaddleVert = { 
    { 
      1, -10
    }
    , { 
      1, 10
    }
    , { 
      -1, 10
    }
    , 
    { 
      -1, -10
    }
  };
  final int[][] halfWayLineVert = { 
    { 
      0, 0
    }
    , { 
      width, height
    }
  };
  final int[][] slowPVert = { 
    { 
      0, 0
    }
    , { 
      -3, -5
    }
    , { 
      3, -5
    }
    , { 
      0, 0
    }
    , 
    { 
      -3, 5
    }
    , { 
      3, 5
    }
  };
  final int[][] dupVert = { 
    { 
      0, 0
    }
    , { 
      -5, 0
    }
    , {
      0, 0
    }
    , { 
      5, 0
    }
    , 
    { 
      0, 0
    }
    , { 
      0, 5
    }
    , { 
      0, 0
    }
    , { 
      0, -5
    }
    , { 
      0, 0
    }
  };
  final int[][] fastPVert = { 
    { 
      0, 1
    }
    , { 
      4, 4
    }
    , {
      -1, 1
    }
    , { 
      0, -1
    }
    , 
    { 
      -4, -4
    }
    , { 
      1, -1
    }
  };
  int p1Score;
  int p2Score;
  ArrayList<Meteor> meteors = new ArrayList();
  ArrayList<PowerUp> powerUps = new ArrayList();
  // Shape player = new Shape(playerVert);
  Shape home = new Shape(homeVert);
  Shape topEdge = new Shape(horzEdgeVert);
  Shape bottomEdge = new Shape(horzEdgeVert);
  Shape rightEdge = new Shape(vertEdgeVert);
  Shape leftEdge = new Shape(vertEdgeVert);
  Shape p1Vert = new Shape(vertPaddleVert);
  Shape p2Vert = new Shape(vertPaddleVert);
  Shape p1Horz = new Shape(horzPaddleVert);
  Shape p2Horz = new Shape(horzPaddleVert);
  Shape halfWayLine = new Shape(halfWayLineVert);
  boolean wPressed, sPressed, aPressed, dPressed, iPressed, kPressed, 
  jPressed, lPressed;
  PFont f;

  public void setup() {
    topEdge.rotate(0.00001);
    bottomEdge.rotate(0.00001);
    rightEdge.rotate(0.00001);
    leftEdge.rotate(0.00001);
    size(width, height);
    background(0);
    // player.setCenter(width/2, height/2);
    home.setCenter(width / 2, height / 2);
    topEdge.setCenter(width / 2, 0);
    bottomEdge.setCenter(width / 2, height);
    rightEdge.setCenter(width, height / 2);
    leftEdge.setCenter(0, height / 2);
    p1Vert.setCenter(width / 2 + 55, height / 2);
    p2Vert.setCenter(width / 2 - 55, height / 2);
    p1Horz.setCenter(width / 2, height / 2 - 55);
    p2Horz.setCenter(width / 2, height / 2 + 55);
    p1Vert.rotate(0.00001);
    p2Vert.rotate(0.00001);
    p1Horz.rotate(0.00001);
    p2Horz.rotate(0.00001);
    textAlign(CENTER);
    f = createFont("Arial", 16, true);
    frameRate(60);
    // shapes.add(player);
  }

  public void draw() {
    manageSpeed();
    smooth();
    background(0);
    this.stroke(240);
    textFont(f, 10);
    text("Scores: \n" + "Player 1: " + p1Score + "\n" + "Player 2: "
      + p2Score, width / 2, height / 4 * 3);
    textFont(f, 20);
    if (p1Score > p2Score) {
      fill(20, 200, 20);
    } 
    else {
      fill(200, 20, 20);
    }
    text("1", width - 30, 30);
    if (p2Score > p1Score) {
      fill(20, 200, 20);
    } 
    else {
      fill(200, 20, 20);
    }
    text("2", 30, height - 30);
    fill(255);
    displayShape(topEdge);
    displayShape(bottomEdge);
    displayShape(rightEdge);
    displayShape(leftEdge);
    displayShape(halfWayLine);
    if (meteors.size() < 2) {
      spawnMeteor((int) (Math.random() + 1));
    }
    if (powerUps.size() < 3) {
      spawnPowerUp();
    }
    for (int i = 0; i < meteors.size(); i++) {
      stroke(200);
      displayShape(meteors.get(i));
      meteors.get(i).move();
      meteors.get(i).rotate();
      for (int j = 0; j < powerUps.size(); j++) {
        if (powerUps.get(j).collision(meteors.get(i))
          || meteors.get(i).collision(powerUps.get(j))) {
          activatePuP(meteors.get(i), powerUps.get(j).getType());
          powerUps.remove(j);
        }
      }
      if (home.collision(meteors.get(i))
        || meteors.get(i).collision(home)) {
        if (meteors.get(i).getCenterX() > meteors.get(i).getCenterY()) {
          p2Score++;
        } 
        else {
          p1Score++;
        }
        meteors.remove(i);
        i--;
      } 
      else if (topEdge.collision(meteors.get(i))
        || meteors.get(i).collision(topEdge)
        || bottomEdge.collision(meteors.get(i))
        || meteors.get(i).collision(bottomEdge)
        || p1Horz.collision(meteors.get(i))
        || meteors.get(i).collision(p1Horz)
        || p2Horz.collision(meteors.get(i))
        || meteors.get(i).collision(p2Horz)) {
        meteors.get(i).setYVelocity(
        meteors.get(i).getYVelocity() * (-1));
      } 
      else if (rightEdge.collision(meteors.get(i))
        || meteors.get(i).collision(rightEdge)
        || leftEdge.collision(meteors.get(i))
        || meteors.get(i).collision(leftEdge)
        || p1Vert.collision(meteors.get(i))
        || meteors.get(i).collision(p1Vert)
        || p2Vert.collision(meteors.get(i))
        || meteors.get(i).collision(p2Vert)) {
        meteors.get(i).setXVelocity(
        meteors.get(i).getXVelocity() * (-1));
      }
      this.stroke(200, 100, 100, 255);
      displayShape(p1Vert);
      displayShape(p2Vert);
      displayShape(p1Horz);
      displayShape(p2Horz);
      this.stroke(100, 100, 255, 255);
      displayShape(home);
      if (wPressed) {
        p1Vert.setYVelocity(-2);
      }
      if (sPressed) {
        p1Vert.setYVelocity(2);
      }
      if (aPressed) {
        p1Horz.setXVelocity(-2);
      }
      if (dPressed) {
        p1Horz.setXVelocity(2);
      }

      if (iPressed) {
        p2Vert.setYVelocity(-2);
      }
      if (kPressed) {
        p2Vert.setYVelocity(2);
      }
      if (jPressed) {
        p2Horz.setXVelocity(-2);
      }
      if (lPressed) {
        p2Horz.setXVelocity(2);
      }
      if (height / 2 - 60 < p1Vert.getCenterY() + p1Vert.getYVelocity()
        && p1Vert.getCenterY() + p1Vert.getYVelocity() < height / 2 + 60) {
        p1Vert.move();
      }
      if (height / 2 - 60 < p2Vert.getCenterY() + p2Vert.getYVelocity()
        && p2Vert.getCenterY() + p2Vert.getYVelocity() < height / 2 + 60) {
        p2Vert.move();
      }
      if (width / 2 - 60 < p1Horz.getCenterX() + p1Horz.getXVelocity()
        + 1
        && p1Horz.getCenterX() + p1Horz.getXVelocity() - 1 < width / 2 + 60) {
        p1Horz.move();
      }
      if (width / 2 - 60 < p2Horz.getCenterX() + p2Horz.getXVelocity()
        && p2Horz.getCenterX() + p2Horz.getXVelocity() < width / 2 + 60) {
        p2Horz.move();
      }

      p1Vert.setYVelocity(p1Vert.getYVelocity() / 5 * 4);
      p1Horz.setXVelocity(p1Horz.getXVelocity() / 5 * 4);
      p2Vert.setYVelocity(p2Vert.getYVelocity() / 5 * 4);
      p2Horz.setXVelocity(p2Horz.getXVelocity() / 5 * 4);
    }
    for (int i = 0; i < powerUps.size(); i++) {
      displayShape(powerUps.get(i));
      powerUps.get(i).rotate();
      if (powerUps.get(i).collision(home)||home.collision(powerUps.get(i))) {
        powerUps.remove(i);
      }
    }
  }

  // player.setXVelocity(player.getXVelocity()/10*9);
  // player.setYVelocity(player.getYVelocity()/10*9);
  // player.setRotationVelocity(player.getRotationVelocity()/10*9);
  // player.rotate();
  // player.move();
  // wrap(player);
  public void keyPressed() {
    if (key == 'w') {
      wPressed = true;
    } 
    else if (key == 's') {
      sPressed = true;
    } 
    else if (key == 'a') {
      aPressed = true;
    } 
    else if (key == 'd') {
      dPressed = true;
    } 
    else if (key == 'i') {
      iPressed = true;
    } 
    else if (key == 'k') {
      kPressed = true;
    } 
    else if (key == 'j') {
      jPressed = true;
    } 
    else if (key == 'l') {
      lPressed = true;
    }
  }

  public void keyReleased() {
    if (key == 'w') {
      wPressed = false;
    } 
    else if (key == 's') {
      sPressed = false;
    } 
    else if (key == 'a') {
      aPressed = false;
    } 
    else if (key == 'd') {
      dPressed = false;
    } 
    else if (key == 'i') {
      iPressed = false;
    } 
    else if (key == 'k') {
      kPressed = false;
    } 
    else if (key == 'j') {
      jPressed = false;
    } 
    else if (key == 'l') {
      lPressed = false;
    }
  }

  public void spawnMeteor(int size) {
    int[][] meteorVert = { 
      { 
        -5 * size, -5 * size
      }
      , 
      { 
        -5 * size, 5 * size
      }
      , { 
        5 * size, 5 * size
      }
      , 
      { 
        5 * size, -5 * size
      }
    };
    Meteor meteor = new Meteor(meteorVert);
    meteor.setCenter(10 + Math.random() * (width - 20), 10 + Math.random()
      * (height - 20));
    meteor.setXVelocity((Math.random() + 1)*meteorSpeed);
    meteor.setYVelocity((Math.random() + 1)*meteorSpeed);
    meteor.setRotationVelocity(0.01 * Math.random()
      * Math.pow(-1, (int) (10 * Math.random())));
    if (slowDownTimer > 0) {
      slowDown(meteor);
    }
    if (speedUpTimer > 0) {
      speedUp(meteor);
    }
    meteors.add(meteor);
  }

  public void spawnPowerUp() {
    if (Math.random() * 100 > 90) {
      PowerUp slowP = new PowerUp(slowPVert, 1);
      slowP.setCenter(10 + Math.random() * (width - 20), 
      10 + Math.random() * (height - 20));
      slowP.setRotationVelocity(0.01 * Math.random()
        * Math.pow(-1, (int) (10 * Math.random())));
      powerUps.add(slowP);
    }
    else if (Math.random() * 100 > 80) {
      PowerUp dupP = new PowerUp(dupVert, 2);
      dupP.setCenter(10 + Math.random() * (width - 20), 
      10 + Math.random() * (height - 20));
      dupP.setRotationVelocity(0.01 * Math.random()
        * Math.pow(-1, (int) (10 * Math.random())));
      powerUps.add(dupP);
    }
    else if (Math.random() * 100 > 70) {
      PowerUp fastP = new PowerUp(fastPVert, 0);
      fastP.setCenter(10 + Math.random() * (width - 20), 
      10 + Math.random() * (height - 20));
      fastP.setRotationVelocity(0.01 * Math.random()
        * Math.pow(-1, (int) (10 * Math.random())));
      powerUps.add(fastP);
    }
  }

  public void displayShape(Shape shape) {
    double[][] c = shape.getCoords();
    double[][] d = new double[c.length][c[0].length];
    for (int j = 0; j < d.length; j++) {
      d[j][0] = c[j][0] + shape.getCenterX();
      d[j][1] = c[j][1] + shape.getCenterY();
    }
    for (int j = 0; j < d.length - 1; j++) {
      line((float) d[j][0], (float) d[j][1], (float) d[j + 1][0], 
      (float) d[j + 1][1]);
    }
    line((float) d[d.length - 1][0], (float) d[d.length - 1][1], 
    (float) d[0][0], (float) d[0][1]);
  }
  public void activatePuP(Meteor m, int t) {
    if (t == 0) {
      speedUpTimer += 200;
    }
    else if (t == 1) {
      slowDownTimer += 200;
    }
    else if (t == 2) {
      duplicate(m, (int)(Math.random() + 1));
    }
  }
  public void slowDown(Meteor m) {
    m.setXVelocity(m.getXVelocity()/2);
    m.setYVelocity(m.getYVelocity()/2);
  }

  public void duplicate(Meteor m, int size) {
    int[][] meteorVert = { 
      { 
        -5 * size, -5 * size
      }
      , 
      { 
        -5 * size, 5 * size
      }
      , { 
        5 * size, 5 * size
      }
      , 
      { 
        5 * size, -5 * size
      }
    };
    Meteor meteor = new Meteor(meteorVert);
    meteor.setCenter(m.getCenterX(), m.getCenterY());
    meteor.setXVelocity((Math.random() + 1)*meteorSpeed);
    meteor.setYVelocity((Math.random() + 1)*meteorSpeed);
    meteor.setRotationVelocity(0.01 * Math.random()
      * Math.pow(-1, (int) (10 * Math.random())));
    if (slowDownTimer > 0) {
      slowDown(meteor);
    }
    meteors.add(meteor);
  }
  public void speedUp(Meteor m) {
    m.setXVelocity(m.getXVelocity()*2);
    m.setYVelocity(m.getYVelocity()*2);
  }
  public void manageSpeed() {
    System.out.println(slowDownTimer);
    if (slowDownTimer>0) {
      slowDownTimer--;
    }
    if (speedUpTimer>0) {
      speedUpTimer--;
    }
    if (slowDownTimer > 0 && speedUpTimer <= 0) {
      if (speedMult > 0.5) {
        for (int i = 0; i < meteors.size(); i++) {
          slowDown(meteors.get(i));
        }
      }
      speedMult = 0.5;
    }
    else if (slowDownTimer <= 0 && speedUpTimer <= 0) {
      if (speedMult <= 0.5) {
        for (int i = 0; i < meteors.size(); i++) {
          speedUp(meteors.get(i));
        }
      }
      speedMult *= 2;
    }
    if (speedUpTimer > 0 && slowDownTimer <= 0) {
      if (speedMult < 2) {
        for (int i = 0; i < meteors.size(); i++) {
          speedUp(meteors.get(i));
        }
      }
      speedMult = 2;
    }
    else if (speedUpTimer <= 0 && slowDownTimer <= 0) {
      if (speedMult <= 0.5) {
        for (int i = 0; i < meteors.size(); i++) {
          slowDown(meteors.get(i));
        }
      }
      speedMult *= 0.5;
    }
  }
  public class PowerUp extends Shape {
    private int type;
    public PowerUp(int[][] coord, int t) {
      super(coord);
      type = t;
    }
    public int getType() {
      return type;
    }
  }

  public class Meteor extends Shape {
    public Meteor(int[][] coord) {
      super(coord);
    }
  }
  public class Shape {
    private double myXVelocity;
    private double myYVelocity;
    private double[][] myCoords;
    private double centerX = 0;
    private double centerY = 0;
    private double rotationVelocity = 0;
    private double direction = 0;

    public Shape(int[][] xyCoords) {
      myCoords = new double[xyCoords.length][2];
      for (int i = 0; i < xyCoords.length; i++) {
        for (int j = 0; j < xyCoords[i].length; j++) {
          myCoords[i][j] = xyCoords[i][j];
        }
      }
    }

    public boolean collision(double x, double y) {
      int vectorsHitBefore = 0;
      int vectorsHitAfter = 0;
      for (int i = 0; i < myCoords.length - 1; i++) {
        boolean vertical = false;
        boolean horizontal = false;
        double slope = (myCoords[i + 1][1] - myCoords[i][1])
          / (myCoords[i + 1][0] - myCoords[i][0]);
        if (slope == 1.0 / 0) {
          vertical = true;
        }
        double slopeInv = 1 / slope;
        if (slope == 0) {
          horizontal = true;
        }

        if (!(vertical || horizontal)) {

          double xHit = slopeInv * (y - myCoords[i + 1][1])
            + myCoords[i + 1][0];
          if (myCoords[i + 1][0] > myCoords[i][0]) {
            if (xHit > myCoords[i][0] && xHit < myCoords[i + 1][0]) {
              if (x > xHit) {
                vectorsHitBefore += 1;
              } 
              else {
                vectorsHitAfter += 1;
              }
            }
          } 
          else {
            if (xHit < myCoords[i][0] && xHit > myCoords[i + 1][0]) {
              if (x > xHit) {
                vectorsHitBefore += 1;
              } 
              else {
                vectorsHitAfter += 1;
              }
            }
          }
        } 
        else if (vertical) {
          if (myCoords[i + 1][1] > myCoords[i][1]) {
            if (y > myCoords[i][1] && y < myCoords[i + 1][1]) {
              if (x > myCoords[i][0]) {
                vectorsHitBefore += 1;
              } 
              else {
                vectorsHitAfter += 1;
              }
            }
          } 
          else {
            if (y < myCoords[i][1] && y > myCoords[i + 1][1]) {
              if (x > myCoords[i][0]) {
                vectorsHitBefore += 1;
              } 
              else {
                vectorsHitAfter += 1;
              }
            }
          }
        }
      }
      boolean vertical = false;
      boolean horizontal = false;
      double slope = (myCoords[myCoords.length - 1][1] - myCoords[0][1])
        / (myCoords[myCoords.length - 1][0] - myCoords[0][0]);
      if (slope == 1.0 / 0) {
        vertical = true;
      }
      double slopeInv = 1 / slope;
      if (slope == 0) {
        horizontal = true;
      }

      if (!(vertical || horizontal)) {
        double xHit = slopeInv * (y - myCoords[myCoords.length - 1][1])
          + myCoords[myCoords.length - 1][0];
        if (myCoords[myCoords.length - 1][0] > myCoords[0][0]) {
          if (xHit > myCoords[0][0]
            && xHit < myCoords[myCoords.length - 1][0]) {
            if (x > xHit) {
              vectorsHitBefore += 1;
            } 
            else {
              vectorsHitAfter += 1;
            }
          }
        } 
        else {
          if (xHit < myCoords[0][0]
            && xHit > myCoords[myCoords.length - 1][0]) {
            if (x > xHit) {
              vectorsHitBefore += 1;
            } 
            else {
              vectorsHitAfter += 1;
            }
          }
        }
      } 
      else if (vertical) {
        if (myCoords[myCoords.length - 1][1] > myCoords[0][1]) {
          if (y > myCoords[0][1] && y < myCoords[myCoords.length - 1][1]) {
            if (x > myCoords[0][0]) {
              vectorsHitBefore += 1;
            } 
            else {
              vectorsHitAfter += 1;
            }
          }
        } 
        else {
          if (y < myCoords[0][1] && y > myCoords[myCoords.length - 1][1]) {
            if (x > myCoords[0][0]) {
              vectorsHitBefore += 1;
            } 
            else {
              vectorsHitAfter += 1;
            }
          }
        }
      }
      if (vectorsHitBefore % 2 != 0 && vectorsHitAfter % 2 != 0) {
        return true;
      } 
      else {
        return false;
      }
    }

    public boolean collision(Shape other) {
      for (int i = 0; i < myCoords.length; i++) {
        if (other.collision(myCoords[i][0] + centerX - other.centerX, 
        myCoords[i][1] + centerY - other.centerY)) {
          return true;
        }
      }
      return false;
    }

    public void rotate(double angleChange) {
      for (int i = 0; i < myCoords.length; i++) {
        double length = Math.sqrt(Math.pow(myCoords[i][0], 2)
          + Math.pow(myCoords[i][1], 2));
        double angle = 0;
        if (myCoords[i][0] > 0) {
          angle = Math.atan((myCoords[i][1]) / (myCoords[i][0]));
        } 
        else if (myCoords[i][0] == 0) {
          if (myCoords[i][1] > 0) {
            angle = Math.PI / 2;
          } 
          else {
            angle = 3 * Math.PI / 2;
          }
        } 
        else {
          angle = Math.atan((myCoords[i][1]) / (myCoords[i][0]))
            + (Math.PI);
        }
        angle = angle + angleChange;
        myCoords[i][0] = Math.cos(angle) * length;
        myCoords[i][1] = Math.sin(angle) * length;
      }
      direction += angleChange;
      if (direction < 0) {
        direction += 2 * Math.PI;
      }
      if (direction > 2 * Math.PI) {
        direction -= 2 * Math.PI;
      }
    }

    public void setXVelocity(double speed) {
      myXVelocity = speed;
    }

    public void setYVelocity(double speed) {
      myYVelocity = speed;
    }

    public double getXVelocity() {
      return myXVelocity;
    }

    public double getYVelocity() {
      return myYVelocity;
    }

    public double getRotationVelocity() {
      return rotationVelocity;
    }
    public void setRotationVelocity(double r) {
      rotationVelocity = r;
    }
    public void rotate() {
      rotate(rotationVelocity);
    }

    public void move() {
      incrementX();
      incrementY();
    }

    public void incrementX() {
      centerX = centerX + myXVelocity;
    }

    public void incrementY() {
      centerY = centerY + myYVelocity;
    }

    public double[][] getCoords() {
      return myCoords;
    }

    public void setCenter(double c, double c2) {
      centerX = c;
      centerY = c2;
    }

    public double getCenterX() {
      return centerX;
    }

    public double getCenterY() {
      return centerY;
    }

    public double getDirection() {
      return direction;
    }
  }
}


