
//variables

PImage nube;
PImage nube_left;
PImage nube_right;
PImage thunder;

void setup()
{
  noCursor();
  size(200,200);
  smooth();
  nube = loadImage ("nube.png");
  nube_left = loadImage ("nube_left.png");
  nube_right = loadImage ("nube_right.png");
  frameRate(15);
}


void draw()
{
 
  
  background(10,10,50);
  
  float nubeX = map(mouseX,0,width,0,180);
  float nubeY = map(mouseY,0,height,-20,100);
  int nube_heading = 0;
  
  if ((mouseX+pmouseX) < (mouseX*2)) {
    nube_heading = 1;
  } else if ((mouseX+pmouseX) > (mouseX*2)) {
    nube_heading = 2;
  }
  
  //cloud
  if (nube_heading == 0) {
    image(nube,nubeX,20);
  } else if (nube_heading == 1) {
    image(nube_left,nubeX,20);
  } else if (nube_heading == 2) {
    image(nube_right,nubeX,20);
  }
  
  float rainX      = random(nubeX+20,nubeX+110);                    //random position of raindrop
  float rainY      = 90;                                  //for movement
  float rainLength = random(1,20);                       //random length of raindrop
  float rainStroke = random(1,5);                        //random width of raindrop
  float rainAlpha  = random(1,200);                      //value of rain transparency
  color rainColor  = color (64,64,255,rainAlpha);        //Rain Color
  float rainSpeed  = random(0.5,5);                      //random speed of raindrop
  
while (rainY < height-40) {
  rainY = rainY + 2;
  stroke(rainColor);
  strokeWeight(rainStroke);
  line(rainX,rainY,rainX,rainY+rainLength);
  
  
}
  

//rainY = rainY+rainSpeed;
//if (rainY > 199) {
//  rainY=0;} else if (rainY < 199) {
//    rainY=rainY+rainSpeed;}
}
  
  



