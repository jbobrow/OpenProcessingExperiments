
// The message to be displayed
String message = "Rat Ox Tiger Rabbit  Dragon Snake Horse Ram Monkey  Rooster Dog Pig";
String message2 = "SUMMER  LONG SUMMER  FALL  WINTER  SPRING"; 
PFont f;
// The radius of a circle
float r = 100;
float s = 75;
int currAngle =0;
int angleChange = 1;
final float ANGLE_LIMIT = 36* TWO_PI;


void setup() {
  size(410, 503);
  f = createFont("Georgia",19.35,true);
  textFont(f);
  // The text must be centered!
  textAlign(CENTER);
  smooth();
  frameRate(30);
}

void draw() {
  PImage flowers;
  flowers = loadImage("1087.jpg");
  background(flowers);


  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  
  

  // We must keep track of our position along the curve
  float arclength = 0;
  float arclength2 = 0;
  currAngle += angleChange;
  if (currAngle > ANGLE_LIMIT || currAngle<0)
  {
    angleChange = -angleChange;
    currAngle += angleChange;
  }
  
if(mousePressed == false){
rotate(radians(currAngle));
}else {
}

  // For every box
  for (int i = 0; i < message.length(); i++)
  {
    // Instead of a constant width, we check the width of each character.
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar); 
    arclength += w/2;
    float theta = PI + arclength / r; 
    
    
    
    pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    rotate(theta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    fill(0);
    text(currentChar,0,0);
    popMatrix();
    // Move halfway again
    arclength += w/2;
   
   
  }
    
for (int j = 0; j < message2.length(); j++)
{
      char currentChar2 = message2.charAt(j);
      float v = textWidth(currentChar2);
      
    // Each box is centered so we move half the width
    arclength2 += v/2;
    float beta = PI + arclength2 / s; 
    
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    
    

    
    pushMatrix();
     translate(s*cos(beta), s*sin(beta));
    // Rotate the box
    rotate(beta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    fill(255,0,0);
    text(currentChar2, 0,0);
    popMatrix();
    arclength2 +=v/2; 
    
  }
}




