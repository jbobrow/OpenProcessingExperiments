
int lastTime;
int counter;

int numDudes; 
Man[] dudes;

int numKids; 
Kid[] children;

int numBottles; 
Bottle[] reusable;

int numDogs; 
Dog[] pack;

int numCats; 
Cat[] litter;

Gun gun;
ArrayList<Water> spray;

PFont geneva54;

PFont geneva75;

boolean gameOver;

boolean gameWin;

boolean anyDudesAlive;
boolean anyKidsAlive;
boolean anyBottlesAlive;
boolean anyDogsAlive;
boolean anyCatsAlive;

void setup() {
  //  colorMode(HSB, 360, 100, 100);
  size(1200, 800);
  smooth();
  geneva54 = loadFont("Geneva-54.vlw");
  geneva75 = loadFont("Geneva-75.vlw");

  counter = 30;

  numDudes = 2;
  dudes = new Man[numDudes];
  gun = new Gun();
  spray = new ArrayList<Water>();
  gameOver = false;
  gameWin = false;

  anyDudesAlive = false;
  anyKidsAlive = false;
  anyDogsAlive = false;
  anyCatsAlive = false;
  anyBottlesAlive = false;

  for (int i = 0; i < numDudes; i++) {
    dudes[i] = new Man(i);
  } 

  numKids = 2;
  children = new Kid[numKids];

  for (int i = 0; i < numKids; i++) {
    children[i] = new Kid(i);
  }   

  numBottles = 2;
  reusable = new Bottle[numBottles];

  for (int i = 0; i < numBottles; i++) {
    reusable[i] = new Bottle(i);
  }

  numDogs = 2;
  pack = new Dog[numDogs];

  for (int i = 0; i < numDogs; i++) {
    pack[i] = new Dog(i);
  }

  numCats = 2;
  litter = new Cat[numCats];

  for (int i = 0; i < numCats; i++) {
    litter[i] = new Cat(i);
  }
}


