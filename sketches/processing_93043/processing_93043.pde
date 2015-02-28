
ArrayList Pixels = new ArrayList();  //this will hold the pixels funniliy enough
ArrayList colours = new ArrayList(); //this hold the colour of each pixel of the image
color col;
public PImage img;                   //this is my balloons image
boolean start = false;               //a boolean to decide whether to start scattering



void setup() {
  size(500, 500,P2D);
  img = loadImage("balloons.jpg");
  background(img);
 

  for (int x = 0; x < width; x++) {     //cycles x coordinates
    for (int y = 0; y < height; y++) {  //cycles x coordinates
      col = get(x, y);      //gets the colour of the pixel at the (x,y) location
      colours.add( col );   //adds my col to my array so I can find it later
      Pixels.add( new pixel(x, y, col) ); //add a pixel to my array, with x,y and corresponding colout

      // println(colours); never ever do this! its  factorial 250000!
      // which is approx 3.018 * 10^1240914
    }
  }
}


void draw() {
  if (mousePressed) {
    start = true;
  }

  if (keyPressed) {
    start = false;
  }
  
  background(0);

  for (int i = 0; i < Pixels.size(); i++) { //Cycle through every pixel in my array
    pixel myDot = (pixel) Pixels.get(i);    //rename each one myDot temporarily for easier use
    myDot.make();                           //assigns the stroke colout and draws the point
    if (start) {                  //was originally if(mousePressed) but this caused stopping and starting
      myDot.move();                        //moves pixels, and slows them down if they hit my repel()
      myDot.bounce();                      //bounce of walls
      myDot.repel(50, -5);                //for 50 px around the mouse, repel all pixels with -5
    }
    if (!start) myDot.originalPosition(); //if ive pushed a key, run the orignalPosition thingy 
  }
}

class pixel {
  PVector pos = new PVector();  //position
  PVector vel = new PVector();  //velocity
  PVector origPos = new PVector();  //where the pixels were assigned in setup()
  color col;                    //the colour...


  pixel(float x, float y, color _col) {

    col=_col;       //this is the input from get(x,y) in setup()

    origPos.x = x;  //giving the original position a value. It seems like a messy way
    origPos.y = y;  //to do it but the commented out line below threw up weird effects.
    //origPos.equals(pos);  //giving my origPos vector a value before velocity makes life awkward


    pos.x = x;      //just giving the vector a value
    pos.y = y;

    vel.x = random(-3, 3);  //velocity is left or right
    vel.y = random(-3, 3);  //and now its up and down
  } 

  void make() {
    strokeWeight(1);      //QUICK NOTE: Setting this to any value other than one causes
    //my laptop to really spit the dummy, but it gives some nice frosted glass
    //or pixelated effects. look at optimisation

    stroke(col);        //set the colout 
    point(pos.x, pos.y);
  }

  void move() {
    if ( abs(vel.x) > 3) vel.x *= .4;   // make the velocity positive for maths purposes 
    if ( abs(vel.y) > 3) vel.y *= .4;   // if its greater than 3 (because of my repel() )
    // then slow it down
    pos.add(vel);  //add velocity to position
  }


  void bounce() {
    if (pos.x  > width) {  
      pos.x = width - 1;          //make it equal at least 1 px in from any edge
      vel.x = abs(vel.x) * -1;   //otherwise pixels can be lost in borders
    }                           //e.g bouncing circle sketches where the circle gets stuck
    if (pos.x  < 0) {          //because it can't follow its own rules properly
      pos.x = 1;          
      vel.x *= -1;
    }
    if (pos.y  > height) {  
      pos.y = height - 1; 
      vel.y = abs(vel.y) * -1;
    }  
    if (pos.y  < 0) {  
      pos.y = 1;          
      vel.y *= -1;
    }
  }

  void repel(float area, float strength)  //area of repulsion, strength of repulsion
  {
    PVector mouse = new PVector(mouseX, mouseY);
    float distance = mouse.dist(pos); //find distance between mouse and pixel
    if (distance < area)              //if its within the area of repulsion then...
    {
      PVector newVel = new PVector();
      if (pos.x >= mouse.x) newVel.x += (area-distance) * strength ;
      else newVel.x -= (area-distance) * strength ;
      //find if the particle is to the left of right of the mouse
      //then subtract or add respectively, the distance between the two multiplied by
      //the strength. QUICK NOTE: negative strength values repel, positive attract(poorly)

      //  Exactly the same thing happens below but for up and down instead of left and right.

      if (pos.y >= mouse.y) newVel.y += (area-distance) * strength ;
      else newVel.y -= (area-distance) * strength ;
      vel.sub(newVel);
    }
  }

  void originalPosition() {

    float targetX = origPos.x;    //where i want to be on x axis
    float targetY = origPos.y;    //where i want to be on the y axis
    float dx = targetX - pos.x;   //difference between where i am, and where i want to be
    float dy = targetY - pos.y;    
    float easing = .05;      //QUICK NOTE: this HAS to be above .5 which is a shame, because its waaaay
                           //too fast for my liking, but if its lower, the pixel return accuracy can be
                          // +- an entire pixel. look to solve
                          //SOLVED!!! PUT P2D on and its fine, must have a higher something or other

    if (abs(dx) > 0)            //if there's any x difference whatsoever
    {
      pos.x += dx * easing;     //get rid of it
    }
    if (abs(dy) > 0)            //same with the y's
    {
      pos.y += dy * easing;
    }
  }




  //placeholder
}//end of class



