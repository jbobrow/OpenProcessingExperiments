
//Based on ste1438's youtube video
//Processing 101 - Circular Paths
//http://www.youtube.com/watch?v=MOec_tdnx8A
 
 
void setup()
{
  size(500,300);  //window size
  frameRate(24);    //frame rate of 24 frames per second
  noStroke();    //stroke's collor (255 = white)
  smooth();        //anti-aliazing for smoother lines
  background(0);
   
}
 
//global variables
float x1, x2, xSpeed=1, y1, rad1; 
int deg=0,r=255,g=255,b=255;
 
void draw()
{
  //not quite sure how to explain this part of the code
  //but check this video to get a good idea. 
  deg=deg+4;
  x2=x2+xSpeed;
   
  rad1=radians(deg);
  x1=sin(rad1)*20+(width/2);
  y1=cos(rad1)*50+(height/2);
  
  fill(r,g,b);
  ellipse(x1+x2,y1,1,1);
 
  if ((x1+x2 >= width) || (x1+x2 <= 0))   //if the sum of the x values
                                          //is more or equal to  ' width '
                                          // or less or equal to 0
  {
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
     
    xSpeed = xSpeed * -1;    //invert direction
  }
 
  if(deg>=360)
  {
    deg=0;  // if deg variable reaches 360, reset to 0, which is
            // the same thing in terms of position, but prevents
            // deg from increasing up and up and up.
  }
   
  if(mousePressed){
    saveFrame("vortex_thingy##.png");    //if mousePressed then save a
                                         //.png of the current frame.
                                         //It'll be in the sketch folder.
  }
 
}