void draw() {
  background(0, 10, 0);



  if (millis() - lastTime > 1000) {
    counter--;
    lastTime = millis();
    println(counter);
  }


  //insert text for counter 00:00:00, counter is an int

  //  if (yPos=height) { 
  //  for (int j = 0; j<yPos; j++) {
  for (int i = 0; i<numDudes; i++) {
    dudes[i].update();
    if (dudes[i].yPos >= height) {
      dudes[i].yPos = -150;
      dudes[i].xPos = random(width);
    }
  }

  for (int i = 0; i<numKids; i++) {
    children[i].update();
    if (children[i].yPos >= height) {
      children[i].yPos = -150;
      children[i].xPos = random(width);
    }
  }

  for (int i = 0; i<numBottles; i++) {
    reusable[i].update();
    if (reusable[i].yPos >= height) {
      reusable[i].yPos = -150;
      reusable[i].xPos = random(width);
    }
  }

  for (int i = 0; i<numDogs; i++) {
    pack[i].update();
    if (pack[i].yPos >= height) {
      pack[i].yPos = -150;
      pack[i].xPos = random(width);
    }
  }

  for (int i = 0; i<numCats; i++) {
    litter[i].update();
    if (litter[i].yPos >= height) {
      litter[i].yPos = -150;
      litter[i].xPos = random(width);
    }
  }
  gun.update();

  for (int i=spray.size()-1; i>0; i--) {    //water shooting

    spray.get(i).update();
    if (spray.get(i).waterY <= 0) {
      spray.remove(spray.get(i));
    }
  }

  for (int i=spray.size()-1; i>0; i--) {    //water colliding
    for (int j = 0; j<numDudes; j++) {
      if (dudes[j].alive == false) {
        continue;
      }

      if (dist(spray.get(i).waterX, spray.get(i).waterY, dudes[j].xPos, dudes[j].yPos) < (spray.get(i).size/2 + dudes[j].size/2)) { //checking for distance between water and object
        dudes[j].quenched = true;  //if shot, tint object
        if (dudes[j].shot > 2) { 
          dudes[j].alive = false;
        }
        spray.remove(spray.get(i));


        break;
        //spray.get(i).transparency = 0;
      } 
      else {
        dudes[j].quenched = false;  //else don't tint
      }
    }
  } 

  for (int i=spray.size()-1; i>0; i--) {    //water colliding
    for (int j = 0; j<numKids; j++) {
      if (children[j].alive == false) {
        continue;
      }

      if (dist(spray.get(i).waterX, spray.get(i).waterY, children[j].xPos, children[j].yPos) < (spray.get(i).size/2 + children[j].size/2)) { //checking for distance between water and object
        children[j].quenched = true;  //if shot, tint object
        if (children[j].shot > 2) { 
          children[j].alive = false;
        }
        spray.remove(spray.get(i));


        break;
        //spray.get(i).transparency = 0;
      } 
      else {
        children[j].quenched = false;  //else don't tint
      }
    }
  } 

  for (int i=spray.size()-1; i>0; i--) {    //water colliding
    for (int j = 0; j<numDogs; j++) {
      if (pack[j].alive == false) {
        continue;
      }

      if (dist(spray.get(i).waterX, spray.get(i).waterY, pack[j].xPos, pack[j].yPos) < (spray.get(i).size/2 + pack[j].sizeY/2)) { //checking for distance between water and object
        pack[j].quenched = true;  //if shot, tint object
        if (pack[j].shot > 2) { 
          pack[j].alive = false;
        }
        spray.remove(spray.get(i));


        break;
        //spray.get(i).transparency = 0;
      } 
      else {
        pack[j].quenched = false;  //else don't tint
      }
    }
  } 

  for (int i=spray.size()-1; i>0; i--) {    //water colliding
    for (int j = 0; j<numCats; j++) {
      if (litter[j].alive == false) {
        continue;
      }

      if (dist(spray.get(i).waterX, spray.get(i).waterY, litter[j].xPos, litter[j].yPos) < (spray.get(i).size/2 + litter[j].sizeY/2)) { //checking for distance between water and object
        litter[j].quenched = true;  //if shot, tint object
        if (litter[j].shot > 2) { 
          litter[j].alive = false;
        }
        spray.remove(spray.get(i));


        break;
        //spray.get(i).transparency = 0;
      } 
      else {
        litter[j].quenched = false;  //else don't tint
      }
    }
  } 

  for (int i=spray.size()-1; i>0; i--) {    //water colliding
    for (int j = 0; j<numBottles; j++) {
      if (reusable[j].alive == false) {
        continue;
      }

      if (dist(spray.get(i).waterX, spray.get(i).waterY, reusable[j].xPos, reusable[j].yPos) < (spray.get(i).size/2 + reusable[j].sizeY/2)) { //checking for distance between water and object
        reusable[j].quenched = true;  //if shot, tint object
        if (reusable[j].shot > 2) { 
          reusable[j].alive = false;
        }
        spray.remove(spray.get(i));


        break;
        //spray.get(i).transparency = 0;
      } 
      else {
        reusable[j].quenched = false;  //else don't tint
      }
    }
  } 

  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        gun.xPos-=20;
      } 
      else if (keyCode == RIGHT) {
        gun.xPos+=20;
      }
    }
  }

  if (keyPressed) {
    if (key == ' ') {
      spray.add(new Water(int (gun.xPos+30)));
    }
  }

  boolean anyDudesAlive = false;
  for (int m = 0; m<numDudes; m++) {
    if (dudes[m].alive) {
      anyDudesAlive = true;
      break;
    }
  }
  boolean anyKidsAlive = false;
  for (int m = 0; m<numKids; m++) {
    if (children[m].alive) {
      anyKidsAlive = true;
      break;
    }
  }
  boolean anyDogsAlive = false;
  for (int m = 0; m<numDogs; m++) {
    if (pack[m].alive) {
      anyDogsAlive = true;
      break;
    }
  }
  boolean anyCatsAlive = false;
  for (int m = 0; m<numCats; m++) {
    if (litter[m].alive) {
      anyCatsAlive = true;
      break;
    }
  }
  boolean anyBottlesAlive = false;
  for (int m = 0; m<numBottles; m++) {
    if (reusable[m].alive) {
      anyBottlesAlive = true;
      break;
    }
  }




  if (!anyDudesAlive && !anyKidsAlive && !anyDogsAlive && !anyCatsAlive && !anyBottlesAlive && counter > 0) {
    gameWin = true;
    if (gameWin) {

      textFont(geneva75);
      fill(5, 145, 255);
      text("YOU WIN!", width/3, height/2);
    }
  }

  if (counter <= 0 && (anyDudesAlive || anyKidsAlive || anyDogsAlive || anyCatsAlive || anyBottlesAlive)) {
    gameOver = true;
    if (gameOver) {

      textFont(geneva75);
      fill(255, 5, 40);
      text("GAME OVER", width/3, height/2);
    } 
  }
    textFont (geneva54);
    fill(255);
    text(counter, width/2, height/16);
  }



class Bottle {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int index;
  PImage bottle;
  boolean alive;
  boolean quenched;
  int sizeX;
  int sizeY;
  int shot;

