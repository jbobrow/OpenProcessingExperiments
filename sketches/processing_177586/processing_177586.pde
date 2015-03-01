
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/160617*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
  @pjs preload="background.png, car.png, masspile0.png, masspile1.png, masspile2.png, masspile3.png, masspile4.png, masspile5.png, masspile6.png, masspile7.png, masspile8.png, masspile9.png";
*/

Game game;

void setup() {
  size(960, 542);
  frameRate(20);
  smooth();
  game = new Game();
  game.setup();
}

void draw() {
  game.update(); // update positions
  game.draw(); // draw game
}

void mouseClicked()
{
  game.mouseClicked();
}

boolean overButton(float x, float y, float diameter)
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2) {
    return true;
  } else {
    return false;
  }
}

class Background {
  PImage backgroundImage;

  Background(PImage img)
  {
    this.backgroundImage = img;
  }

  void draw(int drawOffset) {
    
    // wind the offset back to be the difference of a screen width
    while(drawOffset > width)
    {
      drawOffset -= width;
    }
    
    background(255);
    image(backgroundImage, -drawOffset, 0, width, height);
    image(backgroundImage, -drawOffset+width, 0, width, height);
  }
}

class Car {

  PVector location; // current location
  PVector startingLocation; // the start location
  float velocity; // current velocity
  float startingVelocity; // the start velocity

  float mass; // the car's mass
  float massUnit; // the amount to increment or decrement mass when adding or removing mass
  float brakeStrength; // how strongly to apply the brakes

  PImage img; // the car's sprite to draw to screen
  PVector dimensions; // the car's rectangular dimensions

  boolean braking = false; // whether the car is currently braking
  boolean awaitingReset = false; // if true, the car is frozen and awaiting the user to click the reset button
  boolean movementStarted = false; // whether the car's movement has been initiated

  PImage[] massPileImgs; // list of mass pile images
  PVector massPileDimensions; // dimensions of the clickable mass pile area
  int massPileLevel; // current mass level
  PVector massPileOffset; // display offset for the mass pile in comparison to the car

  int maxCarMass = 9;
  int minCarMass = 0;
  
  int rightSidePadding;

  Game game;

  Car(int x, int y, PImage carImg, PImage[] massPileImages, Game g) {
    this.game = g;

    this.massPileImgs = massPileImages;
    this.img = carImg;

    this.dimensions = new PVector(this.img.width, this.img.height);
    this.massPileDimensions = new PVector(massPileImages[0].width, massPileImages[0].height);

    this.massPileLevel = 0;
    this.massPileOffset = new PVector(10, -25);

    this.mass = 1;
    this.massUnit = 0.1;
    this.brakeStrength = 0.1;
    
    this.startingLocation = new PVector(x, y);
    this.location = new PVector(startingLocation.x, startingLocation.y);
    this.startingVelocity = 0.0f;
    this.velocity = this.startingVelocity;
  
    this.rightSidePadding = 400;
  }

  void update() {

    // Only simulate if the car is not awaiting reset (i.e. frozen)
    if (!this.awaitingReset)
    {
      // simulate the car's movement based upon velocity, etc.
      // If currently braking, apply friction.
      if (this.braking)
      {
        // calculate the amount of force the brakes apply
        float force = this.velocity * this.brakeStrength / (this.mass + this.massPileLevel * this.massUnit);

        // if the force and velocity become sufficiently small enough, wipe the velocity and set the awaitingReset flag to stop simulating
        // this is to avoid the car continuing to move very slowly after it should have come to a rest.
        if (force < 0.1 && this.velocity < 0.1)
        {
          this.velocity = 0.0f;
          this.awaitingReset = true;
          println("Movement has finished, ready to begin again");
        }
        else
        {
          // apply force in the opposite direction of the velocity     
          this.velocity += -(force);
        }
      }

      // Apply the velocity to move the car
      location.x += velocity;

      // Make sure the car stays within the 'play' area
      this.constrainMovement();

      // if the car has crossed the finish line and isn't already braking, start braking
      if (!this.braking && game.finishLine.isFinished() )
      {
        this.startBraking();
      }
    }
  }

