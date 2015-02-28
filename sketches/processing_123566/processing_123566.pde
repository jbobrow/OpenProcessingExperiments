
Bus[] buses = new Bus[6];
Car[] myCar = new Car[23];
Turtle[] myTurtle = new Turtle[10];
Log[] myLog = new Log[6];
Finish[] myFinish = new Finish[6];
boolean alive = true;
float ey = 650;
float ex = 500;
int f = 4100;
//End Explosion
int a = 100;
float[] xCoord = new float[a];
float[] yCoord = new float[a];

float[] xMove = new float[a];
float [] yMove = new float [a];
int[] xpos = new int[50];
int[] ypos = new int[50];
int x = 1000;
int y = 0;
//Frog death count
int s = 675;
int u = 675;
int h = 675;
int deathtally = 0;


void setup() {
  size(1000, 700);
  //End Explosion
   for(int i = 0; i < a; i++) {
    xCoord[i] = width/2;
    yCoord [i] = height/2;
    xMove[i] += random(-5,5);
    yMove[i] += random(-5,5);
  }
  smooth();
for(int i = 0; i < 50; i++){
xpos[i] = 0; 
ypos[i] = 0; 
}

  myFinish[0] = new Finish (color(0), 45, 15); 
  myFinish[1] = new Finish(color(0), 215, 15); 
  myFinish[2] = new Finish (color(0), 405, 15); 
  myFinish[3] = new Finish (color(0), 595, 15); 
  myFinish[4] = new Finish (color(0), 785, 15); 
  myFinish[5] = new Finish (color(0), 955, 15); 



  buses[0] = new Bus (color(255, 0, 0), 0, 350, 3); 
  buses[1] = new Bus (color(255, 255, 0), 500, 350, 3); 
  buses[2] = new Bus (color(255, 0, 255), 0, 450, 2); 
  buses[3] = new Bus (color(0, 255, 0), 500, 450, 2); 
  buses[4] = new Bus (color(255, 0, 255), 0, 550, 1); 
  buses[5] = new Bus (color(255, 255, 0), 500, 550, 1); 

  myCar[0] = new Car(color(255, 0, 0), 0, 300, 2); 
  myCar[1] = new Car(color(0, 0, 255), 200, 300, 2);
  myCar[2] = new Car(color(0, 255, 0), 0, 400, 3);
  myCar[3] = new Car(color(255, 255, 0), 200, 400, 3); 
  myCar[4] = new Car(color(255, 0, 0), 0, 500, 4); 
  myCar[5]= new Car(color(0, 0, 255), 200, 500, 4);
  myCar[6] = new Car(color(0, 255, 0), 0, 600, 3);
  myCar[7] = new Car(color(255, 255, 0), 200, 600, 3); 
  myCar[8]= new Car(color(255, 255, 255), 400, 600, 3); 
  myCar[9] = new Car(color(0, 255, 0), 600, 600, 3);
  myCar[10] = new Car(color(255, 0, 0), 800, 600, 3);  
  myCar[11] = new Car(color(0, 255, 0), 400, 600, 3); 
  myCar[12] = new Car(color(255, 0, 0), 600, 600, 3); 
  myCar[13] = new Car(color(255, 255, 0), 800, 600, 3); 
  myCar[14] = new Car(color(255, 0, 0), 400, 300, 2); 
  myCar[15] = new Car(color(255, 255, 0), 600, 300, 2);
  myCar[16] = new Car(color(0, 255, 0), 800, 300, 2);
  myCar[17] = new Car(color(0, 0, 255), 400, 400, 3); 
  myCar[18] = new Car(color(255, 0, 0), 600, 400, 3); 
  myCar[19]= new Car(color(255, 255, 0), 800, 400, 3); 
  myCar[20] = new Car(color(255, 0, 0), 400, 500, 4); 
  myCar[21] = new Car(color(0, 255, 0), 600, 500, 4); 
  myCar[22] = new Car(color(255, 0, 255), 800, 500, 4); 

  myTurtle[0] = new Turtle(color(#625704), 200, 100, 2);
  myTurtle[1] = new Turtle(color(#625704), 400, 100, 2);
  myTurtle[2] = new Turtle(color(#625704), 600, 100, 2); 
  myTurtle[3] = new Turtle(color(#625704), 800, 100, 2);
  myTurtle[4] = new Turtle(color(#625704), 1000, 100, 2);
  myTurtle[5] = new Turtle(color(#625704), 200, 200, 3); 
  myTurtle[6] = new Turtle(color(#625704), 400, 200, 3);
  myTurtle[7] = new Turtle(color(#625704), 600, 200, 3);
  myTurtle[8] = new Turtle(color(#625704), 800, 200, 3); 
  myTurtle[9] = new Turtle(color(#625704), 1000, 200, 3); 

  myLog[0] = new Log(color(#C49B12), 0, 50, 2); 
  myLog[1] = new Log(color(#C49B12), 300, 50, 2);
  myLog[2] = new Log(color(#C49B12), 600, 50, 2);
  myLog[3] = new Log(color(#C49B12), 0, 150, 3); 
  myLog[4] = new Log(color(#C49B12), 300, 150, 3); 
  myLog[5] = new Log(color(#C49B12), 600, 150, 3);
}
void keyPressed() {
  if (keyCode == UP) {
    ey -= 50;
  }
  else if (keyCode == DOWN) {
    ey += 50;
  }
  if (keyCode == RIGHT) {
    ex += 50;
  }
  else if (keyCode == LEFT) {
    ex -= 50;
  }
}

void draw() {


  background(#707474);
  fill(0, 0, 255);
  rectMode(CORNER);
  rect(0, 0, width, 230);
  fill(0, 200, 0);
  rect(0, 250, width, 30);
  fill(0, 200, 0); 
  rect(0, 0, width, 20);
  fill(255);
  rect(0, 320, width, 5);
  rect(0, 370, width, 5);
  rect(0, 415, width, 5);
  rect(0, 470, width, 5);
  rect(0, 525, width, 5);
  rect(0, 575, width, 5);
  rect(0, 625, width, 5);

 

  for (int i = 0; i<6;i++) {
    buses[i].drive();
    buses[i].display();
  }
  for (int i = 0; i<23;i++) {
    myCar[i].drive();
    myCar[i].display();
  }
  for (int i = 0; i<10;i++) {
    myTurtle[i].drive();
    myTurtle[i].display();
  }
  for (int i = 0; i<6;i++) {
    myLog[i].drive();
    myLog[i].display();
  }
   for (int i = 0; i<6;i++) {
    
    myFinish[i].display();
  }
  //Finish

   for (int i = 0; i<6;i++) {
    myFinish[i].display();
    if (myFinish[i].hitTest(ex, ey)) {
      ex = 500;
      ey = 650;
      myFinish[i].c = #F50531;
      f = f- 600;
   
     
    }
  }

  for (int i = 0; i<6;i++) {
    buses[i].display();
    if (buses[i].hitTest(ex, ey)) {
      ex = 500;
      ey = 650;
    }
  }
  for (int i = 0; i<23;i++) {
    myCar[i].display();
    if (myCar[i].hitTest(ex, ey)) {
      ex = 500;
      ey = 650;
    }
  }

  
 

  
  //turtle and log hit test
  if (ey<230) {
   alive = false;
    for (int i = 0; i<10;i++) {
    myTurtle[i].display();
    if (myTurtle[i].hitTest(ex, ey)) {
      alive = true;
      ex = myTurtle[i].xpos;
   
    }
    }
    for (int i = 0; i<6;i++) {
    myLog[i].display();
    if (myLog[i].hitTest(ex, ey)) {
      alive = true;
      ex = myLog[i].xpos;
     
    }
  }

  }
  if (alive == false) {
    alive = false;
    ex = 500;
    ey = 650;
    deathtally += 1;
    alive = true;
  }
   // FROG!!!
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(ex, ey-10, 45, 5);
  rect(ex, ey+10, 45, 5);

  ellipse(ex, ey, 30, 30);
  ellipse(ex, ey-15, 20, 20);
  fill(255,0,0);
  textSize(200);
  if (f< 600){
    
    fill(0,90);   
   rectMode(CORNER);
   rect(0,0,1000,700);
   fill(255,0,0);
    text ( "YOU WIN!!!",10,f);
    stroke(255,0,0);
  strokeWeight(5);
  for (int i = 0; i < a; i++){
    point(xCoord[i], yCoord[i]);
    xCoord[i]+= xMove[i];
    yCoord[i]+= yMove[i];
    if(xCoord[i] > width || xCoord[i] <0 || yCoord[i] > height || yCoord[i] < 0)
    {
      xCoord[i] = width/2;
    yCoord [i] = height/2;
    }
    
    
  }
  for(int i = 0; i < 49; i++){
xpos[i] = xpos[i+1]; 
ypos[i] = ypos[i+1];
ypos[i] = ypos[i] -5;
xpos[i] += random(-2,2);
}
xpos[xpos.length-1] = x;
ypos[ypos.length-1] = y;
for(int i = 0; i < 50; i++){
noStroke();
fill(200+i*2,100+i*2,250+i*2);
if (mousePressed){
  fill(200+i*5,100+i*5,0+i*5);
}
ellipse(xpos[i], ypos[i], i, i);


}
x = x -2;
y = y + 5;
if (y> height){
  y = 0;
}
if (x< 0){
  x = width;
}

    
  }
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(25, s-10, 45, 5);
  rect(25, s+10, 45, 5);

  ellipse(25, s, 30, 30);
  ellipse(25, s-15, 20, 20);
  rect(75, u-10, 45, 5);
  rect(75, u+10, 45, 5);

  ellipse(75, u, 30, 30);
  ellipse(75, u-15, 20, 20);
  rect(125, h-10, 45, 5);
  rect(125, h+10, 45, 5);

  ellipse(125, h, 30, 30);
  ellipse(125, h-15, 20, 20);



  
  
  
  
}
class Bus { 
   boolean hitTest(float mx,float my){
    if (dist(xpos,ypos,mx,my) < 50)
    return true;
    else return false;
  }
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Bus(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,60,20);
    fill(0);
    rect(xpos - 15, ypos + 15,20,10);
    rect(xpos - 15, ypos - 15,20,10);
    rect(xpos + 15, ypos + 15,20,10);
    rect(xpos + 15, ypos - 15,20,10);
  }

  void drive() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
    }
  }
}
class Car { 
   boolean hitTest(float mx,float my){
    if (dist(xpos,ypos,mx,my) < 30)
    return true;
    else return false;
  }
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
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
    rect(xpos,ypos,40,20);
    fill(0);
    rect(xpos - 15, ypos + 10,10,10);
    rect(xpos - 15, ypos - 10,10,10);
    rect(xpos + 15, ypos + 10,10,10);
    rect(xpos + 15, ypos - 10,10,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
class Finish { 
   boolean hitTest(float mx,float my){
    if (dist(xpos,ypos,mx,my) < 30)
    return true;
    else return false;
  }
  color c;
  float xpos;
  float ypos;


  // The Constructor is defined with arguments.
  Finish(color tempC, float tempXpos, float tempYpos) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
   
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
 rect(xpos,ypos,30,20);
  }

  
}

class Log { 
  boolean hitTest(float mx,float my){
    if (dist(xpos,ypos,mx,my) < 50)
    return true;
    else return false;
  }
  color c;
  float xpos;
  float ypos;
  float xspeed;

  
  Log(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,100,50);
    
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
      
        
    }
  }
}

class Turtle { 
  boolean hitTest(float mx,float my){
    if (dist(xpos,ypos,mx,my) < 50)
    return true;
    else return false;
  }
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Turtle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    
    ellipseMode(CENTER);
    fill(0,255,0);
    ellipse(xpos-15,ypos-15,20,20);
     ellipse(xpos-15,ypos+15,20,20);
      ellipse(xpos+15,ypos-15,20,20);
       ellipse(xpos+15,ypos+15,20,20);
       ellipse(xpos-20, ypos,25,25);
       fill(c);
       ellipse(xpos,ypos,40,40);
  }

  void drive() {
    xpos = xpos - xspeed;
    if (xpos <0) {
      xpos = width;
    }
  }
}


