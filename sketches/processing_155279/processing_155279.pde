
PImage planet;
ArrayList Balls;
short mass;
byte h;
PFont font;


void setup(){
  size(640, 640);
  frameRate(60);
  planet = loadImage("Planet1.png");
  Balls = new ArrayList();
  mass = 400;
  h = 80;
  font = createFont("Onyx", 12);
}

float distance(PVector pos, PVector pos2){
  return sqrt(((pos.x-pos2.x)*(pos.x-pos2.x))+((pos.y-pos2.y)*(pos.y-pos2.y)));
}

PVector grav(PVector pos){
  PVector direction = new PVector(width/2 - pos.x, height/2 - pos.y);
  direction.normalize();
  float d = distance(pos, new PVector(width/2, height/2));
  direction.mult(mass/(d*d));
  return direction;
}
  

class Ball{
  PVector position;
  PVector velocity;
  Ball(float px, float py, float vx, float vy){
    position = new PVector(px, py);
    velocity = new PVector(vx/100, vy/100);
  }
  void drawball(){
    PVector gravity = grav(position);
    PVector velgrav = velocity;
    velgrav.add(gravity);
    position.add(velgrav);
    ellipse(position.x, position.y, 10, 10);
  }
}

void draw(){
  background(0);
  text("w - initial height up", 10, 10);
  text("s - initial hieght down", 10, 20);
  text("c - clear", 10, 30);
  float ds = distance(new PVector(mouseX, mouseY), new PVector(width/2, height/2 - 60));
  stroke(200*(ds/250), 100, 50);
  strokeWeight(4);
  line(width/2, height/2 - h, mouseX, mouseY);
  fill(150);
  noStroke();
  image(planet, width/2-60, height/2-60);
  for (int i = Balls.size()-1; i >= 0; i--){
    Ball a = (Ball) Balls.get(i);
    a.drawball();
    float dis = distance(a.position, new PVector(width/2, height/2));
    if ( dis < 60 || dis > 2000){
      Balls.remove(i);
    }
  }
}

void mousePressed(){
  Balls.add(new Ball(width/2, height/2 - h, mouseX - width/2, mouseY - (height/2 - h)));
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
  }
}



