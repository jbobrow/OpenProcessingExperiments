
/*Birds at Night by Alexa Saccone
 This is my motion project for Building and Programming Intelligent Machines Level 2: 
 it simulates two different classes of flying birds, owls and birdies, that follow the mouse and change
 color when a key is pressed. The owl objects are slower than the birdies, flock closer together, and stay away from the mouse, while the birdies tend to stay near the mouse and generally are faster.
 
 -Modified from "Acceleration with Vectors" by Daniel Shiffman, a example included in processing:
 I used his vector, acceleration, and location parts of his program in my birdy and owl classes
 but edited and added variables and used my own two objects (birdy and owl) instead of a circle. 
 -Used code from "Project 002 - love bird flies" (http://www.openprocessing.org/sketch/57562)
 I used their code for making wings flap, and edited it for my own objects.
 -Modified the owl drawing from "Example "8-3: Draw the Owl" in Getting Started with Processing 
 by C.E.B. Reas and Ben Fryby
 I edited the code of the owls by changing their color and size, and adding wings.
 -Modified the code from "Example 10-10: Managing Many Objects" in Getting Started with Processing
 by C.E.B. Reas and Ben Fryby
 I modified this code for my owl and birdy classes, making arrays for them. 
 
 Inspiration:
 http://www.youtube.com/watch?v=k2PJ6T7U2eU
 http://www.youtube.com/watch?v=XH-groCeKbE
 */
 
 //Birdy class

class Birdy 
{
  PVector location; //tracks location
  PVector velocity; //tracks velocity
  PVector acceleration; //tracks acceleration
  float topspeed; //The birdy's maximum speed; 

  float x = random(400, 700); //variable for location
  float y = random(400, 700); //variable for location
  int c = (int)random(0, 6); //variable for color array
  int w = (int)random(0, 6); //variable for color array

  Birdy()
  {
    location = new PVector(x, y); //places the birdies at random coordinates 
    velocity = new PVector(0, 0);
    topspeed = 5;
  }

  void update() //updates the location/acceleration/velocity/etc according to the mouse position
  {
    PVector mouse = new PVector(mouseX, mouseY); //computes a vector that points from location to mouse
    PVector acceleration = PVector.sub(mouse, location);
    acceleration.setMag(0.2); //sets magnitude of acceleration
    velocity.add(acceleration); //velocity changes according to acceleration
    velocity.limit(topspeed); //limits the velocity by topspeed
    location.add(velocity); //location changes by velocity
  }

  void display() //draws birdy
  {
    stroke(colors[c]); //generates a random integer for the color array 
    if (keyPressed) //when any key pressed and held, objects will change colors
    {
      stroke(colors[abs(c-w)]); //generates another random integer for the color array
    }
    strokeWeight(13);
    line(location.x-15, location.y-5, location.x-35, location.y+tip+8); //left wing
    line(location.x+15, location.y-5, location.x+35, location.y+tip+8); //right wing
    strokeWeight(50);
    line(location.x, location.y, location.x, location.y-20); //body
    noStroke();
    fill(255);
    ellipse(location.x-3, location.y-20, 10, 10); //left eye dome
    ellipse(location.x+3, location.y-20, 10, 10); //Right eye dome
    arc(location.x, location.y-21, 50, 50, 0, PI); // chin
    fill(0);
    ellipse(location.x-14, location.y-20, 8, 8); //left eye
    ellipse(location.x+14, location.y-20, 8, 8); //Right eye
    quad(location.x, location.y-26, location.x+4.5, location.y-19, location.x, location.y-12, location.x-4.5, location.y-19); //beak
  }
}

//Owl class 

class Owl
{

  PVector location; //tracks location
  PVector velocity; //tracks velocity
  PVector acceleration; //tracks acceleration
  float topspeed; ///the owl's maximum speed

    float x = random(100, 250); //variable for location
  float y = random(100, 250); //variable for location
  float q = random(0, 200); //variable for location
  float a = random(0, 125); //variable for location
  int c = (int)random(0, 6); //variable for color array
  int w = (int)random(0, 6); //variable for color array

  Owl() 
  {
    location = new PVector(x, y); //places owls at random coordinates
    velocity = new PVector(0, 0);
    topspeed = 3;
  }

