
Car[] cars = new Car [4];
Car[] sport = new Car[3];
Truck[] truck1 = new Truck [2];
Truck[] truck2 = new Truck [2];
Log[] logs = new Log[10];
Turtle[] yertle1 = new Turtle[8];
Turtle[] yertle2 = new Turtle[8];
SuperCar[] fastCar = new SuperCar[3];
Frog malcolm;
int lives = 3;
//Malcolm & Isiah



void setup() {
  size(400, 600);
  background(255);
  malcolm = new Frog(width/2, height-80);
  int x = 0;
  for (int i = 0; i<fastCar.length; i++) {
    fastCar[i] = new SuperCar (x, 320);
    x+=150;
  }

  x = 0;
  //code for logs
  //1st row
  logs[0] = new Log(x, 80, -1);
  logs[1] = new Log(x-150, 80, -1);
  logs[2] = new Log(x-300, 80, -1);
  //2nd row
  logs[3] = new Log(x+400, 160, 3);
  logs[4] = new Log(x+550, 160, 3);
  logs[5] = new Log(x+700, 160, 3);
  logs[6] = new Log(x+850, 160, 3);
  //3rd row
  logs[7] = new Log(x, 240, -1);
  logs[8] = new Log(x-150, 240, -1);
  logs[9] = new Log(x-300, 240, -1);

  //code for turtle
  x = 0;
  for (int i = 0; i<yertle1.length; i++) {
    yertle1[i] = new Turtle(x, 140,1 );
    yertle1[i].speed = 1;
    x+=100;
  }
  x = 0;
  for (int i = 0; i<yertle2.length; i++) {
    yertle2[i] = new Turtle(x, 220, 1);
    yertle2[i].speed = 1;
    x+=100;
  }


  //code for the cars
  x = 0;
  for (int i = 0; i<cars.length; i++) {
    cars[i] = new Car (x, 440);
    x+=125;
  }

  //code for the trucks
  x = 0;
  for (int i = 0; i<truck1.length; i++) {
    truck1[i]= new Truck (x, 480);
    truck1[i].speed = 2;
    x+=300;
  }
  x = 0;
  for (int i = 0; i<truck2.length; i++) {
    truck2[i]= new Truck (x, 360);
    truck2[i].speed = 1;
    x+=250;
  }

  //code for the sportscar
  x = -50;
  for (int i = 0; i<sport.length; i++) {
    sport[i] = new Car (x, 400);
    sport[i].speed = -3;
    x+=175;
  }
}






void draw() {
  drawfroggerBackground();
  noStroke();

  if (keyPressed && key == ' ')drawGridlines();
  for (int i = 0; i<cars.length; i++) {
    cars[i].display();
    cars[i].move();
    if (cars[i].didHitFrog(malcolm.x, malcolm.y)) {
      println("SQUISH");
      //reset frog to bottom ofww screen
      malcolm.x = width/2;
      malcolm.y = height-40;
      lives --;
    }
  }

  for (int i = 0; i<truck1.length; i++) {
    if (truck1[i].didHitFrog(malcolm.x, malcolm.y) 
      || truck2[i].didHitFrog(malcolm.x, malcolm.y)) {
      println("SQUISH");
      //reset frog to bottom ofww screen
      malcolm.x = width/2;
      malcolm.y = height-40;
      lives --;
    }
    truck1[i].display();
    truck1[i].move();
    truck2[i].display();
    truck2[i].move();
  }
  for (int i = 0; i<sport.length; i++) {
    if (sport[i].didHitFrog(malcolm.x, malcolm.y)) {
      println("SQUISH");
      //reset frog to bottom of screen
      malcolm.x = width/2;
      malcolm.y = height-40;
      lives --;
    }
    sport[i].display();
    sport[i].move();
  }
  for (int i = 0; i<fastCar.length; i++) {
    if (fastCar[i].didHitFrog(malcolm.x, malcolm.y)) {
      println("SQUISH");
      //reset frog to bottom of screen
      malcolm.x = width/2;
      malcolm.y = height-40;
      lives --;
    }
    fastCar[i].display();
    fastCar[i].move();
  }

   for (int i = 0; i<yertle1.length; i++) {
    yertle1[i].display();
    yertle1[i].move();
    yertle2[i].display();
    yertle2[i].move();
  }
   for (int i = 0; i<logs.length; i++) {
    logs[i].display();
    logs[i].move();
  }
  if ( malcolm.y < 280) {
    boolean alive = false;
    for (int i = 0; i <logs.length; i++) {
      if (logs[i].didHitFrog(malcolm.x, malcolm.y)) {
        malcolm.x += logs[i].speed;
        alive = true;
        break;
      }
    }
    if (alive == false) {
      println("Squish");
      malcolm.x = width/2;
      malcolm.y = height - 320;
    }
  }

  
  malcolm.display();
}




void drawfroggerBackground() {
  background(255);
  stroke(0);
  strokeWeight(1);
  // 2nd pavement
  fill(187, 42, 232);
  rect(0, 280, 400, 40);
  // 1st pavement
  fill(187, 42, 232);
  rect(0, 520, 400, 40);
  //water
  fill(42, 148, 232);
  rect(0, 80, 400, 200);
  //street
  fill(128, 128, 128);
  rect(0, 320, width, 200);
  //grassy end
  fill(116, 216, 83);
  rect(0, 0, 400, 80);
  //scoreboard
  fill(0);
  text("Lives: " + lives, 50, 580);
  //lilypads
  fill(0, 255, 0);
  rect(40, 40, 40, 40);
}









void drawGridlines() {
  for (int x=0; x<=width; x+=40) {
    for (int y = 0; y <= height; y+=40) {
      stroke(255, 90);
      strokeWeight(2);
      noFill();
      rect(x, y, 40, 40);
    }
  }
}

