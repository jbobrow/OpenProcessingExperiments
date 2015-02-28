
/*
City Streets Simulator
Code by Maddy Nakada
Class coding based on coding by Ms. Freed
Thank you to Paul Nakada for assistance with arrays and debugging

Project Description
This video was my inspiration for this project: http://www.youtube.com/watch?v=Kk8yzuUyk9c
    At first, it appears to be a normal car just driving down the street. However, it is actually one of thousands of model cars in a model city in Germany. All of the cars in the video could fit in the palm of your hand. Furthermore, the cars are not remote control. They are all programmed to stay on the streets, stop at stoplights, and not hit each other.
    The goal of my program was to create a city street simulation very similar to this. I have cars that drive on the streets and for the most part, don’t hit each other. They turn at intersections, make u-turns to stay on the map, and even have different speeds.

Citations:
    Parts of the Ms. Freed’s “Swimmy the Fish” code was used in this program.
    Thank you to Paul Nakada for helping me to troubleshoot and debug the program.


*/

int blockSize;
int median;
int roadSize;
float random;
int turn;
int RIGHT = 0;
int LEFT = 1;
int UP = 2;
int DOWN = 3;
Car car;

//creates an array containing 5 cars
Car[] cars=new Car[5];

void setup() {
  size(500, 500);
  frameRate(30);
  setting();
  blockSize=width/5-width/25;
  //creates i (in this case 5) number of cars
  for (int i=1; i<cars.length; i++) {
    int locX=i;
    int locY=i;
    cars[i]=new Car(i, locX*(blockSize+roadSize), locY*(blockSize+roadSize));
  }
}


//this function actually displays everything on the screen
void draw() {
  //setting draws the background ie. city blocks, medians, etc.
  setting();
  //this for loop is used to make each car move
  for (int turn=1; turn<cars.length; turn++) {
    car = cars[turn];
    //checks to see if the car is at an intersection
    int xrem = car.x%(median+10);
    int yrem = car.y%(median+10);
    if (turn==0) {
      println("x remaidner "+xrem+ " y remainder" + yrem, car.dir, car.vertical);
    }

    Uturn();
   // collision();

      //if the car is at an intersection, has not just made a turn,
    //and is going horizontal it will do this
    if (!car.vertical && xrem == 0) {
      //it tells the car to wait before it turns again, and that
      //the direction it is going in is now vertical
      int randomX=int(random(4));
      if (randomX==0) {
        car.driveUp();
        car.vertical=true;
      }
      else if (randomX==1) {
        car.driveDown();
        car.vertical=true;
      } 
      else if (randomX==2) {
        car.driveLeft();
        car.vertical=false;
      }
      else if (randomX==3) {
        car.driveRight();
        car.vertical=false;
      }
    }
    //if the car is at an intersection, has not just made a turn,
    //and is going vertical it will do this
    else if (car.vertical && yrem ==0) {
      int randomX=int(random(4));
      if (randomX==0) {
        car.driveUp();
        car.vertical=true;
      }
      else if (randomX==1) {
        car.driveDown();
        car.vertical=true;
      } 
      else if (randomX==2) {
        car.driveLeft();
        car.vertical=false;
      }
      else if (randomX==3) {
        car.driveRight();
        car.vertical=false;
      }
    }
    //if not at intersection, it will continue driving straight
    else if (car.dir==0) {
      cars[turn].driveLeft();
    }
    else if (car.dir==1) {
      cars[turn].driveRight();
    }
    else if (car.dir==2) {
      cars[turn].driveUp();
    }
    else if (car.dir==3) {
      cars[turn].driveDown();
    }
  }
}


//creates grid
void setting() {
  background(50, 50, 50);

  for (float across=0; across<5; across=across+1) {
    median=blockSize+10;
    roadSize = blockSize+20;
    for (float times=0; times<width; times=times+width/5) {
      fill(192, 192, 192);
      rect(across*width/5, times, blockSize, blockSize);
      stroke(255, 255, 0);
      line((across+1)*median+across*10, times, (across+1)*median+across*10, times+blockSize); 
      line(times, (across+1)*median+across*10, times+blockSize, (across+1)*median+across*10);
      stroke(0);
    }
  }
}

