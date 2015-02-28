
//GLOBAL VARIABLES
//Controls amount of objects
int reps = 100; 
float [] ypos = new float[reps]; 
float [] xpos = new float[reps];

//Used in to alow loops to refrence each instance
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

float speedX = 50.0;
float speedY=50.0;



void setup()
{
  //Basic setup
  size(700, 400);
  smooth();

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
    stroke(255, 255, instance,50);
  }
  else {
    background(0);
    stroke(255, 255, instance);
  }  

  for (instance = 0; instance < reps; instance ++) {

    fill(255,20);

    mouseFollowX = mouseFollowX+(mouseX-mouseFollowX)/730.0;
    mouseFollowY = mouseFollowY+(mouseY-mouseFollowY)/730.0;


    float mouse = mouseFollowX-xpos[instance];
    float mouse2 = mouseFollowY-ypos[instance];

    speedX=dist(width/2,height/2,mouseX,mouseY)/10000.0;
    xpos[instance]= xpos[instance]+(xpos[instance])*speedX;
    ypos[instance]= ypos[instance]+(ypos[instance])*speedX;

    float d = dist(mouseX,mouseY,mouse,mouse2);
    ellipse(mouse, mouse2,d/20.0,d/20.0);
     
     

    
    
    //noFill();
    //float apple = dist(width/2,height/2,mouseX,mouseY)/10000.0;
    //ellipse(mouseX,mouseY,200,200);
    //println(apple);

    if ((xpos[instance] < -width) || (xpos[instance] > width) ||
      (ypos[instance] < -height) || ( ypos[instance] > height)) {
      xpos[instance] = random(-refreshPoint, refreshPoint);
      ypos[instance] = random(-refreshPoint, refreshPoint);
    }
  }
  
}