void keyPressed() {
  if (key == 'w'|| keyCode == UP) {
    malcolm.y -= 40;
  }
  if (key == 'd'|| keyCode == RIGHT) {
    malcolm.x += 40;
  }
  if (key == 'a'|| keyCode == LEFT) {
    malcolm.x -= 40;
  }
  if (key == 's'|| keyCode == DOWN) {
    malcolm.y += 40;
  }
}

class Car { 

  float x, y;
  float speed;

  color c;
  Car(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(155, 0, 0);
    speed = -1;
  }

  void display() {
    strokeWeight(1);
    fill(0);
    rect(x+10, y, 15, 15);
    rect(x+10, y+40, 15, -15);
    rect(x+45, y, -15, 15);
    rect(x+45, y+40, -15, -15);
    fill(c);
    //bod of the truck
    rect(x+5, y+5, 45, 30);
  }

  boolean didHitFrog(float fx, float fy) {
    //if the distance between fx fy which we are using for the frog
    // and the x and y coordinates of this is less than 20 SQUISH
    if (dist(x, y, fx, fy) < 30) {
      return true;
    }
    return false;
  }

  void move() {
    x = x + speed;
    if (x > width) {
      x = -100;
    }
    if(x < -100){
      x = width;
    }
  }
}

class Frog {

  float x, y;

  color c;
  Frog(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(0, 155, 0);
  }
  void display() {
    fill(c);
    stroke(0, 100, 0);
    strokeWeight(3);
    //legs
    line(x, y+15, x+40, y+15);
    line(x, y+15, x, y);
    line(x+40, y+15, x+40, y);

    //backlegs
    line(x, y+25, x+40, y+25);
    line(x, y+25, x, y+40);
    line(x+40, y+25, x+40, y+40);

    rect(x+10, y+10, 20, 20);
    fill(255, 0, 0);
    ellipse(x+25, y+10, 5, 5);
    ellipse(x+15, y+10, 5, 5);
  }
}

class Log extends Car { 

  float x, y;
  float speed;

  color c;
  Log(float nx, float ny, float nspeed) {
    super(nx, ny);
    x = nx;
    y = ny;
    c = color(124, 70, 70);
    speed = nspeed;
  }


  void display() {
    
    fill(c);
    ellipse(x, y+20, 20, 40);
    rect(x, y, 100, 40);
    ellipse(x+100, y+20, 20, 40);
  }

  void move() {
    x = x + speed;
    if (x > width) {
      x = -100;
    }
    if (x < -100) {
      x = width;
    }
  }
   boolean onaLog(float fx, float fy) {
    //if the distance between fx fy which we are using for the frog
    // and the x and y coordinates of this is less than 20 SQUISH
    if (dist(x, y, fx, fy) < 30) {
      return true;
    }
    return false;
  }
}

class SuperCar extends Car {
  
  float x, y;
  float speed;
  color c;
  
  SuperCar(float nx, float ny){
    super(nx, ny);
    x = nx;
    y = ny;
    c = color(255);
    speed = -3;
  }
  
  
  void display(){
    //front
    ellipse(x+5, y+20, 35,35);
    fill(c);
    rect(x+5, y+5, 45, 30);
    fill(255,0,0);
    rect(x+5, y+15, 15, 10);
    //wheels
    fill(0);
    rect(x+5, y, 15, 5);
    rect(x+35, y, 15,5);
    rect(x+5, y+35, 15, 5);
    rect(x+35, y+35, 15, 5);
    
  }
  void move() {
    x = x + speed;
    if (x > width) {
      x = -100;
    }
    if(x < -100){
      x = width;
    }
  }
  boolean didHitFrog(float fx, float fy) {
    //if the distance between fx fy which we are using for the frog
    // and the x and y coordinates of this is less than 20 SQUISH
    if (abs(x-fx) < 65 && abs(y-fy) < 1) {
      return true;
    }
    return false;
  }
  
}
    
class Truck extends Car {

  Truck( float nx, float ny) {
    super(nx, ny);
    x = nx;
    y = ny;   
    speed = 1;
  }


  void display() {
    //front    
    fill(0,0,255);
    rect(x+5, y+5, 75, 30);
    //bod
    fill(255,255,0);
    rect(x+5, y+5, 60, 30);
    //mirror
    fill(255,0,0);
    rect(x+75, y+5, -5, -5);
    rect(x+75, y+35, -5, 5); 
    //wheels
    fill(0);
    rect(x+5, y+5, 15, -5);
    rect(x+45, y+5, 15,-5);
    rect(x+5, y+35, 15,5);
    rect(x+45, y+35, 15, 5);
    
  }
 boolean didHitFrog(float fx, float fy) {
    //if the distance between fx fy which we are using for the frog
    // and the x and y coordinates of this is less than 20 SQUISH
    if (abs(x-fx) < 65 && abs(y-fy) < 1) {
      return true;
    }
    return false;
  }
}

class Turtle extends Log {


  Turtle(float nx, float ny, float nspeed) {
    super(nx,ny,nspeed);
    c = color(34, 137, 71);
  }


  void display() {
    fill(c);
    //head
    ellipse(x+15, y, 15, 10);
    //legs
    ellipse(x-5, y-10, 7, 10); 
    ellipse(x+10, y-10, 7, 10);
    ellipse(x-5, y+10, 7, 10);
    ellipse(x+10, y+10, 7, 10);
    //shell
    ellipse(x, y, 30, 20);
    //tail
    ellipse(x-15, y, 30, 10);
  }
  
   void move() {
    x = x + speed;
    if (x > width+80) {
      x = -100;
    }
    if (x < -100) {
      x = width;
    }
  }
}



