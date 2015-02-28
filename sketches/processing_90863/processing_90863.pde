
/*Eric Wang
 * Projection Mapping Template
 * 
 * Using list of points to draw the faces 
 * and edges of an abstracted cityscape.
 *
 * Introduction to Digital Media
 * Carnegie Mellon University SoArch
 * 02.15.2013
 */

// create arrays to store our face locations
ArrayList<PVector> topFacePts   = new ArrayList<PVector>();
ArrayList<PVector> leftFacePts  = new ArrayList<PVector>();
ArrayList<PVector> rightFacePts = new ArrayList<PVector>();

PVector[] startPoints;
PVector[] endPoints;
Boolean[] drawEdges;
float[] edgePercentage;
Boolean[] dir;

int time = 0;
float speed = .03;

void setup() {
  size(800, 500);
  background(0);

  // load in our faces from our text files
  String[] topFaces   = loadStrings("topFaces.txt");
  String[] leftFaces  = loadStrings("leftFaces.txt");
  String[] rightFaces = loadStrings("rightFaces.txt");

  // convert our text to points and store values
  float scalar = 25.0;
  topFacePts   = processTxtFile(topFaces, scalar);
  leftFacePts  = processTxtFile(leftFaces, scalar);
  rightFacePts = processTxtFile(rightFaces, scalar);

  startPoints = new PVector[topFacePts.size() + leftFacePts.size() + rightFacePts.size()];
  endPoints = new PVector[topFacePts.size() + leftFacePts.size() + rightFacePts.size()];

  // Parse Graph!!!!!
  for (int i=0; i<topFacePts.size()-3; i+=4)
  {
    // get our 4 points of the face
    PVector pt00 = topFacePts.get(i);
    PVector pt01 = topFacePts.get(i+1);
    PVector pt02 = topFacePts.get(i+3);
    PVector pt03 = topFacePts.get(i+2);

    startPoints[i] = pt00;
    endPoints[i] = pt01;

    startPoints[i+1] = pt00;
    endPoints[i+1] = pt03;

    startPoints[i+2] = pt01;
    endPoints[i+2] = pt02;

    startPoints[i+3] = pt03;
    endPoints[i+3] = pt02;
  }

  for (int i= 0; i<leftFacePts.size()-3; i+=4)
  {
    // get our 4 points of the face
    PVector pt00 = leftFacePts.get(i);
    PVector pt01 = leftFacePts.get(i+1);
    PVector pt02 = leftFacePts.get(i+3);
    PVector pt03 = leftFacePts.get(i+2);

    startPoints[i + topFacePts.size()] = pt00;
    endPoints[i + topFacePts.size()] = pt01;

    startPoints[i+1 + topFacePts.size()] = pt00;
    endPoints[i+1 + topFacePts.size()] = pt03;

    startPoints[i+2 + topFacePts.size()] = pt01;
    endPoints[i+2 + topFacePts.size()] = pt02;

    startPoints[i+3 + topFacePts.size()] = pt03;
    endPoints[i+3 + topFacePts.size()] = pt02;
  }

  for (int i= 0; i<rightFacePts.size()-3; i+=4)
  {
    // get our 4 points of the face
    PVector pt00 = rightFacePts.get(i);
    PVector pt01 = rightFacePts.get(i+1);
    PVector pt02 = rightFacePts.get(i+3);
    PVector pt03 = rightFacePts.get(i+2);

    startPoints[i + topFacePts.size() + leftFacePts.size()] = pt00;
    endPoints[i + topFacePts.size() + leftFacePts.size()] = pt01;

    startPoints[i+1 + topFacePts.size() + leftFacePts.size()] = pt00;
    endPoints[i+1 + topFacePts.size() + leftFacePts.size()] = pt03;

    startPoints[i+2 + topFacePts.size() + leftFacePts.size()] = pt01;
    endPoints[i+2 + topFacePts.size() + leftFacePts.size()] = pt02;

    startPoints[i+3 + topFacePts.size() + leftFacePts.size()] = pt03;
    endPoints[i+3 + topFacePts.size() + leftFacePts.size()] = pt02;
  }

  // It is that easy.
  pruneArrays();

  // Initialize the drawing booleans and the edge percentages.

  int len = startPoints.length;

  drawEdges = new Boolean[len];
  edgePercentage = new float[len];

  // Stores whether each edge is store in the correct direction.
  dir = new Boolean[len];

  for (int i = 0; i < len; i++)
  {
    drawEdges[i] = false;
    edgePercentage[i] = 0.0;
    dir[i] = false;
  }

  int smallest = findLeftCoord(startPoints);

  drawEdges[smallest] = true;
}

int findLeftCoord(PVector[] points)
{
  float smallest = points[0].x;
  int output = 0;

  int len = points.length;

  for (int i = 1; i < len; i++)
  {
    float val = points[i].x;
    if (val >= smallest)
    {
      continue;
    }

    smallest = val;
    output = i;
  }

  return output;
}

