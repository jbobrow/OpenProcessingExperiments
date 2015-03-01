
player ted;
block [] cube = new block[50];
float tiltX, tiltY;
float velocity = 1.5;
boolean[] CKEYS; 
void setup() {
  size(800, 800, P3D);
  //ortho();
  ted = new player(width/2);
  for (int i = 0; i < cube.length; i++) { 
    cube[i] = new block(random(-4000, 4000), random(-4000, 4000), random(-6400));
    cube[i].size = random(300, 500);
    cube[i].c1 = random(200, 255);
    cube[i].c2 = random(20, 150);
    cube[i].c3 = random(200, 255);
    cube[i].speed = random(30, 150);
  }
  CKEYS = new boolean[255];
}

void draw() {
  background(#6ED9ED);
  noCursor();
  println(frameRate);
  camera(width/2.0+(tiltX*100), height/2.0+tiltY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, tiltX, 1, 0);
  ted.display();
  ted.thrusters();
  for (int i = 0; i < cube.length; i++) {
    cube[i].display();
    cube[i].move();
    ted.hitTest(cube[i].y, cube[i].z, cube[i].x, cube[i].size);
  }
  score();
}


void score() {
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text(frameCount, width/2, 100, 0);
}

public void keyPressed() {
  if (key == CODED && keyCode < 255) CKEYS[keyCode] = true;
}

public void keyReleased() {
  if (key == CODED && keyCode < 255) CKEYS[keyCode] = false;
}

class block {
  float x, y, z, vx, vy, size, speed, c1, c2, c3;
  block(float nx, float ny, float nz) {
    x = nx;
    y = ny;
    z = nz;
  }
  void move() {
    z += speed;
    speed += .01;
    tiltX = -vx / 300;
    tiltY = -vy / 2;
    x+=vx;
    y+=vy;
   
    if (vx >= 2) vx -= velocity;
    else if (vx <= -2) vx += velocity;
    else if (vx < 2 && vx > -2) vx = 0;

    if (vy >= 2) vy -= velocity;
    else if (vy <= -2) vy += velocity;   
    else if (vy < 2 && vy > -2) vy = 0;
    
    //   if (vx < 100 && vx > -100 && vy < 100 && vy > -100){
    if (CKEYS[RIGHT]) vx -= 3;
    if (CKEYS[LEFT]) vx += 3;
    if (CKEYS[UP]) vy += 3;
    if (CKEYS[DOWN]) vy -= 3;
    //}
    
    if (z > 800) {
      z = -6400;
      x = random(random(-4000, 4000));
      y = random(random(-4000, 4000));
    }
  }

  void display() {
    pushMatrix();
    noStroke();
    translate(x, y, z);
    fill(c1, c2, c3);
    box(size);
    popMatrix();
  }
}

class player {
  float x, y, z, health, Ohealth;
  color cage;
  float[] xpos = new float[25];
  float[] ypos = new float[25];
  float[] zpos = new float[25];
  player (float nx) {
    x = nx;
    y = 450;
    z = width-300;
    health = 15;
    Ohealth = 15;
    sphereDetail(10);
  }
  
  void hitTest(float g1, float g2, float g3, float g4) {
    if (abs(g1-y) <g4/2) {
      if (abs(g2-z) < g4/2) {
        if (abs(g3-x) < g4/2) {
          health -= 1;
          if (health < 0) {
            exit();
          }
        }
      }
    }
  }

  void thrusters() {
    pushMatrix();
    strokeWeight(2);
    stroke(255);
    translate(x-25, y, z+30);
    fill(0);
    rotateY(-tiltX);
    rotateX(tiltY/100);
    box(10);
    fill(255);
    noStroke();
    translate(0,0,3);
    sphere(4);
    popMatrix();
    pushMatrix();
    translate(x+25, y, z+30); 
    rotateY(-tiltX);
    rotateX(tiltY/100);
    strokeWeight(2);
    stroke(255);
    fill(0);
    box(10);
    translate(0,0,3);
    fill(255);
    noStroke();
    sphere(4);
    popMatrix();
    noStroke();
    for (int i = 0; i < 24; i++) {
      xpos[i] = xpos[i+1]-random(-1, 1);
      ypos[i] = ypos[i+1]- random(-1, 1);
      zpos[i] = zpos[i+1]-random(-5);
      fill(random(225, 255), random(100, 255), 0, 100);
      pushMatrix();
      ypos[i] -= tiltY/20;
      xpos[i] -= tiltX*2;
      translate(x + xpos[i]-25, y + ypos[i], z + zpos[i]+30);
      box(random(3, 5));
      translate(50, 0, 0);
      box(random(3, 5));
      popMatrix();
    }
  }
  void display() {
    pushMatrix();
    translate (x, y, z);
    stroke(255);
    fill(0);
    box(20);
    if (health < Ohealth) {
      health+=.01;
    }
    popMatrix();
    pushMatrix();
    translate(x, y-health/2+Ohealth/2, z + 10);
    fill(#F20C0C);
    noStroke();
    box(15, health, 1);
    popMatrix();
  }
}



