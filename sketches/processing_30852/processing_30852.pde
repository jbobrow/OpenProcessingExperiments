
//iterations of boxes
//allonestring
//april 2011

//pjs july 2014

shapeClass thing;
String shapeType = "RECTANGLE";
String shapeFill = "FILL";
color[] shapeColour;

int numShapes = 4;
int numPetals = 1;
int numIterations = 80;
float[] shapeWidth, shapeHeight;
float[] xpos, ypos;
float[]rotation;

float theta, speed;
int shapeCounter = 0;
int iterationCount = 0;
float rotationFactor;
float accumulatedRotation;

void setup()
{
  size(600, 600);
  background(255);
  frameRate(12);
//  shapeCounter = 0;
  
  xpos = new float[numShapes];
  ypos = new float[numShapes];
  shapeWidth = new float[numShapes];
  shapeHeight = new float[numShapes];  
  shapeColour = new color[numShapes];
  rotation = new float[numShapes];
  ellipseMode(CENTER);
  
  createNewValues();
}

void createNewValues()
{  
//  rectMode(CORNER);
//  fill(255, 200);
//  rect(0, 0, width, height);

  theta = 0;
  speed = 0;
  shapeCounter = 0;
  iterationCount = 0;
  accumulatedRotation = 0;
//  numPetals = (int)random(6) + 3;
  rotationFactor = random(PI);

  for(int s = 0; s < numShapes; s++)
  {
    shapeWidth[shapeCounter] = random(10) + 10; //30 - abs(5 * (s - (numShapes - 1)));
    shapeHeight[shapeCounter] = shapeWidth[shapeCounter];
    shapeColour[shapeCounter] = color(random(128) + 64, random(128) + 64, random(128) + 64, 100);
    xpos[shapeCounter] = width / 2;
    ypos[shapeCounter] = height / 2;
    rotation[shapeCounter] = s * TWO_PI / numShapes;
    shapeCounter++;
  }
}

void draw()
{
  rectMode(CORNER);
  noStroke();
  fill(255, 5);//(255/numIterations)/2 + iterationCount);
  rect(0, 0, width, height);
  
  rectMode(CENTER);
  shapeCounter = 0;
  for(int s = 0; s < numShapes; s++)
  {
    shapeWidth[shapeCounter] *= 0.98;
    shapeHeight[shapeCounter] = shapeWidth[shapeCounter];
    thing = new shapeClass(shapeType, shapeWidth[shapeCounter], shapeHeight[shapeCounter], shapeColour[shapeCounter], shapeFill);

//    xpos[shapeCounter] += shapeWidth[shapeCounter] * cos(theta);
//    ypos[shapeCounter] += shapeHeight[shapeCounter] * sin(theta);
//    rotation[shapeCounter] += speed;
    float dx = width / 2 - xpos[shapeCounter];
    float dy = height / 2 - ypos[shapeCounter];
    float newDist = sqrt(dx*dx + dy*dy);
    float angle = atan2(dy, dx);
    float newAngle;
    
//    for(int p = 0; p < numPetals; p++)
    {
      pushMatrix();
      newAngle = angle + s * TWO_PI / numShapes;
      translate(width/2 + (newDist * cos(newAngle)), height/2 + (newDist * sin(newAngle)));
//      rotate(HALF_PI * s + PI/4 + random(PI));
      rotate(rotation[shapeCounter]);
      thing.display();
      popMatrix();
    }
    
        xpos[shapeCounter] += shapeWidth[shapeCounter] * cos(theta);
    ypos[shapeCounter] += shapeHeight[shapeCounter] * sin(theta);
    rotation[shapeCounter] += speed;

//    pushMatrix();
//    translate(xpos[shapeCounter], ypos[shapeCounter]);
//    thing.display();
//    popMatrix();
  
//    pushMatrix();
//    translate(width - xpos[shapeCounter], ypos[shapeCounter]);
//    thing.display();
//    popMatrix(); 
    
    shapeCounter++;
  }   
      
  theta += speed;
  speed += (random(1) - 0.5) ;
//    speed += (random(4) - 2)* PI / 10;
  speed = max(speed, -0.5);
  speed = min(speed, 0.5);
  accumulatedRotation += theta;

  if(iterationCount < numIterations) iterationCount++;
  else createNewValues();
}

//multi shape class
class shapeClass
{
  String shapeType;
  float shapeWidth;
  float shapeHeight;
  color colour;
  String shapeFill;
  
