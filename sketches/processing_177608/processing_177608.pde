
/* @pjs preload="background.png,car1.png,car2.png,car3.png,car4.png,car5.png,go.png,stop.png,gorilla1.png,gorilla2.png,gorilla3.png,gorilla4.png"; */

Game game;

void setup()
{
  size(1200, 782);
  
  frameRate(20);
  smooth();
  
  game = new Game();
  game.setup();
}

void draw()
{
  game.update(); // update positions
  game.draw(); // draw game
}

void mouseClicked()
{
  game.mouseClicked(); // process input
}

// Used for determining if the mouse is over a button when clicked
boolean overButton(float x, float y, float diameter)
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2)
  {
    return true;
  }
  else
  {
    return false;
  }
}

boolean overCar(Car zone)
{
  if (mouseX >= zone.location.x &&
      mouseX <= (zone.location.x + zone.dimensions.x) &&
      mouseY >= zone.location.y &&
      mouseY <= (zone.location.y + zone.dimensions.y))
  {
    return true;
  }
  else
  {
    return false;
  }
}

class Car
{
  PVector location; // current location
  PVector startingLocation; // the start location
  float velocity; // current velocity
  int startingVelocity; // the start velocity
  
  int mass; // the car's mass
  int momentum; // the car's momentum
  float farFactor; // scale on distance
  float slowdown; // for applying the brakes
  float stopDistance; // where to finish moving
  
  PImage img; // the car's sprite to draw to screen
  PVector dimensions; // the car's rectangular dimensions
  PImage driverImg; // the driver's sprite to draw to screen
  PVector driverDimensions; // the driver's rectangular dimensions
  PVector driverOffset; // display offset for the driver in comparison to the car
  
  boolean braking = false; // whether the car is currently braking
  boolean awaitingReset = false; // if true, the car is frozen and awaiting the user to click the reset button
  boolean movementStarted = false; // whether the car's movement has been initiated
  
  PImage[] massPileImgs; // list of mass pile images
  PVector massPileDimensions; // dimensions of the clickable mass pile area
  int massPileLevel; // current mass level
  PVector massPileOffset; // display offset for the mass pile in comparison to the car
  
  Game game;
  
  Car(int x, int y, PImage carImg, PImage[] massPileImages, PImage driver, Game g)
  {
    this.game = g;
    
    this.massPileImgs = massPileImages;
    this.img = carImg;
    this.driverImg = driver;
    this.driverDimensions = new PVector(driverImg.width, driverImg.height);
    this.driverOffset = new PVector(118, -14);
    
    this.dimensions = new PVector(this.img.width, this.img.height);
    this.massPileDimensions = new PVector(massPileImages[0].width, massPileImages[0].height);
    this.massPileLevel = 0;
    this.massPileOffset = new PVector(3, -45);
    
    this.mass = 5;
    this.startingLocation = new PVector(x, y);
    this.location = new PVector(startingLocation.x, startingLocation.y);
    this.startingVelocity = 50;
    this.velocity = 0.0f;
  }
  
  void update()
  {
    // Simulate the car's movement based upon velocity, etc.
    // If currently braking, apply friction.
    if (this.braking)
    {
      this.velocity = (this.stopDistance - this.location.x) * this.slowdown;
      // Apply the velocity to move the car
      this.location.x = this.location.x + this.velocity*1.00/20.00;
      
      if (this.velocity < 0.001)
      {
        this.velocity = 0.0f;
        this.awaitingReset = true;
      }
    }
    else
    {
      // Scaling factor is dependent on whether braking has started
      this.location.x = this.location.x + this.velocity;
    }
    
    // if the car has crossed the finish line and isn't already braking, start braking
    if (!this.braking && game.finishLine.isFinished(this) )
    {
      this.startBraking();
    }
  }
  
