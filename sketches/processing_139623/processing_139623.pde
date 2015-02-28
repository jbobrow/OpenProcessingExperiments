
//Car interactions:
//Produced By Dalton Varney on 3/11/14
// Thanks to some helpful instructions by Ms. Freed
 // Motivation and Inspiration by http://www.youtube.com/watch?v=Xdy6P4ik0ms

//int value for distance between cars when stopped
int stoppedCar = 75;
//size variable that I use to change the size
int size = 800;
//Array that uses class "Car" to make 8 cars
Car [] car = new Car [10];
//integer array for the yPos of the Cars
int[] yPos = {
  75, 150, 225, 300, 375, 450, 525, 600, 675, 750
};
//an on off switch to determine if the timer has been set
boolean [] timeron = {false, false, false, false, false, false, false, false, false, false};
//integer array for the speed of each car
int[] d = {2,2,2,2,2,2,2,2,2,2};



void setup() { 
  size(size, size);
  background (0);
  //using the car array to spawn in 8 cars
  for (int i = 0; i < car.length; i++) {
    car[i] = new Car(yPos[i]);
  }
}

void draw() {
  background (0);
  fill(255);
  rect(350, 0, 100, size);
  fill(255,255,0);
  rect(350, 0, 10, size);
  rect(450, 0, 10, size);
  fill(175,238,238);
  //using a for loop to go through each car
  for (int i=0; i < car.length; i++) {
   //individual car the distt in tes to the car class
    car[i].update(yPos[i]);
    yPos[i] -= d[i];
    //command that sets cars to loop if they reach the top of the screen
    if (yPos[i] < - 25){
      yPos[i] = 800;
    }
  }
  
}


class Car {
  //integers for the starting positions of the car
  int x;
  int y;

  //speed set by dy for car movement
  int dy;
  //my variable to make a short timer for how long a car is a bad driver
  int timer;
  //the randomly selected digit to determine if a car should be a bad driver
  int number;
  //car setup
  Car(int startY) {

    x = 392;
    y = startY;
    dy = 2;
  }
  //the reference function that goes into void draw
  void update(int ypos) {
    y = ypos;

    distance();
    badaction();
    //the Actual Rectangular Car
    rect(x, y, 25, 50);
  }

  void badaction () {
    //the for loop that produces a random number and then prints it
    for (int i = 0; i < (car.length); i++) {
      number = int(random(0, 10000));
      println("Timer= " + timer);
      println("Millis= " +millis());

      // The mouse Y position on the graph stops the cars and creates traffic
      if (mouseY > (yPos[i] - 20) && mouseY < (yPos[i]+20) && mouseX > 390 && mouseX < 430) {
        d[i] = 0;
        timeron[i] = true;
      }
      if (timeron[i] == true && mouseX > 430) {
        d[i] = 2;
        timeron[i] = false;
      }
      if (timeron[i] == true && mouseX < 390) {
        d[i] = 2;
        timeron[i] = false;
      }
      
    }
  }

  void distance() {
    // the for loops that determine whether it is about to hit a car in front of it or whether the car is far enough away to drive again
    for (int i=1; i < (yPos.length); i++) {
      if (yPos[i] < (yPos[i-1] +50)  && yPos[i] > (yPos[i-1] +40)) {
        d[i] = 0;
      }
      if (yPos[i] > (yPos[i-1] +100)  && yPos[i] < (yPos[i-1] +125) ) {
        d[i] = 2;
      }
      if (yPos[i-1] > (size - 50) && d[i-1] == 0) {
        d[i] = 0;
      }
      if(d[i] == 0 && yPos[i] > (yPos[i-1] +100)  && yPos[i] < (yPos[i-1] +125) && mouseY > 150) {
        d[i] = 2;
    }
    }
    //since the first car will lap behind the last car, I have to make separate if statements for the first car
    if (yPos[0] < yPos[9] +50  && yPos[0] > yPos[9] +40) {
      d[0] = 0;
    }
    if (yPos[0] > yPos[9] +100  && yPos[0] < yPos[9] +125) {
      d[0] = 2;
    }
    if (d[0] == 0 && yPos[0] > yPos[9] +100  && yPos[0] < yPos[9] +125 && mouseY > 150) {
      d[0] = 2;
    }
    if (yPos[9] > (size-50) && d[9] == 0 ) { 
      d[0] = 0;
    }
  }
}



