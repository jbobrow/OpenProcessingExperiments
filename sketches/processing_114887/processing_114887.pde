
// Pressing Control-R will render this sketch.
int i = 0;
//define variables
int canvasHeight = 600;
int canvasWidth = 300;
//autodraw parameters
int masterCount = 20;
int count = 0;
int prevX = 0;
int prevY = 0;
int currX = 0;
int currY = 0;

int joinType = 0; 


void setup() {  // this is run once.  
     
    // set the background color
    background(255);
     
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 600);
       
    // smooth edges
    smooth();
     
    //randomize parameters
    //prev = (random(0, masterCount), random(0, masterCount));
    prevX = random(0, canvasWidth);
    prevY = random(0, canvasHeight);
     
    // limit the number of frames per second
    frameRate(3);     
}
void draw() {  // this is run repeatedly. 
  
   //println(masterCount);
   if(count == masterCount)
    {
        count = 0;
        background(255);
        //background(random(255));        
        masterCount = (int)random(50);
    }
    count++;
  
    // set the color
    strokeWeight(random(15));
    //stroke(random(255), random(255), random(255), 100);
    stroke(random(255));
    
    currX = random(0, canvasWidth);
    currY = random(0, canvasHeight);
    
    joinType = (int)random(2);
    //println(joinType);
    //String s = joinType;

    //text(s, 15, 20, 70, 70);

    if(joinType == 0)
    {
        //
        curve(prevX, prevY, random(canvasWidth), random(canvasHeight), 
              currX, currY, random(canvasWidth), random(canvasHeight));
    }
    else if(joinType == 1)
    {
        line(prevX, prevY, currX, currY);
    }
    prevX = currX;
    prevY = currY;
}