  void draw()
  {
    // draw the mass pile
    image(this.massPileImgs[this.massPileLevel], location.x+massPileOffset.x, location.y+massPileOffset.y, this.massPileDimensions.x, this.massPileDimensions.y);
    // draw the car
    image(img, location.x, location.y, this.dimensions.x, this.dimensions.y);
    // draw the driver
    if (game.selected == this)
    {
      image(driverImg, location.x+driverOffset.x, location.y+driverOffset.y, driverDimensions.x, driverDimensions.y);
    }
  }
  
  void startBraking()
  {
    this.braking = true;
    
    // Do calculations to achieve necessary brake distance and speed
    this.momentum = this.mass * this.startingVelocity;
    this.farFactor = 0.3;
    this.stopDistance = this.momentum * this.farFactor + (game.finishLine.location.x - this.dimensions.x);
    this.slowdown = this.stopDistance / this.startingVelocity;
  }
  
  // Move the car back to its initial position
  void reset()
  {
    this.location.x = this.startingLocation.x;
    this.location.y = this.startingLocation.y;
    this.velocity = 0.0f;
    
    this.braking = false;
    this.awaitingReset = false;
    this.movementStarted = false;
  }
  
  // Commence movement of the car
  void startMoving()
  {
    this.velocity = this.startingVelocity;
    this.movementStarted = true;
  }
  
  // Set the car's mass value in response to input
  void setMass(int newMass)
  {
    this.mass = newMass;
    this.massPileLevel = this.mass/5-1;
  }
  
  // Set the car's velocity value in response to input
  void setVelocity(int newVelocity)
  {
    this.startingVelocity = newVelocity;
  }
}

class FinishLine
{
  PVector location; // position to draw the finish line
  PVector dimensions; // vector size of the finish line on screen
  PVector lightsOffset; // display offset for lights in relation to finish line
  
  PImage go, stop; // the traffic light images with the finish line
  Game game;
  
  FinishLine(int x, int y, PImage goImg, PImage stopImg, Game g)
  {
    this.game = g;
    this.go = goImg;
    this.stop = stopImg;
    
    this.location = new PVector(x, y);
    this.dimensions = new PVector(10, 220);
    this.lightsOffset = new PVector(-20, -110);
  }
  
  void draw()
  {
    // light turns red when the car passes the line
    if(this.game.selected.braking)
    {
      image(this.stop, location.x+lightsOffset.x, location.y+lightsOffset.y);
    }
    else
    {
      image(this.go, location.x+lightsOffset.x, location.y+lightsOffset.y);
    }
  }
  
  
  boolean isFinished(Car c)
  {
    // check whether the car is past the finish line, taking into account the screen offset
    if(c.location.x + c.dimensions.x > this.location.x)
    {
      return true;
    }
    return false;
  }
}

class Game
{
  Car selected; // the active car that is being driven and represented
  FinishLine finishLine; // the point when the car begins to brake
  PImage worldmap; // the background environment for the game
  Car[] allCars; // the complete set of simulated cars
  
  PVector[] massButtons; // positions of the mass input buttons
  int[] massValues; // values used for the mass input
  PVector[] velocityButtons; // positions of the velocity input buttons
  int[] velocityValues; // values used for the velocity input
  
  Game()
  {
  }
  
  void setup()
  {
    PImage[] massPileImages = new PImage[] {
      loadImage("gorilla1.png"),
      loadImage("gorilla2.png"),
      loadImage("gorilla3.png")
      };
    PImage driver = loadImage("gorilla4.png");
    PImage goImg = loadImage("go.png");
    PImage stopImg = loadImage("stop.png");
    this.worldmap = loadImage("background.png");
    this.allCars = new Car[] {
      new Car(50, 245, loadImage("car1.png"), massPileImages, driver, this),
      new Car(50, 340, loadImage("car2.png"), massPileImages, driver, this),
      new Car(50, 435, loadImage("car3.png"), massPileImages, driver, this),
      new Car(50, 530, loadImage("car4.png"), massPileImages, driver, this),
      new Car(50, 625, loadImage("car5.png"), massPileImages, driver, this)
    };
    this.finishLine = new FinishLine(600, 162, goImg, stopImg, this);
    this.selected = this.allCars[0];
    
    this.massButtons = new PVector[] {
      new PVector(100,30),
      new PVector(140,30),
      new PVector(180,30)
    };
    this.massValues = new int[] { 5, 10, 15 };
    this.velocityButtons = new PVector[] {
      new PVector(370,30),
      new PVector(410,30),
      new PVector(450,30)
    };
    this.velocityValues = new int[] { 50, 100, 150 };
    textSize(24);
  }
  
