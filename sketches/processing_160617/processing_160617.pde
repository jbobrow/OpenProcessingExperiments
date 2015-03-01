
/*
  @pjs preload="background.png, car.png, masspile0.png, masspile1.png, masspile2.png, masspile3.png, masspile4.png, masspile5.png, masspile6.png, masspile7.png, masspile8.png, masspile9.png";
*/

Game game;

void setup() {
  size(960, 540);
  game = new Game();
  game.setup();
}

void draw() {
  game.update(); // update positions
  game.draw(); // draw game
}

void mousePressed()
{
  game.handleMousePressed();
}

void mouseDragged()
{
  game.handleMouseDragged();
}

void mouseReleased()
{
  game.handleMouseReleased();
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
  PVector previousLocation; // the location at last update
  PVector startingLocation; // the start location
  float velocity; // current velocity

    float mass; // the car's mass
  float massUnit; // the amount to increment or decrement mass when adding or removing mass
  float brakeStrength; // how strongly to apply the brakes

  PImage img; // the car's sprite to draw to screen
  PVector dimensions; // the car's rectangular dimensions

    boolean braking = false; // whether the car is currently braking
  boolean disableUserControl = false; // whether the user can control the car at this point in time
  boolean userInControl = false; // whether the user is currently controlling the car
  boolean awaitingReset = false; // if true, the car is frozen and awaiting the user to click the reset button
  boolean firstTouch = false; // records when the first touch of the car happens. For display purposes only.

  PVector locationDragOffset = new PVector(); // while the user is dragging the car, this is the offset of the mouse/touch location in comparison to the car's location

  PImage[] massPileImgs; // list of mass pile images
  PVector massPileDimensions; // dimensions of the clickable mass pile area
  int massPileLevel; // current mass level
  PVector massPileOffset; // display offset for the mass pile in comparison to the car
  
  PImage resetText;
  PVector resetTextDrawOffset; // display offset for the reset text
  PImage pushToStart;

  int maxCarMass = 9;
  int minCarMass = 0;
  
  int rightSidePadding;

  Game game;

  Car(int x, int y, PImage carImg, PImage[] massPileImages, PImage resetTxt, PImage pts, Game g) {
    this.game = g;

    this.massPileImgs = massPileImages;
    this.img = carImg;

    this.dimensions = new PVector(this.img.width, this.img.height);
    this.massPileDimensions = new PVector(massPileImages[0].width, massPileImages[0].height);

    this.massPileLevel = 0;
    
    this.resetText = resetTxt;
    this.resetTextDrawOffset = new PVector(150, -40);
    
    this.pushToStart = pts;

    this.mass = 1;
    this.massUnit = 0.1;
    this.brakeStrength = 0.1;
    this.startingLocation = new PVector(x, y);
    this.location = new PVector(startingLocation.x, startingLocation.y);
    this.previousLocation = new PVector(location.x, location.y);
    this.velocity = 0.0f;
    this.massPileOffset = new PVector(10, -25);
    
    this.rightSidePadding = 400;
  }

  void update() {

    // Only simulate if the car is not awaiting reset (i.e. frozen)
    if (!this.awaitingReset)
    {
      // if the user is in control, apply controlled movment to car
      // else simulate the car's movement based upon velocity, etc.
      if (this.userInControl)
      {
        // set the velocity for when the user lets go of the car
        velocity = location.x - previousLocation.x;
      } else
      {
        // If currently braking, apply friction.
        if (this.braking)
        {
          // calculate the amount of force the brakes apply
          float force = this.velocity * this.brakeStrength / (this.mass + this.massPileLevel * this.massUnit);


          // if the force and velocity become sufficiently small enough, wipe the velocity and set the awaitingReset flag to stop simulating
          // this is to avoid the car continuing to move very slowly after it should have come to a rest.
          if (force < 0.001 && this.velocity < 0.001)
          {
            this.velocity = 0.0f;
            this.awaitingReset = true;
          } else
          {
            // apply force in the opposite direction of the velocity     
            this.velocity += -(force);
          }
        }

        // Apply the velocity to move the car
        location.x += velocity;
      }

      // Make sure the car stays within the 'play' area
      this.constrainMovement();

      // save the location for next update
      this.previousLocation.x = location.x;
      this.previousLocation.y = location.y;

      // if the car has crossed the finish line and isn't already braking, start braking
      if (!this.braking && game.finishLine.isFinished() )
        this.startBraking();
    }
  }

  void draw() {
    // draw the reset text
    if(this.awaitingReset)
    {
      image(resetText, location.x+resetTextDrawOffset.x, location.y+resetTextDrawOffset.y);
    }
    
    // if the car hasn't been touched yet, display a helpful message
    // use the reset text offset
    if(!this.firstTouch)
    {
      image(pushToStart, location.x+resetTextDrawOffset.x, location.y+resetTextDrawOffset.y);
    }
    
    // draw the mass pile
    image(this.massPileImgs[this.massPileLevel], location.x+massPileOffset.x, location.y+massPileOffset.y, this.massPileDimensions.x, this.massPileDimensions.y);
    // draw the car
    image(img, location.x, location.y, this.dimensions.x, this.dimensions.y);
  }

  void startBraking()
  {
    this.braking = true;
    this.disableUserControl = true;
    this.userInControl = false;
  }

  void reset()
  {
    this.location.x = startingLocation.x;
    this.location.y = startingLocation.y;

    this.velocity = 0.0f;

    this.braking = false;
    this.disableUserControl = false;
    this.userInControl = false;
    this.awaitingReset = false;
  }

  void mousePressed()
  {
    // if the mouse is over the car when it's pressed...
    if (mouseX >= location.x && mouseX <= (location.x + this.dimensions.x)
      && mouseY >= location.y && mouseY <= (location.y + this.dimensions.y))
    {
      // and user control isn't disabled
      if (!this.disableUserControl
        && mouseX >= location.x && mouseX <= (location.x + this.dimensions.x)
        && mouseY >= location.y && mouseY <= (location.y + this.dimensions.y))
      {
        // set the user control flag so mouse movement is applied to the car
      
        // check to see if user clicked on mass pile
        if (mouseX >= location.x+massPileOffset.x && mouseX <= (location.x+massPileOffset.x + massPileDimensions.x)
          && mouseY >= location.y+massPileOffset.y && mouseY <= (location.y+massPileOffset.y + massPileDimensions.y))
        {
          this.removeMass();
          this.game.massPile.addMass();
        } else
        {
          println("User has taken control of car");
          this.firstTouch = true;
          this.userInControl = true;
          locationDragOffset.x = mouseX - location.x;
          locationDragOffset.y = mouseY - location.y;
        }
      }
      else if(this.awaitingReset) // if the car is awaiting reset, reset it.
      {
        this.game.reset();
      }
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

  void mouseDragged()
  {
    // if user is currently in control of car
    // apply mouse movement to car
    if (this.userInControl)
    {
      this.location.x = mouseX - this.locationDragOffset.x;
    }
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

  void addMass()
  {
    if (this.massPileLevel < this.maxCarMass)
    {
      this.massPileLevel++;
      println("Car mass is now level " + this.massPileLevel);
    } else
      println("Cannot add mass. Car mass is already level " + this.massPileLevel);
  }

  void removeMass()
  {
    if (this.massPileLevel > this.minCarMass)
    {
      this.massPileLevel--;
      println("Car mass is now level " + this.massPileLevel);
    } else
      println("Cannot remove mass. Car mass is already level " + this.massPileLevel);
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

  //PImage background;

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
    PImage massPileText = loadImage("clicktoload.png");
    PImage carMassPileText = loadImage("clicktounload.png");
    PImage resetText = loadImage("clicktoreset.png");
    PImage pushToStart = loadImage("pushtostart.png");
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
    
    this.massPile = new MassPile(0, 380, massPileImages, massPileText, this);
    this.car = new Car((int)massPile.imgs[0].width+100, 375, carImg, massPileImages, resetText, pushToStart, this);
    this.finishLine = new FinishLine(finishlineImg, goImg, stopImg, this);
    this.background = new Background(backgroundImg);
  }

  void update()
  {
    this.car.update();
  }

  void draw()
  {
    //image(this.background, 0, 0, width, height);
    
    this.background.draw(this.screenDrawOffset);
    this.finishLine.draw(this.screenDrawOffset);
    this.massPile.draw(this.screenDrawOffset);
    this.car.draw();
  }

  void handleMousePressed()
  {
    car.mousePressed();
    massPile.mousePressed();
  }

  void handleMouseReleased()
  {
    car.mouseReleased();
  }

  void handleMouseDragged()
  {
    car.mouseDragged();
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

  PImage massPileText;
  PVector massPileDrawOffset;

  Game game;

  MassPile(int x, int y, PImage[] images, PImage mpt, Game g)
  {
    this.game = g;
    this.imgs = images;
    this.dimensions = new PVector(images[0].width, images[0].height);
    this.location = new PVector(x, y);
    this.massLevel = 9;
    this.massPileText = mpt;
    this.massPileDrawOffset = new PVector(0, -30);
  }

  void draw(int drawOffset) {
    if (this.massLevel > 0 && this.game.car.velocity == 0.0f && !this.game.car.userInControl)
    {
      image(massPileText, location.x - drawOffset + this.massPileDrawOffset.x, location.y + this.massPileDrawOffset.y);
    }
    image(imgs[massLevel], location.x - drawOffset, location.y, dimensions.x, dimensions.y);
  }

  void mousePressed()
  {
    // if the mouse is over the mass pile when it's pressed,
    // and there is still mass left to add, add mass to the car
    if (mouseX >= this.location.x && mouseX <= (this.location.x + this.dimensions.x)
      && mouseY >= this.location.y && mouseY <= (this.location.y + this.dimensions.y)
      && massLevel > 0
      && !this.game.car.disableUserControl)
    {
      println("Adding mass to car.");
      this.game.car.addMass();
      this.removeMass();
    }
  }

  void addMass()
  {
    if (massLevel < 9)
      this.massLevel++;
  }

  void removeMass()
  {
    if (massLevel > 0)
      this.massLevel--;
  }

  void reset()
  {
    this.massLevel = 9;
  }
}