  shapeClass(String shapeType, float shapeWidth, float shapeHeight, color colour, String shapeFill) 
  {
    this.shapeType = shapeType;
    this.shapeWidth = shapeWidth;
    this.shapeHeight = shapeHeight;
    this.colour = colour;
    this.shapeFill = shapeFill;
  }
  
  void display()
  {
    smooth();
//    if(shapeFill.equals("FILL"))
    {
      noStroke();
      fill(colour);
    }
 //   else 
    {
 //     strokeWeight(abs(shapeWidth / 3));
      strokeWeight(1);
      stroke(128);
//      noFill();
    }
    
    if(shapeType.equals("LONGLINE"))
    {
      ellipseMode(CENTER);
      strokeWeight(1);
      line(-5*shapeWidth, 0, 5*shapeWidth, 0);
      fill(colour);
      ellipse(-5*shapeWidth, 0, 10, 10);
      ellipse(5*shapeWidth, 0, 10, 10);
    }
    
    if(shapeType.equals("LEAF"))
    {
      beginShape();
      curve(0, -shapeWidth*5, -shapeWidth/2, -shapeWidth/2, shapeWidth/2, shapeWidth/2, shapeWidth*5, 0);
      curve(0, shapeWidth*5, shapeWidth/2, shapeWidth/2, -shapeWidth/2, -shapeWidth/2, -shapeWidth*5, 0);
      endShape();
    }
    
    if(shapeType.equals("FLOWER"))
    {
      PVector vertex0 = new PVector(cos(0)*shapeWidth, sin(0)*shapeHeight);
      PVector vertex1 = new PVector(cos(2 * PI / 5)*shapeWidth, sin(2 * PI / 5)*shapeHeight); 
      PVector vertex2 = new PVector(cos(4 * PI / 5)*shapeWidth, sin(4 * PI / 5)*shapeHeight); 
      PVector vertex3 = new PVector(cos(6 * PI / 5)*shapeWidth, sin(6 * PI / 5)*shapeHeight);
      PVector vertex4 = new PVector(cos(8 * PI / 5)*shapeWidth, sin(8 * PI / 5)*shapeHeight);
  
      beginShape();
      vertex(0, 0);
      bezierVertex(vertex0.x, vertex0.y, vertex1.x, vertex1.y, 0, 0);
      bezierVertex(vertex1.x, vertex1.y, vertex2.x, vertex2.y, 0, 0);
      bezierVertex(vertex2.x, vertex2.y, vertex3.x, vertex3.y, 0, 0);
      bezierVertex(vertex3.x, vertex3.y, vertex4.x, vertex4.y, 0, 0);
      bezierVertex(vertex4.x, vertex4.y, vertex0.x, vertex0.y, 0, 0);
      endShape();
    }
    else if(shapeType.equals("PENTAGON"))
    {
      PVector vertex0 = new PVector(cos(0)*shapeWidth, sin(0)*shapeHeight);
      PVector vertex1 = new PVector(cos(2 * PI / 5)*shapeWidth, sin(2 * PI / 5)*shapeHeight); 
      PVector vertex2 = new PVector(cos(4 * PI / 5)*shapeWidth, sin(4 * PI / 5)*shapeHeight); 
      PVector vertex3 = new PVector(cos(6 * PI / 5)*shapeWidth, sin(6 * PI / 5)*shapeHeight);
      PVector vertex4 = new PVector(cos(8 * PI / 5)*shapeWidth, sin(8 * PI / 5)*shapeHeight);
  
      beginShape();
//      vertex(0, 0);
      line(vertex0.x, vertex0.y, vertex1.x, vertex1.y);
      line(vertex1.x, vertex1.y, vertex2.x, vertex2.y);
      line(vertex2.x, vertex2.y, vertex3.x, vertex3.y);
      line(vertex3.x, vertex3.y, vertex4.x, vertex4.y);
      line(vertex4.x, vertex4.y, vertex0.x, vertex0.y);
      endShape();
    }    
    else if(shapeType.equals("RECTANGLE"))
    {
      rectMode(CENTER);
//      rect(0, 0, shapeWidth, shapeHeight);
      rect(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }
    else if(shapeType.equals("ELLIPSE"))
    {
      ellipseMode(CENTER);
//      ellipse(shapeWidth, shapeHeight, 2 * shapeWidth, 2 * shapeHeight);      
      ellipse(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }
    else //circle
    {
      ellipseMode(CENTER);
//      ellipse(0, 0, shapeWidth, shapeWidth);
//      ellipse(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }    
  }
}