  void update()
  {
    for (int i = 0; i < this.allCars.length; i++)
    {
      this.allCars[i].update();
    }
  }
  
  void reset()
  {
    for (int i = 0; i < this.allCars.length; i++)
    {
      this.allCars[i].reset();
    }
  }
  
  void draw()
  {
    // Draw the breathing elements of the game world
    background(worldmap);
    this.finishLine.draw();
    for (int i = 0; i < this.allCars.length; i++)
    {
      this.allCars[i].draw();
    }
    
    // Fetch the colour of the currently selected car
    color tinting = selected.img.get(100,50);
    // Render the full set of mass buttons according to state
    for (int i = 0; i < this.massButtons.length; i++)
    {
      if ( massValues[i] == selected.mass ) {
        fill(tinting);
      } else if ( overButton(massButtons[i].x,massButtons[i].y,25)
                  && !selected.movementStarted) {
        fill(200,200,200);
      } else {
        fill(255,255,0);
      }
      ellipse(massButtons[i].x,massButtons[i].y,25,25);
      if ( massValues[i] == selected.mass ) {
        fill(255,255,255);
      } else {
        fill(0,0,0);
      }
      text(i+1,massButtons[i].x-7,massButtons[i].y+8);
    }

    // Render the full set of velocity buttons according to state
    for (int i = 0; i < this.velocityButtons.length; i++)
    {
      if (velocityValues[i] == selected.startingVelocity) {
        fill(tinting);
      } else if ( overButton(velocityButtons[i].x,velocityButtons[i].y,25)
                  && !selected.movementStarted) {
        fill(200,200,200);
      } else {
        fill(255,255,0);
      }
      ellipse(velocityButtons[i].x,velocityButtons[i].y,25,25);
      if (velocityValues[i] == selected.startingVelocity) {
        fill(255,255,255);
      } else {
        fill(0,0,0);
      }
      text(i+1,velocityButtons[i].x-7,velocityButtons[i].y+8);
    }
    // Show labels with instructions to the user
    fill(0,0,0);
    text("Mass:",10,35);
    text("Velocity:",250,35);
    if (selected.awaitingReset)
    {
      text("CLICK CAR TO RESET",500,35);
    }
    else if (!selected.movementStarted)
    {
      text("CLICK CAR TO START",500,35);
    }
    text("(click other cars to switch)",800,35);
  }
  
  void mouseClicked()
  {
    if (selected.movementStarted && !selected.awaitingReset)
    {
      // Ignore input attempts if there is a car in motion
      return;
    }
    
    // Check if the clicked region is one of the cars
    for (int i = 0; i < this.allCars.length; i++)
    {
      // Respond appropriately depending on the car's status
      if ( overCar(allCars[i]) )
      {
        if (selected != allCars[i])
        {
          selected = allCars[i];
        }
        else if (selected.awaitingReset)
        {
          selected.reset();
        }
        else if (!selected.movementStarted)
        {
          selected.startMoving();
        }
      }
    }
    
    // Mass and velocity can only be set before movement begins
    if (selected.movementStarted)
    {
      return;
    }
 
    // Check all of the mass input buttons   
    for (int i = 0; i < this.massButtons.length; i++)
    {
      // Modify the active car's value if appropriate
      if ( overButton(massButtons[i].x,massButtons[i].y,25) ) {
        selected.setMass(massValues[i]);
      }
    }
    
    // Check all of the velocity input buttons
    for (int i = 0; i < this.velocityButtons.length; i++)
    {
      // Modify the active car's value if appropriate
      if ( overButton(velocityButtons[i].x,velocityButtons[i].y,25) ) {
        selected.setVelocity(velocityValues[i]);
      }
    }
  }
}


