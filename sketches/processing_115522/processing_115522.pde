
/* initiallizing variables
 original program didnt use arrays, remade into arrays, and later switched
 to arrayList for flexiblity in size needed for extra cars/difficulty */
ArrayList cars;
ArrayList splat;
Vehicle ufo1;
Vehicle flyingThing;
Frog myFrog;
//Rain drops;
// images ,font and booleans for main draw function
PImage gameStart, gameWin, splatter;
boolean start= false;
boolean victory=false;
PFont frogish;

void setup() 
{
  frameRate(30);
  size(600, 600);
  // loading images
  gameStart = loadImage("gamestart.jpg");
  gameWin = loadImage("victory.jpg");
  splatter= loadImage("splatter.png");
  // creating custom font
  frogish=createFont("Jokerman", 40); 
  textFont(frogish); 

  // creating new objects 
  cars = new ArrayList();
  splat = new ArrayList();
  unleashCars();
  ufo1 = new Ufo(0, random(1, 600), random(-1.5, -6.5)); 
  flyingThing = new FlyingThing(1, random(150, 450), 4);
  myFrog = new Frog();
}
void draw()
{
  if (start)
  {
    if (!victory)
    {   
      //drawing the road
      noStroke();
      fill(135);
      quad(130, 0, 450, 0, 450, height, 130, height);
      fill(15, 180, 7);
      quad(260, 0, 320, 0, 320, height, 260, height);
      fill(129, 175, 16);
      //drawing the landscape
      quad(0, 0, 130, 0, 130, height, 0, height);
      quad(450, 0, 480, 0, 480, height, 450, height);

      //loop for  trees/bushes/greenthings   
      fill(15, 144, 24);
      for (int d=12; d<130; d=d+50)
      {
        for (int b=20; b<height; b=b+40)
        {
          ellipse(d, b, 20, 20);
          // disabled to improve performance and was replaced by other images
          /*for (int n=475; n<width; n=n+50)
           {
           ellipse(n, b, 20, 20);
           }*/
        }
      }    
      // triple loop for road lanes
      stroke(255);
      for ( int j=148; j<250; j=j+38)
      {   
        for (int i=5; i<height; i=i+10)
        {
          line(j, i, j, i=i+10);    
          for ( int k=5; k<height; k=k+10)
          {
            line(j+207, k, j+207, k=k+10);
          }
        }
      }
      // drawing fence in the middle
      strokeWeight(6);
      line(291, 0, 291, 600);
      strokeWeight(1);
      noStroke();
      fill(255);
      for ( int p=25; p<height; p=p+60)
      {
        ellipse(291, p, 20, 20);
        fill(0);
        ellipse(291, p, 10, 10);
        fill(255);
        ellipse(291, p, 5, 5);
      }
      // right side textures and  text
      fill(37, 48, 229);     
      ellipse (540, 300, 160, 900);
      fill(255, 255, 255);
      textSize(18); 
      textAlign(LEFT);
      text("Press SPACE To Increase Diffullty, ENTER To Restart, WASD To Move and MOUSE BUTTON To Spin Flying Object", 480, 100, 120, 400);
      // top left text
      fill(37, 48, 229);
      ellipse(45, 50, 170, 120); 
      fill(255, 255, 255);
      textSize(18); 
      text("Get To", 10, 35);
      text("The Other ", 10, 60); 
      text("Side", 10, 85); 
      // splatter/death arrayList, created before car class so cars can go on top of it      
      if (splat.size()!=0);
      {
        for (int p=0; p< splat.size(); p++)
        {
          Death splatter=(Death) splat.get(p);
          splatter.splat();
        }
      }         
      //creating life, populating our world
      for (int p=0; p<cars.size(); p++)
      {
        Vehicle transport =(Vehicle) cars.get(p);
        transport.populate();
      }
      ufo1.populate();
      myFrog.displayFrog(); //calls method from Frog class to display the frog.
      myFrog.moveFrog(); //calls method from the Frog class to move the frog using WASD.
      myFrog.boundaryFrog(); //calls method from the Frog class to prevent the frog moving from the screen.    
      flyingThing.populate();
      //drops.letItRain();

      // resets frog if it was hit
      if (collision() == true)
      {
        splat.add(new Death( myFrog.getFrogX(), myFrog.getFrogY()));
        myFrog.resetFrogPosition();       
        // println("you got hit " );
      }
      // checks if frog reached other side of the screen/road
      if (myFrog.getFrogX() >= 480)
      {
        victory=true;
      }
    }
    // displays victory image
    else 
    { 
      textSize(40);  
      image (gameWin, 0, 0, 600, 600);
      fill(52, 116, 19);
      text("Restart", 420, 500);
      fill(23, 43, 211);
      text("Victory!", 70, 100);
    }
    // restart the game on a mouse click
    if (mousePressed && victory)
    {
      victory=false;
      // restarting program instead of reseting frog back to start, so diffuculty increase reverts back
      setup();
    }
  } 
  // displays image and starts the game with mous click
  else 
  {
    image(gameStart, 0, 0, 600, 600);
    fill(52, 116, 19);
    text("Start", 400, 500);
  }
  if (mousePressed)
  {
    start=true;
  }
}
// spawns extra cars to make game harder
void keyReleased()
{
  if (keyCode==(' ') && start)

  {
    unleashCars();
  }
  // restarts the game
  if ((keyCode==ENTER) && start)
  {
    setup();
  }
}
// creates cars in arrayList
void unleashCars()  
{   
  cars.add (new Vehicle(327, 0, random(4.5, 6.5)));
  cars.add (new Vehicle(364, 0, random(2.5, 3.5)));
  cars.add (new Vehicle(401, 0, random(1.0, 2.0)));
  cars.add (new Vehicle(157, 600, random(-1.0, -2.0)));
  cars.add (new Vehicle(194, 600, random(-2.5, -3.5)));
  cars.add (new Vehicle(232, 600, random(-4.5, -6.5)));
} 

