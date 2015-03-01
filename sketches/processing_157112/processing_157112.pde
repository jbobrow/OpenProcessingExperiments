

Mover[] m = new Mover[100]; // Creates an ARRAY of 100 Mover objects

void setup(){
  size(1200, 720);
  background(0);
  for (int i = 0; i < 100; i++)
  {
    //Every time this code loops, it creates a new 'Mover' in a slot in the array
    //In initialized the 'Mover' with random values for x, y ,and speed
    m[i] = new Mover(int(random(width)), int(random(height)), int(random(6)+1));
  }
}


void draw(){
  background(0);
  for (int i = 0; i < 100; i++)
  {
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
    if(x<0 || x>width){ // If the Mover goes off the screen...
      x = 0;
    }
    
    if(x>1200 || x>width){ // If the Mover goes off the screen...
      x = 1200;
    }
    if(y<0 || x>width){ // If the Mover goes off the screen...
      y = 720;
    }
    
    
    if(y>720 || x>width){ // If the Mover goes off the screen...
      y = 0;
    }
    
    
    stroke(100, 50, 0);
    fill(random(255), random(255), random(255));
    ellipse(x,y,17,17);
    if(mousePressed){
      y = y + int(random(30));
      y = y - int(random(30));
      x = x + int(random(30));
      x = x - int(random(30));
      }  
      
    float ydiff1 = mouseY - y;
    float xdiff1 = mouseX - x;
    float ydiff2 = y - mouseY;
    float xdiff2 = x - mouseX;
    
    if(ydiff1 < 8.5) {
      y = y+3;}
    if(xdiff1 < 8.5) {
      x = x+3;}
      
    if(ydiff2 < 8.5) {
      y = y-3;}
    if(xdiff2 < 8.5) {
      x = x-3;}
    
     
    
    }
    
}
  



