
//Skip value, makes it a lower resolution, the higher the number the lower the resolution and lower the number the higher the resolution
int skip = 6;
//the amount each pixel moves in the x axis each loop
float increment = 6;

ScrollPixel[][]  textArray;

void setup(){
  //Sets the Size of the Screen
  size(1024,256);
  //Sets the FillColor
  fill(125);
  //Sets the FrameRate
  frameRate(30);
  //Set the noStroke option that turns off Stroke on the objects
  noStroke(); 
  //Creates a ScrollPixel array to hold our Pixels
  //This is what you modify to add text
  textArray = new ScrollPixel[width*2][height];
  //Populates the Array with ScrollPixels
  for(int i = 1; i < textArray.length; i+=skip)
  {
    for(int j = 1; j < height; j+=skip)
    {
      //Example to set the Color to be a Constant Gradient
      //map(value, min_1, max_1, min_2, max_2)
      //map takes a value from a range (min_1, max_1)
      //and maps it to a value in a different range (min_2, max_2)
      
      //you can make Words here if you define them
      //you can put a photo in here
      //you can put a video in here
      //you can do a lot in here
      //you just have to translate the pixels a ScrollPixel
      
      float c = map(i, 0, textArray.length, -255, 255);
      textArray[i][j] = new ScrollPixel(i, j, abs(c));
    }
  }
  
}

//This Loops Runs every Frame
void draw(){
  background(255);
  
  //We loop over the 2D array of ScrollPixel Object
  for(int i = 1; i < textArray.length; i +=skip)
  {
    for(int j = 1; j < height; j+=skip)
    {
      //grab the previous x position from the ScrollPixel object
      float x = textArray[i][j].x;
      
     
     //This Wraps the Position of the Pixel on the X Axis. 
     //The % or mod or modulus operator takes two arguments x and y, 
     //and looks like this x%y. So this take x and divide it by y and 
     //finds the remainder.  It is like doing long division but only 
     //dividing once.  So if we divide the position by the length of 
     //the Scrolling Text and find out that it is either equal to 0 
     //(it reached the end) or within the bounds of increments (because 
     //when dealing with increments that are large you run the risk 
     //of just plowing right past the end and not wrapping correctly) 
     
     //wrap the ends  
      if(x+increment%textArray.length==0 || (x+increment)%textArray.length < increment){
        x=0;
      }
     //wrap the ends
      
      //grab the fill color from the ScrollPixel Object
      fill(textArray[i][j].fillColor, textArray[i][j].fillColor, textArray[i][j].fillColor);
      
      //increment the position and save that in the ScrollPixel Object
      textArray[i][j].setXY(x+increment, textArray[i][j].y);
      
      //draw the ScrollPixel Object on the screen as an ellipse 
      ellipse(textArray[i][j].x, textArray[i][j].y, 4,4);
    } 
  }
}


//ScrollPixel Object
class ScrollPixel{
  
  //These are the aspects of the ScrollPixel array
  // x = x position
  // y = y position
  // filleColor = fillColor
  //
  // These are public varables which means you can access them like this:
  //      ScrollPixel foo = new ScrollPixel();
  //      float x = foo.x;
  //      
  
  public float x, y, fillColor;
  
  //Empty Constructor
  //This creates a new ScrollPixel Object without any aspects 
  public ScrollPixel(){
  
  }
  
  //Constructor with (X,Y) Position
  //This creates a new ScrollPixel Object with the position set
  public ScrollPixel(float x, float y){
    this.x = x;
    this.y = y;
  }
  //Constructor with (X,Y) and a fillColor
  //This creates a new ScrollPixel Object with position and fillColor
  public ScrollPixel(float x, float y, float c){
    this.x = x;
    this.y = y;
    fillColor = c;
  }
  //A void method that sets the X,Y position of the ScrollPixel Object 
  public void setXY(float x, float y){
    this.x = x;
    this.y = y;
  }
  //A void method that sets the fillColor
  public void setFill(float c){
    fillColor = c;
  }
}