  void draw() {
    // draw the mass pile
    image(this.massPileImgs[this.massPileLevel], location.x+massPileOffset.x, location.y+massPileOffset.y, this.massPileDimensions.x, this.massPileDimensions.y);
    // draw the car
    image(img, location.x, location.y, this.dimensions.x, this.dimensions.y);
  }

  void startBraking()
  {
    this.braking = true;
    println("Car has crossed the finish line, braking has begun");
  }

  void reset()
  {
    this.location.x = startingLocation.x;
    this.location.y = startingLocation.y;

    this.velocity = 0.0f;
    this.startingVelocity = 0.0f;

    this.braking = false;
    this.awaitingReset = false;
    this.movementStarted = false;
  }

  // constrain to viewable area
  void constrainMovement() {
    
    // if the car goes past where the rightside padding starts,
    // return the car to the edge of the buffer and move the screen
    if (location.x > width-this.rightSidePadding)
    {
      this.game.moveScreen(location.x - (width-this.rightSidePadding));
      location.x = width-this.rightSidePadding;
    } else if (location.x < 0)
    {
      location.x = 0;
      velocity = 0.0f;
    }
  }
  
  void setMass(int newMass)
  {
    if (newMass < this.minCarMass)
    {
      this.massPileLevel = this.minCarMass;
    }
    else if (newMass > this.maxCarMass)
    {
      this.massPileLevel = this.maxCarMass;
    }
    else
    {
      this.massPileLevel = newMass;
    }
  }
  
  void setVelocity(int initialVelocity)
  {
    this.startingVelocity = initialVelocity;
    this.velocity = this.startingVelocity;
    this.movementStarted = true;
    println("Car has begun moving with mass: "+this.massPileLevel+" and velocity: "+this.startingVelocity);
  }
}

class FinishLine {

  PVector location;
  PVector dimensions;
  PVector lightsOffset;
  
  PImage line, go, stop;

  Game game;

  FinishLine(PImage finishLineImg, PImage goImg, PImage stopImg, Game g)
  {
    this.game = g;
    
    this.line = finishLineImg;
    this.go = goImg;
    this.stop = stopImg;

    this.dimensions = new PVector(10, 220);
    this.location = new PVector(1000, 242);
    this.lightsOffset = new PVector(-20, -110);
  }
  
  void draw(int drawOffset)
  {
    image(this.line, location.x - drawOffset, location.y);
    if(this.game.car.braking)
    {
      image(this.stop, location.x+lightsOffset.x - drawOffset, location.y+lightsOffset.y);
    }
    else
    {
      image(this.go, location.x+lightsOffset.x - drawOffset, location.y+lightsOffset.y);
    }
  }

  boolean isFinished()
  {
    // check whether the car is past the finish line, taking into account the screen offset
    if(this.game.car.location.x + this.game.car.dimensions.x > this.location.x-this.game.screenDrawOffset)
    {
      return true;
    }
    return false;
  }
}

class Game {

  Car car;
  MassPile massPile;
  FinishLine finishLine;
  Background background;
  int screenDrawOffset; // how far the screen has moved to the right
  
  PVector[] massButtons;
  int[] massValues;
  PVector[] velocityButtons;
  int[] velocityValues;

  Game()
  {
  }

  void setup()
  {
    PImage carImg = loadImage("car.png");
    
    PImage finishlineImg = loadImage("finishline.png");
    PImage goImg = loadImage("go.png");
    PImage stopImg = loadImage("stop.png");
    PImage backgroundImg = loadImage("background.png");
    PImage[] massPileImages = new PImage[] {
      loadImage("masspile0.png"), 
      loadImage("masspile1.png"), 
      loadImage("masspile2.png"), 
      loadImage("masspile3.png"), 
      loadImage("masspile4.png"), 
      loadImage("masspile5.png"), 
      loadImage("masspile6.png"), 
      loadImage("masspile7.png"), 
      loadImage("masspile8.png"), 
      loadImage("masspile9.png")
      };
    
    this.massPile = new MassPile(0, 380, massPileImages, this);
    this.car = new Car((int)massPile.imgs[0].width+1, 375, carImg, massPileImages, this);
    this.finishLine = new FinishLine(finishlineImg, goImg, stopImg, this);
    this.background = new Background(backgroundImg);
    
    this.massButtons = new PVector[] {
      new PVector(100,30),
      new PVector(140,30),
      new PVector(180,30),
      new PVector(220,30)
    };
    this.massValues = new int[] { 0, 3, 6, 9 };
    this.velocityButtons = new PVector[] {
      new PVector(370,30),
      new PVector(410,30),
      new PVector(450,30),
      new PVector(490,30)
    };
    this.velocityValues = new int[] { 20, 40, 60, 80 };
    textSize(24);
  }

