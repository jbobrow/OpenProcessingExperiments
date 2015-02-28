
//movingLoops10 aka blob flowers
//allonestring
//june 2011

//pjs - july 2014]

int numBlobs;
blob[] blobs;
color[] colour;
float bRadius = 100;

int numVertices; 
float[][] xBlobVertices, yBlobVertices; //all the vertices used by a blob
float[] xShared, yShared; //vertices shared by blobs (one for each blob)
int numUnshared;
float[][] xUnshared, yUnshared; //vertices not shared

float moveMin = -0.5;
float moveMax = 0.5;


void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  
  createInitialValues();
}
void createInitialValues()  
{
  background(255);
  
  numBlobs = (int)random(2, 10);
  numVertices = (int)random(3, 10); //shapes must have at least 3 vertices
  numUnshared = numVertices - 3; // unshared vertices (total - 2 shared - centre)
  
  blobs = new blob[numBlobs];
  colour = new color[numBlobs];
  
  xShared = new float[numBlobs];
  yShared = new float[numBlobs];  
  xUnshared = new float[numBlobs][numUnshared];
  yUnshared = new float[numBlobs][numUnshared]; 
 
  float angle = TWO_PI / (numBlobs * 2);
  float angleInc = random(HALF_PI); //some random initial rotation
  //find shortRadius (length from blob centres to unshared vertices)
  float dx = bRadius * (cos(2 * angle) - cos(angle));
  float dy = bRadius * (sin(2 * angle) - sin(angle));
  float shortRadius = sqrt(dx*dx + dy*dy);

  for(int i = 0; i < numBlobs; i++)
  {
    colour[i] = color(random(255), random(255), random(255), 10);
    //shared vertices are evenly spaced around the origin
    float beta = (2 * i * angle) + angleInc; //angles to shared vertices
    xShared[i] = bRadius * cos(beta);
    yShared[i] = bRadius * sin(beta);

    for(int j = 0; j < numUnshared; j++)
    {
      float gamma = ((2 * i + 1) * angle) + angleInc; //angles to blob centres
      //spread out from each blob centre are the unshared vertices
      float sectorPart = (PI + angle) / (numUnshared + 1);
      float initialAngle = gamma - sectorPart * (numUnshared - 1) / 2.0;
      float delta = initialAngle + j * sectorPart;
      xUnshared[i][j] = bRadius * cos(gamma) + shortRadius * cos(delta);
      yUnshared[i][j] = bRadius * sin(gamma) + shortRadius * sin(delta);
    }
  }
}

void draw()
{
  fill(255, 1);
  rect(0, 0, width, height);
  
  xBlobVertices = new float[numBlobs][numVertices];
  yBlobVertices = new float[numBlobs][numVertices];

  //each blob needs numVertices vertices
  //the origin
  //the [i]th shared vertex
  //the numUnshared respective unshared vertices
  //the (i+1)th shared vertex
  for(int i = 0; i < numBlobs; i++)
  {
    xBlobVertices[i][0] = 0;
    yBlobVertices[i][0] = 0;
    xBlobVertices[i][1] = xShared[i];
    yBlobVertices[i][1] = yShared[i];
    
    for(int j = 0; j < numUnshared; j++)
    {
      xBlobVertices[i][j + 2] = xUnshared[i][j];
      yBlobVertices[i][j + 2] = yUnshared[i][j];
    }
    
    xBlobVertices[i][numVertices - 1] = xShared[(i + 1) % numBlobs];
    yBlobVertices[i][numVertices - 1] = yShared[(i + 1) % numBlobs];
  }  

  for(int b = 0; b < numBlobs; b++)
  {
    blobs[b] = new blob(xBlobVertices[b], yBlobVertices[b], colour[b]);
  }
  translate(width / 2, height / 2);
  for(int b = 0; b < numBlobs; b++)
  {
    blobs[b].display();
  }
  
  //jiggle all the vertices except the centre one
  for(int i = 0; i < numBlobs; i++)
  {
    xShared[i] += random(moveMin, moveMax);
    yShared[i] += random(moveMin, moveMax);
    for(int j = 0; j < numUnshared; j++)
    {
      xUnshared[i][j] += random(moveMin, moveMax);
      yUnshared[i][j] += random(moveMin, moveMax);
    }
  }
}

void mousePressed()
{
  createInitialValues();
}
class blob //a shape with rounded corners
{
  float[] xpos, ypos; //vertices
  color colour;
  float[] xoffcw, yoffcw; //"clockwise" offsets from vertices
  int n;
  int offset = 3; //fraction of each end of line converted to rounded corners
  
  blob(float[] xpos, float[] ypos, color colour)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.colour = colour;
    init();
  }
  
  void init()
  {
    noStroke();

    n = xpos.length;
    xoffcw = new float[n];
    yoffcw = new float[n];
  }
  
  void display()
  {
    for(int i = 0; i < n; i++)
    {
      float dx = xpos[i] - xpos[(i + 1) % n];
      float dy = ypos[i] - ypos[(i + 1) % n];
      xoffcw[i] = xpos[i] - dx / offset;
      yoffcw[i] = ypos[i] - dy / offset;
    }  
    
    fill(colour);
    beginShape();
    vertex(xoffcw[n - 1], yoffcw[n - 1]);
    for(int i = 0; i < n; i++)
    {
      int j = (i + n - 1) % n;
      bezierVertex(xpos[i], ypos[i], xpos[i], ypos[i], xoffcw[i], yoffcw[i]);
    }
    endShape();
  }
}
    


