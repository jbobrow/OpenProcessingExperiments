
ArrayList<Human> people = new ArrayList<Human>();
ArrayList<Zombie> zombies = new ArrayList<Zombie>();
Infection[] is = new Infection[10];
int numHumans = (int)((Math.random()*10) + 10);
int numInfections = 1;
int survivalTime = 1150;
float xLoc, yLoc;
boolean gameOver, gameWin;
 
void setup() {
  size(500,500);
  background(255);
  for (int i = 0 ; i < numHumans ; i++) {
    people.add(new Human((float)(Math.random()*width), (float)(Math.random()*height)));
  }
  for (int i = 0; i < is.length; i++){
    is[i] = new Infection();
  }
  smooth();
}
 
void draw() {
  background(255);
  if (!(gameOver || gameWin)) { 
    for(int i = 0 ; i < zombies.size() ; i++) {
      if (zombies.get(i).isAlive() == true) {
        if (zombies.get(i).getSurvivalTime() > 0) {
          zombies.get(i).drawZombie();
          zombies.get(i).walk();
          zombies.get(i).checkEdges();
          zombies.get(i).display();
          for (int a  = 0 ; a < people.size() ; a++) {
            if (zombies.get(i).getZombieLoc().dist(people.get(a).getHumanLoc()) <= 11) {
              Zombie z = new Zombie(people.get(a).getHumanLoc().x, people.get(a).getHumanLoc().y);
              zombies.add(z);
              people.remove(a);
              if (people.size() == 0) {
                gameOver = false;
                gameWin = true;
                break;
              }
            }
          }
          zombies.get(i).minusSurvivalTime();
        } else {
          zombies.get(i).die();
        }
      } else {
        zombies.remove(i);
      if (zombies.size() == 0) {
        gameOver = true;
        gameWin = false;
        break;
      }
     }
    }
    for(int i = 0 ; i < people.size() ; i++) {
      if (people.size() > 0) {
        people.get(i).drawHuman();
        people.get(i).update();
        people.get(i).walk();
        people.get(i).checkEdges();
        people.get(i).display();
      } else {
        gameOver = false;
        gameWin = true;
        break;
      }
    }
    for (int i = 0 ; i < is.length ; i++) {
      is[i].infect();
    }
  } else if (!(gameWin || gameOver == false)) {
    textSize(50);
    fill(0);
    textAlign(CENTER);
    text("Game Over", height/2, width/2);
  } else if (!(gameOver != false || gameWin != true)) {
    textSize(50);
    fill(0);
    textAlign(CENTER);
    text("You Win!", height/2, width/2);
  }
}
 
void mousePressed() {
  if (numInfections > 0) {
    for (int i = 0; i < is.length; i++) {
      is[i].launch();
      numInfections--;
    }
  }
}

class Human {
  PVector humanLoc, velocity, acceleration;
   
  public Human(float x, float y) {
    humanLoc = new PVector(x, y);
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  void drawHuman() {
    pushMatrix();
    translate(humanLoc.x, humanLoc.y);
    ellipse(0, 0, 20, 20);
    fill(color(255));
    popMatrix();
  }
  
  void update() {
    acceleration = new PVector(random(-1,1),random(-1,1));
    acceleration.normalize();
    velocity.add(acceleration);
    velocity.limit(3);
    humanLoc.add(velocity);
  }
  
  public PVector getHumanLoc() {
    return humanLoc;
  }
   
  void walk() {
    humanLoc.add(velocity);
  }
   
  void checkEdges() {
    if (humanLoc.x > width) {
      humanLoc.x = width - 20;
    } else if (humanLoc.x < 0) {
      humanLoc.x = 20;
    }
    if (humanLoc.y > height) {
      humanLoc.y = height - 20;
    } else if (humanLoc.y < 0) {
      humanLoc.y = 20;
    }
  }
   
  void display() {
    stroke(0);
    fill(255);
    ellipse(humanLoc.x, humanLoc.y, 20, 20);
  } 
}
 
class Zombie {
  boolean alive = true;
  color c = color(0, 255, 0);
  PVector zombieLoc, velocity, acceleration;
  int survivalTime = 1150;
   
  public Zombie(float x, float y) {
    zombieLoc = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
  }
  
  int getSurvivalTime() {
    return survivalTime;
  }
  
  void minusSurvivalTime() {
    survivalTime--;
  }
  
  boolean isAlive() {
    return alive;
  }
  
  public PVector getZombieLoc() {
    return zombieLoc;
  }
   
  void drawZombie() {
    pushMatrix();
    translate(zombieLoc.x, zombieLoc.y);
    ellipse(0, 0, 20, 20);
    fill(c);
    popMatrix();
  } 
   
  void walk() {
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    acceleration.normalize();
    velocity.add(acceleration);
    velocity.limit(3);
    zombieLoc.add(velocity);
  }
   
  void checkEdges() {
    if (zombieLoc.x > width) {
      zombieLoc.x = width - 20;
    } else if (zombieLoc.x < 0) {
      zombieLoc.x = 20;
    }
    if (zombieLoc.y > height) {
      zombieLoc.y = height - 20;
    } else if (zombieLoc.y < 0) {
      zombieLoc.y = 20;
    }
  } 
   
  void display() {
    stroke(c);
    fill(c);
    ellipse(zombieLoc.x, zombieLoc.y, 20, 20);
  }
   
  void die() {
    alive = false;
  }
}

class Infection {
 int duration;
 color infectColor = color(0, 255, 0);
 float x, y, speed, targetX, targetY, infectTimer;
 boolean hidden = true;

 void infect() {
   if (!hidden) { 
    if (infectTimer < duration) {
      noStroke();
      strokeWeight(3);
      stroke(infectColor);
      for(int i = 0; i <= 8; i++) {
          pushMatrix();
          translate(x,y);
          point(sin(radians(i*45))*infectTimer, cos(radians(i*45))*infectTimer); //credit to Anders Fisher for the math behind drawing a firework
          PVector infectDots = new PVector(sin(radians(i*45))*infectTimer, cos(radians(i*45))*infectTimer);
          for (int a = 0 ; a < people.size() ; a++) {
              if (infectDots.dist(people.get(a).getHumanLoc()) <= 11) {
                Zombie z = new Zombie(people.get(a).getHumanLoc().x, people.get(a).getHumanLoc().y);
                people.remove(a);
                zombies.add(z);
              }
          }
          popMatrix();
       }
       infectTimer++;
    } else { 
      hidden = true;
    }
   }
 }
 void launch() {
    x = mouseX;
    y = mouseY;
    targetX = mouseX;
    targetY = mouseY;
    speed = random(3) + 3;
    duration = 250;
    hidden = false;
 }
}


