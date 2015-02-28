
/* @pjs preload="catboy_1.png", "catwalkleft.png", "catwalkright.png", "splashpages.jpg", "lost.png", "win.png", "fish.png", "fishbones.png"; */


int carAmount = 100;
ArrayList myCars, myFish;
//hitbox
PVector frogPos;
//cat pos
PVector catPos;
PImage walkleft, walkright, back, win, lost, front;
int facing;
int gameState = 0;
int hunger=60;
int counter = 3500;


void setup() {
  size(500, 800);
  back= loadImage("splashpages.jpg");
  front= loadImage("catboy_1.png");
  walkleft= loadImage("catwalkleft.png");
  walkright= loadImage("catwalkright.png");
  win= loadImage("win.png");
  lost= loadImage("lost.png");

  myCars = new ArrayList();
  myFish = new ArrayList();
  frogPos = new PVector(225, 675);
  catPos = new PVector(170, 635);

  for (int i = 0; i < 75; i++) {
    myCars.add(new Car());
  }
  for (int f = 0; f < 15; f++) {
    myFish.add(new FishB());
  }
}

void draw() {
  switch(gameState) {
  case 0:
     background(0);
    text("Click to start the game", width/2, height/2);
    text("Press and hold left and right arrows to move", width/2, (height/2)+20);
    text("Catch fish to fill your belly", width/2, (height/2)+40);
    text("Skeletons of fish will starve you faster", width/2, (height/2)+60);   
    break;

  case 1:
    background(0);
    image(back, 0, 0);
    noStroke();


    fill(0, 0, 0, 255);
    rect(20, 20, 130, 35); 
    fill(190, 0, 0);
    rect(25, 25, hunger, 25);
    fill(255, 255, 255);
    textSize(20);
    text("Full Belly", 35, 45);
    text(counter, 425, 35);

    counter = counter -1;
    if (counter <= 0) {
      gameState = 3;
    }   

    //drawing/controling cars
    for (int i = 0; i < myCars.size(); i++) {
      Car tempCar = (Car) myCars.get(i);
      tempCar.display();
      tempCar.drive();



      //killing cars
      float d = (tempCar.pos).dist(frogPos);
      if (d < tempCar.wide) {
        tempCar.alive = false;
        hunger = hunger +4;
        if (hunger >= 120) {
          hunger = 120;
          gameState = 2;
        }
      }
    }
    for (int f = 0; f < myFish.size(); f ++) {
      FishB tempFish = (FishB) myFish.get(f);
      tempFish.display();
      tempFish.drive();

      //killing fish
      float k = (tempFish.pos).dist(frogPos);
      if (k < tempFish.wide) {
        tempFish.alive = false;
        hunger = hunger -10;
        if (hunger <=0) {
          hunger = 0;
          gameState = 3;
        }
      }
    }
    for (int i = 0; i < myCars.size(); i++) {
      Car tempCar = (Car) myCars.get(i);

      if (tempCar.alive == false) {
        myCars.remove(i);
      }
    }
    for (int f = 0; f < myFish.size(); f++) {
      FishB tempFish = (FishB) myFish.get(f);

      if (tempFish.alive == false) {
        myFish.remove(f);
      }
    }
    //fill(r,g,b,opac)
    fill(255, 0, 0, 0);
    ellipse(frogPos.x, frogPos.y, 50, 50);
        fill(#89a181);
    rect(0, 755, 500, 50);

    switch(facing) {
    case 0:
      image(front, catPos.x, catPos.y);
      break;

    case 1:
      image(walkleft, catPos.x, catPos.y);
      break;

    case 2:
      image(walkright, catPos.x, catPos.y);
      break;
    }

    break;

  case 2:
    //you won!
    background(0);
    fill(255);
    text("You won the game!", width/2, (height/2)-100);
    text("Click to play again!", width/2, (height/2)-80);
    image(win, -100, 300);
    break;

  case 3:
    //You Lost!
    background(0);
    fill(255);
    text("Fail!", width/2, (height/2)-100);
    text("Click to try again", width/2, (height/2)-80);
    image(lost, -50, 300);
    break;
  }
}


void keyPressed() {
  switch(keyCode) {

  case 37:
    facing = 1;
    frogPos.x = frogPos.x -7;
    if (frogPos.x < -70) {
      frogPos.x = width + 50;     
    }
    catPos.x = catPos.x -7;
    if (catPos.x < - 70) {
      catPos.x = width +50;
    }
    break;

  case 39:
      facing =2;
    frogPos.x = frogPos.x +7;
    if (frogPos.x > width + 50) {
      frogPos.x = -70;
    }
    catPos.x = catPos.x +7;
    if (catPos.x > width + 50) {
      catPos.x = -70;
    }
    break;
  }
}
void keyReleased() {
  facing = 0;
}
void mousePressed() {
  if (gameState ==0) {
    gameState = 1;
  }

  if (gameState == 3) {
    //reset the ammount of cars to be created
    hunger = 60;
    gameState = 1;
    catPos.x = 170;
    catPos.y = 635;
    frogPos.x = 225;
    frogPos.y = 675;
    myCars.clear();
    myFish.clear();
    facing = 0;
    counter = 3500;
    for (int i = 0; i < 75; i++) {
      myCars.add(new Car());
    }
    for (int f = 0; f < 15; f++) {
      myFish.add(new FishB());
    }
  }

  if (gameState == 2) {
    //reset the ammount of cars to be created
    hunger = 50;
    gameState = 1;
    catPos.x = 170;
    catPos.y = 635;
    frogPos.x = 225;
    frogPos.y = 675;
    myCars.clear();
    myFish.clear();
    facing = 0;
    counter = 3500;
    for (int i = 0; i < 75; i++) {
      myCars.add(new Car());
    }
    for (int f = 0; f < 15; f++) {
      myFish.add(new FishB());
    }
  }
}

class Car {

  //attributes
  PVector vel;
  PVector pos;
  PImage fish;
  int mySize;
  float wide = random(50, 85), tall = random(50, 75);
  boolean alive;
  float rotation = random(3, 50);

  //construct
  Car() {
    vel = new PVector((0), random(1, 3));
    pos = new PVector(random(20, 450), random(-500, -5000));
    mySize = int(random(15, 40));
    alive = true;
    fish = loadImage("fish.png");
  }

  //method
  void display() {
    image(fish, pos.x, pos.y, wide, tall);
  }

  //drivers
  void drive() {
    pos.add(vel);

    if (pos.x>width +50) {
      pos.x = -50;
    }
    if (pos.x<0 -50) {
      pos.x = width+50;
    }
    if (pos.y>height +50) {
      pos.y = -1000;
      hunger = hunger -2;
      if (hunger <=0) {
        hunger = 0;
        gameState=3;
      }
    }
  }
}


class FishB {

  //attributes
  PVector vel;
  PVector pos;
  PImage fishB;
  int mySize;
  float wide = random(50, 85), tall = random(50, 75);
  boolean alive;
  float rotation = random(3, 50);

  //construct
  FishB() {
    vel = new PVector((0), random(1, 3));
    pos = new PVector(random(20, 450), random(-1000, -5000));
    mySize = int(random(15, 40));
    alive = true;
    fishB = loadImage("fishbones.png");
  }

  //method
  void display() {
    image(fishB, pos.x, pos.y, wide, tall);
  }

  //drivers
  void drive() {
    pos.add(vel);

    if (pos.x>width +50) {
      pos.x = -50;
    }
    if (pos.x<0 -50) {
      pos.x = width+50;
    }
    if (pos.y>height +50) {
      pos.y = -1000;
    }
  }
}


