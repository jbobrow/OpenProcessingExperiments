
ArrayList ballCollection; // Array list called ballCollection
int rainbow; // Variable called rainbow wich is an interger



void setup () { // The page setup
  size(600,600); // The pop out window will be 600 x 600 pixels
  smooth(); // This smooth function make the over quailty better
  frameRate(50); // Refreshes the Frame Rate

ballCollection = new ArrayList(); // This ballCollection is calling on the array list for the class Ball
 

 
 rainbow = 0; // Varible called rainbow which i have set up with a counter to change the colour

}

void draw() { // The draw section of my code
  background(0); // Setting the background to black
  

  
  if (mousePressed){ // an if statement simply changing the background to white if the mouse is clicked
  background(255); // Background white
  }
  
     colorMode(HSB);// Setting the colourmode to Hue, Saturation and Brightness which enables the use of a rainbow of colours
   stroke(rainbow /2,rainbow * 2, 255); // Setting the edges of the squares to different, Hue, Saturation and Brightness
   fill(rainbow,rainbow,rainbow); // Having the fill of the shapes always changing because of the rainbow variable
   colorMode(RGB); // Setting the colour mode to Red, Green, Blue
  
  
  Ball myBall = new Ball(random (0, width),random (0, 0.5)); // From the class Ball, its storing data in the array list ballcollection and producing a square
                                                             // in random positions in the x axis and it creating squares at the top of the Y axis creating the falling effect
  ballCollection.add(myBall); // ballCollection is then telling draw to add the new stored data myBall into the frame
  
  
  
 for( int i = 0; i < ballCollection.size(); i++ ) { // this data then goes through this for loop which starts at 0 and doesnt stop thanks to this ballCollection.size and is known as variable i
   Ball mb = (Ball) ballCollection.get(i); // the class ball is then used again create the variable mb so it can run its data which is coming from the orignal class Ball
   mb.run(); // Makes draw find the run function creates the loop
  
   
   
     rainbow += 2; // variable rainbow adding 2 each frame and when it reaches its maxium 255 it goes back to 0 
  if( rainbow > 255)
  {
    rainbow = 0;
  }
 }
}
 
 
 
 
 

 
 
  


class Ball {
  // global variables
  float x = 0; // Variable x which is a float 
  float y = 0; // Vatiable y which is a float 
  float speedX = random(-0.5,0.5); // the distance that i want the squares to move over the x axis 
  float speedY = random(-0.01,10); // the location of where i want the squares to start on the y axis
  
  
  // Constructor
  Ball(float _x, float _y) { // _x & _y using a float so numbers dont have to be rounded up
    
    x = _x;  
    y = _y;
  }
  
  
  // Functions // The fuctions that will make the square do what its being told. 
  void run() {
    display(); // creating the square
    move();    // making the square able to move
    bounce();  // Making the square able to bounce
    gravity(); // Making the square have a time over distance
    
  }
  
  void gravity() // This function allows the squares seem as if they are floating as each frame is being refreshed
  {
    speedY += 0.15;
  }
  
  void bounce() { // this functions tells the shapes to stay withing the x and y axis. Same code is used on my previous assignment
    if(x > width) {
      speedX = speedX * -1;
    }
    if(x < 0) {
      speedX = speedX * -1;
    }
    if(y > height) {
      speedY = speedY * -1;
    }
    if(y < 0) {
      speedY = speedY * -1;
    }
  }
  
  void move() {
    
    x += speedX; // makes the shape move
    y += speedY;
    
  }
  
  void display() { // drives the display which is a square on the x and y of random, 10 pixels by 10 pixels
    rect(x,y,10,10);
  }
}




