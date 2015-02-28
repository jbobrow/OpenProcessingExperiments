
class ImageNavigator extends MouseRegionDetector
{
  /** the image to navigate **/
  PImage img;

  // positions
  float xPos;
  float yPos;
  float rotation;
  float elevation;
  int maxDistance;

  // speeds
  float speed;
  float rotationSpeed;
  float elevationSpeed;

  // animation frame features
  int numFrames;
  /** the var x is used to iterate through 
   * the frames of the sprite image arrays **/
  int x; 
  // the sprite is to be centered in the center of the 
  // screen, so we have to displace it by half it's width and
  // height - we could use imageMode, but it's sometimes depricated ...
  int spriteWidthDisplacement;
  int spriteHeightDisplacement;

  // sprite image arrays
  PImage[] forward;
  PImage[] left;

  ImageNavigator( PImage img, PImage[] forwardSprites, PImage[] leftSprites )
  {
    this.img = img;
    rotation = 0;
    xPos = img.width/2;
    yPos = img.height/2;
    // the hypotenuse of the image is the maximum distance from the origin
    maxDistance = (int)dist( 0, 0, img.width, img.height );
    rotationSpeed = .05;
    speed = 10;
    elevation = 1.0;
    elevationSpeed = .01;
    forward = forwardSprites;
    left = leftSprites;
    // this is the java 'ternary operator'
    numFrames = ( forwardSprites.length < leftSprites.length ? 
    forwardSprites.length : leftSprites.length );
    x = 0;
    spriteWidthDisplacement = forwardSprites[0].width/-2;
    spriteHeightDisplacement = forwardSprites[0].height/-2;
  }

  void display()
  {
    // erase everything
    background( 0 );
    // make the origin in the middle of the screen
    translate( width/2, height/2 );
    // paint the background image
    paintBackgroundImage();
    // handle mouse presses
    handleMousePresses();
    // paint the sprite and handle mouse movement
    paintSprite();
  }

  void paintBackgroundImage()
  {
    // remember our position
    pushMatrix();
    // rotate all the coordinates from the center
    rotate( rotation ); 
    // make way for scale
    pushMatrix();
    scale( elevation );
    // adjust to new position
    translate( -xPos, -yPos );
    // paint the image at the twisted coordinates
    image( img, 0, 0 );
    // paint an exciting rectangle around the image
    stroke( random( 255 ), random( 255 ), random( 255 ) );
    noFill();
    strokeWeight( 10 );
    rect( -10, -10, img.width+20, img.height+20 );
    // recall the old position
    // we pushed twice so now 
    // we have to pop twice
    popMatrix(); 
    popMatrix();
  }

  void handleMousePresses()
  {
    // handle  mouse buttons - ELEVATION
    // move up in the air when left button pressed
    if( mousePressed && (mouseButton == LEFT ))
    {
      changeElevation( elevationSpeed );
    }
    // move down in the air when right button pressed
    if( mousePressed && (mouseButton == RIGHT))
    {
      changeElevation( -1*elevationSpeed );
    }
    // in emergencies, go back home
    if( mousePressed && ( mouseButton == CENTER ))
    {
      xPos = img.width/2;
      yPos = img.height/2;
      rotation = 0; 
    }
  }

  void paintSprite()
  {
    // HANDLE MOUSE MOVEMENT
    if( mouseCenter() ) // give our mouse users a rest in the middle
    {
      // paint normal forward movement but don't advance
      image( forward[x], spriteWidthDisplacement, spriteHeightDisplacement ); 
    }
    else 
    {
      // go forward when mouse is in top part of window
      if( mouseN() )
      {
        move( -1*speed ); // go UP
        image( forward[x], spriteWidthDisplacement, spriteHeightDisplacement );
      }
      // go backward when mouse is in bottom part of window
      if( mouseS() )
      {
        move( speed ); // go DOWN
        //remember where we were
        pushMatrix();
        // flip it so that up looks down
        scale( 1, -1 );
        image( forward[x], spriteWidthDisplacement, spriteHeightDisplacement );
        // leave things the way we found them
        popMatrix();
      }
      // turn to right if mouse is in right part of window
      if( mouseEN() )
      {
        twist( rotationSpeed );
        //remember where we were
        pushMatrix();
        //flip it so left looks right
        scale( -1, 1 );
        image( left[x], spriteWidthDisplacement, spriteHeightDisplacement );
        // leave things the way we found
        popMatrix();
      }
      // turn to the left if mouse is in left part of window
      if( mouseWN() )
      {
        image( left[x], spriteWidthDisplacement, spriteHeightDisplacement );
        twist( -rotationSpeed );
      }
      if( mouseES() )
      {
        pushMatrix();
        scale( -1, -1 );
        image( left[x], spriteWidthDisplacement, spriteHeightDisplacement );
        popMatrix();  
        twist( -rotationSpeed );
      }
      if( mouseWS() )
      {
        pushMatrix();
        scale( 1, -1 );
        image( left[x], spriteWidthDisplacement, spriteHeightDisplacement );
        popMatrix();  
        twist( rotationSpeed ); 
      }
    }

    // slow down there!
    // only refresh sprite every five frames
    if( frameCount % 5 == 0 )
    {
      x++;
      // loop
      if( x >= numFrames )
      {
        x = 0;
      }
    }
  }

  void move( float amount )
  {
    // now, don't forget the unit circle, kids
    xPos = constrain( xPos + int(amount*sin(rotation)), -maxDistance, maxDistance );
    yPos = constrain( yPos + int(amount*cos(rotation)), -maxDistance, maxDistance );
  }
  void twist( float amount )
  {
    rotation -= amount;
  }

  void changeElevation( float speed )
  {
    // I might want to add a logarithmic scale to give more speed between 0 and 1 and less speed

      // when not between 0 and 1.
    if( speed > 0 )
    {
      elevationSpeed = constrain( elevationSpeed * 1.02, .01, .3 );
    } 
    else 
    {
      elevationSpeed = constrain( elevationSpeed * .98, .01, .3 );
    }
    elevation = constrain( elevation + speed, .7, 6 ); 
  }

  void debug()
  {
    println( "rotation is " + rotation + 
      " and xPos is " + xPos + " and yPos is " 
      + yPos );
  }
}

