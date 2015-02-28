
Bateau bateau;
Canon canon;
Boulet boulet;
boolean shooting = false;
boolean isReady = true;
boolean touche = false;
boolean showInfos = false;

PImage background;
PFont font = createFont("Arial", 16, true);


PVector pos = new PVector(300, 300);

void setup() {
  background = loadImage("/data/background.jpg");
  size(background.width, background.height);
  textFont(font, 20);
  smooth(8);
  frameRate(60);

  bateau = new Bateau(0, 50, 35, 10);
  canon = new Canon(width/2-10, height-50, 20, 45);
}

void draw() {
  background(background);
  stroke(1);
  line(0, height-150, width, height-150);

  pushMatrix();
  if (!touche) {
    bateau.update();
    bateau.display();
  } 
  else {
    fill(255, 0, 0);
    textAlign(CENTER);
    text("COULE !!", width/2, height/3);
  }

  if (isReady && !touche) {
    fill(255, 0, 0);
    textAlign(LEFT);
    text("Prêt !", 2, 20);
  }

  canon.update();
  canon.display();

  if (shooting) {
    boulet.update();
    boulet.display();
  }

  if (showInfos) {
    displayInfos();
  }
  popMatrix();
}

void mousePressed() {
  if (!shooting && !touche) {
    boulet = new Boulet(canon.getXStart(), canon.getYStart(), 10, bateau);
    shooting = true;
    isReady = false;
  }
}

void keyPressed() {
  if (key == 'r') {
    isReady = true;
    shooting = false;
    touche = false;
  } 
  else if (key == 'f') {
    showInfos = !showInfos;
  }
  else if (key == 'v') {
    bateau.newVelocity();
  }
}

void displayInfos() {
  fill(255, 0, 0);
  textAlign(RIGHT);
  text("Frames: "+frameCount, width, 20);
  text("FPS: "+int(frameRate), width, 40);

  text("Position bateau: X: "+int(bateau.position.x)+" ## Y: "+int(bateau.position.y), width, 80);
  text("Velocité bateau: X: "+int(bateau.velocite.x)+" ## Y: "+int(bateau.velocite.y), width, 100);

  text("Angle canon: "+canon.ang, width, 140);

  if (shooting) {
    text("Position boulet: X: "+int(boulet.position.x)+" ## Y: "+int(boulet.position.y), width, 180);
    text("Velocite boulet: X: "+boulet.velocite.x+" ## Y: "+boulet.velocite.y, width, 200);
  }
}

class Bateau {
  int x;
  int y;
  int largeur;
  int hauteur;
  boolean sens = true;
  PVector position;
  PVector velocite;

  Bateau(int x_, int y_, int largeur_, int hauteur_) {
    x = x_;
    y = y_;
    largeur = largeur_;
    hauteur = hauteur_;

    position = new PVector(x, y);
    newVelocity();
  }

  void newVelocity() {
    velocite = new PVector(random(-10, 10), random(-10, 10));
  }

  void update() {

    position.add(velocite);

    if ((position.x > width-largeur) || (position.x < 0)) {
      velocite.x = velocite.x * -1;
    }
    if ((position.y+10 > height-150) || (position.y < 20)) {
      velocite.y = velocite.y * -1;
    }


    //    if (sens) {
    //      x++;
    //    } 
    //    else {
    //      x--;
    //    }
    //
    //    int i = int(random(10));
    //    if (i <= 5) {
    //      y++;
    //    } 
    //    else {
    //      y--;
    //    }
    //
    //    if (x+largeur >= width) {
    //      sens = false;
    //    } 
    //    else if (x==0) {
    //      sens = true;
    //    }
    //
    //    if (y+hauteur >=100) {
    //      y = y-50;
    //    }
  }


  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(15, 5, 107);
    noStroke();
    beginShape();
    vertex(0, 0);
    vertex(15, 0);
    vertex(15, -20);
    vertex(20, -20);
    vertex(25, -10);
    vertex(20, -10);
    vertex(20, 0);
    vertex(35, 0);
    vertex(25, 10);
    vertex(10, 10);
    endShape();
    //rect(0, 0, largeur, hauteur);
    popMatrix();
  }
}

class Boulet {
  float x;
  float y;
  int radius;
  PVector position;
  PVector velocite;

  Bateau bateau;

  Boulet(float x_, float y_, int radius_, Bateau bateau_) {
    x = x_;
    y = y_;
    radius = radius_;
    bateau = bateau_;

    position = new PVector(x, y);
    velocite = new PVector(random(-0.5, 0.5), random(-15, -5));
  }

  void update() {

    position.add(velocite);

    if (position.y < 0) {
      shooting = false;
      isReady = true;
    }

    if (isCollidingCircleRectangle(position.x, position.y, radius, bateau.position.x, bateau.position.y, bateau.largeur, bateau.hauteur)) {
      touche = true;
      shooting = false;
    }
  }


  boolean isCollidingCircleRectangle(float circleX, float circleY, float radius, float rectangleX, float rectangleY, float rectangleWidth, float rectangleHeight) {
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

    if (circleDistanceX > (rectangleWidth/2 + radius)) { 
      return false;
    }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { 
      return false;
    }

    if (circleDistanceX <= (rectangleWidth/2)) { 
      return true;
    }
    if (circleDistanceY <= (rectangleHeight/2)) { 
      return true;
    }

    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) + pow(circleDistanceY - rectangleHeight/2, 2);

    return (cornerDistance_sq <= pow(radius, 2));
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    fill(0);
    stroke(1);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
}

class Canon {
  int x;
  int y;
  float ang;
  int largeur;
  int hauteur;

  Canon(int x_, int y_, int largeur_, int hauteur_) {
    x = x_;
    y = y_;
    largeur = largeur_;
    hauteur = hauteur_;
  }

  void update() {

    ang = (PI * mouseX / largeur);

  }

  float getXStart() {
    return x+hauteur/2*cos(radians(ang));
  }

  float getYStart() {
    return y+hauteur/2*sin(radians(ang));
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(88, 41, 0);
    noStroke();
    rotate(radians(ang));
    //    beginShape();
    //    vertex(0, 0);
    //    vertex(15, 0);
    //    vertex(15, -20);
    //    vertex(30, -20);
    //    vertex(30, 0);
    //    vertex(45, 0);
    //    vertex(45, 20);
    //    vertex(0, 20);
    //    endShape();
    rectMode(CENTER);
    rect(0, 0, largeur, hauteur);
    popMatrix();
  }
}



