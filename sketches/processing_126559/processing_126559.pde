
ArrayList Clouds;

int cloudsize = 7;
int thickness = 10;

int m = 0;
int f = 410;
int l = 0;

void setup() {
  size(800, 450);
  Clouds = new ArrayList();
  frameRate(30);
}

void draw() {
  background(0);

  ellipseMode(CENTER);
  fill(125);
  ellipse(400, 600, 1600, 500);
  stroke(0);

  fill(255);
  ellipse(200, 140, 70, 90);
  ellipse(200, 300, 200+0.1*m, 250);

  fill(0); 
  ellipse(180, 130, 5, 5);
  ellipse(220, 130, 5, 5);

  fill(255, 170, 100);
  rectMode(CENTER);
  rect(245, 160, 25, 10);
  fill(255);
  rect(280, 160, 60, 10);

  stroke(0);
  line(180, -0.05*m+150, 200, 165+0.05*m);
  line(220, -0.05*m+150, 200, 165+0.05*m);

  line(190, 340, 210, 350);
  line(210, 340, 190, 350);

  fill(100); 
  rect(240, f, 20, 40); 
  rect(160, f, 20, 40);

  stroke(200, 50, 50);
  fill(200-0.5*l, 100-0.25*l, 100-0.25*l);
  ellipse(165, 250, 50, 100);
  ellipse(235, 250, 50, 100);
  noStroke();
  fill(255);
  triangle(200, 180, 160, 330, 240, 330);
  fill(200, 100, 100);
  rect(200, 200, 10, 40);
  rect(200, 220, 40, 10);

  noStroke();
  fill(100, 255, 50);
  rect(mouseX, mouseY+10, 10, 20);
  fill(255, 50, 50);
  ellipseMode(CENTER);
  ellipse(mouseX-2, mouseY-9, 8, 20);
  fill(255, 100, 50);
  ellipse(mouseX-2, mouseY-6, 5, 12);

  for (int i = Clouds.size() - 1 ; i >= 0; i--) {
    cloud newcloud = (cloud) Clouds.get(i);

    newcloud.display();
    newcloud.move();
    newcloud.die();
    if (newcloud.life < 0) {
      Clouds.remove(i);
    }
  }

  if (mousePressed && (mouseButton == LEFT) && mouseX<320 && mouseX >300 && mouseY<180 && mouseY>160) {
    fill(255, 30, 30);
    rect(310, 160, 5, 10);
    Clouds.add(new cloud(400, 165));
    l = l + 1;
    l = constrain(l, 0, 320);
    m = m - 1;
    m = constrain(m, -300, 0);
  }
}

void keyPressed() {
  if (key == 'r') {
    l = 0;
    m = 0;
  }
}

class cloud {
  float xpos;
  float ypos;
  float life = 200;
  float opac;

  cloud(float x, float y) {
    xpos = x;
    ypos = y;
  }
  void display() {
    pushMatrix();
    translate(xpos - 70, ypos);
    bigcloud();
    bigcloud();
    bigcloud();
    popMatrix();
  }

  void move() {
    xpos = xpos + 1.5;
    ypos = ypos + random(-3, 2);
  }
  void die() {
    life= life - 1;
    if (life<100) {
      opac = opac + 1;
    }
  }

  void bigcloud() {
    pushMatrix();
    cloud();
    cloud();
    cloud();
    popMatrix();
  }

  void cloud() {
    pushMatrix();
    fill(255, random(50, 100) - opac);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize, cloudsize);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize - 5, cloudsize - 2);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize - 10, cloudsize - 5);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize + 5, cloudsize + 2);
    ellipse(random(-thickness - 10, thickness), random(-thickness, thickness), cloudsize + 10, cloudsize + 5);
    popMatrix();
  }
}



