
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;
Car myCar8;
Car myCar9; 

void setup() {
  size(500,500);
  myCar1 = new Car(color(255,0,0),0,100);
  myCar2 = new Car(color(0,0,255),0,450);
  myCar3 = new Car(color(0,255,0),0,50);
  myCar4 = new Car(color(55,55,0),0,150);
  myCar5 = new Car(color(200,0,50),0,200);
  myCar6 = new Car(color(204,204,0),0,250);
  myCar7 = new Car(color(51,250,250),0,300);
  myCar8 = new Car(color(90,150,0),0,350);
  myCar9 = new Car(color(90,0,90),0,400);
}

void draw()  {
  background(50,150,255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
  myCar5.move();
  myCar5.display();
  myCar6.move();
  myCar6.display();
  myCar7.move();
  myCar7.display();
  myCar8.move();
  myCar8.display();
  myCar9.move();
  myCar9.display();
  fill(255);
  if(myCar1.xpos() > width) {
    background(255);
    text("RED WINS!",250,250);
    noLoop();
  }else if(myCar2.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar3.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar4.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar5.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar6.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar7.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar8.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }else if(myCar9.xpos() > width) {
    background(255);
    text("BLUE WINS",250,250);
    noLoop();
  }
  void keyPressed('space') {
    noLoop();
    fill(100,50);
    rect(0,0, width,height);
    fill(255);
    text("PAUSE",130,110);
    )
    void keyReleased() {
      loop();
    }
}

void display() {
  stroke(2);
  fill(c);
  rectMode(CENTER);
  ellipse(xpos,ypos-20,30,30);
  fill(102,51,0);
  rect(xpos,ypos,15,10);
 
}

void move() {
  xpos = xpos + xspeed;
  if (keyPressed('r')); {
    xpos = 0;
  }
}


class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = random(tempXspeed);
  }
