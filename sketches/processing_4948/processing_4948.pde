

int triWidth = 80;
int triOffset = triWidth * 2; //X-offset for the placement of the right eye
int triAnchorXPos = (480 / 2) - (triOffset - triWidth / 2); //get the pair of eyes centered
int triAnchorYPos = 40;


void setup() {
  size(480, 320); //iPhone dimensions
  smooth();
}

void draw() {
  background(20);
  stroke(255);
  strokeWeight(1);
  
  //prepare the triangles' peak vertices for tracking the mouse position
  int triPeakXPos = constrain(mouseX, triAnchorXPos, (triAnchorXPos + triWidth));
  int triPeakYPos = constrain(mouseY, triAnchorYPos, (triAnchorYPos + triWidth));

  //draw the left eye.  drawn CW from upper-left vertex.
  triangle( triAnchorXPos, triAnchorYPos,                             // vertex 1 (X, Y)
            (triAnchorXPos + triWidth), triAnchorYPos,                // vertex 2 (X, Y)
            triPeakXPos, triPeakYPos);                                // vertex 3 (X, Y)
  
  //draw the right eye.  drawn CW from upper-left vertex.
  triangle( (triAnchorXPos + triOffset), triAnchorYPos,               // vertex 1 (X, Y)
            (triAnchorXPos + triWidth + triOffset), triAnchorYPos,    // vertex 2 (X, Y)
            (triPeakXPos + triOffset), triPeakYPos);                  // vertex 3 (X, Y)
  
  //draw the left half of the mouth.  drawn CW from upper-right vertex.
  triangle( 240, (triAnchorYPos + (triWidth * 2)),                    // vertex 1 (X, Y)
            240, (triAnchorYPos + (triWidth * 3)),                    // vertex 2 (X, Y)
            triPeakXPos, (triPeakYPos + (triOffset / 2)));            // vertex 3 (X, Y)
  
  //draw the right half of the mouth.  drawn CCW from upper-left vertex.
  triangle( 240, (triAnchorYPos + (triWidth * 2)),                    // vertex 1 (X, Y)
            240, (triAnchorYPos + (triWidth * 3)),                    // vertex 2 (X, Y)
            (480 - triPeakXPos), (triPeakYPos + (triOffset / 2)));    // vertex 3 (X, Y)
}