void pruneArrays()
{
  ArrayList<PVector> output1 = new ArrayList<PVector>();
  ArrayList<PVector> output2 = new ArrayList<PVector>();

  int len = startPoints.length;

  for (int i = 0; i < len; i++)
  {
    println(len);

    switch(i)
    {

      //case 0:

      //case 1:

      //case 2:

      //case 3:

      //case 4:

      //case 5:

      //case 6:

      //case 7:

      //case 8:

      //case 9:
      //BAD
    case 10:

      //case 11:

      //case 12:

      //case 13:

    case 14:

      //case 15:

      //case 16:

      //case 17:

      //case 18:

      //case 19:

      //case 20:

      //case 21:

    case 22:

      //case 23:

      //case 24:

    case 25:

      //case 26:

      //case 27:

    case 28:

      //case 29:

      //case 30:

      //case 31:

      //case 32:

      //case 33:

      //case 34:

    case 35:

      //case 36:

      //case 37:

      //case 38:

      //case 39:

      //case 40:

      //case 41:

      //case 42:

      //case 43:

      //case 44:

      //case 45:

      //case 46:

      //case 47:

      //case 48:

      //case 49:

      //case 50:

      //case 51:

      //case 52:

      //case 53:

      //case 54:

      //case 55:

      //case 56:

      //case 57:

      //case 58:

      //case 59:

      //case 60:

      //case 61:

      //case 62:

      //case 63:

      //case 64:

      //case 65:

      //case 66:

      //case 67:

      //case 68:

      //case 69:

      //case 70:

      //case 71:

      //case 72:

      //case 73:

      //case 74:

      //case 75:

      //case 76:

      //case 77:

    case 78:

      //case 79:

    case 80:

      //case 81:

      //case 82:

      //case 83:

      //case 84:

      //case 85:

      //case 86:

    case 87:

      //case 88:

      //case 89:

    case 90:

      //case 91:

      //case 92:

      //case 93:

      //case 94:

      //case 95:

      //case 96:

      //case 97:

      //case 98:

      //case 99:

      //case 100:

      //case 101:

      //case 102:

      //case 103:

      //case 104:

      //case 105:

      //case 106:

      //case 107:

      //case 108:

      //case 109:

      //case 110:

      //case 111:

      //case 112:

      //case 113:

      //case 114:

      //case 115:

      //case 116:

      //case 117:

      //case 118:

      //case 119:

      //case 120:

      //case 121:

      //case 122:

      //case 123:

    case 124:

      //case 125:

      //case 126:

      //case 127:

    case 128:

      //case 129:

      //case 130:

    case 131:

    case 132:

      //case 133:

      //case 134:

      //case 135:

      //case 136:

      //case 137:

      //case 138:

      //case 139:

      //case 140:

      //case 141:

      //case 142:

      //case 143:

      //case 144:

      //case 145:

      //case 146:

      //case 147:

      //case 148:

      //case 149:

      //case 150:

      //case 151:

      //case 152:

      //case 153:

      //case 154:

      //case 155:

      //case 156:

      //case 157:

      //case 158:

      //case 159:

      //case 160:

      //case 161:

      //case 162:

      //case 163:

      //case 164:

      //case 165:

      //case 166:

    case 167:

      //case 168:

    case 169:

      //case 170:

      //case 171:

      //case 172:

      //case 173:

      //case 174:

      //case 175:


      continue;
    default: 
      output1.add(startPoints[i]);
      output2.add(endPoints[i]);
    }
  }// End of loop.



  len = output1.size();

  startPoints = new PVector[len];
  endPoints   = new PVector[len];

  for (int i = 0; i < len; i++)
  {
    startPoints[i] = output1.get(i); 
    endPoints[i]   = output2.get(i);
  }
}

