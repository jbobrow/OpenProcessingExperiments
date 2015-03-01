
// declare 4 "Mover" objects
Mover[] m = new Mover [100]; // creates an empty array of 100 mover objects
Mover m1 = new Mover(100, 100, 10);
Mover m2 = new Mover(110, 110, 5);
Mover m3 = new Mover(120, 120, 1);
Mover m4 = new Mover(130, 130, 7);

void setup(){ // Runs once at start
  size(640, 480); // Set screen size
  background(0); // Make background black
  for (int i=0; i<100; i++){
    m[i] = new Mover(int(random(width)), int(random(height)), int(random(7)+1));
  }
}

void draw(){// Runs every frame
  background(0);
  for (int i=0; i<100; i++){
    m[i].display();
  }
}

// Here is the code that sets up what a "Mover" is,
// what values (variables) it has, and what
// behaviors (functions) it has
class Mover {
  //DATA: Here are the values we want every Mover to have
  int x; // x position of the Mover
  int y; // y position of the Mover
  int speed; // Speed of the Mover

  //CONSTRUCTOR: This is the "constructor." It's a special function
  //that is used to make a new Mover. We called it at the top
  //of this program. You can put "arguments" in the cosntructor
  //to set variables when each new object is made.
  //So "new Mover(100, 100, 10);" sets x to 100, y to 100, speed to 10.
  Mover(int _x, int _y, int _speed) {
    x = _x;
    y = _y;
    speed = _speed;
  }

  //This is a function for actually drawing the mover on the screen.
  //It uses the x, y , and speed values to draw the mover in the right position.
  //It also includes code for the "bouncing" behavior  
  void display() {
    /*if(x<0 || x>width){ // If the Mover goes off the screen...
      speed = -1*speed; // Reverse the speed (multiply it by -1)
    }
    
    if (mouseX-x < 100 && mouseX - x > -100 && mouseY-y > -100){
      y += 10;
    }
    
    
    x = x+speed; // Add the 'speed' to the x value to make it move to another position.*/
    
    if (x> mouseX)
    {
      x-=speed;// x=x-10,
    }
    if(x< mouseX)
    {
      x += speed;
    }
    if(y> mouseY)
      {
      y-=speed;
      }
    if (y< mouseY)
    {
    y+=speed;
   }
       
    
    
    stroke(100, 50, 0); //Stroke color
   fill(random(255), random(255), random(255)); //Fill color
    ellipse(x,y,13,13); //Draw the circle
  }
}

