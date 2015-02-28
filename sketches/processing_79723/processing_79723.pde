
//PImage planet;
ArrayList Balls;
short planetmass;
byte h;
PFont font;
import peasy.*;
PeasyCam cam;
float mX, mY;
float ballmass;
int framecount;
float matrixstep;

void setup(){
  size(640, 640, P3D);
  frameRate(24);
  lights();
  cam = new PeasyCam(this, width/2, height/2, 0, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  //planet = loadImage("Planet1.png");
  Balls = new ArrayList();
  planetmass = 50;
  ballmass = 6;
  h = 80;
  font = createFont("Onyx", 12);
  mX = width/2 + 150;
  mY = height/2 - h;
  framecount = 0;
  matrixstep = 7;
}

float distance(PVector pos, PVector pos2){
  return sqrt(((pos.x-pos2.x)*(pos.x-pos2.x))+((pos.y-pos2.y)*(pos.y-pos2.y)));
}

PVector grav(PVector pos1, PVector pos2, float mass1, float mass2){
  PVector direction = new PVector(pos2.x - pos1.x, pos2.y - pos1.y);
  direction.normalize();
  float d = distance(pos1, pos2);
  direction.mult((mass1*mass2)/(d*d));
  return direction;
}

PVector grav2(PVector pos1, PVector pos2, float mass1, float mass2){
  PVector direction = new PVector(pos2.x - pos1.x, pos2.y - pos1.y);
  direction.normalize();
  float d = distance(pos1, pos2);
  if (d < 15){
    d = 12;
  }
  direction.mult((mass1*mass2)/(pow(d, 1.005)));
  return direction;
}

PVector grav_all_field(PVector pos1){
  PVector newvector = grav2(pos1, new PVector(width/2, height/2), planetmass, 1);
  for (int i = Balls.size()-1; i >= 0; i--){
    Ball a = (Ball) Balls.get(i);
    newvector.add(grav2(pos1, a.position, a.mass, 1));
  }
  return newvector;
}

PVector grav_all(PVector pos1, float mass2){
  PVector newvector = grav(pos1, new PVector(width/2, height/2), planetmass, mass2);
  for (int i = Balls.size()-1; i >= 0; i--){
    Ball a = (Ball) Balls.get(i);
    newvector.add(grav(pos1, a.position, a.mass, mass2));
  }
  return newvector;
}
  
void drawmatrix(){
      strokeWeight(.5);
  for (int px = width/2 -150; px <= width/2 + 150; px += matrixstep){
    for (int py = height/2 -150; py <= height/2 + 150; py += matrixstep){
      float dista = distance(new PVector(px, py), new PVector(width/2, height/2));
      if (dista<145){
        stroke(0, dista+110, 255-dista);
        line(px-matrixstep/2, py, 25-grav_all_field(new PVector(px-matrixstep/2, py)).mag()*100, px+matrixstep/2, py, 25-grav_all_field(new PVector(px+matrixstep/2, py)).mag()*100);
        line(px, py-matrixstep/2, 25-grav_all_field(new PVector(px, py-matrixstep/2)).mag()*100, px, py+matrixstep/2, 25-grav_all_field(new PVector(px, py+matrixstep/2)).mag()*100);
      }
    }
  }
      strokeWeight(1);
      noStroke();
}

class Ball{
  PVector position;
  PVector velocity;
  float mass;
  Ball(float px, float py, float vx, float vy, float bmass){
    position = new PVector(px, py);
    velocity = new PVector(vx/100, vy/100);
    mass = bmass;
  }
  void drawball(){
    PVector gravity = grav(position, new PVector(width/2, height/2), planetmass, mass);
    PVector velgrav = velocity;
    velgrav.add(gravity);
    position.add(velgrav);
    pushMatrix();
    translate(position.x, position.y, 0);
    sphere(mass);
    popMatrix();
  }
}

void draw(){
  background(0);
  framecount++;
  drawmatrix();
  fill(200);
  directionalLight(200, 180, 180, 0, -1, 0);
  directionalLight(150, 150, 150, 0, 0, -1);
  text("w - initial height up", 10, 10);
  text("s - initial hieght down", 10, 20);
  text("c - clear", 10, 30);
  float ds = distance(new PVector(mX, mY), new PVector(width/2, height/2 - 60));
  stroke(200*(ds/250), 100, 50);
  strokeWeight(4);
  line(width/2, height/2 - h, 0, mX, mY, 0);
  fill(150);
  noStroke();
  pushMatrix();
  translate(width/2, height/2, 0);
  sphere(50);
  popMatrix();
  for (int i = Balls.size()-1; i >= 0; i--){
    Ball a = (Ball) Balls.get(i);
    a.drawball();
    float dis = distance(a.position, new PVector(width/2, height/2));
    if ( dis < 60 || dis > 2000){
      Balls.remove(i);
    }
  }
  //saveFrame();
}

void keyPressed(){
  if (key == 'w' && h < 121){
    h++;
  }else if (key == 's' && h > 61){
    h--;
  }else if (key == 'c'){
    for (int i = Balls.size()-1; i >= 0; i--){
      Balls.remove(i);
    }
  }else if (key == 'v'){
    cam.reset();
  }else if (key == 'b'){
    Balls.add(new Ball(width/2, height/2 - h, mX - width/2, mY - (height/2 - h), ballmass));
  }else if (key == 'r'){
    if (ballmass < 20){
      ballmass++;
    }
  }else if (key == 'f'){
      if (ballmass > 2){
        ballmass--;
      }
    }else if (key == 't'){
      matrixstep++;
    }else if (key == 'g'){
      if (matrixstep>2){
        matrixstep--;
      }
    }
  if (key == CODED){
    if (keyCode == UP){
      mY++;
    }else if (keyCode == DOWN){
      mY--;
    }else if (keyCode == RIGHT){
      mX++;
    }else if (keyCode == LEFT){
      mX--;
    }
  }
}