// class for for blood/death effect when frog gets hit 
class Death
{
  float x;
  float y;
  Death (float tempx, float tempy)
  {    
    x=tempx;
    y=tempy;
  }
  // places image in frog location upon collision 
  void splat()
  {
    image (splatter, x, y);
  }
}
// flying object - extending/inheriting class
class FlyingThing extends Vehicle
{

  float yy;
  int m;

  FlyingThing(float tx, float ty, float tspeed)
  {
    super(tx, ty, tspeed); 
    speed=tspeed;
    a=color(255);

    m=1;
    yy=2;
  }   
  // traffic method for flying object
  void traffic()
  {
    yy = yy + speed;
    float xChange = cos(radians(speed));
    float yChange = sin(radians(yy));
    x += xChange * speed * (m);
    y += yChange * speed * (m);
    if ( x>700 )
    {
      m = m*(-1);
    }
    if (x<-100)
    {
      m = m*(-1);
    }
  }
  // display method for flying object
  void display()
  {
    /* the if statement makes the plane do doughnuts when the mouse is pressed.
    The radius of the doughnut depends on the position (x, y plane)
    of the mouse pointer.  
    */
    if (mousePressed) 
    { 
      x = mouseX/2;   
      y = mouseY/2;
       translate(width/2, height/2);
       rotate(millis() * 0.001 * PI / 10.0); 
       translate(80, 0);
       rotate(millis() * 0.001 * TWO_PI);
  
  }
    fill(a);
    ellipse(x, y, 40, 10);
  }
}
 /*This is the class that will contain the fields and methods enabling the frog to 
 be displayed, to move across the screen with user input, to have boundary control, 
 to rotate the frog when moving in certain directions and to enable the collision detection with
 the vehicles and the collision method.
 */
class Frog 
{
  float xPos;
  float yPos;
  float height_of_frog;
  float width_of_frog;
  float speed;

  Frog()
  {
    width_of_frog = 20;
    xPos = width/2-280;
    yPos = height/2-20;
    speed = 3;
  }

  //Method for displaying the frog, using mostly ellipses.
  void displayFrog()
  {
    //ellipseMode(CENTER);
    stroke(0);
    fill(0, 180, 0);
    ellipse(xPos, yPos, 8, 10); 
    ellipse(xPos, yPos+20, 8, 10); 
    ellipse(xPos+17, yPos, 8, 10); 
    ellipse(xPos+17, yPos+20, 8, 10);    
    //rect(xPos, yPos, width_of_frog, width_of_frog);
    ellipse(xPos+10, yPos+10, width_of_frog, width_of_frog);
    fill(142, 71, 4);
    ellipse(xPos+17, yPos+5, 6, 6); 
    ellipse(xPos+17, yPos+15, 6, 6); 
    fill(0);
    ellipse(xPos+17, yPos+5, 2, 2); 
    ellipse(xPos+17, yPos+15, 2, 2);
  }
  /*This moves the frog using classic WASD movement. It also controls player speed
   by increasing or decreasing the integer changing the x/y co-ordinates.
   */
  void moveFrog()
  {
    if (keyPressed)
    {
      if (key=='a') 
      {
        xPos = xPos-speed;
      }
      if (key=='d')
      {
        xPos = xPos+speed;
      }
      if (key=='w')
      {
        yPos = yPos-speed;
      }
      if (key=='s')
      {
        yPos = yPos+speed;
      }
    }
  }
  //Method for boundary control. It prevents the frog from moving off the screen.
  void boundaryFrog() { 
    if (xPos >= 600) { 
      xPos = 600;
    }
    if (xPos <= 0) { 
      xPos = 0;
    }
    if (yPos >= 550) {
      yPos = 550;
    }
    if (yPos <= 50) { 
      yPos = 50;
    }
    // methods to get frog variables for collision method
  }
  float getFrogX()
  {
    return xPos;
  }
  float getFrogY()
  {
    return yPos;
  }
  float getFrogWidth()
  {
    return width_of_frog;
  }
  void resetFrogPosition()
  {
    xPos = width/2-280;
    yPos = height/2-20;
  }
}
// ufo class extending main Vehicle class
class Ufo extends Vehicle
{
  Ufo(float tx, float ty, float tspeed)
  {
    super(tx, ty, tspeed); 
    speed=tspeed;
    a=color(255);
  }
  // traffic method for ufo
  void traffic()
  {
    x=x-speed;
    y=y+speed;

    if (x>600)
    {
      y=random(0, width);
      x=0; 
      y=random(1, 600);
      a=color(255);
      speed=random(-1.5, -6.5);
      Hsize=random(30, 40);
      Wsize=random(20, 25);
    }
  }

