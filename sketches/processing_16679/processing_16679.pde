

class Field {
  PVector[][] Vertexies;
  PVector[] Corners;
  int SideLength;
  
  float Divisor;
  
  Field(PVector[] Square, float Roughness) {// Arbitrary percentage (0=Straight line, 100=at the edge of overlapping)
    Divisor = 300/Roughness;   // dependent variable that determines the randomness of the middle point
    Corners = Square;
    
    Vertexies = new PVector[][] {
      {Corners[3], Corners[0]},  // Have the corners go clockwise 
      {Corners[2], Corners[1]}   // from the point where both are positive 
    };
    SideLength = 2;
  }
  
  void Subdivide() {
    SideLength = 2*SideLength-1;  // we are filling all gaps
    
    PVector[][] NewV = {};    // our temporary Vertexies storage
    
    for (int x=0; x<SideLength; ++x) {    // Add 2 because every 2nd Vertex
      PVector[] Temp = {};
      
      // If it is an even collumn it has original points in it
      // If it is uneven there are only new points in it those include the centre ones
      
      if (x%2 == 0) {  // in case of a even (with originals) collumn
        for (int y=0; y<SideLength; ++y) {  
          if (y%2 == 0) {
            Temp = (PVector[]) append(Temp, Vertexies[x/2][y/2]);  // it is a original point
          }
          else {            // it is a point with original points at both y neighbours
            Temp = (PVector[]) append(Temp, Middle(
              Vertexies[x/2][(y-1)/2],
              Vertexies[x/2][(y+1)/2],
              Divisor
            ));
          }
        }
        NewV = (PVector[][]) append(NewV, Temp);  // Replace the original Collumn with the extended one
      }
      
      else {  // If it is an uneven collumn
        for (int y=0; y<SideLength; ++y) {  // is now a inseted Vertex
          if (y%2 == 0) {  // it is a point with original points at both x neighbours         
            Temp = (PVector[]) append(Temp, Middle(
              Vertexies[(x-1)/2][y/2],
              Vertexies[(x+1)/2][y/2],
              Divisor
            ));
          }
          
          else {  // It is a point in a new centre (middle of square) 
            int d = 2*(int)random(2)-1; // The direction of the line it gets randomized against
                                        // It should be either -1 or +1                                                    
            
            Temp = (PVector[]) append(Temp, Middle(
              Vertexies[(x-1)/2][(y-d)/2],
              Vertexies[(x+1)/2][(y+d)/2],
              Divisor
            ));
            
          }
        }
        NewV = (PVector[][]) append(NewV, Temp);
      }
      
    }
    
    Vertexies = NewV;
  }
  
      
  
  void Display() {
    for (int x=0; x<SideLength; ++x) {
      for (int y=0; y<SideLength; ++y) {
        if (y<SideLength-1) Line3D(Vertexies[x][y], Vertexies[x  ][y+1]);
        if (x<SideLength-1) Line3D(Vertexies[x][y], Vertexies[x+1][y  ]);
      }
    }
  }
}



