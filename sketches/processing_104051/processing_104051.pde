
//copyright Matthew Weidner - 16 July 2013
//first attempt at something gravitational

//final String FILE = "neg_4points3.txt";
final String[] TEXT_FROM_FILE = {
"-5",
"5",
"#x  y  dx  dy  iMass  gMass  radius  r  g  b",
"300  400  0  -.5  -100  -100  10  200  0  0",
"300  340  2  0  10  10  10  0  0  200",
"300  200  1  .6  10  10  10  0  200  0"};

float G;
int EXTRA_PER_SIDE;

float[] xs, ys, dxs, dys;
float[] inertialMasses, gravitationalMasses, radii;
color[] colors;

int frame = 0;

void setup()
{
  size(800, 800);
  
  ellipseMode(CENTER);
  
  initObjects();
}

void initObjects()
{
  ArrayList<Float> xList = new ArrayList<Float>();
  ArrayList<Float> yList = new ArrayList<Float>();
  ArrayList<Float> dxList = new ArrayList<Float>();
  ArrayList<Float> dyList = new ArrayList<Float>();
  ArrayList<Float> inertialMassList = new ArrayList<Float>();
  ArrayList<Float> gravitationalMassList = new ArrayList<Float>();
  ArrayList<Float> radiusList = new ArrayList<Float>();
  ArrayList<Integer> rList = new ArrayList<Integer>();
  ArrayList<Integer> gList = new ArrayList<Integer>();
  ArrayList<Integer> bList = new ArrayList<Integer>();
  
  //String lines[] = loadStrings(FILE);
  String lines[] = TEXT_FROM_FILE;
  //first line is G
  G = float(lines[0]);
  //second line is number of tiles out
  EXTRA_PER_SIDE = int(lines[1]);
  //line format: x y dx dy inertialMass gravMass radius r g b
  for(int i = 2; i < lines.length; i++) {
    String line = lines[i].trim();
    if(line.startsWith("//") || line.startsWith("#") ||
        line.equals("")) {
      //comment/blank line
      continue;
    }
    String[] tokens = line.split("\\s+");
    if(tokens.length != 10) {
      println("Error on line " + i);
      println(line);
      System.exit(0);
    } 
    xList.add(float(tokens[0]));
    yList.add(float(tokens[1]));
    dxList.add(float(tokens[2]));
    dyList.add(float(tokens[3]));
    inertialMassList.add(float(tokens[4]));
    gravitationalMassList.add(float(tokens[5]));
    radiusList.add(float(tokens[6]));
    rList.add(int(tokens[7]));
    gList.add(int(tokens[8]));
    bList.add(int(tokens[9]));
  }
  
  int size = xList.size();
  xs = new float[size];
  ys = new float[size];
  dxs = new float[size];
  dys = new float[size];
  inertialMasses = new float[size];
  gravitationalMasses = new float[size];
  radii = new float[size];
  colors = new color[size];
  for(int i = 0; i < size; i++) {
    xs[i] = xList.get(i);
    ys[i] = yList.get(i);
    dxs[i] = dxList.get(i);
    dys[i] = dyList.get(i);
    inertialMasses[i] = inertialMassList.get(i);
    gravitationalMasses[i] = gravitationalMassList.get(i);
    radii[i] = radiusList.get(i);
    colors[i] = color(rList.get(i), gList.get(i), bList.get(i));
  }
}

void draw()
{
  fill(color(255, 255, 255, 2));
  rect(0, 0, width, height);
  
  gameLogic();
  
  noStroke();
  for(int i = 0; i < xs.length; i++) {
    fill(colors[i]);
    for(int xIndex = -1; xIndex <= 1; xIndex++) {
      for(int yIndex = -1; yIndex <= 1; yIndex++) {
        ellipse(xs[i] + xIndex*width, ys[i] + yIndex*height,
            radii[i], radii[i]);
      }
    }
  }
  
  //println(frameRate);
}

void gameLogic()
{
  for(int i = 0; i < xs.length; i++) {
    if(frame % 2 == 0) {
      applyGravity(i);
      calculatePosition(i);
    }
    else {
      calculatePosition(i);
      applyGravity(i);
    }
  }
  
  frame++;
}

void applyGravity(int index)
{
  //based on code by D. John Kirby
  float otherX, otherY, forcePerDistance, accelerationPerDistance;
  for(int i = 0; i < xs.length; i++)
  {
    for(int xIndex = -EXTRA_PER_SIDE; xIndex <= EXTRA_PER_SIDE; xIndex++) {
      for(int yIndex = -EXTRA_PER_SIDE; yIndex <= EXTRA_PER_SIDE; yIndex++) {
        if(i == index && xIndex == 0 && yIndex == 0) {
          //If I'm looking at myself just hop to the next one.
          continue;
        }
        
        otherX = xs[i] + xIndex*width;
        otherY = ys[i] + yIndex*height;
        accelerationPerDistance = G*gravitationalMasses[i]/
            pow(dist(xs[index],ys[index],otherX, otherY),3);
        if(gravitationalMasses[index] != inertialMasses[index]) {
          accelerationPerDistance *= gravitationalMasses[index] /
              inertialMasses[index];
        }
        dxs[index] += accelerationPerDistance*(otherX - xs[index]);
        dys[index] += accelerationPerDistance*(otherY - ys[index]);
      }
    }
  }
}

void calculatePosition(int index)
{
  xs[index] += dxs[index];
  ys[index] += dys[index];
  while(xs[index] < 0) {
    xs[index] += width;
  }
  while(xs[index] > width) {
    xs[index] -= width;
  }
  while(ys[index] < 0) {
    ys[index] += height;
  }
  while(ys[index] > height) {
    ys[index] -= height;
  }
  //println(index + ": " + xs[index] + ", " + ys[index]);
}
