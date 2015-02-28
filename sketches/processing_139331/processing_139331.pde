
/*
based in Daniel Shiffman Walker example + Collisions & OOP
Ohio State University, ART3001, SP14
Florence Gouvrit www.gouvrit.org
EX. 2/5 - This example is about objects (same class) as dumb agents 
(Dumb agents don't check on others or on the environment to do their thing)
*/

Walker w1;
Walker w2;
Walker w3;
Obstacle obs1;

void setup(){
  size(800,600);
  background(250);
  frameRate(20);
  
  //create objects
  w1 = new Walker();
  w2 = new Walker();
    w3 = new Walker();
  obs1 = new Obstacle();
  obs1.display();
  }

void draw() {
  if (keyPressed) 
  if (key == 'r' || key == 'R') {
  setup();
}
  
  w1.walk();
  w1.checkObst(obs1);
  w1.display();
  w2.walk();
  w2.checkObst(obs1);
  w2.display();
  w3.walk();
  w3.checkObst(obs1);
  w3.display();
  
  if (w1.intersect(w2)) { //communication between objects
  w1.inter();
  w2.inter();
  }
    if (w1.intersect(w3)) { //communication between objects
  w1.inter();
  w3.inter();
  }
      if (w2.intersect(w3)) { //communication between objects
  w2.inter();
  w3.inter();
  }
  }

class Obstacle {

  float x, y;
  float radius = 200;

  //constructor
  Obstacle() {
    x = random(700);
    y = random(500);

  }

  void display()  {
    fill(0, 200, 0);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
  }
}

class Walker {

  float x, y;
  int s;
  color c = color(random(200), 50);
  
  
  //constructor
  Walker() {
    x = random(800);
    y = random(600);
    s = 10;
      }

  void display() {
    noStroke();
    ellipse(x, y, s, s);
  }

  void walk() {
    int option = int(random(4));
    if (option == 0) {
      x = x + s;
    } else if (option == 1) {
      x = x - s;
    } else if (option == 2) {
      y = y + s;
    } else {
      y = y - s;
    }      
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  } //walk end

  void checkObst(Obstacle obs) {  // Use Object as arguments in functions
     float d = dist(x, y, obs.x, obs.y); //dist(x1, y1, x2, y2)
    if (d < (s + obs.radius))
    {          
      fill(255, 50);} else{
      fill(c);}
    }

  
    void inter() { 
    c = color(255,0,0,50);
  }
  
  
    boolean intersect(Walker w0) {   // Use Object as arguments in functions 
    float d = dist(x,y,w0.x,w0.y);    //dist(x1, y1, x2, y2)
    if (d < s*5) {         //multiplying *5 to increase possibility
      return true;
    } else {
      return false;
    }
  }
  
} //class end



