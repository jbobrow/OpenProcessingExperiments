
//lynda.com video: modifying variables 

int x = 10;
float y = 50; 
float z; 

void setup() {
  size (600,200);
  smooth();
  noStroke();
  
  //assign a new value to an existing variable
  y = height; 
  
  //casting a variable
  float randomFloat = random(11); //lower end inclusive (can include 0) 
  //upper value exclusive, e.g won't go up to 11, only 10
  println("randomFloat = " +randomFloat);
  
  int randomInt = int(random(11)); //this gets rid of decimal places from before
  println("randomInt =" + randomInt);
  
  int randomDie = int(random(6)) + 1;
  println("randomDie = " + randomDie);
  
  z = 3*x + atan(sqrt(y));
  println("z = " + z);
}

void draw() {
  background(#333333);
  ellipse(x, y, 40, 40);
  
  //increment it to make it move
  //takes a variable and adds a value you to it every time it runs through a cycle
  x++;
  y*=0.99; //the y value actually decreases, so circle moves up
  
  x = constrain(x, 0, width/2);
  
}


