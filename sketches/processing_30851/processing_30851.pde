
// fake blur
// allonestring
// july 2011

//pjs - july 2014

int numBlobs = 9;

shapeClass sClass;
String shapeType = "CIRCLE";
String shapeFill = "FILL";

color[] colours;
color outlineColour;
float[] sizes;
float lineWidth = 10;

float newX, newY;

float[] xPos;
float[] yPos;
float[] xVel;
float[] yVel;


void setup()
{
  size(500, 500);
  background(255);
  smooth();
  colorMode(RGB);  
//  frameRate(12);


  colours = new color[numBlobs];
  sizes = new float[numBlobs];

  xPos = new float[numBlobs];
  yPos = new float[numBlobs];
  xVel = new float[numBlobs];
  yVel = new float[numBlobs];
  
  populateArrays();
}


void draw()
{
  fill(255);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  moveShapes();
  
  if(mousePressed)
  {
    populateArrays();
  }
} 
  
void moveShapes()
{
  moveAndCheckEdges();
  drawOutlines();
  drawBlurs();
  drawFills();
}

void moveAndCheckEdges()
{
  for(int i = 0; i < numBlobs; i++)
  {
    xPos[i] += xVel[i];
    if(xPos[i] > width - sizes[i] / 2 - lineWidth)
    {
      xPos[i] = width - sizes[i] / 2 - lineWidth;
      xVel[i] *= -1;
    }
    if(xPos[i] < sizes[i] / 2 + lineWidth)
    {
      xPos[i] = sizes[i] / 2 + lineWidth;
      xVel[i] *= -1;
    }
    
    yPos[i] += yVel[i];
    if(yPos[i] > height - sizes[i] / 2 - lineWidth) 
    {
      yPos[i] = height - sizes[i] / 2 - lineWidth;
      yVel[i] *= -1;
    }
    if(yPos[i] < sizes[i] / 2 + lineWidth) 
    {
      yPos[i] = sizes[i] / 2 + lineWidth;
      yVel[i] *= -1;
    }
  }
}





void drawBlurs()
{
  for(int i = 0; i < numBlobs; i++)
  {
    shapeClass sClassWhite = new shapeClass(shapeType, sizes[i]-5, color(255), "FILL");
    
    pushMatrix();
    translate(xPos[i], yPos[i]);
    sClassWhite.display();
    popMatrix();
  }
  for(int b = 0; b < 5; b++) //magic number 5
  {
    int blurScale = 2 * (5 - b);
    for(int i = 0; i < numBlobs; i++)
    {

      shapeClass sClass0 = new shapeClass(shapeType, sizes[i] + blurScale, color(colours[i], blurScale * 5), "FILL");
      
      pushMatrix();
      translate(xPos[i], yPos[i]);
      sClass0.display();
      popMatrix();
    }  
  }
}
void drawFills()
{
  for(int i = 0; i < numBlobs; i++)
  {
    sClass = new shapeClass(shapeType, sizes[i], color(colours[i]), "FILL");
    
    pushMatrix();
    translate(xPos[i], yPos[i]);
    sClass.display();
    popMatrix();
  }
}
void drawOutlines()
{
  for(int i = 0; i < numBlobs; i++)
  {
    sClass = new shapeClass(shapeType, sizes[i] + 2 * lineWidth, color(outlineColour), "FILL");
    
    pushMatrix();
    translate(xPos[i], yPos[i]);
    sClass.display();
    popMatrix();
  }
}

void populateArrays()
{
  for(int i = 0; i < numBlobs; i++)
  {
    float redBit = random(192, 222);
    float blueBit = random(192-64, redBit-64);
    float greenBit = 255 - (redBit + blueBit) / 2;
    colours[i] = color(redBit, greenBit, blueBit, 50);
    outlineColour = color(redBit / 2, greenBit / 2, blueBit / 2);
    sizes[i] = random(100, 200);
    xPos[i] = random(sizes[i], width - sizes[i]); 
    yPos[i] = random(sizes[i], height - sizes[i]); 
    xVel[i] = random(-1.5, 1.5);
    yVel[i] = random(-1.5, 1.5);
  }
}



//multi shape class
class shapeClass
{
  String shapeType;
  float shapeSize;
  color colour;
  String shapeFill;
  
  shapeClass(String shapeType, float shapeSize, color colour, String shapeFill) 
  {
    this.shapeType = shapeType;
    this.shapeSize = shapeSize;
    this.colour = colour;
    this.shapeFill = shapeFill;
  }
  
  void display()
  {
    smooth();
    if(shapeFill.equals("FILL"))
    {
      noStroke();
      fill(colour);
    }
    else 
    {
      strokeWeight(10);
      stroke(colour);
      noFill();
    }
    
    if(shapeType.equals("FLOWER"))
    {
      PVector vertex0 = new PVector(cos(0)*shapeSize, sin(0)*shapeSize);
      PVector vertex1 = new PVector(cos(2 * PI / 5)*shapeSize, sin(2 * PI / 5)*shapeSize); 
      PVector vertex2 = new PVector(cos(4 * PI / 5)*shapeSize, sin(4 * PI / 5)*shapeSize); 
      PVector vertex3 = new PVector(cos(6 * PI / 5)*shapeSize, sin(6 * PI / 5)*shapeSize);
      PVector vertex4 = new PVector(cos(8 * PI / 5)*shapeSize, sin(8 * PI / 5)*shapeSize);
  
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
      PVector vertex0 = new PVector(cos(0)*shapeSize, sin(0)*shapeSize);
      PVector vertex1 = new PVector(cos(2 * PI / 5)*shapeSize, sin(2 * PI / 5)*shapeSize); 
      PVector vertex2 = new PVector(cos(4 * PI / 5)*shapeSize, sin(4 * PI / 5)*shapeSize); 
      PVector vertex3 = new PVector(cos(6 * PI / 5)*shapeSize, sin(6 * PI / 5)*shapeSize);
      PVector vertex4 = new PVector(cos(8 * PI / 5)*shapeSize, sin(8 * PI / 5)*shapeSize);
  
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
//      rectMode(CENTER);
//      rect(0, 0, shapeWidth, shapeHeight);
      rect(-shapeSize/2, -shapeSize/2, shapeSize, shapeSize);
    }
    else //circle
    {
      ellipseMode(CENTER);
      ellipse(0, 0, shapeSize, shapeSize);
//      ellipse(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }    
  }
}