void draw() {
  noStroke();

  // Should be as big as the screen.
  fill(60);
  rect(0, 0, 1000, 1000);

  // draw our top faces
  fill(170);
  for (int i=0; i<topFacePts.size()-3; i+=4) {
    // get our 4 points of the face
    PVector pt00 = topFacePts.get(i);
    PVector pt01 = topFacePts.get(i+1);
    PVector pt02 = topFacePts.get(i+3);
    PVector pt03 = topFacePts.get(i+2);
    // draw a quad shape
    quad(pt00.x, pt00.y, pt01.x, pt01.y, pt02.x, pt02.y, pt03.x, pt03.y);
  }

  // draw our right faces

  fill(100);
  for (int i=0; i<leftFacePts.size()-3; i+=4) {
    // get our 4 points of the face
    PVector pt00 = leftFacePts.get(i);
    PVector pt01 = leftFacePts.get(i+1);
    PVector pt02 = leftFacePts.get(i+3);
    PVector pt03 = leftFacePts.get(i+2);

    // draw a quad shape
    quad(pt00.x, pt00.y, pt01.x, pt01.y, pt02.x, pt02.y, pt03.x, pt03.y);
  }

  // draw our left faces
  fill(145);
  for (int i=0; i<rightFacePts.size()-3; i+=4) {
    // get our 4 points of the face
    PVector pt00 = rightFacePts.get(i);
    PVector pt01 = rightFacePts.get(i+1);
    PVector pt02 = rightFacePts.get(i+3);
    PVector pt03 = rightFacePts.get(i+2);

    // draw a quad shape
    quad(pt00.x, pt00.y, pt01.x, pt01.y, pt02.x, pt02.y, pt03.x, pt03.y);
  }

  time++;

  int len = startPoints.length;

  int magicNumber = (int)( len/2 + (len-1)/2*cos(radians(time)));

  stroke(255, 255, 255);
  strokeWeight(1);
  for (int i = 0; i < len; i++)
  {

    if (!drawEdges[i])
    {
      continue;
    }

    PVector start = startPoints[i];
    PVector end = endPoints[i];

    // The percentage of the line that is being drawn.
    float percentage  = edgePercentage[i];
    float percentage2 = edgePercentage[i];

    int c = (int)(255*percentage*percentage); 
    stroke(c, c, c);

    if (dir[i])
    {

      PVector mid = end.get();
      mid.sub(start);
      mid.mult(edgePercentage[i]);
      mid.add(start);
      line(start.x, start.y, mid.x, mid.y);
    }
    else
    {
      PVector mid = start.get();
      mid.sub(end);
      mid.mult(edgePercentage[i]);
      mid.add(end);
      line(end.x, end.y, mid.x, mid.y);
    }
  }

  advanceEdges();
}


// Increases the edges lengths and starts new edges rolling.
void advanceEdges()
{


  int len = drawEdges.length;
  Boolean[] output = new Boolean[len];

  for (int i = 0; i < len;i++)
  {
    output[i] = false;
  }

  for (int i = 0; i < len; i++)
  {
    if (!drawEdges[i])
    {
      continue;
    }

    output[i] = true;

    if (edgePercentage[i] < 1)
    {
      edgePercentage[i] += speed;
      continue;
    }

    PVector v1 = startPoints[i];
    PVector v2 = endPoints[i];

    float x1 = v1.x;
    float y1 = v1.y;

    float x2 = v2.x;
    float y2 = v2.y;

    for (int j = 0; j < len; j++)
    {

      if (drawEdges[j])
      {
        continue;
      }

      PVector v3 = startPoints[j];
      PVector v4 = endPoints[j];

      // Test for Vector equalities on the bipartite graph.
      if (v3.x == x1 && v3.y == y1)
      {
        output[j] = true;
        dir[j] = true;
        continue;
      }

      if (v3.x == x2 && v3.y == y2)
      {
        output[j] = true;
        dir[j] = true;
        continue;
      }

      if (v4.x == x1 && v4.y == y1)
      {
        output[j] = true;
        dir[j] = false;
        continue;
      }

      if (v4.x == x2 && v4.y == y2)
      {
        output[j] = true;
        dir[j] = false;
        continue;
      }
    }// End of j for loop.
  }// End of i for loop.

  drawEdges = output;
}

/**
 * 
 */
void drawFaces(ArrayList<PVector> facePts, int r, int g, int b) {

  fill(r, g, b);
  for (int i=0; i<facePts.size()-3; i+=4) {

    // get our 4 points of the face
    PVector pt00 = facePts.get(i);
    PVector pt01 = facePts.get(i+1);
    PVector pt02 = facePts.get(i+3);
    PVector pt03 = facePts.get(i+2);

    // draw a quad shape
    quad(pt00.x, pt00.y, pt01.x, pt01.y, pt02.x, pt02.y, pt03.x, pt03.y);
  }
}



/**
 * Takes a .txt file from grasshopper and translates
 * the strings to an ArrayList of PVectors
 */
ArrayList<PVector> processTxtFile(String[] points, float scalar) {



  ArrayList<PVector> facePts = new ArrayList<PVector>();

  // for each line of the text file
  for (int i=0; i<points.length; i++) {   

    // create an array that holds 3 values,
    // the X, Y, and Z coordinate of our PVector
    String[] coord = split(points[i], ",");

    // increase the scale
    float x = Float.parseFloat(coord[0])*scalar;
    float y = Float.parseFloat(coord[1])*scalar;
    float z = Float.parseFloat(coord[2])*scalar;

    // add new PVector to our ArrayList
    facePts.add(new PVector(x, y, z));
  }

  // reassign our modified ArrayList to the variable
  // that called processTxtFile(..)
  return facePts;
}


