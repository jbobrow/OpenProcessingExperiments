
PImage planet;
ArrayList Balls;
short mass, cheating;
byte h;
PFont font;

void setup(){
  size(640, 700);
  frameRate(15);
  planet = loadImage("Planet1.png");
  Balls = new ArrayList();
  mass = 1000;
  h = 80;
  font = createFont("Onyx", 12);
  cheating = 47;
  
  //Add Moon
  Balls.add(new Ball(width/2, height/2 - 301, grav(new PVector(width/2, height/2 - 301)).y*cheating,0));
  fill(150);
}

void draw(){
  background(0);

  image(planet, width/2-5, height/2-5, 10, 10);
  
    Ball a = (Ball) Balls.get(0);
    a.drawball();
    float dis = distance(a.position, new PVector(width/2, height/2));
    
  fill(200);
  ellipse(50, 50, 40, 40);
  float angle = atan2(a.position.x - width/2, a.position.y - height/2);
  fill(0);
  noStroke();
  ellipse((angle/PI)*40 + 50f, 50, 40, 40 + abs(angle)*10);
  
  stroke(200, 200, 0, 40);
  strokeWeight(2);
  for (int i = 0; i < 30; i++){
    line(i*width/30, height, i*width/30, height-30); 
  }
  strokeWeight(1);
  
   if (keyPressed){
     if (key == 'v'){
       stroke(255);
       line(width/2, height/2, a.position.x, a.position.y);
       noStroke(); 
     }
   }
}


float distance(PVector pos, PVector pos2){
  return sqrt(((pos.x-pos2.x)*(pos.x-pos2.x))+((pos.y-pos2.y)*(pos.y-pos2.y)));
}

PVector grav(PVector pos){
  PVector direction = new PVector(width/2 - pos.x, height/2 - pos.y);
  direction.normalize();
  float d = distance(pos, new PVector(width/2, height/2));
  direction.mult((mass*(mass*0.0123))/pow(d, 2));
  return direction;
}

class Ball{
  PVector position;
  PVector velocity;
  Ball(float px, float py, float vx, float vy){
    position = new PVector(px, py);
    velocity = new PVector(vx, vy);
  }
  void drawball(){
    PVector gravity = grav(position);
    PVector velgrav = velocity;
    velgrav.add(gravity);
    position.add(velgrav);
    fill(150);
    ellipse(position.x, position.y, 2.7287, 2.7827);
  }
}


