
/** 
 * "Dancing Hotdog People" by Evan Reeves 
 * 
 * For lack of a better app name, this is an applet that iteratively renders
 * line segments of a uniform magnitude  about a given incremented angle 
 * throughout the screen. The spacing of the line segments is controlled
 * by vertical mouse position, the increment of the angle controlled by 
 * horizontal mouse position, and random color assignment for the 
 * line segments.
 * Email: web@evanreeves.com
 * Website: www.evanreeves.com or github.com/JadedEvan
 */ 

// Some global vars
float spacing = 5;     // Spacing between objects
float dTheta = 2;      // Incremental change in angle 
float angle = 0;       // Initial angle

float midpointX, midpointY = 0;
void setup()
{
  size(600, 400);
  // Hint : higher framerates make this a bit more schizophrenic
  frameRate(15);
  smooth(); 
  strokeWeight(5);
}

void draw()
{
  background(255,255,255);
 
  // Hint : Try playing with the tresholds for the mapping
  dTheta = map(mouseY, 0, height, 0, 15);
  spacing = map(mouseX, 0, width, 5, 50);
  
  // Hint : adding 'float' before variable assignment also 
  // yields some interesting results!
  //float dTheta = map(mouseY, 0, height, 0, 15);
  //float spacing = map(mouseX, 0, width, 5, 50);
  
  stroke(0,0,0);
  for(int dY=0; dY < height; dY += spacing)
  {
    for(int dX=0; dX < width; dX += spacing)
    {
      drawSegment(dX, dY, angle);
      // Hint : try moving the angle statement into 
      // the previous for loop for a different look
      angle = incrementAngle(angle, dTheta);
    }
  } 
  
}

void drawSegment(float xPos, float yPos, float angle)
{
  // Calculate the midpoint of where the line should be drawn
  // So segments can be extended equally from this position
  midpointX = xPos + (spacing/2);
  midpointY = yPos + (spacing/2);  
  float lengthX = (spacing/2)*cos(radians(angle));
  float lengthY = (spacing/2)*sin(radians(angle));
  
  // TODO : might run faster in HSB mode, by making fewer calls to 
  // random()
  stroke(random(255), random(255), random(255));
  line(midpointX, midpointY, midpointX + lengthX, midpointY + lengthY);
  line(midpointX, midpointY, midpointX - lengthX, midpointY - lengthY);
}

float incrementAngle(float angle, float dT)
{
  if(angle > 360) {
    return angle - 360 + dT;
  } else {
    return angle+dT;
  }
}

