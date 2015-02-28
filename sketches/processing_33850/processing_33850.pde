
//allonestring
//april 2011
//hidden spirals

//pjs - july 2014

shapeClass thing;
String shapeType = "LONGLINE";
String shapeFill = "FILL";
color[] shapeColour;
int colourPart;

int numShapes = 4;
int numPetals = 1;
int[] iterations, iterationCount;
float[] shapeWidth, shapeHeight;
float[] xpos, ypos;
float[] rotation, rotationRate, scales;

float theta, speed;
int shapeCounter = 0;
float rotationFactor;
float accumulatedRotation;

void setup()
{
  size(400, 400);
  background(255);
  frameRate(12);
//  shapeCounter = 0;
  
  iterations = new int[numShapes];
  iterationCount = new int[numShapes];
  xpos = new float[numShapes];
  ypos = new float[numShapes];
  shapeWidth = new float[numShapes];
  shapeHeight = new float[numShapes];  
  shapeColour = new color[numShapes];
  rotation = new float[numShapes];
  rotationRate = new float[numShapes];
  scales = new float[numShapes];
    colourPart = (int)(random(5));

  ellipseMode(CENTER);
  for(int s = 0; s < numShapes; s++)
  {
    createNewValues(s);
  }
}

void createNewValues(int s)
{  
//  shapeCounter = 0;

//  for(int s = 0; s < numShapes; s++)
  {
    iterations[s] = int(random(60, 100));
    iterationCount[s] = 0;
    shapeWidth[s] = random(width/4, width/2);//random(width / 4, width / 2);//random(10) + 10; //30 - abs(5 * (s - (numShapes - 1)));
    shapeHeight[s] = shapeWidth[s];
    shapeColour[s] = color(random(255), random(255), random(255), 100);
    xpos[s] = width / 4 + (s % 2) * width / 2;
    ypos[s] = height / 4 + int(s/2) * height / 2;
    rotation[s] = random(TWO_PI);
    rotationRate[s] = random(PI/16, PI/8);
    if((s == 0) || (s == 3))  rotationRate[s] *= -1;
    scales[s] = random(0.95, 0.98);

//    shapeCounter++;
  }
}

void draw()
{
  rectMode(CORNER);
  noStroke();
  fill(255, 10);//(255/numIterations)/2 + iterationCount);
  rect(0, 0, width, height);
  
  rectMode(CENTER);
  shapeCounter = 0;
  for(int s = 0; s < numShapes; s++)
  {
    float radius = shapeWidth[shapeCounter]/10;// * (scales[shapeCounter]) /10;
    
    thing = new shapeClass(shapeType, shapeWidth[shapeCounter], shapeWidth[shapeCounter], shapeColour[shapeCounter], shapeFill);
    
    pushMatrix();
    translate(xpos[shapeCounter], ypos[shapeCounter]);
    rotate(rotation[shapeCounter]);
    thing.display();
    popMatrix();

    rotation[shapeCounter] += rotationRate[shapeCounter];
    shapeWidth[shapeCounter] *= (2-scales[shapeCounter]);
    xpos[shapeCounter] += radius * cos(rotation[shapeCounter])/10;
    ypos[shapeCounter] += radius * sin(rotation[shapeCounter])/10;

  if(iterationCount[shapeCounter] < iterations[shapeCounter]) iterationCount[shapeCounter]++;
  else createNewValues(shapeCounter);
    shapeCounter++;
  }   


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
//      stroke(128);
//      noFill();
    }
    
    if(shapeType.equals("LONGLINE"))
    {
      ellipseMode(CENTER);
      stroke(0);
      strokeWeight(1);
      line(-5*shapeWidth, 0, 5*shapeWidth, 0);
//      fill(colour);
//      ellipse(-5*shapeWidth, 0, 10, 10);
//      ellipse(5*shapeWidth, 0, 10, 10);
    }
    
    if(shapeType.equals("LEAF"))
    {
      beginShape();
      curve(20, 20-shapeWidth*5, 20-shapeWidth/2, 20-shapeWidth/2, 20+shapeWidth/2, 20+shapeWidth/2, 20+shapeWidth*5, 20);
      curve(20, 20+shapeWidth*5, 20+shapeWidth/2, 20+shapeWidth/2, 20-shapeWidth/2, 20-shapeWidth/2, 20-shapeWidth*5, 20);
//      curve(0, -shapeWidth*5, -shapeWidth/2, -shapeWidth/2, shapeWidth/2, shapeWidth/2, shapeWidth*5, 0);
//      curve(0, shapeWidth*5, shapeWidth/2, shapeWidth/2, -shapeWidth/2, -shapeWidth/2, -shapeWidth*5, 0);
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
//      ellipseMode(CENTER);
//      ellipse(0, 0, shapeWidth, shapeWidth);
//      ellipse(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }    
  }
}



