
int num= 100;

Car[] cars= new Car[num];
color[] colors= new color[num]; 
float[] xpos= new float[num];
float[] ypos= new float[num];
float[] speed= new float[num]; 

void setup() {
  size(500, 500);
  smooth();
  for (int i= 0; i<num; i++) {
    colors[i]= color(random(0, 255));
    xpos[i]= random(0, width);
    ypos[i]= random(0, height);
    speed[i]= random(0.1, 20);
    cars[i]= new Car(colors[i], xpos[i], ypos[i], speed[i]);
  }
}


void draw() {
  background(255);
  for (int i= 0; i<num; i++) {
    cars[i].move();
    cars[i].display();
  }
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c= tempC;
    xpos= tempXpos;
    ypos= tempYpos;
    xspeed= tempXspeed;
  }
  
  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    rect(xpos, ypos, 20, 10);
  }
  
  void move() {
    xpos= xpos+xspeed;
    if(xpos > width) {
      xpos=0;
    }
  }
}


