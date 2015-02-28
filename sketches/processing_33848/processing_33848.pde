
//allonestring
//may 2011
//flower buds

int numRows = 3;
int numColumns = 3;
float borderx = 50;
float bordery = 50;
float gridWidth, gridHeight;

int counter;
budShape[] buds;
color[] colours, bColours;
float[] angles, budWidths, budLengths;
float budLength;


void setup()
{
  size(500, 500);
//  background(255, 255, 255);
  smooth();
//  noStroke();
  colorMode(RGB);  
  frameRate(1);
  
  noStroke();
  fill((random(128)+129)/2, (random(128)+64)/2, random((32)+32)/2);
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  gridWidth = (width - 2 * borderx) / numColumns;
  gridHeight = (height - 2 * bordery) / numRows;

  int arrayLength = numRows*numColumns;
  colours = new color[arrayLength];
  bColours = new color[arrayLength];
  angles = new float[arrayLength];
  budWidths = new float[arrayLength];
  budLengths = new float[arrayLength];
  buds = new budShape[arrayLength];
  
  for(int b = 0; b < arrayLength; b++)
  {
    createNewValues(b);
  }
}

void createNewValues(int b)
{
  float redBit = random(128)+129;
  float greenBit = random(128)+64;
  float blueBit = random(32)+32;
  colours[b] = color(redBit, greenBit, blueBit);
  bColours[b] = color((255-redBit)/3, (255-greenBit)/3, (255-blueBit)/3);
  angles[b] = -random(1, 2) * PI / 3;
  budWidths[b] = random(0.6, 0.8) * gridWidth;
  budLengths[b] = random(0.7, 0.5) * gridHeight;
  int missingLine = int(random(1, 12));
  buds[b] = new budShape(colours[b], budWidths[b], budLengths[b], missingLine);

}

void draw()
{
  float xpos = borderx + (counter%numColumns) * gridWidth + gridWidth / 2;
  float ypos = bordery + int(counter/numColumns) * gridHeight + gridHeight / 2;
//      float xpos = borderx + r * gridWidth + gridWidth / 2;
//      float ypos = bordery + c * gridHeight + gridHeight / 2;
  pushMatrix();
  translate(xpos, ypos);
  noStroke();
  fill(bColours[counter]);
  rect(-gridWidth/2, -gridHeight/2, gridWidth, gridHeight);
  rotate(angles[counter]);
  buds[counter].display();
  popMatrix();
  
  createNewValues(counter);
  if(counter < numRows*numColumns-1) counter++;
  else counter = 0;
}

class budShape
{
  color colour;
  float shapeWidth, sl;
  int missingLine;
  
  budShape(color colour, float shapeWidth, float shapeLength, int missingLine) 
  {
    this.colour = colour;
    this.shapeWidth = shapeWidth;
    this.sl = shapeLength;
    this.missingLine = missingLine;
  }
  
  void display()
  {
    smooth();

    noFill();
    stroke(colour);
    strokeWeight(3);
    
    float curveFactor1 = random(0.4, 0.6);
    float curveFactor2 = random(0.05, 0.2);
    
    for(int i = 0; i < 10; i++)
    {
      if(i == missingLine && i != 9) continue;
      float curveDist = shapeWidth/2 - i * shapeWidth/9;
      bezier(-0.5*sl, 0, -curveFactor1*sl, curveDist, -curveFactor2*sl, curveDist, 0.5*sl, 0);
    }
  }
}



