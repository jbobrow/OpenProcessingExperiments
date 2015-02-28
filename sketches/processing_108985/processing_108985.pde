
// Week 3 assignment

// Static Variables
int multiple;
int gridCenter;
int diameter;
int secondHand;
void setup()
{
   size(640,480);
   background(255); 
  
}
void draw()
{
  
  int rangeH;        // width of screen
  int rangeV;        // height of screen
  int posX;          // x coordinate 
  int posY;          // y coordinate
  
  int red = 255;
  int green = 255;
  int blue = 255;
  int alpha = 100;
  
  // MAIN CONTROLS   *** ellipse size, how many gridspaces, placement EVERYTHING!!!
  diameter = 20;
  multiple = 30;
  gridCenter = multiple/2;
  
  
  // take screen width and height and divide by however many grid spaces you want
  rangeH = width/multiple;
  rangeV = height/multiple;
  //gridSpace = PVector(10,10);
  //determine random number within x and y coordinates
  posX = int(random(rangeH));  
  posY = int(random(rangeV));
  // multiply by multiple to get our desired coordinates
  posX = posX * multiple;         
  posY = posY * multiple;
  color c = get (posX+gridCenter,posY+gridCenter);
  // find random values for RBGA parameters
//  red = int(random(255));
//  green = int(random(255));
//  blue = int(random(255));
//  alpha = int(random(40,100));
  
  // CHECK QUADRANTS
  
  if(posX > width/2 && posY < height/2){              //Quadrant 1
    //make this section different shades of blue
    blue = int(random(255));
    int x = int(random(50));
    green = x;
    red = x;
  }else if(posX <= width/2 && posY < height/2){        //Quadrant 2
    //make this section different shades of red
    red = int(random(255));
    int x = int(random(50));
    green = x;
    blue = x;
  }else if(posX > width/2 && posY >= height/2){        //Quadrant 4
    //make this section different shades of yellow
    red = int(random(255));
    int x = int(random(50));
    green = red;
    blue = x;
  }else if(posX <= width/2 && posY >= height/2){            //Quadrant 3
    //make this section different shades of green
    green = int(random(255));
    int x = int(random(50));
    red = x;
    blue = x;    
  }
  
  ellipseMode(CENTER);
    fill(red,green,blue);
    ellipse(posX+gridCenter,posY+gridCenter,diameter,diameter);
    
  // draw circles where no circles have been drawn before
//  if(c == color(255)){
//    ellipseMode(CENTER);
//    fill(red,green,blue);
//    ellipse(posX+gridCenter,posY+gridCenter,diameter,diameter);
//  }
}  
  
  
void keyPressed(){
  background(255); 
}
  
  // a state is an int that represents some logical thing that u put ontop of the number
  // you're assigning a meaning to integer value that isn't implicit
  



