
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;

void setup() {
  size(300,300);
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,200,1);
  myCar3 = new Car(color(255,0,0),0,50,.5);
  myCar4 = new Car(color(0,0,255),0,250,2);
}

void draw() {
  background(49,185,76);
  
  //road
  fill(0);
  rect(0,50,600,20);
  
  //road
  fill(0);
  rect(0,200,600,20);
  
  //road
  fill(0);
  rect(0,100,600,20);
  
  //road
  fill(0);
  rect(0,250,600,20);
  
  //orange house
  fill(255,127,41);
  rect(50,150,50,30);
  
  //door 1
  fill(0);
  rect(50,158,10,15);
  
  //roof 1
  fill(14,179,198);
  rect(50,138,50,5);
  
  //yellow house
  fill(240,193,36);
  rect(160,150,50,50);
  
  //door 2
  fill(0);
  rect(160,168,10,15);
  
  //window 1
  fill(0);
  rect(150,145,8,8);
  
  //window 2
  fill(0);
  rect(170,145,8,8);
  
  //roof 2
  fill(255,127,41);
  rect(160,130,50,10);
  
  //pink house
  fill(236,68,186);
  rect(225,140,30,30);
  
  //door 3
  fill(0);
  rect(225.5,148,10,15);
  
  //roof 3
  fill(82,226,221);
  rect(225,128,30,5);
  
  //blue house
  fill(82,226,221);
  rect(265,160,30,30);
  
  //door 4
  fill(0);
  rect(265,168,10,15);
  
  //roof 4
  fill(236,68,186);
  rect(265,148,30,5);
  
  //bush 1
  fill(21,91,26);
  ellipse(100, 140, 20, 20);
  
  //bush 2
  fill(21,91,26);
  ellipse(95,165,15,15);
  
  //bush 3
  fill(21,91,26);
  ellipse(115,160,10,10);
  
  //bush 4
  fill(21,91,26);
  ellipse(215,170,10,10);
  
  //bush 5
  fill(21,91,26);
  ellipse(235,175,15,15);
  
  //bush 6
  fill(21,91,26);
  ellipse(265,130,15,15);
  
  //bush 7
  fill(21,91,26);
  ellipse(30,20,20,20);
  
  //bush 8
  fill(21,91,26);
  ellipse(60,20,10,10);
  
  //bush 9
  fill(21,91,26);
  ellipse(120,20,15,15);
  
  //bush 10
  fill(21,91,26);
  ellipse(200,20,20,20);
  
  //bush 11
  fill(21,91,26);
  ellipse(240,20,10,10);
  
  //bush 12
  fill(21,91,26);
  ellipse(50,280,20,20);
  
  //bush 13
  fill(21,91,26);
  ellipse(80,285,15,15);
  
  //lake 1
  fill(82,226,221);
  ellipse(170,300,100,40);
  
  //little lake
  fill(82,226,221);
  ellipse(250,285,40,20);
  
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
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
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

