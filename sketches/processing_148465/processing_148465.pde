

ArrayList<Human> people = new ArrayList<Human>();
ArrayList<Zombie> zombies = new ArrayList<Zombie>();
Infection[] is = new Infection[10];
int numHumans = 10;
int numInfections = 1;
float xLoc, yLoc;

void setup() {
  size(500,500);
  background(255);
  for (int i = 0 ; i < numHumans ; i++) {
    people.add(new Human((float)(Math.random()*width), (float)(Math.random()*height)));
  }
  zombies.add(new Zombie((float)(Math.random()*width), (float)(Math.random()*height)));  
  for (int i = 0; i < is.length; i++){
    is[i] = new Infection();
  }
  smooth();
}

void draw() {
  background(255);
  for(Human p : people) {
    p.drawHuman();
    p.update();
    p.walk();
    p.checkEdges();
    p.display();
   
  }
  for(Zombie z : zombies) {
    z.drawZombie();
    z.update();
    z.walk();
    z.checkEdges();
    z.display();
  }
  for (int i = 0; i < is.length; i++){
    is[i].draw();
  }
}

void mouseReleased() {
  if (numInfections > 0) {
    for (int i = 0; i < is.length; i++){
      if(is[i].hidden){
        is[i].launch();
        numInfections--;
      }
    }
  }
}
 //for(Zombie z : zombies) {
   //if (alive == true) {
     //if (survivalTime > 0) {
       //survivalTime--;
     //} else {
       //z.die();
     //}
   //} else {
     //zombies.remove(z);
   //}
 //}
class Human {
  boolean infected;
  PVector humanLoc, velocity, acceleration;
  int xSpeed = 5; int ySpeed = 5;
  
  public Human(float x, float y) {
    humanLoc = new PVector(x, y);
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  public void drawHuman() {
    pushMatrix();
    translate(humanLoc.x, humanLoc.y);
    ellipse(0, 0, 20, 20);
    fill(color(255));
    popMatrix();
  }
  
  void update() {
    acceleration = new PVector(random(-1,1),random(-1,1));
    acceleration.normalize();
    acceleration.mult(random(2));
    velocity.add(acceleration);
    velocity.limit(5);
    humanLoc.add(velocity);
  }
  
  void walk() {
    int choice = int(random(2));
    if (choice == 0) {
      humanLoc.add(velocity);
    } else if (choice == 1) {
      humanLoc.sub(velocity);
    } 
  }
  
  void checkEdges() {
    if (humanLoc.x > width) {
      humanLoc.x = width-10;
    } else if (humanLoc.x < 0) {
      humanLoc.x = 10;
    }
    if (humanLoc.y > height) {
      humanLoc.y = height-10;
    } else if (humanLoc.y < 0) {
      humanLoc.y = 10;
    }
  }
  
  void display() {
    stroke(0);
    fill(255);
    ellipse(humanLoc.x, humanLoc.y, 20, 20);
  }
      
  //for (int i = 0 ; i < zombies.size() ; i++) { //run away from the closest zombie
    
  //}
  //if (infection collides with human) {
      //human turns into zombie
      //people.remove(human);
      //zombies.add(human);
  //}
}

//Zombies want to eat humans.
class Zombie {
  boolean alive = true;
  int survivalTime = 100;
  color c;
  PVector zombieLoc, velocity, acceleration;
  
  public Zombie(float x, float y) {
    c = color(0, 255, 0);
    zombieLoc = new PVector(x, y);
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  public void drawZombie() {
    pushMatrix();
    translate(zombieLoc.x, zombieLoc.y);
    ellipse(0, 0, 20, 20);
    fill(c);
    popMatrix();
  }  
  void update() {
    acceleration = new PVector(random(-1,1),random(-1,1));
    acceleration.normalize();
    acceleration.mult(random(2));
    velocity.add(acceleration);
    velocity.limit(5);
    zombieLoc.add(velocity);
  }
  
  void walk() {
    int choice = int(random(2));
    if (choice == 0) {
      zombieLoc.add(velocity);
    } else if (choice == 1) {
      zombieLoc.sub(velocity);
    } 
  }
  
  void checkEdges() {
    if (zombieLoc.x > width) {
      zombieLoc.x = width-10;
    } else if (zombieLoc.x < 0) {
      zombieLoc.x = 10;
    }
    if (zombieLoc.y > height) {
      zombieLoc.y = height-10;
    } else if (zombieLoc.y < 0) {
      zombieLoc.y = 10;
    }
  }
  
  void display() {
    stroke(c);
    fill(c);
    ellipse(zombieLoc.x, zombieLoc.y, 20, 20);
    survivalTime--;
  }
  
  public void die() {
    alive = false;
  }
  //zombieLoc.set(xLoc, yLoc); 
  //for (int i = 0 ; i < people.size() ; i++) { 
    //Human closestHuman = people.get(0);
    //float closestDistance = dist(people.get(0));
    //if (dist(people.get(i)) < closestDistance) {
      //closestDistance = dist(people.get(i));
      //closestHuman = people.get(i);
    //}  
  //}
}

class Infection {
 int infectAmount, duration;
 color infectColor = color(0,255,0);
 float x, y, oldX, oldY, ySpeed, targetX, targetY, infectTimer, infectWeight, infectAngle;
 boolean launched, exploded, hidden;
 Infection(){
    launched = false;
    exploded = false;
    hidden = true;
 }
 void draw() {
    if((launched)&&(!exploded)&&(!hidden)){
      launchMaths();
    }
    if((!launched)&&(exploded)&&(!hidden)){
      explodeMaths();
      noStroke();
      strokeWeight(infectWeight);
      stroke(infectColor);
      for(int i = 0; i < infectAmount + 1; i++){
          pushMatrix();
          translate(x,y);
          point(sin(radians(i*infectAngle))*infectTimer,cos(radians(i*infectAngle))*infectTimer);
          popMatrix();
       }
    }
 }
 void launch() {
    x = oldX = mouseX + ((random(5)*10) - 25);
    y = oldY = height;
    targetX = mouseX;
    targetY = mouseY;
    ySpeed = random(3) + 3;
    infectAmount = 8;
    infectWeight = 4;
    duration = 250;
    infectAngle = 360/infectAmount;
    launched = true;
    exploded = false;
    hidden = false;
 }
 void launchMaths() {
    oldX = x;
    oldY = y;
    if(dist(x,y,targetX,targetY) > 6){
      x += (targetX - x)/2;
      y += -ySpeed;
    }else{
      explode();
    }
 }
 void explode(){
    infectTimer = 0;
    launched = false;
    exploded = true;
    hidden = false;
 }
 void explodeMaths(){
    if(infectTimer < duration){
      infectTimer+= 0.4;
    }else{
      hide();
    }
 }
 void hide(){
    launched = false;
    exploded = false;
    hidden = true;
 }
}
//http://natureofcode.com/book/introduction/


