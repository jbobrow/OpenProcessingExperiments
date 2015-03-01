
/*
  @pjs preload="background.png, car.png";
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
  float acceleration, velocity, velocityDecay;

  // mouse/touch handling
  int prevMouseX;

  boolean userInControl;

  Game game;

  Car(int x, int y, int w, int h, PImage carImg, Game g) {
    this.game = g;
    this.prevMouseX = 0;
    this.acceleration = 0;
    this.velocity = 0;
    this.velocityDecay = 0.3;

    this.userInControl = false;

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
    // if the user is in control, apply controlled movement to car
    // else simulate the car's movement based upon velocity, etc.
    if (this.userInControl)
    {
      int distanceDragged = mouseX - this.prevMouseX;
      // set the velocity for when the user lets go of the car
      this.velocity = distanceDragged;
      this.acceleration = distanceDragged;
    } else
    {
      if (this.velocity > 0)
      {
        this.velocity -= this.velocityDecay;
        this.acceleration = this.velocityDecay;
        
        // make sure velocity decay doesn't make velocity go below 0
        if(this.velocity < 0)
        {
          this.velocity = 0;
        }
          
      } else if (this.velocity < 0)
      {
        this.velocity += this.velocityDecay;
        this.acceleration = -this.velocityDecay;
        
        // make sure velocity decay doesn't make velocity go below 0
        if(this.velocity > 0)
        {
          this.velocity = 0;
        }
      } else
      {
        this.acceleration = 0;
      }
    }

    this.game.background.move((int)this.velocity);

    //this.constrainMovement();
    // record mouse x location for next time
    this.prevMouseX = mouseX;
  }
  void mousePressed()
  {
    // if the mouse is over the car when it's pressed and user control isn't disabled
    // set the user control flag so mouse movement is applied to the car
    if (mouseX >= location.x && mouseX <= (location.x + this.dimensions.x)
      && mouseY >= location.y && mouseY <= (location.y + this.dimensions.y))
    {
      println("User has taken control of car");
      this.userInControl = true;
    }
  }

  void mouseReleased()
  {
    // release user control of car and apply the resultant velocity
    if (this.userInControl)
    {
      println("User has released control of car");
      this.userInControl = false;
    }
  }
}

class Game {

  Car car;
  Graph accelerationGraph;
  Graph velocityGraph;
  Background background;

  Game()
  {
  }

  void setup()
  {

    PImage carImg = loadImage("car.png");
    PImage backgroundImg = loadImage("background.png");

    this.car = new Car(width/2-(carImg.width/2), 350, carImg.width, carImg.height, carImg, this);
    this.background = new Background(backgroundImg);

    this.accelerationGraph = new Graph(255, 0, 0); // color red
    this.velocityGraph = new Graph(0, 0, 255); // color blue
  }

  void draw()
  {
    this.car.update();

    // DRAW
    this.background.draw();
    this.velocityGraph.draw((int)this.car.velocity);
    this.accelerationGraph.draw((int)this.car.acceleration);
    this.car.draw();

    // decay velocity
    //this.car.velocity -= this.car.velocityDecay;

    // avoid negative velocity
    //    if (this.car.velocity < 0)
    //      this.car.velocity = 0;
  }

  void mousePressed()
  {
    this.car.mousePressed();
  }

  void mouseReleased()
  {
    this.car.mouseReleased();
  }
}

class Graph {
  int locY;
  float[] graphPoints;
  float r, g, b;

  Graph(float r, float g, float b)
  {
    this.locY = 200;

    graphPoints = new float[width/4];

    // set initial graph
    for (int i = 0; i < graphPoints.length; i++) {
      graphPoints[i] = this.locY;
    }

    this.r = r;
    this.g = g;
    this.b = b;
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
  }
}



