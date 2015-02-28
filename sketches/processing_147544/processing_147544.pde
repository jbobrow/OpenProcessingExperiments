
Car car;
Meteor meteor;

boolean carStart;
boolean meteorStart;
boolean gameRestart;
boolean stopItAll;


boolean TESTHECK;
boolean TESTROOF;
boolean TESTFRONT;

int[] background = { 
  255, 255, 255
};

void setup() {
  size(1400, 800); 
  background(255);
  car = new Car();
  meteor = new Meteor();
  carStart = false;
  meteorStart = false;
  gameRestart = false;
  stopItAll = false;

  //***TEST
  TESTHECK = false;
  TESTROOF = false;
  TESTFRONT = false;
  //*****
  noStroke();
  fill(0);
}

void draw() {
  //setup();

  if (gameRestart)
    restartTheGame();

  if (stopItAll == false) {
    background(background[0], background[1], background[2]);


    //*****testarea
    fill(100);
    if (TESTHECK == true)
      ellipse(40, 40, 40, 40);
    if (TESTROOF == true)
      ellipse(100, 40, 40, 40);
    if (TESTFRONT == true) 
      ellipse(160, 40, 40, 40);
    //*****

    car.move();
    meteor.move();
    gameWatcher();
  }
}

void mousePressed() {
  if (carStart && meteorStart)
    gameRestart = true;
  if (carStart == true)
    meteorStart = true;
  carStart = true;
}

void gameWatcher() {

  //Kollisions-check: Autoheck
  if (meteor.Xpos+meteor.radius > car.posX && meteor.Xpos+meteor.radius < car.posX + car.backLength
    && meteor.Ypos + meteor.radius > car.posY-car.backHeight) {
    TESTHECK = true;
    stopItAll = true;
  }

  //Kollisions-check: Autodach
  else if (meteor.Xpos-meteor.radius > car.posX + car.backLength && meteor.Xpos+meteor.radius < car.posX + car.backLength + car.roofLength
    && meteor.Ypos + meteor.radius > car.posY - car.backHeight - car.roofHeight) {
    TESTROOF = true;
    stopItAll = true;
  }

  //Kollisions-check: Autofront
  else if (meteor.Xpos-meteor.radius > car.posX + car.backLength + car.roofLength && meteor.Xpos+meteor.radius < car.posX+car.carLength
    && meteor.Ypos + meteor.radius > car.posY - car.frontHeight) {
    TESTFRONT = true;
    stopItAll = true;
  }
}

void restartTheGame() {
  setup();
}

class Car {

  int[] carColor = new int[3];

  //Autopositionierung, X / Y = Links unten vom Auto
  int posX = 120;
  int posY = 500;

  //Automasse
  int carLength;
  int backHeight;
  int backLength;
  int roofStartX;
  int roofHeight;
  int roofLength;
  int roofArchHeight;
  int frontHeight;
  int frontLength;
  int frontStartX;

  //random-value für Zittern (Vibration) der Autos
  int rv = 2;

  int randomMax = 50;
  int randomMin = 0;

  int rl;
  int startX;
  int startY;
  int endX;
  int endY;

  public Car() {
    carColor[0] = (int) random(255);
    carColor[1] = (int) random(255);
    carColor[2] = (int) random(255);

    this.backHeight = 30 + (int) random(randomMin, randomMax);
    this.backLength = 50 + (int) random(randomMin, randomMax);

    this.roofHeight = 30 + (int) random(randomMin, randomMax);
    this.roofLength = 100 + (int) random(randomMin, randomMax);
    this.roofArchHeight = 5 + (int) random(randomMin, randomMax);
    this.frontHeight = backHeight + (int) random(randomMin, randomMax);
    this.frontLength = backLength + (int) random(randomMin, randomMax);

    this.roofStartX = backLength + (int) random(randomMin, randomMax);
    this.frontStartX = backLength + roofLength - (int) random(randomMin, randomMin);
    this.carLength = backLength + roofLength + frontLength;
  } 

  public void move() {
    if (carStart == true) {
      posX += (int) random(1, 10);
    }
    this.drawCar();
  }

  public void drawCar() {

    //*****DRAW CAR CHASSIS*****************************************
    fill(carColor[0], carColor[1], carColor[2]);
    int carStartX = posX+(int) random(rv);
    int carStartY = posY+(int) random(rv);
    int carEndX = posX+carLength+(int) random(rv);
    int carEndY = posY+(int)random(rv);



    beginShape();
    curveVertex(carStartX, carStartY); // the first control point
    curveVertex(carStartX, carStartY); // is also the start point of curve

    //1. Punkt: Kofferaumhebel
    curveVertex(posX+random(rv), posY-backHeight+random(rv));
    //2. Punkt: Ende Heckscheibe
    curveVertex(posX+backLength+random(rv), posY-backHeight+random(rv));
    //3. Punkt: Verbindung Heckschreibe/Dach
    curveVertex(posX+roofStartX+random(rv), posY-backHeight-roofHeight+random(rv));
    //4. Punkt: Dachwölbung (in der Mitte der Dachlänge
    curveVertex(posX+backLength+roofLength/2+random(rv), posY-backHeight-roofHeight-roofArchHeight+random(rv));
    //5. Punkt: Verbindung Dach, Frontscheibe
    curveVertex(posX+frontStartX+random(rv), posY-frontHeight-roofHeight+random(rv));
    //6. Punkt: Verbindung Frontscheibe/Motorblock
    curveVertex(posX+backLength+roofLength+random(rv), posY-frontHeight+random(rv));
    //7. punkt: Motorklappe
    curveVertex(posX+carLength+random(rv), posY-frontHeight+random(rv));

    curveVertex(carEndX, carEndY); // the last point of curve
    curveVertex(carEndX, carEndY); // is also the last control point
    endShape();

    //*****DRAW WHEELS
    fill(60);
    ellipse(posX + carLength/8, posY, (int) random(25, 55), (int) random(25, 35));
    ellipse(posX + carLength*7/8, posY, (int) random(25, 55), (int) random(25, 35));

  //*****DRAW FRONTGLASS
  rl = roofLength/3;
  startX = posX+frontStartX-rl;
  startY = posY-frontHeight-roofHeight/2;
  endX = posX+frontStartX-rl;
  endY = posX-frontHeight;
    
  fill(180,180,255);  
  ellipse(startX, startY, roofHeight/1.2, roofHeight/1.2);
  }
}


class Meteor {

  //Meteorposition
  int Xpos = 1100;
  int Ypos = 100;

  //Meteorgrösse
  int durchmesser = 30;
  int radius = durchmesser / 2;

  public Meteor() {
  }

  public void move() {

    if (meteorStart == true) {
      Ypos *= 1.025;
    }
    this.drawMeteor();
  }

  public void drawMeteor() {
    fill(230, 110, 25);
    ellipse(Xpos, Ypos, durchmesser, durchmesser);
  }
}
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
