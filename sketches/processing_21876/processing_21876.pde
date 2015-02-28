

float orbitalX;
float orbitalY;
float frequency = 8;
float angle; 

float diameter = 20;

PVector position = new PVector(100, 75);
PVector acceleration; //new PVector//(-0.2, 0.2);
PVector vDirection; //new PVector(1,1);

float x = 0;
float y = 0;

float circleLocationX;
float circleLocationY;
float circleRadius = diameter/2;

float rectangleLocationX = width/2;
float rectangleLocationY = height/2;
float rectangleWidth = 100.0;
float rectangleHeight = 100.0;

//array blips = new array[];
//////////////////////////////////////////////////////////////////////////////////////////// Setup
void setup()
{
 frameRate(30);
 size(1024,1024);
 smooth();
 rectMode(CORNER);
// ellipseMode(CENTER);
background(0);

 
}

//////////////////////////////////////////////////////////////////////////////////////////// Draw
void draw()
{
    //background(0, 0 , 0, 50);
    fill(0,0,0, 20);
    rect(0, 0, 1024, 1024);
    //position = new PVector(300, 300);
    
    //DRAw RECT

   // translate(width/2, height/2);
    rect (rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);
    vDirection = new PVector(orbitalX,orbitalY);

    
    //orbitalX = position.x + cos(radians(angle))*(diameter/2);
    //orbitalY = position.y + sin(radians(angle))*(diameter/2); 
  
    orbitalX = x + cos(radians(angle))*(diameter/2);
    orbitalY = y + sin(radians(angle))*(diameter/2);
  
    acceleration = new PVector(orbitalX*1.2, orbitalY*1.2); 
    //draws player
    
//    
//    for (int i = 0; i <= 10; i++)
//    { 
//       strokeWeight(i);
//       if(i == 8)
//       {
//       i = 0;
//       }  
//    }
    
    stroke(255);
    strokeWeight(3);
    ellipse(x + position.x, y + position.y , diameter/.9, diameter/.9); 
    //ellipse(orbitalX, orbitalY, 10, 10);
   
   // Draws Orbiters
   // noFill();
    fill(255,0,0);
    ellipse(x+position.x +  cos(radians(angle))*(diameter/2), y+position.y+sin(radians(angle))*(diameter/2), 10, 10);
    ellipse(x+position.x +  cos(radians(angle))*(diameter*50), y+position.y+sin(radians(angle))*(diameter*50), 10, 10);
     
    angle -= frequency*1.2; 
      
    //CIRClE COORDINATES
    circleLocationX = x + position.x;
    circleLocationY = y + position.y; 
    
    /// DRAWING WALLS -______________-__-_-_-_-_
    fill(0, 0, 255);
    noStroke();
    
    drawWalls(841, 99, 142, 130);   
    drawWalls(644, 140, 128, 153);
    drawWalls(819, 285, 200, 78);
    drawWalls(658, -6, 142, 74);
    drawWalls(493, 62, 107, 196);
    
    drawWalls(85, 131, 344, 155);
    drawWalls(199, 45, 109, 42);
    drawWalls(820, 440, 93, 72);
    drawWalls(536, 350, 203, 333);
    drawWalls(463, 516, 94, 105);
    
    drawWalls(341, 340, 137, 86);
    drawWalls(199, 339, 95, 156);
    drawWalls(0, 339, 69, 147);
    drawWalls(50, 389, 71, 51);
    drawWalls(841, 584, 56, 75);
    
    drawWalls(737, 717, 140, 32);
    drawWalls(800, 728, 79, 189);
    drawWalls(865, 785, 160, 76);
    drawWalls(658, 900, 219, 48);
    drawWalls(446, 785, 267, 69);
    
    drawWalls(212, 730, 367, 69);
    drawWalls(106, 599, 180, 84);
    drawWalls(110, 844, 166, 85);
    drawWalls(47, 599, 72, 331);
    drawWalls(305, 962, 292, 62);
    
    drawWalls(998, 0, 26, 1024);
    
    drawWalls(232, 647, 138, 63);
    
    drawWalls(787, 635, 23, 24);
    drawWalls(389, 486, 29, 30);
    drawWalls(328, 561, 37, 37);
    drawWalls(131, 495, 30, 37);
    drawWalls(382, 54, 24, 27);
    drawWalls(0, 0, 59, 87);
    
    
    boolean collisionDetected = isCollidingCircleRectangle(circleLocationX, circleLocationY, circleRadius, 
    rectangleLocationX, rectangleLocationY, rectangleWidth, rectangleHeight);
    
    if (collisionDetected == true)
    {
      fill(255,0,0);
    }
    else
    {
      fill(255);
    }
      
    //targeting ellipse
  
    stroke(0);
    strokeWeight(3);
    noFill();
    ellipse(x + position.x, y + position.y , diameter*8, diameter*8);
    strokeWeight(5);
    ellipse(x + position.x, y + position.y , diameter*100, diameter*100); 
    move(); 
    spawnBlips(); 
}

//////////////////////////////////////////////////////////////////////////////////////////// Move
void move()
{
   
     if(mousePressed)
     { 
        //vDirection.add(acceleration);
        vDirection.sub(position);
        //position.add(vDirection);
        position.add(acceleration);
      
     }
}

//////////////////////////////////////////////////////////////////////////////////////////// Draw Wall Blocks
void drawWalls(float cornX, float cornY, float wWidth, float wHeight)
{
  rectMode(CORNER);
  rect(cornX, cornY, wWidth, wHeight);
}

//////////////////////////////////////////////////////////////////////////////////////////// Collision
boolean isCollidingCircleRectangle(
      float circleX,
      float circleY,
      float radius,
      float rectangleX,
      float rectangleY,
      float rectangleWidth,
      float rectangleHeight)
{
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);
 
    if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
 
    if (circleDistanceX <= (rectangleWidth/2)) { return true; }
    if (circleDistanceY <= (rectangleHeight/2)) { return true; }
 
    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);
 
    return (cornerDistance_sq <= pow(radius,2));
    
}

//////////////////////////////////////////////////////////////////////////////////////////// Place Markers
void spawnBlips()
{


  for (int i = 0; i < 10; i++)
  {
    //blip = new 
    //ellipse(int)Math.random(width), (int)Math.random(height), 15, 15);
  }
}



