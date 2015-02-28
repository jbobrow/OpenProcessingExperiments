
//variables
//Car myCar;
//Car myCar2;

Car[] myCars = new Car[10];

void setup() {
  size(500, 500);
  //(contrutor variables)  color, width, height, posX, posY, speed)
  //  myCar = new Car(color(255, 56, 89), 20, 50, width/2, height/2, 2, 3);
  //  myCar2 = new Car(color(50, 56, 89), 20, 50, 150, height/2, 2, 33);
  for (int i = 0; i < myCars.length; i++) {
    myCars [i] = new Car(color(random(255), random(255), random(255)), 20, 20, random(width), random(height), random(4), random(6));
  }
}

void draw() {
  background(255);
  // myCar.display();
  // myCar2.display();
  // myCar.move();
  // myCar2.move();
  // myCar.bounce();
  // myCar2.bounce();

  for (int i = 0; i< myCars.length; i++) {
    myCars[i].display();
    myCars[i].move();
    myCars[i].bounce();
    myCars[i].collide();
    myCars[i].linettes();
  }
  //myCars[i].display();
  // myCars[i].move();
  // myCars[i].bounce();
}

//function



//class

class Car {
  color carColor;
  float carWidth, carHeight;
  float posX, posY, speedX, speedY;

  //the constructor
  Car(color theColor, float theWidth, float theHeight, float thePosX, float thePosY, float theSpeedX, float theSpeedY) {
    carColor = theColor;  
    carWidth = theWidth;
    carHeight = theHeight;
    posX = thePosX;
    posY = thePosY;
    speedX = theSpeedX;
    speedY = theSpeedY;
  } 

  //methods
  void display() {
    rectMode(CENTER);
    fill(carColor);
    rect(posX, posY, carWidth, carHeight);
  }

  void move() {
    posX = posX + speedX;
    posY = posY + speedY;
  }


  void bounce() {
    if (posX> width || posX< 0) {
      speedX = speedX * -1;
    }
    if (posY > height || posY < 0) {
      speedY = speedY* -1;
    }
  }
  public float getPosX(){
     return posX; 
  }
  
  public float getPosY(){
     return posY; 
  }
  
  void collide(){
    for(int i = 0; i<myCars.length; i++){
       float theDistance = dist(myCars[i].getPosX(), myCars[i].getPosY(), this.getPosX(), this.getPosY());
       if(theDistance < 20 && myCars[i] != this){
        speedX = speedX * -1;
        speedY = speedY * -1; 
       }
      
    }
  }
  
  void linettes() {
    for(int i = 0; i<myCars.length; i++){
       float theDistance = dist(myCars[i].getPosX(), myCars[i].getPosY(), this.getPosX(), this.getPosY());
       if(theDistance < 100 && myCars[i] != this){
        line(myCars[i].getPosX(), myCars[i].getPosY(), this.getPosX(), this.getPosY());
      }
    }
  }
}



