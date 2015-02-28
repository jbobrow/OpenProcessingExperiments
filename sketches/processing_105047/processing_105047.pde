
//barbara compagnoni ball following mouse with delay
int counter = 0; //defines and sets counter to 0
float time; //defines time
float xDist; //defines x distance
float yDist; //defines y distance
float xPos = height/2; //sets x position in centre
float yPos = width/2; //sets y position in centre

void setup (){
    size (500, 500); //frame size 500 x 500
   
}

void draw (){ //begins draw function
  frameRate (60); //sets frame rate to 60
  yDist = mouseY-yPos; //calculates the distance from y position to the mouse y position
  xDist = mouseX-xPos; //calculates the distance from x position to the mouse x position
  xPos = xPos+xDist/frameRate; //adds a small fraction of the x distance to the x position
  yPos = yPos+yDist/frameRate; //adds a small fraction of the y distance to the x position

  counter++; //adds one to the counter each time it runs
  time = counter/frameRate; //sets time equal to the counter/framerate to get the second.milliseconds
  println (time); //prints time
  
  ellipse(xPos, yPos , 10, 10); //draws ellipse with a trail using the x position and y position of the mouse
}


  

