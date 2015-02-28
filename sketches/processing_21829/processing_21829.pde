
/* @author Vivian Wong
 * @version 0.1
 * All comments I've added to this sketch will be in 'slash star' format.
 *
 * Description: This monster has a bunch of eyes that follow the cursor
 * when either mouse button is pressed and held, the eyes get scared and run away
 * from the cursor until the button is released. When the button is released,
 * the eyes come back cautiously to follow the mouse.
*/

/*Adapted from Worms monster sketch*/
//Gabe Graham 4/1/09
/*with excerpts from mb09's BlinkingEyeMonster code*/

//Array of /*blinking eyes*/
BlinkingEye[] beEyes;
int iEyes = 200; //number of /*blinking eyes*/

void setup() {
  /*initial set up of the "screen" including size, smoothing and frame rate*/
  size(800,600,P2D);
  noSmooth();
  frameRate(30);
  /*initializes a BlinkingEye array with 100 eyes*/
  beEyes = new BlinkingEye[iEyes];
  /*initialize each BlinkingEye object individually*/
  for(int i = 0; i < iEyes; i++)
  {
    /*randomizes the speed, movement direction, target location and steering*/
    beEyes[i] = new BlinkingEye(random(1.5,4),random(0.5,2),random(50,200),random(-.1,.1));
  }
}

void draw() {
  /*draw the background as white*/
  background(255);
  /*iterate through all of the eyes and update, then draw each one*/
  for(int i = 0; i < iEyes; i++)
  {
    beEyes[i].update();
    beEyes[i].draw();
  }
} 

/*Now a hybrid of code from mb09 and Gabe Graham's code*/
class BlinkingEye 
{
  /*x and y position of target, based on where the mouse is*/
  float fXTarget, fYTarget;
  /*x and y position of eye*/
  float fX, fY;
  //randomness for target
  float fRandTarget;
  //randomness for movement
  float fRandMove;
  //pixels per second 
  float fSpeed;
  /*"age" of eye, how long the eye has been active*/
  int iAge;
  //steering offset in radians
  float fSteer;
  //angle that worm is moving
  float fAngle;
  
  /*constructor for one instance of an eye.
   * @param speed: the initial speed of the eye
   * @param move: how random the movement of the eye is
   * @param target: where the target is
   * @param steer: the offset of how directly the eye gets to the target
   */
  BlinkingEye(float speed, float move, float target, float steer) 
  {
    /*initializes a BlinkingEye at the mouse's x and y*/
    fX = mouseX + random(-2, 2);
    fY = mouseY + random(-2, 2);
    /*initialize the eye's speed*/
    fSpeed = speed;
    /*initialize fRandMove with a random value*/
    fRandMove = move;
    /*initialize fRandTarget with a random value*/
    fRandTarget = target;
    /*initialize fSteer with a random value*/
    fSteer = steer;
    /*initialzie iAge to 0 because the eye is a baby*/
    iAge = 0;
  }
  
  void update() 
  {
    //find target, add some randomness
    /*adds mouse reactivity*/
    fXTarget = mouseX + random(-fRandTarget, fRandTarget);
    fYTarget = mouseY + random(-fRandTarget, fRandTarget);
    
    //get angle to target
    /*go towards the mouse*/
    fAngle = atan2((fYTarget - fY), (fXTarget - fX)) + fSteer;
    
    /*check if mouse button is being pressed*/
    if (mousePressed == true)
    {
      //reverse direction if mouse pressed
      fAngle = PI + fAngle;
      /*increase speed gradually as the monster gets more scared*/
      fSpeed += fSpeed * .1;
    }
    else {
      /*reset speed to what it was originally if the mouse button is released*/
      fSpeed = random(1.5, 4);
    }
    
    //update position of /*eye based on the speed the eye is moving and the angle it is moving in*/
    fX += fSpeed * cos(fAngle);
    fY += fSpeed * sin(fAngle);
    
    /*update age each time update is called*/
    iAge++;
      
    //keep within bounds
    if (fX > width) /*if x position is too far to the right...*/
     { 
       fX = width; /*then reset the x position to on the edge of the right side*/
     }
    if (fX < 0) /*if x position is too far to the left...*/
     {
       fX = 0; /*then set the x position to on the edge of the left side*/
     }
    if (fY > height) /*if y position is too far to the bottom...*/
     {
       fY = height; /*then set the y position to on the edge of the bottom*/
     }
    if (fY < 0) /*if y position is too far to the top...*/
     {
       fY = 0; /*then set the y position to on the edge of the top*/
     }    
  }
  
  //draw /*eye*/  
  void draw() 
  { 
    /*add matrix onto the top of the matrix stack*/
    pushMatrix();
    /*displaces the eye by fX and fY*/
    translate(fX, fY);
    /*fill with black*/
    fill(0);
    /*draw a circle of diameter 35*/
    ellipse(0, 0, 35, 35);
    
    /*add matrix onto the top of the matrix stack*/
    pushMatrix();
    /*if the age divided by 100 comes out evenly to 95...*/
    if(iAge % 100 > 95)
    {
      /*makes the eye blink*/
      scale(1, .2);
    }
    
    /*fill with white*/
    fill(255);
    /*draw a circle with diameter 17*/
    ellipse(0, 0, 17, 17);
    /*remove the matrix from top of the matrix stack*/
    popMatrix();
    
    /*fill with black*/
    fill(0);
    /*draw a circle with diameter 3*/
    ellipse(0, 0, 3, 3);
    /*remove the matrix from top of the matrix stack*/
    popMatrix();
  }
  
}

