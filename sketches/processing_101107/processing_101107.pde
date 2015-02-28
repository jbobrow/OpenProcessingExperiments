

MyTree[] tree = new MyTree[13];
MyBird[] bird = new MyBird[10];
Cloud[] cloud = new Cloud[4];

float[] grassX = new float[400];
float[] grassY = new float[400];
float windAngle = 0;
float windoff = 0;
float windScale = .07;

void setup() {
  size(1366, 768);
  for (int i = 0; i < tree.length; i++) {
    tree[i] = new MyTree(50+i*120, height+random(50), random(10, 40));
  }
  for (int i = 0; i < bird.length; i++) {
    bird[i] = new MyBird(int(random(1, 4)));
  }
  for (int i = 0; i < cloud.length; i++) {
    cloud[i] = new Cloud();
  }
  for (int i = 0; i < grassX.length; i++) {
    grassX[i] = random(width);
  }
  for (int i = 0; i < grassY.length; i++) {
    grassY[i] = random(height-80+10, height);
  }
}

void draw() {
  if (mousePressed || keyPressed) {
    exit();
  }
  background(140, 240, 240);
  fill(170);
  text("TrevPhil", 10, 15);
  hills();
  for (int i = 0; i < cloud.length; i++) {
    cloud[i].display();
  }
  grass();
  for (int i = 0; i < tree.length; i++) {
    tree[i].display();
  }
  for (int i = 0; i < bird.length; i++) {
    bird[i].display();
  }
}

void hills() {
  noStroke();
  fill(90, 200, 85);
  beginShape();
  for (int i = 0; i < width; i++) {
    vertex(i, 10*sin(.02*i)+(height-80));
  }
  vertex(width, height);
  vertex(0, height);
  vertex(0, height-80);
  endShape();
}

void grass() {
  windoff += windScale;
  windAngle = noise(windoff)*80;
  stroke(50, 110, 30);
  strokeWeight(1);
  for (int i = 0; i < 200; i++) {
    pushMatrix();
    translate(grassX[i], grassY[i]);
    rotate(radians(-windAngle));
    line(0, 0, 0, -5);
    popMatrix();
  }
}

class MyTree {

  float theta;
  float treeBaseX;
  float treeBaseY;
  float a;
  color trunkColor = color(85, 40, 15);
  color leafColor = color(20, 140, 10);

  MyTree(float treeBaseX, float treeBaseY, float a) {
    this.treeBaseX = treeBaseX;
    this.treeBaseY = treeBaseY;
    this.a = a;
  } 

  void display() {
    theta = radians(a);
    pushMatrix();
    translate(treeBaseX, treeBaseY);
    stroke(trunkColor);
    strokeWeight(5);
    line(0, 0, 0, -120);
    translate(0, -120);
    branch(90);
    popMatrix();
  }

  void branch(float h) {
    h *= 0.66;

    if (h > 2) {
      pushMatrix();
      rotate(theta);
      //  each RGB value = initialColor + (finalColor-initialColor) * (1/h)
      stroke(85-65*(1/h), 40+100*(1/h), 15-5*(1/h));
      strokeWeight(5 - 4.9*(1/h));
      line(0, 0, 0, -h); 
      translate(0, -h);
      branch(h);
      popMatrix();

      pushMatrix();
      rotate(-theta);
      stroke(85-65*(1/h), 40+100*(1/h), 15-5*(1/h));
      strokeWeight(5 - 4.9*(1/h));
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h);
      popMatrix();
    }
  }
}

class MyBird {
  float x;
  float y;
  float flySpeed;
  boolean dir1 = true;
  float angle = 0;

  MyBird(float flySpeed) {
    x = random(0, width);
    y = random(height-200);
    this.flySpeed = flySpeed;
  }

  void display() {
    x -= flySpeed;
    if (x < -50) {
      x = random(width, width*2);
    }
    if (dir1) {
      angle += 2;
    }  
    else {
      angle -= 2;
    }
    if (angle > 30) {
      dir1 = false;
    }
    if (angle < -10) {
      dir1 = true;
    }
    strokeWeight(2);
    stroke(0);
    noFill();

    pushMatrix();
    translate(x, y);
    rotate(radians(angle));
    bezier(-15, 0, -10, -5, -5, -5, 0, 0);
    popMatrix();

    pushMatrix();
    translate(x, y);
    rotate(radians(-angle));
    bezier(0, 0, 5, -5, 10, -5, 15, 0);
    popMatrix();
  }
}

class Cloud {
  float x;
  float y;
  float randomFactor;
  float randomScaleX;
  float randomScaleY;

  Cloud() {
    x = random(width);
    y = random(height-200);
    randomFactor = random(.7, 1.3);
    randomScaleX = random(.5, 1.5);
    randomScaleY = random(.5, 1.5);
  }

  void display() {
    x -= .7;
    if (x < -200) {
      x = random(width, width*2);
      randomFactor = random(.7, 1.3);
      randomScaleX = random(.5, 1.5);
      randomScaleY = random(.5, 1.5);
    }
    noStroke();
    fill(255);
    pushMatrix();
    translate(x, y);
    scale(randomScaleX, randomScaleY);
    beginShape();
    vertex(0, -70);
    bezierVertex(-37*randomFactor, -75*randomFactor, -58*randomFactor, -58*randomFactor, -70, -30);
    bezierVertex(-122*randomFactor, -7*randomFactor, -60*randomFactor, 20*randomFactor, -47, 16);
    bezierVertex(-14*randomFactor, 38*randomFactor, 26*randomFactor, 32*randomFactor, 47, 10);
    bezierVertex(111*randomFactor, 3*randomFactor, 109*randomFactor, -40*randomFactor, 80, -60);
    bezierVertex(67*randomFactor, -100*randomFactor, 28*randomFactor, -95*randomFactor, 0, -70);
    endShape();
    popMatrix();
  }
}



