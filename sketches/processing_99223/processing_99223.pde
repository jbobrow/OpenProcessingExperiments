
// Declare
Circle [ ] circleLots = new Circle [20]; // This array will allow 20 ellipse. 20 is the size of the array.  



void setup() {            // Void because we are not returning anything.

  size(600, 600);          // Create window 600x600
  smooth();               //Draws all geometry with smooth edges.



  // Initailize
  for ( int i = 0; i < 20; i ++) {                             // Building class. Size of the array. Use this to                   generate different elements (ellipse). Up to 20 at the one time.
    circleLots[i] = new Circle(random(0, width), random(0, 200)); // Generate a random number each time the for   loop runs. i represents the number of elements in the array. i = 0
    // Generate at random positions across the x axis. Will change everytime the for loop runs.
  }
}

void draw() {
  background(0);

  if (mousePressed == true) {                    // Took me a while to figure out random. Finaly got it working as it needed to be under void draw.
    fill( random(255), random(255), random(255));     // This is generating a random colour for when the mouse was clicked.
  } 
  else { 
    fill( random(255), random(255), random(255));     // I decided i didnt want this function, so i put the same code for random in the else.
  }                                                
                                                      // As i had another plan for mouse clicking. I left this here     incase i change my mind. 


  // Call Function
  for (int i = 0; i < 20; i ++) {                     // if i is less than 20 increase the value
    circleLots[i].run();                              // Opens up the class. Runs the class.
  }
}






class Circle {



  float x = 0;                        // Specify global Variables
  float y = 0;
  float speedX = 4.5;                 // Standard speed of ball. 
  float speedY = 0.5;                 // Speed of ball on the Y axis (Falling Down)




  // Constructor 
  Circle(float posx, float posy) {      // posx & posy(position of x and y). Using FLOAT as i can control speed better.    

    x = posx;
    y = posy;                          // A way of being able to change position of the circle. I named them "POS" for position.
  }


  // Function
  void run() {                      // Building functions. The behaviour of the ellipse's will be all determined here. 
    display();  
    move();
    bounce();
    gravity();
  }

  void gravity() {              // Adds 0.2 to the Y axis. Making the Ellipse fall. 
    speedY += 0.2;
  }

  void bounce() {          // This part of the code will keep bal in the window.    
    if (x > width) {          // If X comes to the width boundary on X
      speedX = speedX * -1; // Will change from + to - which makes the ellipse appear like it is bounceing off the right wall.
    }
    if (x < 0) {
      speedX = speedX * -1; // Creating a wall on the left of the window
    }
    if (y > height) {
      speedY = speedY * -1; // Putting a roof on the window so balls cannot bounce out.
    }
    if (y < 0) {
      speedY = speedY * -1; // The floor of the window which balls will bounce off.
    }
  }

  void move() {          // Make the Circle move depending on speed.
    x += speedX;        // add asign ( x = x + x)
    y += speedY;
  }
  void display() {                                // When you click the mouse, the size of the ellipse will change.
    if (mousePressed == true) {
      ellipse(x, y, 40, 40); // Create an elippse      // Click and you will create an ellipse 40x40
    } 
    else if (mousePressed == false) {
      ellipse(x, y, 90, 90);                        // Let go and you will create an ellipse 90x90
    }
  }
}
