
/*
  @pjs preload="background.png, car.png";
  @pjs globalKeyEvents="true";
 */

Game game;

void setup() {
    size(960, 540);
  game = new Game();
  game.setup();
}

void draw() {
  game.draw(); // draw game
}

void mousePressed()
{
  game.mousePressed();
}

void mouseReleased()
{
  game.mouseReleased();
}

class Background {
  PImage backgroundImage;
  int currentPosition;

  Background(PImage img)
  {
    this.backgroundImage = img;
  }

  void draw() {
    background(255);
    image(backgroundImage, this.currentPosition, 0, width, height);
    image(backgroundImage, this.currentPosition+width, 0, width, height);
    image(backgroundImage, this.currentPosition-width, 0, width, height);
  }

  void move(int movement)
  {
    this.currentPosition -= movement;

    // if the position has moved further than a screen width, adjust it back a screen width
    if (this.currentPosition < -width)
      this.currentPosition += width;
    else if (this.currentPosition > width)
      this.currentPosition -= width;
  }
}

class Car {

  PVector location; // current location
  PImage img; // the car's sprite to draw to screen
  PVector dimensions; // the car's rectangular dimensions
  float acceleration, velocity;

  Game game;

  Car(int x, int y, int w, int h, PImage carImg, Game g) {
    this.game = g;
    this.acceleration = 0;
    this.velocity = 0;

    this.img = carImg;
    this.location = new PVector(x, y);
    this.dimensions = new PVector(w, h);
  }

  void draw() {
    // draw the car
    image(img, (location.x+this.velocity*1.5), location.y, this.dimensions.x, this.dimensions.y);
  }

  void update()
  {
    // apply acceleration or deceleration if the appropriate
    // buttons are being held. Limit if going too fast!
    if (this.game.accelPressed)
    {
      this.acceleration += 0.005;
      if (this.velocity >= 250)
      {
        this.acceleration = 0;
        this.velocity = 250;
        println("Maximum velocity has been reached!");
      }
    }
    else if (this.game.decelPressed)
    {
      this.acceleration -= 0.005;
      if (this.velocity <= -250)
      {
        this.acceleration = 0;
        this.velocity = -250;
        println("Maximum velocity has been reached!");
      }
    }
    else
    {
      this.acceleration = 0;
    }
    this.velocity += this.acceleration;

    this.game.background.move((int)this.velocity);
  }
}

class Game {

  Car car;
  Graph accelerationGraph;
  Graph velocityGraph;
  Background background;

  PVector accelPos;
  PVector stopPos;
  PVector decelPos;
  int bttnSize;
  Boolean accelPressed;
  Boolean stopPressed;
  Boolean decelPressed;
  
  Game() {}

  void setup()
  {
    PImage carImg = loadImage("car.png");
    PImage backgroundImg = loadImage("background.png");

    this.car = new Car(width/2-(carImg.width/2), 350, carImg.width, carImg.height, carImg, this);
    this.background = new Background(backgroundImg);

    this.accelerationGraph = new Graph(210, 255, 0, 0, "Acceleration"); // color red
    this.velocityGraph = new Graph(125, 0, 0, 255, "Velocity"); // color blue
    textSize(20);
    
    this.accelPos = new PVector(150, height-50);
    this.stopPos = new PVector(100, height-50);
    this.decelPos = new PVector(50, height-50);
    this.bttnSize = 30;
    
    this.accelPressed = false;
    this.stopPressed = false;
    this.decelPressed = false;
  }

  void draw()
  {
    this.car.update();

    // DRAW
    this.background.draw();
    this.velocityGraph.draw((int)(this.car.velocity*0.5));
    this.accelerationGraph.draw((int)(this.car.acceleration*50));
    this.car.draw();

    // draw the Acceleration control button
    if (accelPressed) {
      fill(0, 128, 192);
    } else {
      fill(255, 255, 0);
    }
    triangle(accelPos.x, accelPos.y,
    accelPos.x+bttnSize, accelPos.y+bttnSize/2,
             accelPos.x, accelPos.y+bttnSize);
    
    // draw the Stopping control button
    if (stopPressed) {
      fill(0, 128, 192);
    } else {
      fill(255, 255, 0);
    }
    rect(stopPos.x, stopPos.y, bttnSize, bttnSize);
    
    // draw the Deceleration control button
    if (decelPressed) {
      fill(0, 128, 192);
    } else {
      fill(255, 255, 0);
    }
    triangle(decelPos.x, decelPos.y+bttnSize/2,
    decelPos.x+bttnSize, decelPos.y,
    decelPos.x+bttnSize, decelPos.y+bttnSize);
  }

  void mousePressed()
  {
    // determine if mouse is over a valid button when pressed
    if (mouseX > accelPos.x && mouseX < (accelPos.x+bttnSize)
    && mouseY > accelPos.y && mouseY < (accelPos.y+bttnSize)) {
      println("User has pressed the accelerate button");
      accelPressed = true;
    }
    if (mouseX > stopPos.x && mouseX < (stopPos.x+bttnSize)
    && mouseY > stopPos.y && mouseY < (stopPos.y+bttnSize)) {
      println("User has pressed the stop button");
      car.acceleration = 0;
      stopPressed = true;
    }
    if (mouseX > decelPos.x && mouseX < (decelPos.x+bttnSize)
    && mouseY > decelPos.y && mouseY < (decelPos.y+bttnSize)) {
      println("User has pressed the decelerate button");
      decelPressed = true;
    }
  }

  void mouseReleased()
  {
    // release any and all user button input
    if (accelPressed) {
      println("User has released the accelerate button");
      accelPressed = false;
    }
    if (stopPressed) {
      println("User has released the stop button");
      car.velocity = 0;
      stopPressed = false;
    }
    if (decelPressed) {
      println("User has released the decelerate button");
      decelPressed = false;
    }
  }
}

class Graph {
  int locY;
  float[] graphPoints;
  float r, g, b;
  String label;

  Graph(int locY, float r, float g, float b, String label)
  {
    this.locY = locY;

    graphPoints = new float[width/4];

    // set initial graph
    for (int i = 0; i < graphPoints.length; i++) {
      graphPoints[i] = this.locY;
    }

    this.r = r;
    this.g = g;
    this.b = b;
    
    this.label = label;
  }

  void draw(int y) {

    y = this.locY - y;

    // move everything down the array
    for (int i = 0; i < graphPoints.length-1; i++) {
      graphPoints[i] = graphPoints[i+1];
    }

    graphPoints[graphPoints.length-1] = y;

    for (int i = 0; i < graphPoints.length-1; i++) {
      stroke(this.r, this.g, this.b);
      strokeWeight(2);
      line(i*2, graphPoints[i], i*2+1, graphPoints[i+1]);
    }
    
    // append and print the actual units figure
    fill(this.r, this.g, this.b);
    text(this.label, graphPoints.length*2, this.locY);
  }
}



