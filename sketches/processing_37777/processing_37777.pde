
int mode;
ArrayList<PVector> points;
PVector[] newPoints,
          newVelocities;
float[][] distances;

void setup() {
  ellipseMode(CENTER);
  background(0);
  stroke(0);
  strokeWeight(1);
  size(500,500);
  initCapture();
}

void initCapture() {
  points = new ArrayList<PVector>();
  mode = 0;
  println("Initiating Capture");
}

void initReconstruction() {
  distances = new float[points.size()][points.size()];
  newPoints = new PVector[points.size()];
  newVelocities = new PVector[points.size()];
  for(int i=0; i<points.size(); i++) {
      for(int j=0; j<points.size(); j++)
          distances[i][j] = points.get(i).dist(points.get(j));
      newPoints[i] = PVector.add(new PVector(random(-5,5),random(-5,5)), points.get(0));
      newVelocities[i] = new PVector();
  }
  mode = 1;
  println("Initiating Reconstruction");
}

void keyReleased() {
  if(mode==0) initReconstruction();
  else if(mode==1) initCapture();
}

void draw() {  //draw function loops
  float totalStress = 0;
  fill(255);
  background(255);
  if(mode==0) {
    if(mousePressed == true) //add some interaction
      points.add(new PVector(mouseX,mouseY));
    //if(points.size()>0) println("Number of Points is " + points.size() + ", Anchor is at (" + points.get(0).x + "," + points.get(0).y + ")");}
    for(int i=0; i<points.size(); i++)
        ellipse(points.get(i).x,points.get(i).y,5,5);
  } else if(mode==1) {
    for(int i=0; i<points.size(); i++) {
      float stress = 0;
      for(int j=0; j<points.size(); j++)
          if(j!=i) {
              PVector norm = (PVector.sub(newPoints[j],newPoints[i]));
              norm.normalize();
              float force = (newPoints[i].dist(newPoints[j])-distances[i][j])*.01f;
              stress += force/points.size();
              newVelocities[i].add( PVector.mult(norm,force) );
              newVelocities[i].mult(.98f);
          }
      totalStress += stress;
      //newVelocities[i].add(new PVector(random(-50f,50f)*stress,random(-50f,50f)*stress));
      newPoints[i].add(newVelocities[i]);
      //println("Drawing Point at " + "(" + newPoints[i].x + "," + newPoints[i].y + ")");
      ellipse(newPoints[i].x,newPoints[i].y,5,5);
    }
  }
  fill(0);
  text( mode==0?"Stage 1: Place points with mouse, Press any key to reconstruct"
               :"Stage 2: Reconstructing positions from distance matrix: " + (int)totalStress + " Stress" + ((abs(totalStress)<.01f)?"\nRECONSTRUCTION COMPLETE":""),10,20);
}

                
                

