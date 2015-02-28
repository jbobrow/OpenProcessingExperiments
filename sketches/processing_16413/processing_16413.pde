

int MaxLevel = 1;  // Current Maximum recursions (also known as detail)

float Roughness = 50;           // Arbitrary percentage (0=Straight line, 100=at the edge of overlapping)
float Divisor = 300/Roughness;  // dependent variable that determines the randomness of the middle point

ArrayList Points;

PVector Left;  // end points of the line
PVector Right;

void setup() {
  size(900, 600);
  frameRate(2);  // 2 FPS: so we can see the shapes properly
  smooth();
  
  Left  = new PVector(20,height/2);
  Right = new PVector(width-20, height/2);
  
  Render();
}

void draw() {
  Render();
  
}

void mouseReleased() {
  ++MaxLevel;
  Render();
}

void Render() {
  background(25);

  fill(250);
  text("Detail: " + MaxLevel, 100, 100);  // Give the current Detail
  text("Roughness(%): " + Roughness, 100, 113);  // Give the current Roughness
  
  PVector[] Points = CalculateRoughLine(Left, Right, MaxLevel);

  stroke (155);
  strokeWeight(10/MaxLevel);  // the line gets thinner with more detail
  for (int i=0; i<Points.length-1; ++i) {  // Loop though the array, connecting the dots
    line(Points[i].x, Points[i].y, Points[i+1].x, Points[i+1].y);
  }
}



PVector[] CalculateRoughLine(PVector P1, PVector P2, int Level) {
  PVector[] Vertexies = {P1};                  // Add left point
  
  Vertexies = (PVector[]) concat(Vertexies,       // Add midpoints recursively
    MyLine(P1, P2, Level)  
  );  
  
  Vertexies = (PVector[]) append(Vertexies, P2);  // Add right point
  
  return Vertexies;
}

PVector[] MyLine(PVector P1, PVector P2, int Level) {
  PVector[] Final =  {};
  
  PVector Difference =  PVector.sub(P1, P2);
  float Distance = Difference.mag();  
  
  PVector Middle = PVector.add(P1, P2);
  Middle.div(2);  // get the average point between them
  Middle.add(new PVector(    // Add a bit of randomness, proportional to distance and Roughness
    random(-Distance/Divisor, Distance/Divisor),
    random(-Distance/Divisor, Distance/Divisor)
  ));
  
  if (Level > 1) {   // Are there recursions to do?
    Final = (PVector[]) concat(Final, // Add midpoints (left) recursively
      MyLine(P1, Middle, Level-1)  
    );
    Final = (PVector[]) append(Final,
      Middle
    );
    Final = (PVector[]) concat(Final, // Add midpoints (right) recursively
      MyLine(Middle, P2, Level-1)  
    );
  }
  else {
    //line(x1, y1, Middle.x, Middle.y);             // Draw lines
    //line(Middle.x, Middle.y, x2, y2);
    Final = (PVector[]) append(Final,
      Middle
    );
  }
  //println(Final);
  return Final;
}