  // display method for ufo
  void display()
  {   
    stroke(0);
    fill(a);
    ellipse(x, y, Wsize*1.5, Wsize*1.5);
    fill(220);
    ellipse(x, y, Wsize/1.8, Wsize/1.8);
  }
}
// Vehicle  class, for cars on the road
class Vehicle 
{
  //color variables
  int a;
  float b;
  float c;
  float d;
  //coordinates
  float x;
  float y;
  //size and speed
  float speed;
  float Wsize;
  float Hsize;

  // main class constructor
  Vehicle(float tx, float ty, float tspeed)
  {
    //random colors and size for objects
    b=random(1, 255);
    c=random(1, 255);
    d=random(1, 255);
    a=color(b, c, d);
    speed=tspeed;
    x=tx;
    y=ty;
    Hsize=random(30, 40);
    Wsize=random(20, 25);
  }
  //method to call other methods, to simplify
  void populate()
  {   
    traffic();
    display();
  } 
  // display method to display vehicles
  void display()
  { 
    stroke(0.5);
    fill(a);
    rect(x, y, Wsize, Hsize);
  }
  // movement method
  void traffic()
  {
    y=y+speed;
    // resets the car and its variables once it goes out of screen, every new car will be different 
    if (y<0 || y>height)
    {
      getY();
      b=random(1, 255);
      c=random(1, 255);
      d=random(1, 255);
      a=color(b, c, d);
      getSpeed();
      Hsize=random(30, 40);
      Wsize=random(20, 25);
    }
  } 
  // method to give cars custom speed according to their x location or simply road lane
  void getSpeed()
  {
    if (x==327)
    {
      speed=random(4.5, 6.5);
    }
    if (x==364)
    {
      speed=random(2.5, 3.5);
    }
    if (x==401)
    {
      speed=random(1.0, 2.0);
    }
    if (x==157)
    {
      speed=random(-1.0, -2.0);
    }
    if (x==194)
    {
      speed=random(-2.5, -3.5);
    }
    if (x==232)
    {
      speed=random(-4.5, -6.5);
    }
  }
  // new position for car after it goes out of screen
  void getY()
  {
    if (x==327 || x== 364 || x== 401) 
    {
      y=0;
    }  
    if (x==157 || x==194 || x==232)
    {
      y=600;
    }
    // methods to get car variables for collision method
  }
  float getCarsX()
  {
    return x;
  }
  float getCarsY()
  { 
    return y;
  }
  float getCarsWidth()
  {
    return Wsize;
  }
  float getCarsHeight()
  {
    return Hsize;
  }
}
// collision method, uses  variables from Vehicle and Frog classes
boolean collision()
{
  boolean returnValue = false;
  // assigned variables using methods in car frog
  float frogWidth=myFrog.getFrogWidth();
  float frogX=myFrog.getFrogX();
  float frogY=myFrog.getFrogY();

  for (int p=0; p<cars.size(); p++)
  {
    // assigned variables using methods in car class
    Vehicle transport =(Vehicle) cars.get(p);
    float carsWidth=transport.getCarsWidth();
    float carsHeight=transport.getCarsHeight();
    float carsX=transport.getCarsX();
    float carsY=transport.getCarsY();

    // checks for collision
    if (frogX+frogWidth/2 >= carsX-carsWidth/2 && frogX-frogWidth/2 <= carsX + carsWidth/2 &&
      frogY+frogWidth/2 >= carsY-carsHeight/2 && frogY-frogWidth/2<= carsY+carsHeight/2)
    {
      returnValue=true;
    }
  }
  return returnValue;
}


