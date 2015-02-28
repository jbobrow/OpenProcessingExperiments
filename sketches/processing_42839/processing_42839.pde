
 int NUM_THINGS = 75;
 
  Thing[] things = new Thing[NUM_THINGS];
 
 
void setup() 
{
  size(500, 500); 
  smooth();
  frameRate(30);
 
 
  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();   // populating the array
 
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }
}
 
void draw() 
{
  Thing[] thingsall = new Thing[NUM_THINGS];
  
  background( 0, 0, 0);
 
  
  for (int i = 0; i < NUM_THINGS; i++)
  {
    
    things[i].update();        //beginning the bacteria colony
    
  
  }
  
  
  
  
  
}
 
 
class Thing
{
  //parameters of my thing
  float myDiameter = 10;
  float x;
  float y;
  float speedX = 2;
  float speedY = 2;
  float direction = 0;
 float  accelX=1;
 float accelY=1;
 float magx =0;
 float magy =0;
 float mousetrackX =0;
 float mousetrackY =0;
 
  //method(s) for my thing
  void update()
  {
    
  
    float dX = cos(radians(direction))*speedX*accelX+mousetrackX;
    float dY = sin(radians(direction))*speedY*accelY+mousetrackY;
    
    if (mousePressed){
    mousetrackX = (mouseX-x)/100;
    mousetrackY = (mouseY-y)/100;
    }
    else{
    mousetrackX =0;
    mousetrackY =0;
    
    }
    
    
    
    
 float ring =10;
 
 float growth =1;
 
 
    x = x + dX+magx;
    y = y + dY+magy;
 
    //managing borders
    if (x > width || x < 0)
    {
      speedX*=-1;
    }
 
    if (y > height||y < 0)
    {
      speedY*=-1;
    }
 
  color col = #D34A24;
  
  if (keyPressed ==true)
  col = #16642E;
  
    //draw the thing  
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
 
    
    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_THINGS; i++)
    {
      //temporary variable to store the other
      Thing other = things[i];
 
      if (this != other && keyPressed == false)
      {
        
        if (dist(x, y, other.x, other.y)<300){        //objects magnetize to each other
        direction+=0.2;
        magx=(-x+other.x)/300;
        magy=(-y+other.y)/300;
        accelX+=0.2;
        accelY+=0.2;
        }
        
        if (dist(x, y, other.x, other.y)<100){        //objects magnetize to each other
        direction+=0.4;
        magx=(-x+other.x)/200;
        magy=(-y+other.y)/200;
        accelX+=0.5;
        accelY+=0.5;
        }
        
        else{
          accelX=1;
        accelY=1;
        }
        
        
        if (dist(x, y, other.x, other.y)<25 && ring<300){        //ring growth
          stroke(150, 100);
          strokeWeight(2);
          noFill();
        ellipse(x, y, ring, ring);
     ring+=growth;
   growth+=3;}
   
   
      
          
        
        
      }
      
      
    }
    
    ////////////
  }
}                                               
