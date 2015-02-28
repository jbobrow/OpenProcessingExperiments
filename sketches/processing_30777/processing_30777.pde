
//flash maths 03grid
//allonestring
//april 2011

//pjs - july 2014

int numRows = 30;
int numColumns = 30;
int gridSpacing = 20;
int counter = 0;
int offsetX, offsetY;

shapeClass sClass;
String shapeType = "RECTANGLE";
String shapeFill = "FILL";

float newX, newY;
color[] colours;
float[] sizes;
float[] distances;
float shapeScale = 1;
float angle = 0;


void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  colorMode(RGB);  
  //  frameRate(1);

  colours = new color[numRows*numColumns];
  sizes = new float[numRows*numColumns];
  distances = new float[numRows*numColumns];

  for(int r = 0; r < numRows; r++)
  {
    for(int c = 0; c < numColumns; c++)
    {
      colours[counter] = color(random(128) + 128, random(128) + 128, random(128) + 128);
      sizes[counter] = random(10) + 10;
      distances[counter] = random(20) + 80;
      counter++;
    }
  }

  offsetX = (width - (numRows * gridSpacing)) / 2 + gridSpacing / 2;
  offsetY = (height - (numColumns * gridSpacing)) / 2 + gridSpacing / 2;
}

void draw()
{
  fill(241, 237, 233, 128);
  noStroke();
  rect(0, 0, width, height);
  
  counter = 0;
  
  for(int r = 0; r < numRows; r++)
  {
    for(int c = 0; c < numColumns; c++)
    {
      angle = 0;
      float shapeSize = 20;

      float newX = offsetX + (r * gridSpacing);
      float newY = offsetY + (c * gridSpacing);

      float dx = mouseX - newX;
      float dy = mouseY - newY;
      float dt = sqrt(dx*dx + dy*dy);
      if(dt < distances[counter])
      {
        angle = atan2(dy, dx);
        newX -= cos(angle) * (distances[counter] - dt)/2;
        newY -= sin(angle) * (distances[counter] - dt)/2;
      }
      
      sClass = new shapeClass(shapeType, sizes[counter], sizes[counter], colours[counter], shapeFill);

      pushMatrix();
      translate(newX, newY);
      sClass.display();
      popMatrix();

      counter++;
    }
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
    if(shapeFill.equals("FILL"))
    {
      noStroke();
      fill(colour);
    }
    else 
    {
      strokeWeight(abs(shapeWidth / 3));
      stroke(colour);
      noFill();
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
    else if(shapeType.equals("RECTANGLE"))
    {
//      rectMode(CENTER);
//      rect(0, 0, shapeWidth, shapeHeight);
      rect(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }
    else if(shapeType.equals("ELLIPSE"))
    {
//      ellipseMode(CENTER);
//      ellipse(0, 0, shapeWidth, shapeHeight);      
      ellipse(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }
    else //circle
    {
//      ellipseMode(CENTER);
//      ellipse(0, 0, shapeWidth, shapeWidth);
      ellipse(-shapeWidth/2, -shapeHeight/2, shapeWidth, shapeHeight);
    }    
  }
}