  void update()
  {
    this.car.update();
  }

  void draw()
  {
    this.background.draw(this.screenDrawOffset);
    this.finishLine.draw(this.screenDrawOffset);
    this.massPile.draw(this.screenDrawOffset);
    this.car.draw();
    
    for (int i = 0; i < this.massButtons.length; i++)
    {
      if ( massValues[i] == car.massPileLevel) {
        fill(255,255,0);
      } else if ( overButton(massButtons[i].x,massButtons[i].y,25) ) {
        fill(0,0,255);
      } else {
        fill(255,0,0);
      }
      ellipse(massButtons[i].x,massButtons[i].y,25,25);
      if ( massValues[i] == car.massPileLevel) {
        fill(0,0,0);
      } else {
        fill(255,255,255);
      }
      text(i+1,massButtons[i].x-7,massButtons[i].y+8);
    }

    for (int i = 0; i < this.velocityButtons.length; i++)
    {
      if (velocityValues[i] == car.startingVelocity) {
        fill(255,255,0);
      } else if ( overButton(velocityButtons[i].x,velocityButtons[i].y,25) ) {
        fill(0,0,255);
      } else {
        fill(255,0,0);
      }
      ellipse(velocityButtons[i].x,velocityButtons[i].y,25,25);
      if (velocityValues[i] == car.startingVelocity) {
        fill(0,0,0);
      } else {
        fill(255,255,255);
      }
      text(i+1,velocityButtons[i].x-7,velocityButtons[i].y+8);
    }
    fill(0,0,0);
    text("Mass:",10,35);
    text("Velocity:",250,35);
    if (car.awaitingReset)
    {
      textSize(100);
      text("CLICK TO RESET",100,300);
      textSize(24);
    }
  }
  
  void mouseClicked()
  {
    if (car.movementStarted)
    {
      if (car.awaitingReset)
      {
        this.reset();
      }
      return;
    }
    for (int i = 0; i < this.massButtons.length; i++)
    {
      if ( overButton(massButtons[i].x,massButtons[i].y,25) ) {
        car.setMass(massValues[i]);
        massPile.setMass(9-massValues[i]);
      }
    }
    
    for (int i = 0; i < this.velocityButtons.length; i++)
    {
      if ( overButton(velocityButtons[i].x,velocityButtons[i].y,25) ) {
        car.setVelocity(velocityValues[i]);
      }
    }
  }

  void reset()
  {
    this.screenDrawOffset = 0;
    this.car.reset();
  }
  
  void moveScreen(float amount)
  {
    this.screenDrawOffset += amount;
  }
}

class MassPile {
  PVector location;
  PVector dimensions;

  PImage imgs[]; // sprites to draw to screen
  int massLevel; // the level of mass left

  PVector massPileDrawOffset;
  
  int minPileSize = 0;
  int maxPileSize = 9;

  Game game;

  MassPile(int x, int y, PImage[] images, /*PImage mpt,*/ Game g)
  {
    this.game = g;
    this.imgs = images;
    this.dimensions = new PVector(images[0].width, images[0].height);
    this.location = new PVector(x, y);
    this.massLevel = 9;
    this.massPileDrawOffset = new PVector(0, -30);
  }

  void draw(int drawOffset) {
    image(imgs[massLevel], location.x - drawOffset, location.y, dimensions.x, dimensions.y);
  }
  
  void setMass(int newMass)
  {
    if (newMass < this.minPileSize)
    {
      this.massLevel = this.minPileSize;
    }
    else if (newMass > this.maxPileSize)
    {
      this.massLevel = this.maxPileSize;
    }
    else
    {
      this.massLevel = newMass;
    }
  }
}




