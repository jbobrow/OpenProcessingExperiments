
//variables

//Declare Bitmap Files

PImage nube;
PImage nube_left;
PImage nube_right;
PImage nube_up;
PImage nube_down;
PImage thundercloud;

// Declare variables

  float rainX      = random(0,200);                      //random position of raindrop
  float rainY      = 90;                                 //for movement
  float rainLength = random(1,20);                       //random length of raindrop
  float rainStroke = random(1,5);                        //random width of raindrop
  float rainAlpha  = random(1,200);                      //value of rain transparency
  color rainColor  = color (64,64,255,50);               //Rain Color
  float rainSpeed  = random(5,15);                       //random speed of raindrop
  
  //This Array Setup is better than pMouseX, might give some "Marioness" to the movement of the cloud.
  int mouseXreadings = 15;                               //number of MouseX readings in array
  
  int [] readings = new int [mouseXreadings];            //readings =... 
  int index = 0;                                         //position of current reading
  int total = 0;                                         //totals..
  int average = 0;                                       //average

// The stuff you can count on...
void setup()
{
  mouseX = constrain(mouseX,600,320);
  
  noCursor();
  size(600,320);
  smooth();
  
  // Load Bitmaps
  nube = loadImage ("nube.png");
  nube_left = loadImage ("nube_left.png");
  nube_right = loadImage ("nube_right.png");
  thundercloud = loadImage ("thunder.png");
  
  //initialize mouseXreadings to 0.
  for (int mouseX_now = 0; mouseX_now < mouseXreadings; mouseX_now++) {
    readings[mouseX_now] = 0;
  }
  
  //Framerate
  frameRate(15);
}


void draw()
{
 
  
  background(240,240,255);
  
  
  //movement will become array based in order to make it smoother.
  
  total = total - readings [index];
  readings [index] = mouseX;
  total = total + readings[index];
  index = index + 1;
  
  if (index >= mouseXreadings)
      index = 0;
    
  average = total / mouseXreadings;
  float nubeX = average;
  float nubeY = map(mouseY,0,height,-20,100);
  
  //float nubeX = map(mouseX,0,width,20,width-20);
  //float nubeY = map(mouseY,0,height,-20,100);
  
  int nube_heading = 0;
  
 
  //cloud heading
  if ((mouseX+pmouseX) < (mouseX*2)) {
    nube_heading = 1;
  } else if ((mouseX+pmouseX) > (mouseX*2)) {
    nube_heading = 2;
  } else if (mousePressed) {
    nube_heading = 3;
  }
  
  //cloud
  if (nube_heading == 0) {
    image(nube,nubeX,20);
  } else if (nube_heading == 1) {
    image(nube_left,nubeX,20);
  } else if (nube_heading == 2) {
    image(nube_right,nubeX,20);
  } else if (nube_heading == 3) {
    image(thundercloud,nubeX,20);
  }
  

  //raindrop
  stroke(rainColor);
  strokeWeight(rainStroke);
  line(rainX,rainY,rainX,rainY+rainLength);

  if (rainY > 199) {
    rainY = 90;
    rainX = random(average,average+100);
    rainLength = random(1,40);
    rainStroke = random(1,5);
    rainSpeed = random(40,60);
  } else if (rainY < 199) 
    {rainY=rainY+rainSpeed;
    }
    
  
  
}
  


  
  