  Bottle(int tempIndex) {

    xPos = random(width);
    yPos = -20;
    xSpeed = 0;
    ySpeed = random(2, 6);
    alive = true;
    quenched = false;
    bottle = loadImage("bottle.png");
    index = tempIndex;
    sizeX = 50;
    sizeY = 130;
    shot = 0;
  }
  void update() { //comparable to void draw function, virtual draw loop
      
      
    if (alive) {

      //move creature
      xPos += xSpeed;
      yPos += ySpeed;

      if (quenched) {      //checking for tint
        tint(0, 80, 250);
        shot++;
      } 
      else {
        tint(255, 255, 255);
      }
        image(bottle, xPos, yPos, sizeX, sizeY);
    }
  }
}




class Cat {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int index;
  PImage cat;
  boolean alive;
  boolean quenched;
  int sizeX;
  int sizeY;
  int shot;

  Cat (int tempIndex) {

    xPos = random(width);
    yPos = -20;
    xSpeed = 0;
    ySpeed = random(2, 6);
    alive = true;
    quenched = false;
    cat = loadImage("cat.png");
    index = tempIndex;
    sizeX = 150;
    sizeY = 130;
    shot = 0;
  }
  void update() { //comparable to void draw function, virtual draw loop

    if (alive) {

      //move creature
      xPos += xSpeed;
      yPos += ySpeed;

      if (quenched) {      //checking for tint
        tint(0, 80, 250);
        shot++;
      } 
      else {
        tint(255, 255, 255);
      }
        image(cat, xPos, yPos, sizeX, sizeY);
    }
  }
}

class Dog {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int index;
  PImage dog;
  boolean alive;
  boolean quenched;
  int sizeX;
  int sizeY;
  int shot;

  Dog (int tempIndex) {

    xPos = random(width);
    yPos = -20;
    xSpeed = 0;
    ySpeed = random(2, 6);
    alive = true;
    quenched = false;
    dog = loadImage("dog.png");
    index = tempIndex;
    sizeX = 150;
    sizeY = 130;
    shot = 0;
  }
  void update() { //comparable to void draw function, virtual draw loop

    if (alive) {

      //move creature
      xPos += xSpeed;
      yPos += ySpeed;

      if (quenched) {      //checking for tint
        tint(0, 80, 250);
        shot++;
      } 
      else {
        tint(255, 255, 255);
      }
      image(dog, xPos, yPos, sizeX, sizeY);
    }
  }
}



class Gun {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int index;
  PImage image;
  boolean alive;
  int sizeX;
  int sizeY;

  Gun () {

    xPos = width/2;
    yPos = height*.91;
    //    println(yPos);
    alive = true;
    image = loadImage("gun.png");
    sizeX = 60;
    sizeY = 150;
  }
  void update() { //comparable to void draw function, virtual draw loop
    tint(255, 255, 255);
    image(image, xPos, yPos, sizeX, sizeY);
  }
}



class Kid {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int index;
  PImage kid;
  boolean alive;
  boolean quenched;
  int size;
  int shot;

  Kid(int tempIndex) {

    xPos = random(width);
    yPos = -20;
    xSpeed = 0;
    ySpeed = random(2, 6);
    alive = true;
    quenched = false; 
    kid = loadImage("kid.png");
    index = tempIndex;
    size = 100;
    shot = 0;
  }
  void update() { //comparable to void draw function, virtual draw loop

    if (alive) {

      //move creature
      xPos += xSpeed;
      yPos += ySpeed;

      if (quenched) {      //checking for tint
        tint(0, 80, 250);
        shot++;
      } 
      else {
        tint(255, 255, 255);
      }
      image(kid, xPos, yPos, size, size);
    }
  }
}



class Man {
  float xPos, yPos;
  float xSpeed, ySpeed;
  int index;
  PImage man;
  boolean alive;
  boolean quenched;  //tint
  int size;
  int shot;


  Man(int tempIndex) {
    xPos = random(width);
    yPos = -20;
    xSpeed = 0;
    ySpeed = random(2, 6);
    alive = true;
    quenched = false;    //tint
    shot = 0;
    man = loadImage("man.png");
    index = tempIndex;
    size = 150;
    imageMode(CENTER);
  }

  void update() { //comparable to void draw function, virtual draw loop

    if (alive) {

      //move creature
      xPos += xSpeed;
      yPos += ySpeed;

      if (quenched) {      //checking for tint
        tint(0, 80, 250);
        shot++;
      } 
      else {
        tint(255, 255, 255);
      }

      image(man, xPos, yPos, size, size);
    }
  }
}

class Water {
  int waterX;
  int waterY;
  int waterSpeed;
  int size;
  int transparency;

  Water(int _waterX) {
    waterX = _waterX-30;
    waterY = height-159;
    size = 40;
    transparency = 200;
  }

  void update() {
    ellipseMode(CENTER);
    noStroke();
    fill (0,80,250,transparency);
    ellipse (waterX, waterY, (size+6), size);
    tint(255, 255, 255);
    waterY = waterY - 3;
  }
}