//if the car is near the end of the map it will slow down,
// and when it reaches the end, it will make a u-turn it will make a u-turn

void Uturn() {
  if (car.x<=10 && car.dir==0) {
    car.speed=1;
    if (car.x==1) {
      car.dir=1;
      car.driveRight();
      car.speed=car.saveSpeed;
    }
  }
  else if (car.x>=490 && car.dir==1) {
    car.speed=1;
    if (car.x==499) {
      car.dir=0;
      car.driveLeft();
      car.speed=car.saveSpeed;
    }
  }
  else if (car.y<=10 && car.dir==2) {
    car.speed=1;
    if (car.y==1) {
      car.dir=3;
      car.driveDown();
      car.speed=car.saveSpeed;
    }
  }
  else if (car.y>=490 && car.dir==3) {
    car.speed=1;
    if (car.y==499) {
      car.dir=2;
      car.driveUp();
      car.speed=car.saveSpeed;
    }
  }
}

/*
void collision() {
  if (car.dir==2) {
    for (int a=1;a<cars.length; a++) {
      int distanceY=abs(car.y-cars[a].y);
      int distanceX=abs(car.x-cars[a].y);
      if(distanceX<3 && distanceX>2 && distanceY<3 && distanceY>2) {
        car.dir=3;
      }
    }
  }
  else if (car.dir==3) {
    for (int a=1;a<cars.length; a++) {
      int distanceY=abs(car.y-cars[a].y);
      int distanceX=abs(car.x-cars[a].y);
      if (distanceX<3 && distanceX>2 && distanceY<3 && distanceY>2) {
        car.dir=2;
      }
    }
  }else if (car.dir==0) {
    for (int a=1;a<cars.length; a++) {
      int distanceY=abs(car.y-cars[a].y);
      int distanceX=abs(car.x-cars[a].y);
      if (distanceX<3 && distanceX>2 && distanceY<3 && distanceY>2) {
        car.dir=1;
      }
    }
  }else if (car.dir==1) {
    for (int a=1;a<cars.length; a++) {
      int distanceY=abs(car.y-cars[a].y);
      int distanceX=abs(car.x-cars[a].y);
      if (distanceX<3 && distanceX>2 && distanceY<3 && distanceY>2) {
        car.dir=0;
      }
    }
  }
}
*/

class Car {
  int x;
  int y;
  int dir;
  boolean vertical;
  int id;
  int speed;
  int saveSpeed;

//creates the object, car which has a location, a direction, and a speed
  Car(int idnum, int tempX, int tempY) {
    id = idnum;
    x=tempX;
    y=tempY;
    vertical = false;
    dir = 1;
    speed = int(random(3))+1;
    saveSpeed=speed;
  }
  
  //displays the car
  void display(int CenterX, int CenterY) {
    fill(id*40, 0, 0);
    rect(CenterX, CenterY, 8, 12, 3);
    fill(255);
    rect(CenterX+2, CenterY+2, 4, 3);
  }
  
  //basic function to drive horizontally
  void driveX(int pixels) {
    x+=pixels;
  }
  
  //basic function to drive vertically
  void driveY(int pixels) {
    y-=pixels;
  }

  //makes the car drive upwards on the right side of the street
  void driveUp() {
    display(x-8,y-12);
    driveY(speed);
    dir = 2;
  }
  
  //makes the car drive downwards on the left side (its right) of the street
  void driveRight() {
    pushMatrix();
    translate(x+4, y-6);
    rotate(PI/2.0);
    display(-3, 0);
    popMatrix();
    driveX(speed);
    dir = 1;
  }
  
 void driveDown(){
   pushMatrix();
    translate(x+4, y-6);
    rotate(PI);
    display(15,0);
    popMatrix();
    driveY(-1*speed);
    dir = 3;
 }
 
 void driveLeft(){
   pushMatrix();
    translate(x+4, y-6);
    //ellipse (0,0,20,20);
    rotate(PI+HALF_PI);
    display(5, -24);
    popMatrix();
    driveX(-1*speed);
    dir = 0;
 }
}

