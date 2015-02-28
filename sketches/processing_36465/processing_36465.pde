
//GLOBAL VARIABLES
//Controls amount of objects
int reps = 100; 
float [] ypos = new float[reps]; 
float [] xpos = new float[reps];

//Used in to allow loops to refrence each instance
int instance = 0; 

//Provides a starting point value for the objects
int startingPointX= 350; 
int startingPointY= 350;

//Provides a refresh point value for when the objects touch the edge of the canvas
int refreshPoint = 50;

/*Variables that can be altered for mouseX and mouseY. 
 Important for 'follow the curser' effect*/
float mouseFollowX = 350;
float mouseFollowY = 200;

//A variable that controls the speed of the particles  
float speedX = 50.0;

//A varable for the colour changing function 
float change= 0;

//A varable for the shape changing function 
float shapes= 0;

//Variables used to tell the particles to appear at mouseFollowX or Y
float mouse = 0;
float mouse2 = 0;

void setup()
{
  //Basic setup
  size(700, 400);
  smooth();
  noCursor();

  //A loop provides a random startingPoint value to each object in the array.
  for (instance = 0; instance < reps; instance ++) {
    xpos[instance] = int(random(-startingPointX, startingPointX));
    ypos[instance] = int(random(-startingPointY, startingPointY));
  }
}

void draw()
{
  //Conditional to remove background if mousePressed.
  if (mousePressed) {
    stroke(255, 255, instance, 50);
  }
  else {
    background(0);
    stroke(255, 255, instance);
  }  

  for (instance = 0; instance < reps; instance ++) {

    /*Shapes follow the mouse be moving a small amout of the
     distance the mouse moves at time*/
    mouseFollowX = mouseFollowX+(mouseX-mouseFollowX)/730.0;
    mouseFollowY = mouseFollowY+(mouseY-mouseFollowY)/730.0;

    //Maps the particles to mouseFollow
    mouse = mouseFollowX-xpos[instance];
    mouse2 = mouseFollowY-ypos[instance];

    /*Determines the value of the speed by using the diffrence 
     between the middle of the canvas and the mouse location*/
    speedX=dist(width/2, height/2, mouseX, mouseY)/10000.0;

    /*Takes the x and y value of each instance in the array
     and adds a fraction of those values to the original value*/
    xpos[instance]= xpos[instance]+(xpos[instance])*speedX;
    ypos[instance]= ypos[instance]+(ypos[instance])*speedX;

    Colour();
    shapes();

    /*Code that sets the particles to return to an area near 
     the mouse which is defined by the refreshPoint variable. 
     Particles return if they reach a value eqivelent to the length
     of the cavas*/
    if ((xpos[instance] < -width) || (xpos[instance] > width) ||
      (ypos[instance] < -height) || ( ypos[instance] > height)) {
      xpos[instance] = random(-refreshPoint, refreshPoint);
      ypos[instance] = random(-refreshPoint, refreshPoint);
    }
  }
}

void Colour() {
  /*A percentage is calculated between the mouse and
   the value of the canvas size. The percentage is then
   applied to the fill so that it moves through all 255
   values gradually*/
  change =dist(width/2, height/2, mouseX, mouseY);
  change = change/(width/2);
  change = change*255;

  //Conditionals that depend on which quater of the screen the mouse is on
  if ((mouseX>width/2)&&(mouseY>height/2)) {
    fill(144, 0, change, 100);
  }
  else if ((mouseX>width/2)&&mouseY<height/2) {
    fill(144, change, 123, 100);
  }
  else if ((mouseX<width/2)&&mouseY<height/2) {
    fill(change, 207, 123, 100);
  }
  else if ((mouseX<width/2)&&mouseY<height/2) {
    fill(50, 0, change, 100);
  }
}

/*Changes the shape depending on mouseX and Y. 
 The shapes are drawn when this function is called*/
void shapes() {
  shapes = dist(mouseX, mouseY, mouse, mouse2);
  if ((mouseX>width/2)&&(mouseY>height/2)) {
    rect(mouse, mouse2, shapes/20.0, shapes/20.0);
  }
  else {
    ellipse(mouse, mouse2, shapes/20.0, shapes/20.0);
  }
}