  void update() //updates the location/acceleration/velocity/etc according to the mouse position
  {
    PVector mouse = new PVector(mouseX-150+q, mouseY-150-a); //computes a vector that points from a location to mouseX-150+q and mouseY-150-a (random variables) to make the owls stay away from the mouse
    PVector acceleration = PVector.sub(mouse, location); 
    acceleration.setMag(0.2); //sets magnitude of acceleration
    velocity.add(acceleration); //velocity changes according to acceleration
    velocity.limit(topspeed); //limits the velocity by topspeed
    location.add(velocity); // location changes by velocity
  }


  void display() //draws owl
  {
    stroke(colors[abs(c)]); //generates random integer for the color array
    if (keyPressed) //color of the owl objects will change when any key is pressed and held
    {
      stroke(colors[abs(c-w)]); //generates another random integer for the color array
    }
    strokeWeight(20);
    line(location.x, location.y-40, location.x-50, location.y+tip-10); //left wing
    line(location.x, location.y-40, location.x+50, location.y+tip-10); //right wing
    strokeWeight(67);
    line(location.x, location.y-10, location.x, location.y-60); //body
    stroke(255);
    strokeWeight(50);
    line(location.x, location.y-2.5, location.x, location.y-2.5); //stomach 
    noStroke();
    fill(255);
    ellipse(location.x-17.5, location.y-60, 35, 35); //left eye dome
    ellipse(location.x+17.5, location.y-60, 35, 35); //Right eye dome
    arc(location.x, location.y-65, 70, 70, 0, PI); // chin
    fill(0);
    ellipse(location.x-14, location.y-65, 9, 9); //left eye
    ellipse(location.x+14, location.y-65, 9, 9); //Right eye
    quad(location.x, location.y-62, location.x+6, location.y-55, location.x, location.y-48, location.x-6, location.y-55); //beak
  }
}

//Star class

class Star
{
  float x = random(0, 700); //variable for location
  float y = random(0, 500); //variable for location

  void display() //draws star
  {
    fill(255);
    ellipse(x, y, 1, 1);
  }
}


int direction = 1; //variable for the direction of the flapping wings
int tip = int(random(0, 2)); //variable for the position of the flapping wings, tip referring to the wing's tip

Star[] stars = new Star[2000]; //sets up star array, determines number of stars
color[] colors = new color[6]; // defines an array of 6 colors
Owl[] owls = new Owl[2]; //sets up owl arrary, determines number of owls
Birdy[] birdies = new Birdy[4]; //sets up birdy array, determines number of birdies


void setup() 
{
  size(700, 500);
  smooth();
  colors[0] = color(224, 36, 36);  // sets the first color (at array position 0)
  colors[1] = color(247, 219, 52); // sets the second color (at array position 1)
  colors[2] = color(164, 245, 52); // sets the third color (at array position 2)
  colors[3] = color(34, 240, 186); // sets the fourth color (at array position 3)
  colors[4] = color(34, 148, 240); // sets the fifth color (at array position 4)
  colors[5] = color(180, 100, 247); // sets the sixth color (at array position 5)

  for (int i = 0; i < owls.length; i++) //Owl constructor
  {
    owls[i] = new Owl();
  }

  for (int i = 0; i < birdies.length; i++) //Birdy constructor
  {  
    birdies[i] = new Birdy();
  }

  for (int i = 0; i < stars.length; i++) //Star constructor
  {
    stars[i] = new Star();
  }
}


void draw() 
{
  background(0);

  for (int i = 0; i < stars.length; i++) //displays stars
  {
    stars[i].display();
  }

  fill(242, 238, 227); 
  ellipse(70, 70, 70, 70); //draws moon

  for (int i = 0; i < owls.length; i++)  //displays/updates owls
  {
    owls[i].update();
    owls[i].display();
  }

  for (int i = 0; i < birdies.length; i++) //displays/updates birdies
  {
    birdies[i].update();
    birdies[i].display();
  }

  tip += 3*direction; //makes wings flap, edited from "Project 002 - Love Bird Flies"
  if (tip > 15 || tip < -45)
  {
    direction = -direction;
  }
}
