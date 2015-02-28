
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/100391*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
Sal Spring
allonestring.co.uk
June 2013

playing with rotating systems
here with blobs

keyboard input for 
• [b]lobs
• [f]lowers
• [s]tars
• toggle [d]isplaying the satelliets
*/

int numBlobs = 11;
Blob[] blobs;

int minOrbitRad = 80;
int maxOrbitRad = 300;
float minOrbitRotInc = -0.015;
float maxOrbitRotInc = 0.015;
int minBlobOrbit = 100;
int maxBlobOrbit = 200;

boolean displaySats = false;
color bgcolour = 255;
String shapeStyle = "BLOBS";


void setup()
{
  size(500, 500);
  background(bgcolour);
  smooth();

  blobs = new Blob[numBlobs];
  for (int b = 0; b < numBlobs; b++)
  {
    blobs[b] = new Blob();
    blobs[b].colour = color(random(64, 192), random(64, 192), random(64, 192));
    blobs[b].makeSatellites();
  }
}

void draw()
{
  background(bgcolour);

  pushMatrix();
  translate(width/2, height/2);
  for (int b = 0; b < numBlobs; b++)
  {
    pushMatrix();
    translate(blobs[b].centre.posx, blobs[b].centre.posy);
    blobs[b].update();
    blobs[b].display();
    popMatrix();
  }
  popMatrix();
}

void keyPressed()
{
  if (keyCode == 'd' || keyCode == 'D') displaySats = !displaySats;
  if (keyCode == 's' || keyCode == 'S') shapeStyle = "STARS";
  if (keyCode == 'f' || keyCode == 'F') shapeStyle = "FLOWERS";
  if (keyCode == 'b' || keyCode == 'B') shapeStyle = "BLOBS";
}

class Blob
{
  Satellite[] satellites;
  int numSats = 7;
  Satellite centre;
  color colour;


  Blob()
  {
    this.satellites = satellites;
    this.centre = centre;
    this.colour = colour;
  }

  void update()
  {
    for (int s = 0; s < numSats; s++)
    {
      satellites[s].update();
      if (displaySats) satellites[s].display();
    }
    centre.update();
  }

  void makeSatellites()
  {      
    satellites = new Satellite[numSats];
    for (int s = 0; s < numSats; s++)
    {
      float thisOrbitRad = random(minOrbitRad, maxOrbitRad);
      float thisOrbitRot = random(0, TWO_PI);
      float thisOrbitRotInc = random(minOrbitRotInc, maxOrbitRotInc);

      satellites[s] = new Satellite(thisOrbitRad, thisOrbitRot, thisOrbitRotInc);
      satellites[s].colour = this.colour;
    }
    float centreOrbitRad = random(minBlobOrbit, maxBlobOrbit);
    float cenreOrbitRot = random(0, TWO_PI);
    float centreOrbitRotInc = random(minOrbitRotInc, maxOrbitRotInc);
    centre = new Satellite(centreOrbitRad, cenreOrbitRot, centreOrbitRotInc);
  }

  void display()
  {
    PVector[] unsorted = new PVector[numSats];
    for (int s = 0; s < numSats; s++)
    {
      unsorted[s] = new PVector(satellites[s].posx, satellites[s].posy);
    }
    PVector[] sorted = untwistShape(unsorted);

    if (shapeStyle == "STARS")
    {
    stroke(colour, 80);
    fill(colour, 100);
      beginShape();
      for (int s = numSats - 1; s >= 0; s--)
      {
        int t = (s + 1) % numSats;
        curveVertex(sorted[t].x, sorted[t].y);
        curveVertex(sorted[t].x, sorted[t].y);
        curveVertex(0, 0);
        curveVertex(sorted[s].x, sorted[s].y);
        curveVertex(sorted[s].x, sorted[s].y);
      }
      endShape();
    }
    else if (shapeStyle == "FLOWERS")
    {
    stroke(colour, 80);
    fill(colour, 100);
      beginShape();
      for (int s = numSats - 1; s >= 0; s--)
      {
        int t = (s + 1) % numSats;
        curveVertex(sorted[t].x, sorted[t].y);
        curveVertex(0, 0);
        curveVertex(0, 0);
        curveVertex(sorted[s].x, sorted[s].y);
      }
      endShape();
    }    
    else
    {
    stroke(colour, 20);
    fill(colour, 80);
      beginShape();
      for (int s = numSats - 1; s >= 0; s--)
      {
        curveVertex(sorted[s].x, sorted[s].y);
      }
      for (int s = numSats - 1; s >= 0; s--)
      {
        curveVertex(sorted[s].x, sorted[s].y);
      }
      endShape();
    }

    if (displaySats)
    {
      for (int s = 0; s < numSats; s++)
      {
        satellites[s].display();
      }
    }
  }

  //sort vertices clockwise from midpoint
  PVector[] untwistShape(PVector[] vertices)
  {
    float midpointX = 0;
    float midpointY = 0;

    float[] anglesToVertices = new float[vertices.length];
    for (int v = 0; v < vertices.length; v++)
    {
      float dx = midpointX - vertices[v].x;
      float dy = midpointY - vertices[v].y;
      anglesToVertices[v] = atan2(dy, dx);
    }

    int[] sortedArray = new int[anglesToVertices.length];

    for (int i = 0; i < sortedArray.length; i++)
    {
      int arrayIndex = 80; //something much bigger than largest array length
      float minTestValue = 1000; // something much bigger than largest value

      for (int j = 0; j < anglesToVertices.length; j++)
      {
        if (anglesToVertices[j] < minTestValue)
        {
          minTestValue = anglesToVertices[j];
          arrayIndex = j;
        }
      }
      sortedArray[i] = arrayIndex;
      anglesToVertices[sortedArray[i]] = 1000;
    }

    PVector[] returnArray = new PVector[vertices.length];
    for (int a = 0; a < vertices.length; a++)
    {
      returnArray[a] = vertices[sortedArray[a]];
    }

    return returnArray;
  }
}

class Satellite
{
  float orbitRadius, orbitRotation, orbitRotInc;
  float posx, posy;
  color colour;

  Satellite(float orbitRadius, float orbitRotation, float orbitRotInc)
  {
    this.orbitRadius = orbitRadius;
    this.orbitRotation = orbitRotation;
    this.orbitRotInc = orbitRotInc;
    this.colour = colour;
    findPosition();
  }

  void display()
  {
    pushMatrix();
    translate(posx, posy);
    if (shapeStyle == "STARS")
    {
      stroke(colour, 100);
      noFill();
      ellipse(0, 0, 15, 15);
    }
    else if (shapeStyle == "FLOWERS") 
    {
      noStroke();
      fill(colour, 10);
      ellipse(0, 0, 25, 25);
    }
    else
    {
      noStroke();
      fill(colour);
      ellipse(0, 0, 5, 5);
    }
    popMatrix();
  }

  void update()
  {
    orbitRotation += orbitRotInc;
    findPosition();
  }

  void findPosition()
  {
    posx = orbitRadius * cos(orbitRotation);
    posy = orbitRadius * sin(orbitRotation);
  }
}



