
int NUM_CARS = 180;

Car[] cars = new Car[NUM_CARS];

void setup() {
  size(500, 500);
  for (int i=0; i < NUM_CARS; i++) {
    cars[i] = makeRandomCar();
  }
}

Car makeRandomCar() {
  color c = color(random(255), random(255), random(255));
  float initialX = random(50, width);
  float initialY = random(50, height);
  float initialSpeed = random(3) + 1;
  int len = (int) random(10,50);
  int wid = int(random(10,40));
  return new Car(c, (int) initialX, (int) initialY, (int) initialSpeed, len, wid);
}

void draw() {
  background(255);
  int x = 10;
  int y = 20;
  //   1        2                3      { 4 }
  for (int i=0; i < cars.length; i++) {
    Car c = cars[i];
    c.move();
    c.display();
  }
  // 1: initialize a variable. This only runs one time at the
  // very beginning of the for-loop.
  
  // 2. test if the loop should continue. This is tested at the
  // beginning of each iteration of the for-loop (including the
  // first one). As long as it evaluates to true, it continues.
  
  // 3. increment. This runs at the *end* of each iteration,
  // including the first iteration. Here, i++ just means to add
  // one to the current value of i. So it will get one larger
  // every time, letting us address the next car: cars[i].
  
  // 4. The block of code to execute. Here the value of i is one
  // larger every time. So cars[i] is the first car on the first
  // iteration, but cars[i] is the second car on the second round.
  
  // cars.length works because 'cars' is an array variable. We
  // declared it as "Car[] cars", meaning "This is an array of
  // Car objects".  We assign it the initial value of Cars[5],
  // meaning an array of five Cars. You index them with numbers
  // zero through four. The array has a 'length' property that
  // tells you how many things there are. You can always address
  // into the array using cars[0] through cars[cars.length-1].
}


class Car {
  
  color c;
  int xpos;
  int ypos;
  int xspeed;
  int carLength;
  int carWidth;
  
  Car(color tempC, int initialX, int initialY, int initialSpeed,
      int len, int wid) {
    c = tempC;          //
    xpos = initialX;
    ypos = initialY;    
    xspeed = initialSpeed;
    carLength = len;
    carWidth = wid;
  }
  
  void display() {
    stroke(0);              //
    fill(c);               //    
    rectMode(CENTER);
    rect(xpos,ypos,carLength,carWidth);
    
    fill(150);
    ellipse(xpos-carLength/2,ypos-carWidth/2,10,10);
    ellipse(xpos-carLength/2,ypos+carWidth/2,10,10);
    ellipse(xpos+carLength/2,ypos-carWidth/2,10,10);
    ellipse(xpos+carLength/2,ypos+carWidth/2,10,10);
  }
  
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


