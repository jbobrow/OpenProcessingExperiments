
/*Paired project for ICM - Heidi Frank and Oscar Torres*/
Rabbit[] rabbits = new Rabbit[30];   //declare an array of 50 objects of type Rabbit
float grav=0.3;
PImage bImgFor;
PImage bImgRev;
PImage bGrass;
PImage fGrass;

void setup() {
  size(720,480);
  bImgFor = loadImage("fluffy.gif");   //load image of fluffy bunny facing forward
  bImgRev = loadImage("fluffyRev.gif");   //load image of fluffy bunny facing backwards
  bGrass = loadImage("bgrass.gif");   //load background grass image
  fGrass = loadImage("fgrass.gif");   //load foreground grass image
  for(int i=0; i < rabbits.length; i++) {   //Loop to initialize each object in the array
    rabbits[i] = new Rabbit();   //Initialize a Rabbit object and assign it to the array index position "i"
  }
}

void draw() {
  image(bGrass,0,0,width,height);   //draw the background grass
  for(int i=0; i < rabbits.length; i++) {   //Loop to display and move each object in the array
    rabbits[i].display();
    rabbits[i].move();
  }
  image(fGrass,0,height-height/8,width,height/8);   //draw the foreground grass
}

class Rabbit {
  float x;
  float y;
  float w;
  float xSpeed;
  float ySpeed;
  PImage b;
  
  Rabbit() {   //Rabbit object constructor used to initialize the variables for each Rabbit object
    x = random(20,600);
    y = random(0,height/2);
    w = random(10,100);
    xSpeed = 5;
    ySpeed = 0;
    b = bImgFor;
  }
  
  void display() {   //Function called to display each Rabbit object
    if(x > width-w) {
      b = bImgRev;
    }
      if(x < 0) {
      b = bImgFor;
    }
    image(b,x,y,w,w);
  }
  
  void move() {   //Function called to move each Rabbit object
    x = x + xSpeed;   //Increment the x-coord position of the Rabbit to move it across the screen
    y = y + ySpeed;   //Increment the y-coord of the Rabbit by the amount of speed
    ySpeed = ySpeed+grav;   //Factor in the gravity to the speed
    if(y > height-w) {   //If the Rabbit is greater than the height of the window, change the direction of the Rabbit
      ySpeed = ySpeed * -0.95;
    }
    if(x > width-w) {
      xSpeed = xSpeed * -1;
    }
        if(x < 0) {
      xSpeed = xSpeed * -1;
    }
  }
}

