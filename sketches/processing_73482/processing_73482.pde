
//Amount of ball classes being called
int ballCount=15;

//sets up area of memory for the array of the ball class
Ball[] b = new Ball[ballCount];



void setup() {

  //initilizes the starting values
  size(600, 600);
  //Sets the frame
  frameRate(40);

  //Creates a loop that intilizes the class arrays and gives then random attributes
  for (int i=0;i<b.length;i++) {
    b[i]= new Ball(random(width), random(height), random(100), random(100));
  }
}

void draw() {

  //loops throughout all the classes and calls the update and render methods within the ball class
  for (int i=0;i<b.length;i++) {
    b[i].update();

    b[i].render();
  }
  //updates background rectangle to help give the trail effect
  fill(0, 10);
  rect(0, 0, width, height);
}


//ball class
class Ball {
  //initial variables
  //x starting postion
  float x;
  //y starting postion
  float y;
  //diameter
  float d;
  //angle
  float a;
  //x axis direction
  float m1;
  //y axis direction
  float m2;

  //constructior setting up initial variables
  public Ball(float newX, float newY, float newD, float newA) {
    x= newX;
    y= newY;
    d= newD;
    a= newA;
    //x direction
    m1= 3;
    
   //y direction
    m2= 2;
  }

  //updates the location of each ball 
  void update() {

    //holds red colour value
    float Cred = random(255);
    //hold green colour value
    float Cgreen = random(255);
    //holds blue colour value
    float Cblue = random(255);
    //used to record how many times the walls have been hit
    int bounces = 0;


    //used to select what colour it leans towards starting at creen
    float Crandom = 2;



    //Causes the ball to bounce if it hits right side and changes the colour of each ellipse then incriments bounce
    if (x>=width) {
      //changes direction
      m1=m1*(-1);
      //changes angle
      a+=3;
      //adds a different fill
      fill(Cred, Cgreen, Cblue, 20);
      //incriments bounce
      bounces++;
    }
    //Causes the ball to bounce if it hits left side and changes the colour of each ellispse then incriments bounce
    if (x<=0) {
      m1=m1*(-1);
      a+=3;
      fill(Cred, Cgreen, Cblue, 20);
      bounces++;
    }
    //Causes the ball to bounce if it hits the bottom and changes the colour of each ellipse then incriments bounce
    if (y>=height-10) {
      m2=m2*(-1);
      a+=3;
      fill(Cred, Cgreen, Cblue, 20);
      bounces++;
    }

    //Causes the ball to bounce if it hits the top and changes the colour of the ellipse then incriments bounce
    if (y<=10) {
      m2=m2*(-1);
      a+=3;
      fill(Cred, Cgreen, Cblue, 20);
      bounces++;
    }

    x+=m1;
    y+=m2;
    //causes the angle to change when it bounces base on the if statements
    float xInc = cos(radians(a))*1.0;
    float yInc = sin(radians(a))*1.5;

    x+=xInc;
    y+=yInc;

    //after 10 bounces choose a Red,Green,or blue to be stronger then the other colours
    if (bounces > 10) {
      //choose random colour
      Crandom = random(3);
      //reset bounces to 0
      bounces = 0;
    }

    //choose what colour to make stronger based on Crandom
    //if Crandom = 1 make red stronger
    if (Crandom == 1) {
      Cred = (random(255)+100);
    }
    //if Crandon = 2 make green stronger
    else if (Crandom == 2) {
      Cgreen = (random(255)+100);
    }
    //if Crandom = 3 make blue stronger
    else if  (Crandom  == 3) {
      Cblue = (random(255)+100);
    }
  }

  //constantly renders the ellipses
  void render() {
    //removes stroke
    noStroke();
    //creates ellispe
    ellipse(x, y, d, d);
  }
}


