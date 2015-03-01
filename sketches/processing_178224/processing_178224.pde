
int radius = 10, direction = 1,time,intervel = 700;
float x = 10, y = 10, speed = 20;
PImage tower; 
void setup()
{
  size(600, 500);
  tower = loadImage("10833593_1009252432424127_468483056_n.jpg");
  smooth();
  ellipseMode(RADIUS);
  fill(#1F8916);
  noStroke();
  time = millis();
}
void draw()
{
  background(175); 
  image(tower, 0,0);
  if((x > width - radius) || (x < radius))
     direction = -direction;
  arc(x,y,radius,radius,0.52,5.76);
  
  spaceIsClear(x,y);
  
  if(key == CODED)
  {
    
    frameRate(13);
    
    if(keyCode == UP)
      {
        arc(x,y,radius,radius,5.2,10.6);
        if(millis() > time + intervel)
        //milliseconds plus 700 - 700 milliseconds -
        //if milliseconds is greater than 700 milliseconds
        //something will happen (every 0.7 seconds)
        {
          time = millis();
          arc(x,y,radius,radius,5.18,10.6);
          arc(x,y,radius,radius,5.08,10.7);
          arc(x,y,radius,radius,4.8,10.8);
          arc(x,y,radius,radius,4.5,11);
          ellipse(x,y,radius,radius);
          arc(x,y,radius,radius,4.5,11);
          arc(x,y,radius,radius,4.8,10.8);
          arc(x,y,radius,radius,5.08,10.7);
         
        }
        y = y - 5;
    
        
      }
    else if(keyCode == DOWN)
      {
        arc(x,y,radius,radius,8.4,13.7);
        if(millis() > time + intervel)
        {
          time = millis();
          arc(x,y,radius,radius,8.3,13.6);
          arc(x,y,radius,radius,8.2,13.5);
          arc(x,y,radius,radius,8.1,13.4);
          arc(x,y,radius,radius,8,13.3);
          arc(x,y,radius,radius,7.8,14);
          ellipse(x,y,radius,radius);
          arc(x,y,radius,radius,7.8,14);
          arc(x,y,radius,radius,8,13.3);
          arc(x,y,radius,radius,8.1,13.4);
          arc(x,y,radius,radius,8.2,13.5);
        }
        y = y + 5;
      }
    else if(keyCode == RIGHT)
      {
        arc(x,y,radius,radius,0.52,5.76);
        if(millis() > time + intervel)
        {
          time = millis();
          arc(x,y,radius,radius,0.52,5.76);
          arc(x,y,radius,radius,0.32,5);
          arc(x,y,radius,radius,0.12,3.5);
          arc(x,y,radius,radius,-3,0);
          ellipse(x,y,radius,radius);
          arc(x,y,radius,radius,-3,0);
          arc(x,y,radius,radius,0.12,3.5);
          arc(x,y,radius,radius,0.32,5);
        }
        x = x + 5;
        //float newX = x + 5;
       //if( spaceIsClear(newX, y)) 
        
      }
    else
      {
        arc(x,y,radius,radius,3.67,8.90);
        if(millis() > time + intervel)
        {
          time = millis();
          arc(x,y,radius,radius,3.67,8.90);
          arc(x,y,radius,radius,3.47,9.1);
          arc(x,y,radius,radius,3.37,9.2);
          arc(x,y,radius,radius,3.17,9.4);
          arc(x,y,radius,radius,3.07,9.5);
          arc(x,y,radius,radius,3.17,9.4);
          arc(x,y,radius,radius,3.37,9.2);
          arc(x,y,radius,radius,3.47,9.1);
        }
        x = x - 5.5;
      }
    if(x <= 10)
      x = 10;
    if(x >= width - 10)
      x = width - 10;
    if(y >= height - 10)
      y = height - 10;
    if(y <= 10)
      y = 10;
   
  }
}


boolean spaceIsClear(float nx, float ny){
  tower.loadPixels();
  int i = int( x + (y * tower.width));
  color c = tower.pixels[i];
  //println(brightness(c));
  return true;
}


  
  




