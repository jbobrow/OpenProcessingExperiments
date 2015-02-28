
/*Aneta Genova CClab HomeWork week 4*/
Animal[] animals = new Animal[30];   //declare an array of 50 objects of type Animal
float grav=0.3;
PImage bImgFor;
PImage bImgRev;
PImage bGrass;

 
void setup() {
  size(720,480);
  bImgFor = loadImage("hen.png");   //load image of fluffy bunny facing forward
  bImgRev = loadImage("bunny.png");   //load image of fluffy bunny facing backwards
  bGrass = loadImage("grass.jpg");   //load background grass image
  for(int i=0; i < animals.length; i++) {   //Loop to initialize each object in the array
    animals[i] = new Animal();   //Initialize a Animal object and assign it to the array index position "i"
  }
}
 
void draw() {
  image(bGrass,0,0,width,height);   //draw the background grass
  for(int i=0; i < animals.length; i++) {   //Loop to display and move each object in the array
    animals[i].display();
    animals[i].move();
  }
}
 
class Animal {
  float x;
  float y;
  float w;
  float xSpeed;
  float ySpeed;
  PImage b;
   
  Animal() {   //Animal object constructor used to initialize the variables for each Animal object
    x = random(20,600);
    y = random(0,height/2);
    w = random(10,100);
    xSpeed = 5;
    ySpeed = 0;
    b = bImgFor;
  }
   
  void display() {   //Function called to display each Animal object
    if(x > width-w) {
      b = bImgRev;
    }
      if(x < 0) {
      b = bImgFor;
    }
    image(b,x,y,w,w);
  }
   
  void move() {   //Function called to move each Animal object
    x = x + xSpeed;   //Increment the x-coord position of the Animal to move it across the screen
    y = y + ySpeed;   //Increment the y-coord of the Animal by the amount of speed
    ySpeed = ySpeed+grav;   //Factor in the gravity to the speed
    if(y > height-w) {   //If the Animal is greater than the height of the window, change the direction of the Animal
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

