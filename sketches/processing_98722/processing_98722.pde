
import java.util.ArrayList;
ArrayList<Scope> scopes;

void setup() {
  size(500, 400);
  background(0);
  smooth();
  strokeCap(SQUARE);
  rectMode(CENTER);

  scopes = new ArrayList<Scope>();
  noCursor();
}

void draw() {
  background(0);

  Scope scope;

  cursor_display();

  for (int i = 0; i < scopes.size();i++) {
    scope = scopes.get(i);

    if (mouseButton == RIGHT) {
      scope.locking_scope();
      if (mousePressed == false) {
        scopes.remove(i);
      }
    }
    else if (mouseButton == LEFT) {
      scope.default_scope();
    }

    scope.display();
  }
}

void mousePressed() {
  float x;
  float y;

  x = mouseX;
  y = mouseY;

  if (mouseButton == LEFT) {
    scopes.add(new Scope(this, x, y));
  }
}

void cursor_display() {
  pushMatrix();
  translate(mouseX, mouseY);

  //center circle
  stroke(0, 255, 0);
  strokeWeight(2);
  noFill();
  ellipse(0, 0, 30, 30);

  //outside cross
  fill(0, 255, 0);
  noStroke();
  rect(0, -30, 3, 10);
  rect(0, 30, 3, 10);
  rect(-40, 0, 15, 3);
  rect(40, 0, 15, 3);

  //inside cross
  rect(0, 0, 3, 10);
  rect(0, 0, 10, 3);

  popMatrix();
}

class Scope {
  PApplet papplet;

  float bigarc_r = 0;
  float smallarc_r = 0;
  int bigarc_r_goal = 140;
  int smallarc_r_goal = 120;

  float theta = 0; 

  color multi_lock_color = color(255, 255, 0);
  color lock_color = color(255, 0, 0);
  color c;

  boolean bigarc_flg = false;
  boolean smallarc_flg = false;
  boolean theta_flg = false;

  float x;
  float y;

  int life;

  Scope(PApplet tmpP, float tmpX, float tmpY) {
    papplet = tmpP;
    x = tmpX;
    y = tmpY;

    life = 400;
  }

  void display() {
    papplet.pushMatrix();
    papplet.translate(x, y);

    //small arc
    papplet.noFill();
    papplet.stroke(c);
    papplet.strokeWeight(5);
    papplet.pushMatrix();
    papplet.translate(0, 0);
    papplet.rotate(theta);
    papplet.arc(0, 0, smallarc_r, smallarc_r, radians(-20), radians(20));
    papplet.arc(0, 0, smallarc_r, smallarc_r, radians(-20)+PI, radians(20)+PI);
    papplet.popMatrix();

    //big arc
    papplet.strokeWeight(10);
    papplet.arc(0, 0, bigarc_r, bigarc_r, radians(-40), radians(40));
    papplet.arc(0, 0, bigarc_r, bigarc_r, radians(-40)+PI, radians(40)+PI);

    //center circle
    papplet.strokeWeight(2);
    papplet.noFill();
    papplet.ellipse(0, 0, 30, 30);

    //outside cross
    papplet.fill(c);
    papplet.noStroke();
    papplet.rect(0, -30, 3, 10);
    papplet.rect(0, 30, 3, 10);
    papplet.rect(-40, 0, 15, 3);
    papplet.rect(40, 0, 15, 3);

    //inside cross
    papplet.rect(0, 0, 3, 10);
    papplet.rect(0, 0, 10, 3);

    papplet.popMatrix();
  } 


  void locking_scope() {
    bigarc_r += 10;
    if (bigarc_r > bigarc_r_goal) {
      bigarc_r = bigarc_r_goal;
      bigarc_flg = true;
    }

    smallarc_r += 10;
    if (smallarc_r > smallarc_r_goal) {
      smallarc_r = smallarc_r_goal;
      smallarc_flg = true;
    }

    theta+=0.25;
    if (theta > TWO_PI) {
      theta = TWO_PI;
      theta_flg  = true;
    }

    if (bigarc_flg == true && smallarc_flg == true && theta_flg == true) {
      c = color(lock_color);
    }
    else {
      c = color(multi_lock_color);
    }
  }

  void default_scope() {
    c = color(multi_lock_color);
    bigarc_r = 0;
    smallarc_r = 0;

    theta = 0;

    bigarc_flg = false;
    smallarc_flg = false;
    theta_flg = false;
  }
}
